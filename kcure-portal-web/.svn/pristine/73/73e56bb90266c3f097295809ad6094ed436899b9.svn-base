package kcure.portal.sys.etc.srv.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.etc.srv.service.EtcSrvService;
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
  * @package_name : kcure.portal.sys.etc.service.impl
  * @FileName : EtcServiceImpl.java
  * @since : 2023. 3. 29.
  * @version 1.0
  * @author : kyj
  * @프로그램 설명 : 권한관리에 관한 ServiceImpl 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("EtcSrvService")
public class EtcSrvServiceImpl extends EgovAbstractServiceImpl implements EtcSrvService {

	@Resource(name="EtcSrvDAO")
    private EtcSrvDAO etcSrvDAO;

    /**
	 * 설문조사 목록을 조회한다.
	 * @param etcVO etcVO
	 * @return List<etcVO>
	 * @exception Exception
	 */
    public List<Map<String,Object>> selectSrvyList(ComDefaultVO comDefaultVO) throws Exception {
        return etcSrvDAO.selectSrvyList(comDefaultVO);
    }

    /**
	 * 설문조사 목록을 카운트한다.
	 * @param comDefaultVO etcVO
	 * @return int
	 * @exception Exception
	 */
    public int selectSrvyListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
        return etcSrvDAO.selectSrvyListTotCnt(comDefaultVO);
    }

	/**
	 * 설문조사 리스트를 저장한다.
	 * @param ramDefaultVO RamDefaultVO
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public void saveSrvy(GridParameterMap gridParameterMap) throws Exception {
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
    			map.put("prtiId", user.getPrtiId());
    			etcSrvDAO.insertSrvy(map);
    		}
    	}

    	//수정
    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			map.put("lastModpId", user.getId());
    			etcSrvDAO.updateSrvy(map);
    		}
    	}

    	//삭제
    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			etcSrvDAO.deleteSrvy(map);
    		}
    	}

    }
}