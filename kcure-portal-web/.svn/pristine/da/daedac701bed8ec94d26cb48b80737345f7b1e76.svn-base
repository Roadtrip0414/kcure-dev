package kcure.portal.sys.dac.rvw.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.dac.rvw.service.DacRvwService;
import kcure.portal.sys.aum.usr.service.impl.AumUsrDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Service("dacRvwService")
public class DacRvwServiceImpl extends EgovAbstractServiceImpl implements DacRvwService {

	@Resource(name="dacRvwDAO")
    private DacRvwDAO dacRvwDAO;

    public List<Map<String, Object>> selectDataAplcRvwList(DacRvwSearchVO searchVO) throws Exception {
        return dacRvwDAO.selectDataAplcRvwList(searchVO);
    }

    public int selectDataAplcRvwListTotCnt(DacRvwSearchVO searchVO) throws Exception {
        return dacRvwDAO.selectDataAplcRvwListTotCnt(searchVO);
    }

    public List<Map<String, Object>> selectRvwStpSpcdList() throws Exception {
        return dacRvwDAO.selectRvwStpSpcdList();
    }
}
