package kcure.portal.sys.dac.prc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kcure.portal.cmn.CommonEnum.NtceUserInfo;
import kcure.portal.cmn.alm.service.AlmService;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.dac.prc.service.DacPrcService;
import kcure.portal.sys.aum.usr.service.impl.AumUsrDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Service("dacPrcService")
public class DacPrcServiceImpl extends EgovAbstractServiceImpl implements DacPrcService {

	@Resource(name="dacPrcDAO")
    private DacPrcDAO dacPrcDAO;

	@Resource(name = "almService")
	private AlmService almService;
	
    public List<Map<String,Object>> selectSvcPrtiSpCdIs01(ComDefaultVO comDefaultVO) throws Exception {
        return dacPrcDAO.selectSvcPrtiSpCdIs01(comDefaultVO);
    }

    @SuppressWarnings("unchecked")
	public void saveUserRvwPrncYn(GridParameterMap gridParameterMap) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	JSONArray updateArr = gridParameterMap.getUpdate();

    	//수정
    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			map.put("lastModpId", user.getId());
    			dacPrcDAO.saveUserRvwPrncYn(map);

    			//심의자 초청 알림 및 메일 발송
    			almService.registAlrm(NtceUserInfo.NTCE_REVW_01.getSpDtlcd(), (String)map.get("userId"), (String)map.get("prtiId"));
    			
    		}
    	}
    }

    public List<Map<String, Object>> selectUserList(Map<String, String> param) throws Exception {
        return dacPrcDAO.selectUserList(param);
    }
}
