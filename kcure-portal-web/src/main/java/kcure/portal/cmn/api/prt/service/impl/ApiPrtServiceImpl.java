package kcure.portal.cmn.api.prt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import kcure.portal.cmn.api.cmm.Constants;
import kcure.portal.cmn.api.prt.service.ApiPrtService;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchDAO;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;
import kcure.portal.sys.pim.mng.service.impl.PimMngDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.api.prt.service.impl
  * @FileName : ApiPrtServiceImpl.java
  * @since : 2023. 3. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	참여기관 API ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("apiPrtService")
public class ApiPrtServiceImpl extends EgovAbstractServiceImpl implements ApiPrtService{

	/**
	 * 참여기관 API DAO
	 */
	@Resource(name="apiPrtDAO")
	private ApiPrtDAO apiPrtDAO;

	/**
	 * 참여기관 정보DAO
	 */
	@Resource(name="pimMngDAO")
    private PimMngDAO pimMngDAO;

	/**
	 * 연구 정보 DAO
	 */
	@Resource(name = "ClcInfReserchDAO")
    private ClcInfReserchDAO clcInfReserchDAO;

	@Override
	public Map<String, Object> dataAplyExist(String prtiId, String dataAplyNo) throws Exception {

		Map<String, Object> returnMap = new LinkedHashMap<String, Object>();

		//1. 기관 코드 존재 여부 확인
		String prtiNm = pimMngDAO.selectPrtiNm(prtiId);

		if(prtiNm != "" && prtiNm != null) {
			//2. 신청번호 존재여부 확인
			ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
			clcInfReserchVo.setDataAplcNo(dataAplyNo);
			clcInfReserchVo = clcInfReserchDAO.selectDetailClcInfReserch(clcInfReserchVo);

			if(clcInfReserchVo != null) {
				//nas정보
				returnMap.put("nasUrl",EgovProperties.getProperty("nas.ftp.url"));
				returnMap.put("nasId",EgovProperties.getProperty("nas.ftp.id"));
				returnMap.put("nasPw",EgovProperties.getProperty("nas.ftp.pwd"));
				returnMap.put("nasPort",EgovProperties.getProperty("nas.ftp.port"));
				returnMap.put("nasBaseFolder",EgovProperties.getProperty("nas.ftp.baseFolder"));
				returnMap.put("nasEncoding",EgovProperties.getProperty("nas.ftp.encoding"));
				returnMap.put("prtFileDir", EgovProperties.getProperty("nas.apv.filePath") + dataAplyNo + "/" + prtiId + "/");
				returnMap.put("failMsg","");
			}else {
				//nas정보
				returnMap.put("nasUrl","");
				returnMap.put("nasId","");
				returnMap.put("nasPw","");
				returnMap.put("nasPort","");
				returnMap.put("nasBaseFolder","");
				returnMap.put("nasEncoding","");
				returnMap.put("prtFileDir", "");
				returnMap.put("failMsg","신청번호가 존재하지 않습니다.");
			}
		}else {
			returnMap.put("nasUrl","");
			returnMap.put("nasId","");
			returnMap.put("nasPw","");
			returnMap.put("nasPort","");
			returnMap.put("nasBaseFolder","");
			returnMap.put("nasEncoding","");
			returnMap.put("prtFileDir", "");
			returnMap.put("failMsg","기관코드가 존재하지 않습니다.");
		}

		return returnMap;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> insertAplyFile(Map<String, Object> requestMap) throws Exception {
		Map<String, Object> returnMap = new LinkedHashMap<String, Object>();
		String uploderId = String.valueOf(requestMap.get("uploderId"));
		String prtiId = String.valueOf(requestMap.get("prtiId"));
		String dataAplyNo = String.valueOf(requestMap.get("dataAplyNo"));
		List<Map<String,Object>> applyFiles = (List<Map<String, Object>>) requestMap.get("applyFiles");

		returnMap.put("dataAplyNo", dataAplyNo);

		//1. 기관 코드 존재 여부 확인
		String prtiNm = pimMngDAO.selectPrtiNm(prtiId);
		if(prtiNm != "" && prtiNm != null) {
			//파일경로
			String prtDir = EgovProperties.getProperty("nas.apv.filePath") + dataAplyNo + "/" + prtiId + "/";

			//2. 신청번호 존재여부 확인
			ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
			clcInfReserchVo.setDataAplcNo(dataAplyNo);
			clcInfReserchVo = clcInfReserchDAO.selectDetailClcInfReserch(clcInfReserchVo);

			if(clcInfReserchVo != null) {
				//2. 승인건인지 확인
				if(Constants.API.APLC_PROG_STCD_05.equals(clcInfReserchVo.getAplcProgStcd())) {
					if(applyFiles.size() > 0) {

						try{
							List<Map<String, Object>> fileList = new ArrayList<Map<String,Object>>();

							for(int i=0; i < applyFiles.size(); i++) {
								Map<String, Object> fileMap = new HashMap<String, Object>();
								//3. 업로드 경로 체크
								String dir = applyFiles.get(i).get("dir").toString();

								if(!prtDir.equals(dir)) {
									throw new Exception(dir);
								}else {
									fileMap.put("attfSeq", apiPrtDAO.selectAttfSeq(dataAplyNo)+i);
									fileMap.put("dataAplcNo", dataAplyNo);
									fileMap.put("attfSpcd", Constants.API.ATTF_SPCD_03);
									fileMap.put("uploderId", uploderId);
									fileMap.put("attfPthNm", dir);
									fileMap.put("attfNm", applyFiles.get(i).get("fileNm"));
									fileList.add(fileMap);
								}
							}

							//4. file insert
							apiPrtDAO.insertSvcAttf(fileList);
							returnMap.put("isSuccess", true);
							returnMap.put("failMsg","");

						}catch (Exception e) {
							returnMap.put("isSuccess", false);
							returnMap.put("failMsg", e.getMessage() + " : 파일경로가 맞지 않습니다.");
						}
					}else {
						returnMap.put("isSuccess", false);
						returnMap.put("failMsg","파일정보가 없습니다.");
					}
				}else {
					returnMap.put("isSuccess", false);
					returnMap.put("failMsg","신청건이 승인되지 않았습니다.");
				}
			}else {
				returnMap.put("isSuccess", false);
				returnMap.put("failMsg","신청번호가 존재하지 않습니다.");
			}
		}else {
			returnMap.put("isSuccess", false);
			returnMap.put("failMsg","기관코드가 존재하지 않습니다.");
		}
		return returnMap;
	}

}
