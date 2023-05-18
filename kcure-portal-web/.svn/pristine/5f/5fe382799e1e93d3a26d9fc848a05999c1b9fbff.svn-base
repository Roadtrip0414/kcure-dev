package kcure.portal.sys.mnu.mng.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.mnu.mng.service.impl.MnuVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.mng.service
  * @FileName : MnuService.java
  * @since : 2023. 2. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	메뉴관리 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface MnuMngService {
	/**
	  * @Method Name : getMenuManageList
	  * @작성일 : 2023. 1. 17.
	  * @작성자 : hjjeon
	  * @Method 설명 : 메뉴관리 조회
	  *  <p>
	  *  </p>
	  * @param : mnuVO MnuVO
	  * @return : List<MnuVO>
	  */
	public List<MnuVO> getMenuManageList(MnuVO mnuVO) throws Exception;

	/**
	  * @Method Name : getMenuManageListTotCnt
	  * @작성일 : 2023. 1. 17.
	  * @작성자 : hjjeon
	  * @Method 설명 : 메뉴관리 총갯수 조회
	  *  <p>
	  *  </p>
	  * @param : mnuVO MnuVO
	  * @return : int
	  */
	public int getMenuManageListTotCnt(MnuVO mnuVO) throws Exception;

	/**
	  * @Method Name : saveMenuManage
	  * @작성일 : 2023. 1. 20.
	  * @작성자 : hjjeon
	  * @Method 설명 : 메뉴관리 저장
	  *  <p>
	  *  </p>
	  * @param : gridParameterMap GridParameterMap
	  * @return :
	  */
	public void saveMenuManage(GridParameterMap gridParameterMap) throws Exception;

	/**
	  * @Method Name : getGnbMenuList
	  * @작성일 : 2023. 2. 14.
	  * @작성자 : kyh
	  * @Method 설명 : 상단 GNB 메뉴 조회
	  *  <p>
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : List<MnuVO>
	  */
	public List<MnuVO> getGnbMenuList(HashMap<String, Object> paramMap) throws Exception;

	/**
	  * @Method Name : getNavMenuList
	  * @작성일 : 2023. 2. 14.
	  * @작성자 : kyh
	  * @Method 설명 : 상단 navigation 메뉴 조회
	  *  <p>
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : List<MnuVO>
	  */
	public List<MnuVO> getNavMenuList(HashMap<String, Object> paramMap) throws Exception;

	/**
	  * @Method Name : getNowMenuInfo
	  * @작성일 : 2023. 2. 14.
	  * @작성자 : kyh
	  * @Method 설명 : 상단 메뉴 타이틀 조회
	  *  <p>
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> getNowMenuInfo(HashMap<String, Object> paramMap) throws Exception;
}
