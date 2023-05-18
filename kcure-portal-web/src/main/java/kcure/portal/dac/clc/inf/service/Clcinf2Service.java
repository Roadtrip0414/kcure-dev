package kcure.portal.dac.clc.inf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReqTreeVo;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;
import kcure.portal.dac.clc.inf.service.impl.ClcInfRspVo;
import kcure.portal.dac.clc.inf.service.impl.ColDfndVo;

public interface Clcinf2Service {
	
	public List<ClcInfReqTreeVo>selectPrtiTreeList01() throws Exception;
	
	public List<ClcInfReqTreeVo>selectPrtiTreeList02(ClcInfReserchVo vo) throws Exception;
	
	public List<ClcInfReqTreeVo>selectPrtiTreeList03() throws Exception;
	
	public List<ClcInfReqTreeVo>selectDtsTreeList(String prtiId) throws Exception;
	
	public List<ClcInfReqTreeVo>selectPub01DtsTreeList() throws Exception;
	
	public List<ClcInfReqTreeVo>selectPub02DtsTreeList() throws Exception;
	
	public List<ColDfndVo>selectColDfndList(Map paramap) throws Exception;
	
	public ClcInfReserchVo selectDetailClcInfReserch(ClcInfReserchVo clcInfReserchVo) throws Exception;
	
	public int selectClcInfRspCnt(String dataAplcNo) throws Exception;
	
	public ClcInfRspVo selectClcInfRsp(String dataAplcNo) throws Exception;
	
	public List<ClcInfRspVo> selectClcInfRspList(String dataAplcNo) throws Exception;
	
	
	public List<HashMap<String, Object>> selectTmplte1List(HashMap<String, Object> paramap) throws Exception;
	public List<HashMap<String, Object>> selectTmplte2List(HashMap<String, Object> paramap) throws Exception;
	public List<HashMap<String, Object>> selectTmplte3List(HashMap<String, Object> paramap) throws Exception;
	public List<HashMap<String, Object>> selectTmplte4List(HashMap<String, Object> paramap) throws Exception;
	public List<HashMap<String, Object>> selectTmplte5List(HashMap<String, Object> paramap) throws Exception;
	
	public List<HashMap<String, Object>> selectPubTmplte1List(HashMap<String, Object> paramap) throws Exception;
	public List<HashMap<String, Object>> selectPubTmplte2List(HashMap<String, Object> paramap) throws Exception;
	
	
	public void saveAplcRvw(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public void deleteTmpAddDataAplcDts(HashMap<String, Object> paramMap) throws Exception;
	
	public void deleteTmpDataAplcDtsOne(HashMap<String, Object> paramMap) throws Exception;
	
	public void deleteTmpAddDataAplcDtsOne(HashMap<String, Object> paramMap) throws Exception;
	
	public int insertAplcRvw(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public int insertDtapStatHst(ClcInfReserchVo clcInfReserchVo) throws Exception;
	
	public int insertPrvdInst(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public int insertAplcTempDts(List<HashMap<String, Object>> param) throws Exception;
	
	public int insertAplcDts(HashMap<String, Object> paramMap) throws Exception;
	
	public int updateAplcAddTmpDts(HashMap<String, Object> paramMap) throws Exception;
	
	public void updateAplcProgStcd(ClcInfReserchVo vo) throws Exception;
	
	public int insertAplcAddTmpDts(HashMap<String, Object> paramMap) throws Exception;
	
	public int insertAplcAddDts(HashMap<String, Object> paramMap) throws Exception;
	
	public int selectTmpAplcAddTmpDtsCnt(HashMap<String, Object> paramMap) throws Exception;
		
	public List<HashMap<String, Object>> selectTmpAplcAddTmpDtsList(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public List<HashMap<String, Object>> selectTmpDtsList(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public HashMap<String, Object> selectTmpDtsOne(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public List<ClcInfRspVo> selectDtsList(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public List<ClcInfRspVo> selectDtsList2(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public void saveReqData(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public List<DataServiceFileVO> selectDataServiceFileList(DataServiceFileVO dataVo) throws Exception;
	
	public int selectAplDtsListCnt(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public List<HashMap<String, Object>> selectAplDtsList(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public List<HashMap<String, Object>> selectAplTmpDtsHistList(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public List<HashMap<String, Object>> selectAplDtsHistList(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public List<HashMap<String, Object>> selectAplDtsHistList2(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public List<HashMap<String, Object>> selectAplAddDtsHistList2(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public HashMap<String, Object> selectAplDtsStep(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public void deleteAllDataAplcDts(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public void deleteDataAplcDts(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public void deleteAllAddDataAplcDts(ClcInfRspVo clcInfRspVo) throws Exception;
	
	public void deleteAddDataAplcDts(ClcInfRspVo clcInfRspVo) throws Exception;

	public String selectNccApiList(String dataAplcNo);
	
	public List<Map<String, Object>> selectNccApiFileList(DataServiceFileVO vo) throws Exception;


}
