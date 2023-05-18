package kcure.portal.sys.mnu.dvz.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.dvz.service
  * @FileName : MnuDvzService.java
  * @since : 2023. 3. 27.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	시각화 메뉴 관리 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface MnuDvzService {

	/**
	  * @Method Name : selectMenuManageList
	  * @작성일 : 2023. 3. 27.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	시각화 메뉴 관리 목록 조회
	  *  </p>
	  * @param : ComDefaultVO comDefaultVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectMenuManageList(ComDefaultVO comDefaultVO) throws Exception;
    /**
     * @Method Name : selectMenuManageListTotCnt
     * @작성일 : 2023. 3. 27.
     * @작성자 : hjjeon
     * @Method 설명 :
     *  <p>
     *  	시각화 메뉴 관리 목록 총 갯수
     *  </p>
     * @param : ComDefaultVO comDefaultVO
     * @return : int
     */
	public int selectMenuManageListTotCnt(ComDefaultVO comDefaultVO)  throws Exception;
    /**
     * @Method Name : saveMenuManage
     * @작성일 : 2023. 3. 27.
     * @작성자 : hjjeon
     * @Method 설명 :
     *  <p>
     *  	시각화 메뉴 관리 저장
     *  </p>
     * @param : GridParameterMap gridParameterMap
     * @return :
     */
	public void saveMenuManage(GridParameterMap gridParameterMap) throws Exception;
}
