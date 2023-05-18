package kcure.portal.sys.mnu.dvz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.mnu.dvz.service.MnuDvzService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.dvz.service.impl
  * @FileName : MnuDvzServiceImpl.java
  * @since : 2023. 3. 27.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	시각화 메뉴 관리 ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("mnuDvzService")
public class MnuDvzServiceImpl extends EgovAbstractServiceImpl implements MnuDvzService{

	@Resource(name="mnuDvzDAO")
    private MnuDvzDAO mnuDvzDAO;

	@Override
	public List<Map<String, Object>> selectMenuManageList(ComDefaultVO comDefaultVO) throws Exception {
		return mnuDvzDAO.selectMenuManageList(comDefaultVO);
	}

	@Override
	public int selectMenuManageListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
		return mnuDvzDAO.selectMenuManageListTotCnt(comDefaultVO);
	}

	@SuppressWarnings("unchecked")
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

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			map.put("vslzMenuOrd", Integer.valueOf(String.valueOf(childObj.get("vslzMenuOrd"))));
    			map.put("userId", user.getId());
    			mnuDvzDAO.insertMenuManage(map);
    		}
    	}

    	//수정
    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			map.put("vslzMenuOrd", Integer.valueOf(String.valueOf(childObj.get("vslzMenuOrd"))));
    			map.put("userId", user.getId());
    			mnuDvzDAO.deleteMenuManage(map);
    			mnuDvzDAO.insertMenuManage(map);
    		}
    	}

    	//삭제
    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.put("vslzMenuId", childObj.get("vslzMenuId"));
    			mnuDvzDAO.deleteMenuManage(map);
    		}
    	}
	}
}
