package kcure.portal.sys.rsr.dau.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.rsr.dau.web
 * @FileName : RsrDauService.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터 활용관리에 대한 Service Interface를 정의한다.
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
public interface RsrDauService {
    /**
	 * @Method Name : selectRsrDauAdmAuthCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   사무국권한 카운트
	 * @param : model
	 * @return :
	 */
	public int selectRsrDauAdmAuthCnt(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectRsrDauSiDoList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 존재 시도 조회
	 * @param : model
	 * @return :
	 */
	public List<ComCdDetailVo> selectRsrDauSiDoList(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectRsrDauPrtiIdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauPrtiIdList(HashMap<String, Object> paramMap) throws Exception;
	
    /**
	 * @Method Name : selectRsrDauListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	public int selectRsrDauListTotCnt(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectRsrDauList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauList(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectRsrDauDtu
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 신청내역 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectRsrDauDtu(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectRsrDauAcidList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 분석자 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauAcidList(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectRsrDauDszRsvList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 예약좌석 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauDszRsvList(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectRsrDauDsgnYmdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 지정일자 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauDsgnYmdList(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectRsrDauPrtiSeatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 센터 좌석 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauPrtiSeatList(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : saveRsrDauManage
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 저장
	 * @param : model
	 * @return :
	 */
	public void saveRsrDauManage(HashMap<String, Object> paramMap) throws Exception;
}
