package kcure.portal.dac.clc.inf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.cmn.service.DataServiceFileVO;

@Repository("clcinf2DAO")
public class Clcinf2DAO extends EgovComAbstractDAO {

	private static final String sqlNameSpace = "clcinf2DAO.";
	
	/**
	 * 데이터제공기관(임상) tree 조회
	 * @return List
	 * @exception Exception
	 */
	public List<ClcInfReqTreeVo>selectPrtiTreeList01() throws Exception{
		return selectList(sqlNameSpace + "selectPrtiTreeList01");
	}
	
	/**
	 * 데이터제공기관(공공) tree 조회
	 * @return List
	 * @exception Exception
	 */
	public List<ClcInfReqTreeVo>selectPrtiTreeList02(ClcInfReserchVo vo) throws Exception{
		return selectList(sqlNameSpace + "selectPrtiTreeList02", vo);
	}
	
	/**
	 * 데이터제공기관(결합) tree 조회
	 * @return List
	 * @exception Exception
	 */
	public List<ClcInfReqTreeVo>selectPrtiTreeList03() throws Exception{
		return selectList(sqlNameSpace + "selectPrtiTreeList03");
	}
	
	/**
	 * 데이터셋 임상 tree 조회
	 * @return List
	 * @exception Exception
	 */
	public List<ClcInfReqTreeVo>selectDtsTreeList(String prtiId) throws Exception{
		return selectList(sqlNameSpace + "selectDtsTreeList", prtiId);
	}
	
	/**
	 * 데이터셋 공공(표준) tree 조회
	 * @return List
	 * @exception Exception
	 */
	public List<ClcInfReqTreeVo>selectPub01DtsTreeList() throws Exception{
		return selectList(sqlNameSpace + "selectPub01DtsTreeList");
	}
	
	/**
	 * 데이터셋 공공(맞춤) tree 조회
	 * @return List
	 * @exception Exception
	 */
	public List<ClcInfReqTreeVo>selectPub02DtsTreeList() throws Exception{
		return selectList(sqlNameSpace + "selectPub02DtsTreeList");
	}
	
	/**
	 * 데이터셋 컬럼 목록 조회
	 * @return List
	 * @exception Exception
	 */
	public List<ColDfndVo>selectColDfndList(Map paramap) throws Exception{
		return selectList(sqlNameSpace + "selectColDfndList", paramap);
	}
	
	/**
	 * 서비스신청 상세정보 조회
	 * @return ClcInfReserchVo
	 * @exception Exception
	 */
	public ClcInfReserchVo selectDetailClcInfReserch(ClcInfReserchVo clcInfReserchVo) {
		return selectOne(sqlNameSpace + "selectDetailClcInfReserch", clcInfReserchVo);
	}
	
	/**
	 * 참여 연구자 카운트 조회
	 * @return ClcInfReserchVo
	 * @exception Exception
	 */
	public int selectClcInfRspCnt(String dataAplcNo) {
		return selectOne(sqlNameSpace + "selectClcInfRspCnt", dataAplcNo);
	}
	
	/**
	 * 신청 연구자 조회
	 * @return ClcInfReserchVo
	 * @exception Exception
	 */
	public ClcInfRspVo selectClcInfRsp(String dataAplcNo) {
		return selectOne(sqlNameSpace + "selectClcInfRsp", dataAplcNo);
	}
	
	/**
	 * 연구자 리스트 조회
	 * @return ClcInfReserchVo
	 * @exception Exception
	 */
	public List<ClcInfRspVo> selectClcInfRspList(String dataAplcNo) {
		return selectList(sqlNameSpace + "selectClcInfRspList", dataAplcNo);
	}
	
	/**
	 * [템플릿] 암임상_데이터셋(목록)정보 리스트 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectTmplte1List(HashMap<String, Object> paramap) {
		return selectList(sqlNameSpace + "selectTmplte1List", paramap);
	}
	
	/**
	 * [템플릿] 공공_데이터셋(목록)정보 리스트 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectPubTmplte1List(HashMap<String, Object> paramap) {
		return selectList(sqlNameSpace + "selectPubTmplte1List", paramap);
	}
	
	/**
	 * [템플릿] 암임상_데이터셋(목록)정보 리스트 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectTmplte2List(HashMap<String, Object> paramap) {
		return selectList(sqlNameSpace + "selectTmplte2List", paramap);
	}
	
	/**
	 * [템플릿] 공공_데이터셋(목록)정보 리스트 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectPubTmplte2List(HashMap<String, Object> paramap) {
		return selectList(sqlNameSpace + "selectPubTmplte2List", paramap);
	}
	
	/**
	 * [템플릿] 코드값_코드명정보 리스트 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectTmplte3List(HashMap<String, Object> paramap) {
		return selectList(sqlNameSpace + "selectTmplte3List", paramap);
	}
	
	/**
	 * [템플릿] BaseLine_데이터셋(목록)정보 리스트 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectTmplte4List(HashMap<String, Object> paramap) {
		return selectList(sqlNameSpace + "selectTmplte4List", paramap);
	}
	
	/**
	 * [템플릿] BaseLine_데이터셋변수(항목)정보 리스트 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectTmplte5List(HashMap<String, Object> paramap) {
		return selectList(sqlNameSpace + "selectTmplte5List", paramap);
	}
	
	/**
	 * [템플릿] 데이터셋변수(항목)정보 임시등록
	 * @return HashMap
	 * @exception Exception
	 */
	public int insertAplcTempDts(HashMap<String, Object> paramap) {
		return insert(sqlNameSpace + "insertAplcTempDts", paramap);
	}
	
