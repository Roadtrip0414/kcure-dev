package kcure.portal.cmn.api.cry.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import kcure.portal.cmn.api.cmm.Constants;
import kcure.portal.cmn.api.cry.service.CryService;
import kcure.portal.cmn.api.prt.service.impl.ApiPrtDAO;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchDAO;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;


/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.cry.service.impl
 * @FileName : CryServiceImpl.java
 * @since : 2023. 2. 20.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	VDI 반출신청 API serviceImpl
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
@Service("cryService")
public class CryServiceImpl implements CryService {
	/**
	 * 참여기관 API DAO
	 */
	@Resource(name="apiPrtDAO")
	private ApiPrtDAO apiPrtDAO;

	/**
	 * 반출 신청 DAO
	 */
	@Resource(name="cryDAO")
	private CryDAO cryDAO;

	/**
	 * 연구 정보 DAO
	 */
	@Resource(name = "ClcInfReserchDAO")
    private ClcInfReserchDAO clcInfReserchDAO;

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> updateDttoAplc(Map<String, Object> requestMap) throws Exception {
		Map<String,Object> returnMap = new LinkedHashMap<String, Object>();
		String dataAplyNo = requestMap.get("dataAplyNo").toString();
		String userId = requestMap.get("userId").toString();
		
		String rsrAsmtNo = apiPrtDAO.selectSvcRsrAsmtNo(dataAplyNo);

		returnMap.put("dataAplyNo", dataAplyNo);

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("dttoAplcYn", "Y");
		map.put("dataAplcNo", dataAplyNo);
		map.put("userId", userId);

		List<String> cryOutFiles = (List<String>) requestMap.get("cryOutFiles");

		if(cryOutFiles.size() > 0) {
			ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
			clcInfReserchVo.setDataAplcNo(dataAplyNo);
			clcInfReserchVo = clcInfReserchDAO.selectDetailClcInfReserch(clcInfReserchVo);

			if(clcInfReserchVo != null && ! StringUtils.isBlank(rsrAsmtNo)) {
				//연구명 제외, YYYYMMDD 추가
				String prtDir = EgovProperties.getProperty("nas.cro.filePath") + dataAplyNo + "/"  + userId + "/" + CommonUtils.getNow("yyyyMMdd") + "/";
				String dttoAplcDt = getCurrentTimestamp();
				
				try{
					List<Map<String, Object>> fileList = new ArrayList<Map<String,Object>>();

					for(int i=0; i < cryOutFiles.size(); i++) {
						Map<String, Object> fileMap = new HashMap<String, Object>();
						//3. 업로드 경로 체크
						String fullDir = cryOutFiles.get(i).toString();
						String dir = fullDir.substring(0, fullDir.indexOf("/",prtDir.length()-1)+1);
						String fileNm = fullDir.substring(fullDir.lastIndexOf("/")+1);

						if(!prtDir.equals(dir)) {
							throw new Exception(dir);
						}else {
							fileMap.put("attfSeq", apiPrtDAO.selectAttfSeq(dataAplyNo)+i);
							fileMap.put("dataAplcNo", dataAplyNo);
							fileMap.put("rsrAsmtNo", rsrAsmtNo);
							fileMap.put("dttoAplcDt", dttoAplcDt);
							fileMap.put("attfSpcd", Constants.API.ATTF_SPCD_05);
							fileMap.put("dttoAplcProgStcd", Constants.API.DTTO_APLC_PROG_STCD_01);
							fileMap.put("uploderId", userId);
							fileMap.put("attfPthNm", fullDir.substring(0, fullDir.lastIndexOf("/")+1));
							fileMap.put("attfNm", fileNm);
							fileList.add(fileMap);
						}
					}

					//데이터 신청 업데이트
					cryDAO.updateDttoAplcYn(map);

					//데이터 반출 신청 delete
					//apiPrtDAO.deleteSvcDttoAplc(fileList.get(0));
					//데이터 반출 신청파일 관리정보 delete
					//apiPrtDAO.deleteSvcDttoProg(fileList);
					//데이터 신청 파일 delete
					//apiPrtDAO.deleteSvcAttf(fileList);

					//데이터 반출 신청 insert
					apiPrtDAO.insertSvcDttoAplc(fileList.get(0));
					
					//데이터 신청 반출파일 정보 insert							
					apiPrtDAO.insertSvcAttf(fileList);
					
					//데이터 신청 반출파일 관리정보 insert							
					apiPrtDAO.insertSvcDttoProg(fileList);

					returnMap.put("isApply", true);
					returnMap.put("applyFailMsg","");
				}catch (Exception e) {
					returnMap.put("isApply", false);
					returnMap.put("applyFailMsg", e.getMessage() + " : 파일경로가 맞지 않습니다.");
				}
			}else {
				returnMap.put("isApply", false);
				returnMap.put("applyFailMsg","신청 정보가 없습니다.");
			}

		}else {
			returnMap.put("isApply", false);
			returnMap.put("applyFailMsg","파일정보가 없습니다.");
		}
		return returnMap;
	}
	
	private String getCurrentTimestamp() {
		LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSSSSS");
	    return now.format(formatter);
    }

}
