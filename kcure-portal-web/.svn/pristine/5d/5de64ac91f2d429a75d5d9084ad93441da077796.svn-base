package kcure.portal.myp.rsc.inf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;
import kcure.portal.myp.rsc.inf.service.impl.ExtnVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.rsc.inf.service
 * @FileName : MypRscInfService.java
 * @since : 2023. 02. 01.
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 나의연구에 대한 Service Interface를 정의한다.
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
public interface MypRscInfService {
	/**
	 * @Method Name : selectRscInfNavCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  나의연구 메뉴별 카운트 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectRscInfNavCnt(HashMap<String, Object> paramMap) throws Exception;

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
	public int selectMypRscAplcListTotCnt(HashMap<String, Object> paramMap) throws Exception;

	/**
	  * @Method Name : selectMypRscAplcList
	  * @작성일 : 2023. 5. 2.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	나의 연구 신청 목록
	  *  </p>
	  * @param :
	  * @return :
	  */
	public List<Map<String, Object>> selectMypRscAplcList(HashMap<String, Object> paramMap) throws Exception;

    /**
	 * @Method Name : selectMypRscInfAplListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	public int selectMypRscInfAplListTotCnt(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfAplList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfAplList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfInListTotCnt
	 * @작성일 : 2023. 05. 02.
	 * @작성자 : bhs
	 * @Method 설명 :  반입신청 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	public int selectMypRscInfInListTotCnt(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfInList
	 * @작성일 : 2023. 05. 02.
	 * @작성자 : bhs
	 * @Method 설명 :  반입신청 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfInList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfInDetail
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입신청연구정보 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfInDetail(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfTkInDetailInfo
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입신청상세정보 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfTkInDetailInfo(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfAplc
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 내용 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfAplc(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfTkInFileList
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입신청 파일리스트 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfTkInFileList(HashMap<String, Object> paramMap) throws Exception;
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
	public int selectMypRscInfUseListTotCnt(HashMap<String, Object> paramMap) throws Exception;
	/**
	 * @Method Name : selectMypRscInfUseList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfUseList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfTkinListTotCnt
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 목록 카운트 조회
	 * @param : model
	 * @return :
	 */
	public int selectMypRscInfTkinListTotCnt(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfTkinList
	 * @작성일 : 2023. 05. 03.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfTkinList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfUse
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 내역 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfUse(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfUseAcidList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 분석자목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfUseAcidList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfUseDszRsvList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 좌석목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfUseDszRsvList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfRspList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 연구자 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfRspList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfDszSiDoList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 존재 시도 조회
	 * @param : model
	 * @return :
	 */
	public List<ComCdDetailVo> selectMypRscInfDszSiDoList(ComCdDetailVo comCd) throws Exception;

	/**
	 * @Method Name : selectMypRscInfDszPrtiIdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfDszPrtiIdList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfCalExceptList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 제외기간 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfCalExceptList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : saveMypRscInfUseAplc
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 정보 저장
	 * @param : model
	 * @return :
	 */
	public void saveMypRscInfUseAplc(MultipartHttpServletRequest request) throws Exception;

	/**
	 * @Method Name : saveMypRscInfInAplc
	 * @작성일 : 2023. 05. 03.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 정보 저장
	 * @param : model
	 * @return :
	 */
	public void saveMypRscInfInAplc(MultipartHttpServletRequest request) throws Exception;
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
	public int selectMypRscInfOutListTotCnt(HashMap<String, Object> paramMap) throws Exception;
	/**
	 * @Method Name : selectMypRscInfOutList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfOutList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfOut
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 내역 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfOut(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfIn
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 내역 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfIn(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfOutFileList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 파일 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectMypRscInfOutFileList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectMypRscInfRsrRslt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  연구성과 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectMypRscInfRsrRslt(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : saveMypRscInfRsrRslt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  연구성과 저장
	 * @param : model
	 * @return :
	 */
	public void saveMypRscInfRsrRslt(HashMap<String, Object> paramMap) throws Exception;

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
	public void deleteSvcDataAplc(String dataAplcNo) throws Exception;

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
	public Map<String, Object> selectDataAplcDetail(Map<String,Object> map) throws Exception;

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
	public List<Map<String, Object>> selectDataPrvdInstList(Map<String,Object> map) throws Exception;

	/**
	  * @Method Name : selectSrvyLnk
	  * @작성일 : 2023. 5. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	설문조사 링크 조회
	  *  </p>
	  * @param : Map<String,Object> map
	  * @return : Map<String,Object>
	  */
	public Map<String, Object> selectSrvyLnk() throws Exception;

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
	public Map<String, Object> selectDataAplcRvw(String dataAplcNo) throws Exception;

	/**
	  * @Method Name : selectExtnList
	  * @date : 2023. 5. 9.
	  * @Method 설명 :
	  *  <p>
	  *     보관/연장 리스트
	  *  </p>
	  * @param :
	  * @return :
	  */
	public List<ExtnVO> selectExtnList(HashMap<String, Object> paramMap) throws Exception;

	public List<HashMap<String, Object>> selectExtnSubList(ExtnVO extnVO) throws Exception;

	/**
	  * @Method Name : selectExtnPopup
	  * @date : 2023. 5. 9.
	  * @Method 설명 :
	  *  <p>
	  *     보관/연장 신청 팝업
	  *  </p>
	  * @param :
	  * @return :
	  */
	public Map<String, Object> selectExtnPopup(EgovMap map) throws Exception;

	/**
	  * @Method Name : selectExtnPayPopup
	  * @date : 2023. 5. 10.
	  * @Method 설명 :
	  *  <p>	
	  *     보관/연장 결제 팝업 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public Map<String, Object> selectExtnPayPopup(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	  * @Method Name : selectMypRscInfOutApl
	  * @date : 2023. 5. 10.
	  * @Method 설명 :
	  *  <p>	
	  *     반출신청 상세조회
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectMypRscInfOutApl(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	  * @Method Name : selectMypRscInfTkOutFileList
	  * @date : 2023. 5. 10.
	  * @Method 설명 :
	  *  <p>	
	  *     반출신청 파일리스트 조회
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : List<HashMap<String, Object>>
	  */
	public List<Map<String, Object>> selectMypRscInfTkOutFileList(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	  * @Method Name : checkExtdStcdCnt
	  * @date : 2023. 5. 10.
	  * @Method 설명 :
	  *  <p>	
	  *     보관 / 연장 신청 가능 여부  
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public Map<String, Object> checkExtdStcdCnt(ExtnVO extnVO) throws Exception;

	/**
	  * @Method Name : saveReqExit
	  * @date : 2023. 5. 12.
	  * @Method 설명 :
	  *  <p>	
	  *     보관 / 연장 신청 저장 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void saveReqExit(HashMap<String, Object> commandMap, MultipartHttpServletRequest multiRequest)  throws Exception;
	
	/**
	  * @Method Name : updateFileUnldYn
	  * @작성일 : 2023. 5. 15.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	반출파일 다운로드 여부 업데이트
	  *  </p>
	  * @param : HashMap<String, Object> commandMap
	  * @return :
	  */
	public int updateFileUnldYn(HashMap<String, Object> commandMap) throws Exception;
}
