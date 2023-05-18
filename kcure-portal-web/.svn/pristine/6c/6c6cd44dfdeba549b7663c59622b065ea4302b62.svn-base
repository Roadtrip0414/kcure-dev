package kcure.portal.sys.mnu.mng.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.ObjectUtils;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.mnu.mng.service.MnuMngService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.mng.service.impl
  * @FileName : MnuServiceImpl.java
  * @since : 2023. 2. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 메뉴관리 ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("mnuMngService")
public class MnuMngServiceImpl  extends EgovAbstractServiceImpl implements MnuMngService {

	@Resource(name="mnuMngDAO")
    private MnuMngDAO mnuMngDAO;

	@Override
	public List<MnuVO> getMenuManageList(MnuVO mnuVO) throws Exception {
		return mnuMngDAO.selectMenuManageList(mnuVO);
	}

	@Override
	public int getMenuManageListTotCnt(MnuVO mnuVO) throws Exception {
		return mnuMngDAO.selectMenuManageListTotCnt(mnuVO);
	}

	@Override
	public void saveMenuManage(GridParameterMap gridParameterMap) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	JSONArray createArr = gridParameterMap.getCreate();
    	JSONArray updateArr = gridParameterMap.getUpdate();
    	JSONArray deleteArr = gridParameterMap.getDelete();

    	//추가
    	if(createArr.size() > 0) {
    		for (Object obj : createArr) {
    			JSONObject childObj = (JSONObject) obj;

    			MnuVO mnuVO = new MnuVO();
    			mnuVO.setMenuId(childObj.get("menuId").toString());
    			mnuVO.setHghrMenuId(ObjectUtils.toString(childObj.get("hghrMenuId")));
    			mnuVO.setMenuNm(ObjectUtils.toString(childObj.get("menuNm")));
    			mnuVO.setMenuDmnSpcd(childObj.get("menuDmnSpcd").toString());
    			mnuVO.setMenuUriAddr(ObjectUtils.toString(childObj.get("menuUriAddr")));
    			mnuVO.setMenuExplCont(ObjectUtils.toString(childObj.get("menuExplCont")));
    			mnuVO.setMenuOputOrd(Integer.parseInt(ObjectUtils.toString(childObj.get("menuOputOrd"),"0")));
    			mnuVO.setMenuUseYn(ObjectUtils.toString(childObj.get("menuUseYn")));
    			mnuVO.setMenuUriPattCont(ObjectUtils.toString(childObj.get("menuUriPattCont")));
    			mnuVO.setFrstRegpId(user.getId());
    			mnuVO.setLastModpId(user.getId());
    			mnuMngDAO.insertMenuManage(mnuVO);
    		}
    	}

    	//수정
    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;

    			MnuVO mnuVO = new MnuVO();
    			mnuVO.setMenuId(childObj.get("menuId").toString());
    			mnuVO.setHghrMenuId(ObjectUtils.toString(childObj.get("hghrMenuId")));
    			mnuVO.setMenuNm(ObjectUtils.toString(childObj.get("menuNm")));
    			mnuVO.setMenuDmnSpcd(childObj.get("menuDmnSpcd").toString());
    			mnuVO.setMenuUriAddr(ObjectUtils.toString(childObj.get("menuUriAddr")));
    			mnuVO.setMenuExplCont(ObjectUtils.toString(childObj.get("menuExplCont")));
    			mnuVO.setMenuOputOrd(Integer.parseInt(ObjectUtils.toString(childObj.get("menuOputOrd"),"0")));
    			mnuVO.setMenuUseYn(ObjectUtils.toString(childObj.get("menuUseYn")));
    			mnuVO.setMenuUriPattCont(ObjectUtils.toString(childObj.get("menuUriPattCont")));
    			mnuVO.setFrstRegpId(user.getId());
    			mnuVO.setLastModpId(user.getId());
    			mnuMngDAO.deleteMenuManage(mnuVO);
    			mnuMngDAO.insertMenuManage(mnuVO);
    		}
    	}

    	//삭제
    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			MnuVO mnuVO = new MnuVO();
    			mnuVO.setMenuId(childObj.get("menuId").toString());

    			mnuMngDAO.deleteMenuManage(mnuVO);
    		}
    	}
	}

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
	@Override
	public List<MnuVO> getGnbMenuList(HashMap<String, Object> paramMap) throws Exception {
		return mnuMngDAO.selectGnbMenuList(paramMap);
	}

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
	@Override
	public List<MnuVO> getNavMenuList(HashMap<String, Object> paramMap) throws Exception {
		return mnuMngDAO.selectNavMenuList(paramMap);
	}

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
	@Override
	public Map<String, Object> getNowMenuInfo(HashMap<String, Object> paramMap) throws Exception {
		return mnuMngDAO.selectNowMenuInfo(paramMap);
	}
}
