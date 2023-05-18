package kcure.portal.sys.aum.mng.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.aum.mng.service.AumMngService;
import kcure.portal.sys.aum.usr.service.impl.AumUsrDAO;
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
  * @package_name        : kcure.portal.sys.aum.service.impl
  * @FileName : AumServiceImpl.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	권한관리에 관한 ServiceImpl 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("aumMngService")
public class AumMngServiceImpl extends EgovAbstractServiceImpl implements AumMngService {

	@Resource(name="aumMngDAO")
    private AumMngDAO aumMngDAO;

	@Resource(name="aumUsrDAO")
	private AumUsrDAO aumUsrDAO;

    /**
	 * 권한 목록을 조회한다.
	 * @param aumVO AumVO
	 * @return List<AumVO>
	 * @exception Exception
	 */
    public List<Map<String,Object>> selectAuthorList(ComDefaultVO comDefaultVO) throws Exception {
        return aumMngDAO.selectAuthorList(comDefaultVO);
    }

    /**
	 * 권한 목록 카운트를 조회한다.
	 * @param comDefaultVO AumVO
	 * @return int
	 * @exception Exception
	 */
    public int selectAuthorListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
        return aumMngDAO.selectAuthorListTotCnt(comDefaultVO);
    }

	/**
	 * 권한을 등록한다.
	 * @param ramDefaultVO RamDefaultVO
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public void saveAuthor(GridParameterMap gridParameterMap) throws Exception {
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
    			aumMngDAO.insertAuthor(map);
    		}
    	}

    	//수정
    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			map.put("lastModpId", user.getId());
    			aumMngDAO.updateAuthor(map);
    		}
    	}

    	//삭제
    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			//권한 유저 테이블 삭제
    			aumUsrDAO.deleteAuthUser(map);
    			//권한 테이블 삭제
    			aumMngDAO.deleteAuthor(map);
    		}
    	}

    }

	@Override
	public List<Map<String, Object>> selectAuthAllList() throws Exception {
		return aumMngDAO.selectAuthAllList();
	}

	@Override
	public int selectAuthAllListTotCnt() throws Exception {
		return aumMngDAO.selectAuthAllListTotCnt();
	}
}
