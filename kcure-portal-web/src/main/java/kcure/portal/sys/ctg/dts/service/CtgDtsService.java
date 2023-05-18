package kcure.portal.sys.ctg.dts.service;

import java.util.List;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.ctg.dts.service.impl.CtgDtsVO;

public interface CtgDtsService {
	public List<CtgDtsVO> selectDtsDfndList(CtgDtsVO dtsDfndVO) throws Exception;

	public int selectDtsDfndListTotCnt(CtgDtsVO dtsDfndVO) throws Exception;

	public List<CtgDtsVO> selectPrtiDtsList() throws Exception;

	public void saveDtsDfnd(GridParameterMap gridParameterMap, String userId) throws Exception;
}
