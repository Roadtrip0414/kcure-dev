package kcure.portal.dit.clb.mdl.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.dit.clb.mdl.service.ClbMdlService;

@Service("ClbMdlService")
public class ClbMdlServiceImpl extends EgovAbstractServiceImpl implements ClbMdlService{

	@Resource(name="ClbMdlDAO")
    private ClbMdlDAO clbMdlDAO;

	@Override
	public List<Map<String, Object>> selectCrcnNmList(Map<String, Object> map) throws Exception {
		return clbMdlDAO.selectCrcnNmList(map);
	}

	@Override
	public List<Map<String, Object>> selectLclsNmList(Map<String, Object> map) throws Exception {
		return clbMdlDAO.selectLclsNmList(map);
	}

	@Override
	public List<Map<String, Object>> selectMclsNmList(Map<String, Object> map) throws Exception {
		return clbMdlDAO.selectMclsNmList(map);
	}

	@Override
	public List<Map<String, Object>> selectColKnmList(Map<String, Object> map) throws Exception {
		return clbMdlDAO.selectColKnmList(map);
	}

}
