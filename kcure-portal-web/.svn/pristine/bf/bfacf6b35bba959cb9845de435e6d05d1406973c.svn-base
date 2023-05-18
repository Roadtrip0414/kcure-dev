package kcure.portal.sys.ctg.dts.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.ctg.dts.service.CtgDtsService;

@Service("ctgDtsService")
public class CtgDtsServiceImpl  extends EgovAbstractServiceImpl implements CtgDtsService {

	@Resource(name="ctgDtsDAO")
    private CtgDtsDAO ctgDtsDAO;

	@Override
	public List<CtgDtsVO> selectDtsDfndList(CtgDtsVO ctgDtsVO) throws Exception {
		return ctgDtsDAO.selectDtsDfndList(ctgDtsVO);
	}

	@Override
	public int selectDtsDfndListTotCnt(CtgDtsVO ctgDtsVO) throws Exception {
		return ctgDtsDAO.selectDtsDfndListTotCnt(ctgDtsVO);
	}

	@Override
	public List<CtgDtsVO> selectPrtiDtsList() throws Exception {
		return ctgDtsDAO.selectPrtiDtsList();
	}

	@Override
	public void saveDtsDfnd(GridParameterMap gridParameterMap, String userId) throws Exception {
		CtgDtsVO[] inserts = gridParameterMap.getCreate(CtgDtsVO.class);
		CtgDtsVO[] updates = gridParameterMap.getUpdate(CtgDtsVO.class);
		CtgDtsVO[] deletes = gridParameterMap.getDelete(CtgDtsVO.class);

		for (CtgDtsVO vo : inserts) {
			vo.setFrstRegpId(userId);
			vo.setLastModpId(userId);
			ctgDtsDAO.insertDtsDfnd(vo);
		}

		for (CtgDtsVO vo : updates) {
			vo.setLastModpId(userId);
			ctgDtsDAO.updateDtsDfnd(vo);
		}

		for (CtgDtsVO vo : deletes) {
			ctgDtsDAO.deleteDtsDfnd(vo);
		}
	}
}
