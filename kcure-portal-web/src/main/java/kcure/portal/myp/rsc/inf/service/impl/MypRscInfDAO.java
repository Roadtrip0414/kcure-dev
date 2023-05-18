package kcure.portal.myp.rsc.inf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.rsc.inf.service.impl
 * @FileName : MypRscInfDAO.java
 * @since : 2023. 02. 01.
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 : 마이페이지 나의연구 처리를 위한 DAO 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.02.01   kyh           최초생성
 *  </pre>
 */
@Repository("mypRscInfDAO")
public class MypRscInfDAO extends EgovComAbstractDAO {

	private static final String sqlNameSpace = "mypRscInf.";

	/**
	 * @Method Name : selectRscInfNavCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  //나의연구 메뉴별 카운트 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectRscInfNavCnt(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectRscInfNavCnt", paramMap);
	}

	/**
	  * @Method Name : selectMypRscAplcListTotCnt
	  * @작성일 : 2023. 5. 2.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	나의 연구 신청 목록 카운트
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : int
	  */
	public int selectMypRscAplcListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscAplcListTotCnt", paramMap);
	}

	/**
	  * @Method Name : selectMypRscAplcList
	  * @작성일 : 2023. 5. 2.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	나의 연구 신청 목록
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectMypRscAplcList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscAplcList", paramMap);
	}

    /**
	 * @Method Name : selectMypRscInfAplListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	public int selectMypRscInfAplListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfAplListTotCnt", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfAplList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfAplList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfAplList", paramMap);
	}

	 /**
		 * @Method Name : selectMypRscInfInListTotCnt
		 * @작성일 : 2023. 05. 02.
		 * @작성자 : bhs
		 * @Method 설명 :  반입신청 목록 총 카운트
		 * @param : model
		 * @return :
		 */
		public int selectMypRscInfInListTotCnt(HashMap<String, Object> paramMap) throws Exception {
			return selectOne(sqlNameSpace + "selectMypRscInfInListTotCnt", paramMap);
		}

		/**
		 * @Method Name : selectMypRscInfInList
		 * @작성일 : 2023. 05. 02.
		 * @작성자 : bhs
		 * @Method 설명 :  반입신청 목록 조회
		 * @param : model
		 * @return :
		 */
		public List<Map<String, Object>> selectMypRscInfInList(HashMap<String, Object> paramMap) throws Exception {
			return selectList(sqlNameSpace + "selectMypRscInfInList", paramMap);
		}

	/**
	 * @Method Name : selectMypRscInfAplc
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 내용 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfAplc(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfAplc", paramMap);
	}

	/**
	  * @Method Name : selectMypRscInfUseListTotCnt
	  * @작성일 : 2023. 5. 10.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	활용 신청 카운트
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : int
	  */
	public int selectMypRscInfUseListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfUseListTotCnt", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfUseList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfUseList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfUseList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfTkinListTotCnt
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : kyh
	 * @Method 설명 :  반입 신청 목록 카운트 조회
	 * @param : model
	 * @return :
	 */
	public int selectMypRscInfTkinListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfTkinListTotCnt", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfTkinList
	 * @작성일 : 2023. 05. 03.
	 * @작성자 : kyh
	 * @Method 설명 :  반입 신청 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfTkinList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfTkinList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfUse
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 내역 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfUse(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfUse", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfInDetail
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입신청연구정보
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfInDetail(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfInDetail", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfTkInDetailInfo
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입신청상세정보
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfTkInDetailInfo(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfTkInDetailInfo", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfTkInFileList
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입신청 파일리스트
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfTkInFileList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfTkInFileList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfUseAcidList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 분석자목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfUseAcidList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfUseAcidList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfUseDszRsvList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 좌석목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfUseDszRsvList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfUseDszRsvList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfRspList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 연구자 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfRspList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfRspList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfDszSiDoList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 존재 시도 조회
	 * @param : model
	 * @return :
	 */
	public List<ComCdDetailVo> selectMypRscInfDszSiDoList(ComCdDetailVo comCd) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfDszSiDoList", comCd);
	}

	/**
	 * @Method Name : selectMypRscInfDszPrtiIdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfDszPrtiIdList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfDszPrtiIdList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfCalExceptList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 제외기간 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfCalExceptList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfCalExceptList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfUseDtuAplcNoMax
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 데이터활용신청번호 채번
	 * @param : model
	 * @return :
	 */
	public String selectMypRscInfUseDtuAplcNoMax(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfUseDtuAplcNoMax", paramMap);
	}

	/**
	 * @Method Name : insertMypRscInfUseDtu
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 정보 저장
	 * @param : model
	 * @return :
	 */
	public void insertMypRscInfUseDtu(HashMap<String, Object> paramMap) throws Exception {
		insert(sqlNameSpace + "insertMypRscInfUseDtu", paramMap);
	}

	/**
	 * @Method Name : insertMypRscInfUseDtuAcid
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 분석자 정보 저장
	 * @param : model
	 * @return :
	 */
	public void insertMypRscInfUseDtuAcid(HashMap<String, Object> paramMap) throws Exception {
		insert(sqlNameSpace + "insertMypRscInfUseDtuAcid", paramMap);
	}

	/**
	 * @Method Name : insertMypRscInfUseDsgnYmd
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 지정일자 정보 저장
	 * @param : model
	 * @return :
	 */
	public void insertMypRscInfUseDsgnYmd(HashMap<String, Object> paramMap) throws Exception {
		insert(sqlNameSpace + "insertMypRscInfUseDsgnYmd", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfIn
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 내역 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfIn(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfIn", paramMap);
	}

	/**
	  * @Method Name : selectMypRscInfOutListTotCnt
	  * @작성일 : 2023. 5. 10.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	반출 신청 카운트
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : int
	  */
	public int selectMypRscInfOutListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfOutListTotCnt", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfOutList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfOutList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfOutList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfOut
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 내역 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfOut(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfOut", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfOutFileList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 파일 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfOutFileList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectMypRscInfOutFileList", paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfRsrRslt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  연구성과 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfRsrRslt(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfRsrRslt", paramMap);
	}

	/**
	 * @Method Name : saveMypRscInfRsrRslt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  연구성과 저장
	 * @param : model
	 * @return :
	 */
	public void saveMypRscInfRsrRslt(HashMap<String, Object> paramMap) throws Exception {
		update(sqlNameSpace + "saveMypRscInfRsrRslt", paramMap);
	}

	/**
	  * @Method Name : deleteSvcDataAplc
	  * @작성일 : 2023. 4. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 삭제
	  *  </p>
	  * @param : dataAplcNo 신청번호
	  * @return :
	  */
	public void deleteSvcDataAplc(String dataAplcNo) throws Exception {
		delete(sqlNameSpace + "deleteSvcDataAplc", dataAplcNo);
	}
	/**
	  * @Method Name : deleteSvcAttf
	  * @작성일 : 2023. 4. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 파일 삭제
	  *  </p>
	  * @param : dataAplcNo 신청번호
	  * @return :
	  */
	public void deleteSvcAttf(String dataAplcNo) throws Exception {
		delete(sqlNameSpace + "deleteSvcAttf", dataAplcNo);
	}
	/**
	  * @Method Name : deleteSvcRsp
	  * @작성일 : 2023. 4. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 신청자 삭제
	  *  </p>
	  * @param : dataAplcNo 신청번호
	  * @return :
	  */
	public void deleteSvcRsp(String dataAplcNo) throws Exception {
		delete(sqlNameSpace + "deleteSvcRsp", dataAplcNo);
	}
	/**
	  * @Method Name : deleteSvcDataAplcRvw
	  * @작성일 : 2023. 4. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 심의 삭제
	  *  </p>
	  * @param : dataAplcNo 신청번호
	  * @return :
	  */
	public void deleteSvcDataAplcRvw(String dataAplcNo) throws Exception {
		delete(sqlNameSpace + "deleteSvcDataAplcRvw", dataAplcNo);
	}
	/**
	  * @Method Name : deleteSvcDataPrvdInst
	  * @작성일 : 2023. 4. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 제공기간 삭제
	  *  </p>
	  * @param : dataAplcNo 신청번호
	  * @return :
	  */
	public void deleteSvcDataPrvdInst(String dataAplcNo) throws Exception {
		delete(sqlNameSpace + "deleteSvcDataPrvdInst", dataAplcNo);
	}

	/**
	  * @Method Name : updateSvcDataAplcCncl
	  * @작성일 : 2023. 5. 1.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 취소 여부 업데이트
	  *  </p>
	  * @param : Map<String, Object> map
	  * @return :
	  */
	public void updateSvcDataAplcCncl(Map<String, Object> map) throws Exception {
		update(sqlNameSpace + "updateSvcDataAplcCncl", map);
	}

	/**
	  * @Method Name : selectDataAplcDetail
	  * @작성일 : 2023. 5. 2.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 자세히 보기
	  *  </p>
	  * @param : Map<String,Object> map
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectDataAplcDetail(Map<String,Object> map) throws Exception {
		return selectOne(sqlNameSpace + "selectDataAplcDetail", map);
	}

	/**
	  * @Method Name : selectDataPrvdInstList
	  * @작성일 : 2023. 5. 2.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 자세히 보기 - 데이터 제공기관 목록
	  *  </p>
	  * @param : Map<String,Object> map
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectDataPrvdInstList(Map<String,Object> map) throws Exception {
		return selectList(sqlNameSpace + "selectDataPrvdInstList", map);
	}

	/**
	 * @Method Name : insertMypRscInfTkin
	 * @작성일 : 2023. 05. 03.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 정보 저장
	 * @param : model
	 * @return :
	 */
	public void insertMypRscInfTkin(TkinVO vo) throws Exception {
		insert(sqlNameSpace + "insertMypRscInfTkin", vo);
	}

	/**
	 * @Method Name : insertMypRscInfTkinProg
	 * @작성일 : 2023. 05. 03.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 데이터 정보 저장
	 * @param : model
	 * @return :
	 */
	public void insertMypRscInfTkinProg(HashMap<String, Object> paramMap) throws Exception {
		insert(sqlNameSpace + "insertMypRscInfTkinProg", paramMap);
	}

	/**
	 * @Method Name : insertMypRscInfTkinProg
	 * @작성일 : 2023. 05. 03.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 이력저장
	 * @param : model
	 * @return :
	 */
	public void insertDtapStatHst(HashMap<String, Object> paramMap) throws Exception {
		insert(sqlNameSpace + "insertDtapStatHst", paramMap);
	}

	/**
	  * @Method Name : selectSrvyLnk
	  * @작성일 : 2023. 5. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	설문조사 링크 조회
	  *  </p>
	  * @param :
	  * @return : Map<String,Object>
	  */
	public Map<String, Object> selectSrvyLnk() throws Exception {
		return selectOne(sqlNameSpace + "selectSrvyLnk");
	}

	/**
	 * @Method Name : selectDataAplcRvw
	 * @작성일 : 2023. 5. 3.
	 * @작성자 : hjjeon
	 * @Method 설명 :
	 *  <p>
	 *  	보완요청, 반려 사유 조회
	 *  </p>
	 * @param : String dataAplcNo
	 * @return : Map<String,Object>
	 */
	public Map<String, Object> selectDataAplcRvw(String dataAplcNo) throws Exception {
		return selectOne(sqlNameSpace + "selectDataAplcRvw", dataAplcNo);
	}

	public List<ExtnVO> selectExtnList(HashMap<String, Object> paramMap) {
		return selectList(sqlNameSpace + "selectExtnList", paramMap);
	}

	public List<HashMap<String, Object>> selectExtnSubList(ExtnVO extnVO) {
		return selectList(sqlNameSpace + "selectExtnSubList", extnVO);
	}

	public Map<String, Object> selectExtnPopup(EgovMap map) throws Exception {
		return selectOne(sqlNameSpace + "selectExtnPopup", map);
	}
	
	public Map<String, Object> selectExtnPayPopup(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectExtnPayPopup", paramMap);
	}
	
	/**
	 * @Method Name : selectMypRscInfOutApl
	 * @작성일 : 2023. 5. 10.
	 * @작성자 : bhs
	 * @Method 설명 :
	 *  <p>
	 *  	반출신청 상세 조회
	 *  </p>
	 * @param : Map<String, Object>
	 * @return : Map<String,Object>
	 */
	public Map<String, Object> selectMypRscInfOutApl(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectMypRscInfOutApl", paramMap);
	}
	
	/**
	 * @Method Name : selectMypRscInfTkOutFileList
	 * @작성일 : 2023. 5. 10.
	 * @작성자 : bhs
	 * @Method 설명 :
	 *  <p>
	 *  	반출신청 파일리스트 조회
	 *  </p>
	 * @param : Map<String, Object>
	 * @return : List<HashMap<String, Object>>
	 */
	public List<Map<String, Object>> selectMypRscInfTkOutFileList(HashMap<String, Object> paramMap) {
		return selectList(sqlNameSpace + "selectMypRscInfTkOutFileList", paramMap);
	}
	
	public Map<String, Object> checkExtdStcdCnt(ExtnVO extnVO) {
		return selectOne(sqlNameSpace + "checkExtdStcdCnt", extnVO);
	}

	public ExtnVO getDefaultExtdInfo(HashMap<String, Object> commandMap) {
		return selectOne(sqlNameSpace + "getDefaultExtdInfo", commandMap);
	}

	/**
	  * @Method Name : insertReqExit
	  * @date : 2023. 5. 12.
	  * @Method 설명 :
	  *  <p>	
	  *     보관연장 등록 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void insertReqExit(Map<String, Object> defaultInfo) {
		insert(sqlNameSpace + "insertReqExit", defaultInfo);
	}
	
	/**
	  * @Method Name : updateFileUnldYn
	  * @date : 2023. 5. 15.
	  * @Method 설명 :
	  *  <p>	
	  *     반출파일 다운로드 여부 업데이트
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public int updateFileUnldYn(HashMap<String, Object> commandMap) {
		return update(sqlNameSpace + "updateFileUnldYn", commandMap);
	}
}
