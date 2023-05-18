package kcure.portal.sys.rsr.daz.service.impl;

import java.util.Map;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.rsr.daz.service.RsrDazService;

@Service("rsrDazService")
public class RsrDazServiceImpl  extends EgovAbstractServiceImpl implements RsrDazService {

	@Resource(name="rsrDazDAO")
    private RsrDazDAO rsrDazDAO;

	@Override
	public List<Map<String, Object>> selectSvcPrtiSpCdIs02(RsrDazSearchVO searchVO) throws Exception {
		return rsrDazDAO.selectSvcPrtiSpCdIs02(searchVO);
	}

	@Override
	public int selectSvcPrtiSpCdIs02TotCnt(RsrDazSearchVO searchVO) throws Exception {
		return rsrDazDAO.selectSvcPrtiSpCdIs02TotCnt(searchVO);
	}

	@Override
	public void saveSvcPrtiCtpvSpcd(GridParameterMap gridParameterMap, String userId) throws Exception {
		UpdateCtpvSpcdVO[] updates = gridParameterMap.getUpdate(UpdateCtpvSpcdVO.class);

		for (UpdateCtpvSpcdVO vo : updates) {
			vo.setLastModpId(userId);
			rsrDazDAO.updateSvcPrtiCtpvSpcd(vo);
		}
	}


	@Override
	public List<Map<String, Object>> selectSvcPrtiDszList(ComDefaultVO searchVO) throws Exception {
		return rsrDazDAO.selectSvcPrtiDszList(searchVO);
	}

	@Override
	public int selectSvcPrtiDszListTotCnt(ComDefaultVO searchVO) throws Exception {
		return rsrDazDAO.selectSvcPrtiDszListTotCnt(searchVO);
	}

	@Override
	public void saveSvcPrtiDsz(GridParameterMap gridParameterMap, String userId) throws Exception {
		SvcPrtiDszVO[] inserts = gridParameterMap.getCreate(SvcPrtiDszVO.class);
		SvcPrtiDszVO[] updates = gridParameterMap.getUpdate(SvcPrtiDszVO.class);
		SvcPrtiDszVO[] deletes = gridParameterMap.getDelete(SvcPrtiDszVO.class);

		for (SvcPrtiDszVO vo : inserts) {
			vo.setFrstRegpId(userId);
			vo.setLastModpId(userId);
			rsrDazDAO.insertSvcPrtiDsz(vo);
		}

		for (SvcPrtiDszVO vo : updates) {
			vo.setLastModpId(userId);
			rsrDazDAO.updateSvcPrtiDsz(vo);
		}

		for (SvcPrtiDszVO vo : deletes) {
			rsrDazDAO.deleteSvcPrtiDsz(vo);
		}
	}
}
