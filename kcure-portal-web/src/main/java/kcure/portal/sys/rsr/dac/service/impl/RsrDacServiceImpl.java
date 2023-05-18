package kcure.portal.sys.rsr.dac.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.rsr.dac.service.RsrDacService;
import kcure.portal.sys.aum.usr.service.impl.AumUsrDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Service("rsrDacService")
public class RsrDacServiceImpl extends EgovAbstractServiceImpl implements RsrDacService {

	@Resource(name="rsrDacDAO")
    private RsrDacDAO rsrDacDAO;

    public List<Map<String, Object>> selectDataAplcEndList(RsrDacSearchVO searchVO) throws Exception {
        return rsrDacDAO.selectDataAplcEndList(searchVO);
    }

    public int selectDataAplcEndListTotCnt(RsrDacSearchVO searchVO) throws Exception {
        return rsrDacDAO.selectDataAplcEndListTotCnt(searchVO);
    }
}
