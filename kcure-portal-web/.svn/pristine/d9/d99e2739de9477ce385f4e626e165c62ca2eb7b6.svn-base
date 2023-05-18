package kcure.portal.sys.dac.rvw.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.dac.rvw.service.impl.DacRvwVo;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.dac.rvw.service
  * @FileName : DacRvwAplcDtsService.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : bhs
  * @프로그램 설명 :
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface DacRvwAplcDtsService {

	/**
	  * @Method Name : selectDetailDataAplcRvw
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터심의 기본상세 정보 조회
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return : DacRvwRspVo
	  */
	public DacRvwVo selectDetailDataAplcRvw(DacRvwVo dacRvwVo) throws Exception;

	public DacRvwVo selectDetailDataAplcRvw2(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : selectDetailDataAplcRvw
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터심의 기본상세 리스트 조회
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return : DacRvwRspVo
	  */
	public List<DacRvwVo> selectDetailDataAplcRvwList(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : selectStpRvw
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터심의 진행단계 조회
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return : DacRvwVo
	  */
	public DacRvwVo selectStpRvw(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : selectPrvdRvw
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 : 제공기관 심의결과 조회
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return : DacRvwVo
	  */
	public DacRvwVo selectPrvdRvw(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : selectRvwTmplt
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터 결합 검토서 조회
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return : DacRvwVo
	  */
	public DacRvwVo selectRvwTmplt(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : selectRjcRsnContView
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 : 반려사유 조회
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return : DacRvwVo
	  */
	public DacRvwVo selectRjcRsnContView(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : selectRevPrtiList
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터심의 제공기관 목록 조회
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectRevPrtiList(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : selectRevPrtiTotCnt
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터심의 제공기관 목록 카운트
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : int
	  */
	public int selectRevPrtiTotCnt(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : selectDataServiceFileList
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터심의 제출서류 파일목록 조회
	  *  <p>
	  *  </p>
	  * @param : DataServiceFileVO
	  * @return : DataServiceFileVO
	  */
	public List<DataServiceFileVO> selectDataServiceFileList(DataServiceFileVO dataVo) throws Exception;

	/**
	  * @Method Name : saveRevAplcRsch
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터신청-심의단계(연구접수/사무국검토) 저장
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return :
	  */
	public boolean saveRevAplcRsch(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : selectAcptAprpCnt
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 : 연구접수 검토서 제출여부 조회
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return : int
	  */
	public int selectAcptAprpCnt(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : saveRevPrti
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터신청-심의단계(제공기관 심의) 저장
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return :
	  */
	public void saveRevPrti(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : updateDacRvwStat
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터신청-심의상태 변경
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return :
	  */
	public void updateDacRvwStat(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : insertRsrAcptAprp
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터 심의양식 정보저장(관리자용 검토서 양식)
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return :
	  */
	public void insertRsrAcptAprp(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : updateRsrAcptAprp
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터 심의양식 정보변경(관리자용 검토서 양식)
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return :
	  */
	public void updateRsrAcptAprp(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : insertPrvdRvw
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터 심의양식 저장(제공기관용 심의 양식)
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return :
	  */
	public void insertPrvdRvw(DacRvwVo dacRvwVo) throws Exception;

	/**
	  * @Method Name : selectDetailDataAplcSendPay
	  * @작성일 : 2023. 4. 26.
	  * @작성자 : parkgu
	  * @Method 설명 : 연구접수 최종금액전송
	  *  <p>
	  *  </p>
	  * @param : DacRvwVo
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectDetailDataAplcSendPay(DacRvwVo dacRvwVo) throws Exception;

	/**공공 결제 금액 저장
	 * @param dacRvwVo
	 */
	public void updateClcInfPblAmt(DacRvwVo dacRvwVo) throws Exception;
	
	public void makeStepDtapHst(EgovMap map) throws Exception;
	
	public void updateSplmntReq(DacRvwVo dacRvwVo) throws Exception;

	public void updateRjcRgst(DacRvwVo dacRvwVo)throws Exception;
}

