package kcure.portal.sys.aum.mnu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.aum.mnu.service.AumMnuService;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.aum.mnu.service.impl
  * @FileName : AumServiceImpl.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	권한별 메뉴관리에 관한 ServiceImpl 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("aumMnuService")
public class AumMnuServiceImpl extends EgovAbstractServiceImpl implements AumMnuService {

	@Resource(name="aumMnuDAO")
    private AumMnuDAO aumMnuDAO;

	@Override
	public List<Map<String,Object>> selectAuthorMenuList(ComDefaultVO comDefaultVO) throws Exception {
		return aumMnuDAO.selectAuthorMenuList(comDefaultVO);
	}

	@Override
	public int selectAuthorMenuListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
		return aumMnuDAO.selectAuthorMenuListTotCnt(comDefaultVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void saveAuthorMenu(GridParameterMap gridParameterMap) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		JSONArray updateArr = gridParameterMap.getUpdate();
		JSONArray deleteArr = gridParameterMap.getDelete();

    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			map.put("frstRegpId", user.getId());
    			map.put("lastModpId", user.getId());
    			aumMnuDAO.insertAuthorMenu(map);
    		}
    	}

    	//삭제
    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);

    			aumMnuDAO.deleteAuthorMenu(map);
    		}
    	}
	}
}
