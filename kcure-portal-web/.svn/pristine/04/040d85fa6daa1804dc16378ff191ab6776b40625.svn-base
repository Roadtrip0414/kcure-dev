package kcure.portal.sys.rsr.dau.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;
import kcure.portal.sys.rsr.dau.service.RsrDauService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.rsr.dau.web
 * @FileName : RsrDauServiceImpl.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터 활용관리에 대한 비즈니스 구현 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.02.01   kyh           최초생성
 *  </pre>
 */
@Service("sysRsrDauService")
public class RsrDauServiceImpl extends EgovAbstractServiceImpl implements RsrDauService {
	
	@Resource(name="sysRsrDauDAO")
	private RsrDauDAO sysRsrDauDAO;
	
    /**
	 * @Method Name : selectRsrDauAdmAuthCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   사무국권한 카운트
	 * @param : model
	 * @return :
	 */
	@Override
	public int selectRsrDauAdmAuthCnt(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauAdmAuthCnt(paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauSiDoList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 존재 시도 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<ComCdDetailVo> selectRsrDauSiDoList(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauSiDoList(paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauPrtiIdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectRsrDauPrtiIdList(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauPrtiIdList(paramMap);
	}

    /**
	 * @Method Name : selectRsrDauListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	@Override
	public int selectRsrDauListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauListTotCnt(paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectRsrDauList(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauList(paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauDtu
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 신청내역 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public Map<String, Object> selectRsrDauDtu(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauDtu(paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauAcidList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 분석자 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectRsrDauAcidList(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauAcidList(paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauDszRsvList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 예약좌석 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectRsrDauDszRsvList(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauDszRsvList(paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauDsgnYmdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 지정일자 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectRsrDauDsgnYmdList(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauDsgnYmdList(paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauPrtiSeatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 센터 좌석 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectRsrDauPrtiSeatList(HashMap<String, Object> paramMap) throws Exception {
		return sysRsrDauDAO.selectRsrDauPrtiSeatList(paramMap);
	}
	
	/**
	 * @Method Name : saveRsrDauManage
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 저장
	 * @param : model
	 * @return :
	 */
	@Override
	public void saveRsrDauManage(HashMap<String, Object> paramMap) throws Exception {
		String dtuAplcProgStcd = (String)paramMap.get("dtuAplcProgStcd");
		String seatRsvList = (String)paramMap.get("seatRsvList");
		String dataAplcNo = (String)paramMap.get("dataAplcNo");
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		paramMap.put("frstRegpId", user.getId());
		
		if ("U02".equals(dtuAplcProgStcd)) {		//승인일 경우 좌석예약정보 등록
			//승인일 경우 좌석예약정보 등록
			String[] seatRsv = seatRsvList.split(",");
			
			for (int i = 0; i < seatRsv.length ; i++) {
				String[] seatRsvMap = seatRsv[i].split("//");
				
				HashMap<String, Object> subParamMap = new HashMap<>();
				subParamMap.put("dszInstId", (String)paramMap.get("dszInstId"));
				subParamMap.put("rsvSeatNo", seatRsvMap[1]);
				subParamMap.put("dtuRsvYmd", seatRsvMap[0]);
				subParamMap.put("dataAplcNo", dataAplcNo);
				subParamMap.put("dtuAplcNo", (String)paramMap.get("dtuAplcNo"));
				subParamMap.put("dataAplpIdList", (String)paramMap.get("dataAplpIdList"));
				subParamMap.put("frstRegpId", user.getId());
				
				sysRsrDauDAO.insertRsrDauDszRsv(subParamMap);
			}
		}
		
		sysRsrDauDAO.updateRsrDauDtu(paramMap);
		
		HashMap<String, Object> paramHst = new HashMap<String, Object>();
		paramHst.put("dataAplcNo", dataAplcNo);
		paramHst.put("cdClcd", "DTU");
		paramHst.put("detlCd", dtuAplcProgStcd);
		paramHst.put("userId", user.getId());
		sysRsrDauDAO.insertDtapStatHst(paramHst);
	}
}
