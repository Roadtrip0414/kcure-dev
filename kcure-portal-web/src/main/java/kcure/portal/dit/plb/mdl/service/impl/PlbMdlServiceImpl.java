package kcure.portal.dit.plb.mdl.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.dit.plb.mdl.service.PlbMdlService;

@Service("PlbMdlService")
public class PlbMdlServiceImpl extends EgovAbstractServiceImpl implements PlbMdlService{

	@Resource(name="PlbMdlDAO")
    private PlbMdlDAO plbMdlDAO;

	@Override
	public List<Map<String, Object>> selectLclsNmList(Map<String, Object> map) throws Exception {
		return plbMdlDAO.selectLclsNmList(map);
	}

	@Override
	public List<Map<String, Object>> selectTblEnmList(Map<String, Object> map) throws Exception {
		return plbMdlDAO.selectTblEnmList(map);
	}

	@Override
	public List<Map<String, Object>> selectColKnmList(Map<String, Object> map) throws Exception {
		return plbMdlDAO.selectColKnmList(map);
	}

}
