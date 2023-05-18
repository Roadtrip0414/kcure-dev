package kcure.portal.uss.umt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.uss.umt.service.UmtService;

@Service("umtService")
public class UmtServiceImpl extends EgovAbstractServiceImpl implements UmtService{

	@Resource(name="umtDAO")
	private UmtDAO umtDAO;

	@Override
	public List<UmtVO> viewUser(UmtVO umtVO) throws Exception {
		return umtDAO.viewUser(umtVO);
	}

	@Override
	public int viewUserTotCnt(UmtVO umtVO) throws Exception {
		return umtDAO.viewUserTotCnt(umtVO);
	}


}
