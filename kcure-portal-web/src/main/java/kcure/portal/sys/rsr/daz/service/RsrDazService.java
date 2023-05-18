package kcure.portal.sys.rsr.daz.service;

import java.util.Map;
import java.util.List;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.rsr.daz.service.impl.RsrDazSearchVO;
import kcure.portal.sys.cmm.ComDefaultVO;

public interface RsrDazService {
	public List<Map<String, Object>> selectSvcPrtiSpCdIs02(RsrDazSearchVO rsrDazVO) throws Exception;

	public int selectSvcPrtiSpCdIs02TotCnt(RsrDazSearchVO rsrDazVO) throws Exception;

	public void saveSvcPrtiCtpvSpcd(GridParameterMap gridParameterMap, String userId) throws Exception;


	public List<Map<String, Object>> selectSvcPrtiDszList(ComDefaultVO searchVO) throws Exception;

	public int selectSvcPrtiDszListTotCnt(ComDefaultVO searchVO) throws Exception;

	public void saveSvcPrtiDsz(GridParameterMap gridParameterMap, String userId) throws Exception;
}
