package kcure.portal.sys.ctg.cds.service;

import java.util.List;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.ctg.cds.service.impl.CtgCdsDetlVO;

public interface CtgCdsDetlService {
	public List<CtgCdsDetlVO> selectCdsDetlList(CtgCdsDetlVO ctgCdsDetlVO) throws Exception;

	public int selectCdsDetlListTotCnt(CtgCdsDetlVO ctgCdsDetlVO) throws Exception;

	public void saveCdsDetl(GridParameterMap gridParameterMap, String userId) throws Exception;
}
