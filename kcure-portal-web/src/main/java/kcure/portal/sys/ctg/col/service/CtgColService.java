package kcure.portal.sys.ctg.col.service;

import java.util.List;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.ctg.col.service.impl.CtgColVO;

public interface CtgColService {
	public List<CtgColVO> selectDtsColDfndList(CtgColVO ctgColVO) throws Exception;

	public int selectDtsColDfndListTotCnt(CtgColVO ctgColVO) throws Exception;

	public void saveDtsColDfnd(GridParameterMap gridParameterMap, String userId) throws Exception;

	public void insertDtsColDfnd(List<CtgColVO> inserts, String userId) throws Exception;
}