	/**
	 * [제출완료] 참여기관 심의 등록
	 * @return HashMap
	 * @exception Exception
	 */
	public int insertAplcRvw(ClcInfRspVo clcInfRspVo) {
		return insert(sqlNameSpace + "insertAplcRvw", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 이력등록
	 * @return HashMap
	 * @exception Exception
	 */
	public int insertDtapStatHst(ClcInfReserchVo clcInfReserchVo) {
		return insert(sqlNameSpace + "insertDtapStatHst", clcInfReserchVo);
	}
	
	/**
	 * [제출완료] 데이터 제공기관 등록
	 * @return HashMap
	 * @exception Exception
	 */
	public int insertPrvdInst(ClcInfRspVo clcInfRspVo) {
		return insert(sqlNameSpace + "insertPrvdInst", clcInfRspVo);
	}
	
	/**
	 * 데이터셋변수(항목) 정보 제출등록
	 * @return HashMap
	 * @exception Exception
	 */
	public int insertAplcDts(HashMap<String, Object> paramap) {
		return insert(sqlNameSpace + "insertAplcDts", paramap);
	}
	
	/**
	 * 데이터셋변수 추가정보 등록
	 * @return HashMap
	 * @exception Exception
	 */
	public int insertAplcAddDts(HashMap<String, Object> paramap) {
		return insert(sqlNameSpace + "insertAplcAddDts", paramap);
	}
	
	/**
	 * 임시등록 데이터셋변수 추가정보 등록
	 * @return HashMap
	 * @exception Exception
	 */
	public int insertAplcAddTmpDts(HashMap<String, Object> paramap) {
		return insert(sqlNameSpace + "insertAplcAddTmpDts", paramap);
	}
	
	/**
	 * 신청상태 변경
	 * @return 
	 * @exception Exception
	 */
	public void updateAplcProgStcd(ClcInfReserchVo vo) {
		update(sqlNameSpace + "updateAplcProgStcd", vo);
	}
	
	/**
	 * 임시등록 데이터셋변수 추가정보 수정
	 * @return HashMap
	 * @exception Exception
	 */
	public int updateAplcAddTmpDts(HashMap<String, Object> paramap) {
		return update(sqlNameSpace + "updateAplcAddTmpDts", paramap);
	}
	
	/**
	 * 임시등록 데이터셋변수 추가정보 조회
	 * @return int
	 * @exception Exception
	 */
	public int selectTmpAplcAddTmpDtsCnt(HashMap<String, Object> paramap) {
		return selectOne(sqlNameSpace + "selectTmpAplcAddTmpDtsCnt", paramap);
	}
	
	/**
	 * 심의등록삭제
	 * @return int
	 * @exception Exception
	 */
	public int deleteAplcRvw(ClcInfReserchVo vo) {
		return delete(sqlNameSpace + "deleteAplcRvw", vo);
	}
	
	/**
	 * 심의 제공기관 등록삭제
	 * @return int
	 * @exception Exception
	 */
	public int deletePrvdInst(ClcInfRspVo vo) {
		return delete(sqlNameSpace + "deletePrvdInst", vo);
	}
	
	/**
	 * 심의 제공기관 등록건수 조회
	 * @return int
	 * @exception Exception
	 */
	public int selectPrvdInstCnt(ClcInfRspVo vo) {
		return selectOne(sqlNameSpace + "selectPrvdInstCnt", vo);
	}
	
	/**
	 * 심의 등록건수 조회
	 * @return int
	 * @exception Exception
	 */
	public int selectAplcRvwCnt(ClcInfReserchVo vo) {
		return selectOne(sqlNameSpace + "selectAplcRvwCnt", vo);
	}
	
	/**
	 * 임시등록 데이터셋변수 추가정보 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectTmpAplcAddTmpDtsList(ClcInfRspVo clcInfRspVo) {
		return selectList(sqlNameSpace + "selectTmpAplcAddTmpDtsList", clcInfRspVo);
	}
	
	/**
	 * 임시등록 데이터셋변수 개별삭제
	 * @return HashMap
	 * @exception Exception
	 */
	public void deleteTmpDataAplcDtsOne(HashMap<String, Object> paramap) {
		delete(sqlNameSpace + "deleteTmpDataAplcDtsOne", paramap);
	}
	
	/**
	 * 임시등록 데이터셋변수 추가정보 알괄삭제
	 * @return HashMap
	 * @exception Exception
	 */
	public void deleteTmpAddDataAplcDts(HashMap<String, Object> paramap) {
		delete(sqlNameSpace + "deleteTmpAddDataAplcDts", paramap);
	}
	
	/**
	 * 임시등록 데이터셋변수 추가정보 개별삭제
	 * @return HashMap
	 * @exception Exception
	 */
	public void deleteTmpAddDataAplcDtsOne(HashMap<String, Object> paramap) {
		delete(sqlNameSpace + "deleteTmpAddDataAplcDtsOne", paramap);
	}
	
	/**
	 * 임시등록 데이터셋변수(항목)정보 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectTmpDtsList(ClcInfRspVo clcInfRspVo) {
		return selectList(sqlNameSpace + "selectTmpDtsList", clcInfRspVo);
	}
	
	/**
	 * 임시등록 데이터셋변수(항목)정보 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public HashMap<String, Object> selectTmpDtsOne(ClcInfRspVo clcInfRspVo) {
		return selectOne(sqlNameSpace + "selectTmpDtsOne", clcInfRspVo);
	}
	
	/**
	 * 등록 데이터셋변수(항목)정보 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<ClcInfRspVo> selectDtsList(ClcInfRspVo clcInfRspVo) {
		return selectList(sqlNameSpace + "selectDtsList", clcInfRspVo);
	}
	
	/**
	 * 등록 데이터셋변수(항목)정보 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<ClcInfRspVo> selectDtsList2(ClcInfRspVo clcInfRspVo) {
		return selectList(sqlNameSpace + "selectDtsList2", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 제출서류 파일 리스트 조회
	 * @return DataServiceFileVO
	 * @exception Exception
	 */
	public List<DataServiceFileVO> selectDataServiceFileList(DataServiceFileVO dataVo) {
		return selectList(sqlNameSpace + "selectDataServiceFileList", dataVo);
	}
	
	/**
	 * 데이터신청 리스트 카운트 조회
	 * @return int
	 * @exception Exception
	 */
	public int selectAplDtsListCnt(ClcInfRspVo clcInfRspVo) {
		return selectOne(sqlNameSpace + "selectAplDtsListCnt", clcInfRspVo);
	}

	/**
	 * 데이터신청 리스트 조회
	 * @return int
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectAplDtsList(ClcInfRspVo clcInfRspVo) {
		return selectList(sqlNameSpace + "selectAplDtsList", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 임시저장 리스트 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectAplTmpDtsHistList(ClcInfRspVo clcInfRspVo) {
		return selectList(sqlNameSpace + "selectAplTmpDtsHistList", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 히스토리 리스트 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectAplDtsHistList(ClcInfRspVo clcInfRspVo) {
		return selectList(sqlNameSpace + "selectAplDtsHistList", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 히스토리 리스트2 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectAplDtsHistList2(ClcInfRspVo clcInfRspVo) {
		return selectList(sqlNameSpace + "selectAplDtsHistList2", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 히스토리 리스트3 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public List<HashMap<String, Object>> selectAplAddDtsHistList2(ClcInfRspVo clcInfRspVo) {
		return selectList(sqlNameSpace + "selectAplAddDtsHistList2", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 진행상태 조회
	 * @return HashMap
	 * @exception Exception
	 */
	public HashMap<String, Object> selectAplDtsStep(ClcInfRspVo clcInfRspVo) {
		return selectOne(sqlNameSpace + "selectAplDtsStep", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 데이터셋 일괄삭제
	 * @return HashMap
	 * @exception Exception
	 */
	public void deleteAllDataAplcDts(ClcInfRspVo clcInfRspVo) {
		delete(sqlNameSpace + "deleteAllDataAplcDts", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 추가 데이터셋 일괄삭제
	 * @return HashMap
	 * @exception Exception
	 */
	public void deleteAllAddDataAplcDts(ClcInfRspVo clcInfRspVo) {
		delete(sqlNameSpace + "deleteAllAddDataAplcDts", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 데이터셋 삭제
	 * @return HashMap
	 * @exception Exception
	 */
	public void deleteDataAplcDts(ClcInfRspVo clcInfRspVo) {
		delete(sqlNameSpace + "deleteDataAplcDts", clcInfRspVo);
	}
	
	/**
	 * 데이터신청 추가 데이터셋 삭제
	 * @return HashMap
	 * @exception Exception
	 */
	public void deleteAddDataAplcDts(ClcInfRspVo clcInfRspVo) {
		delete(sqlNameSpace + "deleteAddDataAplcDts", clcInfRspVo);
	}

	public String selectNccApiList(String dataAplcNo) {
		return selectOne(sqlNameSpace + "selectNccApiList", dataAplcNo);
	}
	
	public List<Map<String, Object>> selectNccApiFileList(DataServiceFileVO vo) {
		return selectList(sqlNameSpace + "selectNccApiFileList", vo);
	}
	
}
