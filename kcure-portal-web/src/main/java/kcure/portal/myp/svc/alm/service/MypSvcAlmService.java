package kcure.portal.myp.svc.alm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.svc.alm.service
 * @FileName : MypSvcAlmService.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 알림에 대한 Service Interface를 정의한다.
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
public interface MypSvcAlmService {
	/**
	 * @Method Name : selectMypSvcAlmCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  조회 전 나의알림 카운트
	 * @param : model
	 * @return :
	 */
	public int selectMypSvcAlmCnt(HashMap<String, Object> paramMap) throws Exception;
	
    /**
	 * @Method Name : selectMypSvcAlmListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	public int selectMypSvcAlmListTotCnt(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectMypSvcAlmList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypSvcAlmList(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : updateMypSvcAlmAllCnfrYn
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 확인여부 전체수정
	 * @param : model
	 * @return :
	 */
	public void updateMypSvcAlmAllCnfrYn(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : selectMypSvcAlm
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 상세 정보 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypSvcAlm(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : updateMypSvcAlmClckYn
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 클릭여부 수정
	 * @param : model
	 * @return :
	 */
	public void updateMypSvcAlmClckYn(HashMap<String, Object> paramMap) throws Exception;
}
