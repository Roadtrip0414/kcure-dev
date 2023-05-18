package kcure.portal.sys.ctg.cds.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.ctg.cds.service.CtgCdsService;

@Service("ctgCdsService")
public class CtgCdsServiceImpl  extends EgovAbstractServiceImpl implements CtgCdsService {

	@Resource(name="ctgCdsDAO")
    private CtgCdsDAO ctgCdsDAO;

	@Override
	public List<CtgCdsVO> selectCdsDfndList(CtgCdsVO ctgCdsVO) throws Exception {
		return ctgCdsDAO.selectCdsDfndList(ctgCdsVO);
	}

	@Override
	public int selectCdsDfndListTotCnt(CtgCdsVO ctgCdsVO) throws Exception {
		return ctgCdsDAO.selectCdsDfndListTotCnt(ctgCdsVO);
	}

	@Override
	public void saveCdsDfnd(GridParameterMap gridParameterMap, String userId) throws Exception {
		CtgCdsVO[] inserts = gridParameterMap.getCreate(CtgCdsVO.class);
		CtgCdsVO[] updates = gridParameterMap.getUpdate(CtgCdsVO.class);
		CtgCdsVO[] deletes = gridParameterMap.getDelete(CtgCdsVO.class);

		for (CtgCdsVO vo : inserts) {
			vo.setFrstRegpId(userId);
			vo.setLastModpId(userId);
			ctgCdsDAO.insertCdsDfnd(vo);
		}

		for (CtgCdsVO vo : updates) {
			vo.setLastModpId(userId);
			ctgCdsDAO.updateCdsDfnd(vo);
		}

		for (CtgCdsVO vo : deletes) {
			ctgCdsDAO.deleteCdsDfnd(vo);
		}
	}

	@Override
	public void insertCdsDfnd(List<CtgCdsVO> inserts, String userId) throws Exception {
		for (CtgCdsVO vo : inserts) {
			vo.setFrstRegpId(userId);
			vo.setLastModpId(userId);
			ctgCdsDAO.insertCdsDfnd(vo);
		}
	}
}
