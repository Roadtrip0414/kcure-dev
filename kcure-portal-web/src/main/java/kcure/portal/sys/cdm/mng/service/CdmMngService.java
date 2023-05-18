package kcure.portal.sys.cdm.mng.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cdm.mng.service.Impl.CdmMngDetailVO;
import kcure.portal.sys.cdm.mng.service.Impl.CdmMngGrpVO;
/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.cdm.mng.web
 * @FileName :CdmMngService.java
 * @since : 2023. 02. 10.
 * @version 1.0
 * @author : jyk
 * @프로그램 설명 :	공통코드관리에 대한 Service Interface  정의한다.
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
public interface CdmMngService {

	/**
	  * @Method Name : selectGrpCdList
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	마스터코드목록,검색목록을 조회
	  *  </p>
	  * @param : CdmMngGrpVO
	  * @return : List<Map<String, Object>>
	  */
	List<Map<String, Object>> selectGrpCdList(CdmMngGrpVO vo) throws Exception;

	/**
	  * @Method Name : selectGrpCdListTotCnt
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	마스터코드목록,검색목록 총건수를 조회한다.
	  *  </p>
	  * @param : CdmMngGrpVO
	  * @return : int
	  */
	int selectGrpCdListTotCnt(CdmMngGrpVO vo) throws Exception;

	/**
	  * @Method Name : saveCdmCdData
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	공통 코드 마스터 테이블 저장
	  *  </p>
	  * @param : GridParameterMap
	  * @return :
	  */
	public void saveCdmCdData(GridParameterMap gridParameterMap, String userId) throws Exception;

	/**
	  * @Method Name : selectDetailCdList
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	상세코드 목록을 조회
	  *  </p>
	  * @param : CdmMngDetailVO
	  * @return : List<Map<String, Object>>
	  */
	List<Map<String, Object>> selectDetailCdList(CdmMngDetailVO vo) throws Exception;

	/**
	  * @Method Name : selecthDetailCdListTotCnt
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	상세코드목록 총건수를 조회한다.
	  *  </p>
	  * @param : CdmMngDetailVO
	  * @return : int
	  */
	int selecthDetailCdListTotCnt(CdmMngDetailVO vo) throws Exception;

	/**
	  * @Method Name : saveCdmDetailCdData
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	공통 코드 디테일테이블 저장
	  *  </p>
	  * @param : GridParameterMap
	  * @return :
	  */
	public void saveCdmDetailCdData(GridParameterMap gridParameterMap, String userId) throws Exception;
}
