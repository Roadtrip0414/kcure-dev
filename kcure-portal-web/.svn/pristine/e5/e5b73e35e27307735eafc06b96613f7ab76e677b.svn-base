package kcure.portal.sys.aum.mnu.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.aum.mnu.service
  * @FileName : AumMnuService.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 권한별 메뉴 관리 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface AumMnuService {

	/**
	 * @Method Name : selectAuthorMenuList
	 * @작성일 : 2023. 1. 4.
	 * @작성자 : hjjeon
	 * @Method 설명 : 권한별 메뉴 맵핑 관리 목록 조회
	 *  <p>
	 *  </p>
	 * @param : mnuVO AumVO
	 * @return : List<AumVO>
	 */
	public List<Map<String,Object>> selectAuthorMenuList(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : selectAuthorMenuListTotCnt
	  * @작성일 : 2023. 1. 4.
	  * @작성자 : hjjeon
	  * @Method 설명 : 목록조회 카운트를 반환한다
	  *  <p>
	  *  </p>
	  * @param : mnuVO MnuVO
	  * @return : int
	  */
	public int selectAuthorMenuListTotCnt(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : saveAuthorMenu
	  * @작성일 : 2023. 1. 5.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 롤 관계정보를 화면에서 입력하여 입력항목의 정합성을 체크하고 데이터베이스에 저장
	  *  <p>
	  *  </p>
	  * @param : gridParameterMap GridParameterMap
	  * @return :
	  */
	public void saveAuthorMenu(GridParameterMap gridParameterMap) throws Exception;
}
