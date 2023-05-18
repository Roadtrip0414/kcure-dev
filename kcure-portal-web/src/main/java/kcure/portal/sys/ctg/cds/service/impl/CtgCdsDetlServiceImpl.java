package kcure.portal.sys.ctg.cds.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.ctg.cds.service.CtgCdsDetlService;

@Service("ctgCdsDetlService")
public class CtgCdsDetlServiceImpl  extends EgovAbstractServiceImpl implements CtgCdsDetlService {

	@Resource(name="ctgCdsDetlDAO")
    private CtgCdsDetlDAO ctgCdsDetlDAO;

	@Override
	public List<CtgCdsDetlVO> selectCdsDetlList(CtgCdsDetlVO ctgCdsDetlVO) throws Exception {
		return ctgCdsDetlDAO.selectCdsDetlList(ctgCdsDetlVO);
	}

	@Override
	public int selectCdsDetlListTotCnt(CtgCdsDetlVO ctgCdsDetlVO) throws Exception {
		return ctgCdsDetlDAO.selectCdsDetlListTotCnt(ctgCdsDetlVO);
	}

	@Override
	public void saveCdsDetl(GridParameterMap gridParameterMap, String userId) throws Exception {
		CtgCdsDetlVO[] inserts = gridParameterMap.getCreate(CtgCdsDetlVO.class);
		CtgCdsDetlVO[] updates = gridParameterMap.getUpdate(CtgCdsDetlVO.class);
		CtgCdsDetlVO[] deletes = gridParameterMap.getDelete(CtgCdsDetlVO.class);

		for (CtgCdsDetlVO vo : inserts) {
			vo.setFrstRegpId(userId);
			vo.setLastModpId(userId);
			ctgCdsDetlDAO.insertCdsDetl(vo);
		}

		for (CtgCdsDetlVO vo : updates) {
			vo.setLastModpId(userId);
			ctgCdsDetlDAO.updateCdsDetl(vo);
		}

		for (CtgCdsDetlVO vo : deletes) {
			ctgCdsDetlDAO.deleteCdsDetl(vo);
		}
	}
}
