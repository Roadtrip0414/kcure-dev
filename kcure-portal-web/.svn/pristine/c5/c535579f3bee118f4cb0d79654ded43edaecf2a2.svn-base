package kcure.portal.sys.ctg.col.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.ctg.col.service.CtgColService;

@Service("ctgColService")
public class CtgColServiceImpl  extends EgovAbstractServiceImpl implements CtgColService {

	@Resource(name="ctgColDAO")
    private CtgColDAO ctgColDAO;

	@Override
	public List<CtgColVO> selectDtsColDfndList(CtgColVO ctgColVO) throws Exception {
		return ctgColDAO.selectDtsColDfndList(ctgColVO);
	}

	@Override
	public int selectDtsColDfndListTotCnt(CtgColVO ctgColVO) throws Exception {
		return ctgColDAO.selectDtsColDfndListTotCnt(ctgColVO);
	}

	@Override
	public void saveDtsColDfnd(GridParameterMap gridParameterMap, String userId) throws Exception {
		CtgColVO[] inserts = gridParameterMap.getCreate(CtgColVO.class);
		CtgColVO[] updates = gridParameterMap.getUpdate(CtgColVO.class);
		CtgColVO[] deletes = gridParameterMap.getDelete(CtgColVO.class);

		for (CtgColVO vo : inserts) {
			vo.setFrstRegpId(userId);
			vo.setLastModpId(userId);
			ctgColDAO.insertDtsColDfnd(vo);
		}

		for (CtgColVO vo : updates) {
			vo.setLastModpId(userId);
			ctgColDAO.updateDtsColDfnd(vo);
		}

		for (CtgColVO vo : deletes) {
			ctgColDAO.deleteDtsColDfnd(vo);
		}
	}

	@Override
	public void insertDtsColDfnd(List<CtgColVO> inserts, String userId) throws Exception {
		for (CtgColVO vo : inserts) {
			vo.setFrstRegpId(userId);
			vo.setLastModpId(userId);
			ctgColDAO.insertDtsColDfnd(vo);
		}
	}
}
