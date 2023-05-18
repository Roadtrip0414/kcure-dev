package kcure.portal.sys.pim.mng.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.pim.mng.service.PimMngService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.pim.mng.service.impl
  * @FileName : PimServiceImpl.java
  * @since : 2023. 2. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	참여기관 관리 ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("pimMngService")
public class PimMngServiceImpl extends EgovAbstractServiceImpl implements PimMngService {

	@Resource(name="pimMngDAO")
    private PimMngDAO pimMngDAO;

	@Override
	public List<Map<String, Object>> selectPrtiList(ComDefaultVO comDefaultVO) throws Exception {
		return pimMngDAO.selectPrtiList(comDefaultVO);
	}

	@Override
	public int selectPrtiListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
		return pimMngDAO.selectPrtiListTotCnt(comDefaultVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public String savePrti(GridParameterMap gridParameterMap) throws Exception {
		String rtn = "";

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
    			map.put("frstRegpId", user.getId());
    			map.put("lastModpId", user.getId());
    			try {
    				pimMngDAO.insertPrti(map);
    			}catch(DuplicateKeyException e) {
    				e.getMessage();
    				rtn = "중복된 ID가 있습니다.";
    			}
    		}
    	}

    	//수정
    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;
    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			map.put("lastModpId", user.getId());
    			pimMngDAO.updatePrti(map);
    		}
    	}

    	//삭제
    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;
    			Map<String, Object> map = new HashMap<String, Object>();
    			map.put("prtiId", childObj.get("prtiId"));
    			pimMngDAO.deletePrti(map);
    		}
    	}

    	return rtn;
	}

	@Override
	public List<?> selectPrtiAllList(String param) throws Exception {
		return pimMngDAO.selectPrtiAllList(param);
	}
}
