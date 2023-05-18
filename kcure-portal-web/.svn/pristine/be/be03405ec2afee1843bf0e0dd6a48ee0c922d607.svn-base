package kcure.portal.sys.dac.rvw.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.dac.rvw.service.impl
  * @FileName : DacRvwAplcDtsDAO.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : bhs
  * @프로그램 설명 :	데이터심의에 대한 DAO 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("dacRvwAplcDtsDAO")
public class DacRvwAplcDtsDAO extends EgovComAbstractDAO {

	private static final String sqlNameSpace = "Rvw.";

    /**
      * @Method Name : selectRevPrtiList
      * @작성일 : 2023. 3. 14.
      * @작성자 : bhs
      * @Method 설명 : 데이터심의 제공기관 목록 조회
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : List<Map<String,Object>>
      */
	public List<Map<String,Object>> selectRevPrtiList(DacRvwVo dacRvwVo) throws Exception {
		return selectList(sqlNameSpace + "selectRevPrtiList", dacRvwVo);
    }

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
    public int selectRevPrtiTotCnt(ComDefaultVO comDefaultVO)  throws Exception {
    	return selectOne(sqlNameSpace + "selectRevPrtiTotCnt", comDefaultVO);
    }

    /**
     * @Method Name : selectDataServiceFileList
     * @작성일 : 2023. 3. 14.
     * @작성자 : bhs
     * @Method 설명 : 데이터심의 제출서류 파일 목록조회
     *  <p>
     *  </p>
     * @param : DataServiceFileVO
     * @return : DataServiceFileVO
     */
    public List<DataServiceFileVO> selectDataServiceFileList(DataServiceFileVO dataVo) {
		return selectList(sqlNameSpace + "selectDataServiceFileList", dataVo);
	}

    /**
     * @Method Name : selectDetailDataAplcRvw
     * @작성일 : 2023. 3. 14.
     * @작성자 : bhs
     * @Method 설명 : 데이터심의 상세정보 조회
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : DacRvwVo
     */
    public DacRvwVo selectDetailDataAplcRvw(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectDetailDataAplcRvw", dacRvwVo);
	}

    public DacRvwVo selectDetailDataAplcRvw2(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectDetailDataAplcRvw2", dacRvwVo);
	}

    /**
     * @Method Name : selectDetailDataAplcRvw
     * @작성일 : 2023. 3. 14.
     * @작성자 : bhs
     * @Method 설명 : 데이터심의 상세정보 조회
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : DacRvwVo
     */
    public List<DacRvwVo> selectDetailDataAplcRvwList(DacRvwVo dacRvwVo) {
		return selectList(sqlNameSpace + "selectDetailDataAplcRvwList", dacRvwVo);
	}

    /**
     * @Method Name : selectHistDetailDataAplcRvw
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 데이터심의 이전단계 상세정보 조회
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : DacRvwVo
     */
    public DacRvwVo selectHistDetailDataAplcRvw(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectHistDetailDataAplcRvw", dacRvwVo);
	}


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
    public DacRvwVo selectPrvdRvw(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectPrvdRvw", dacRvwVo);
	}

    /**
     * @Method Name : selectPrvdRvw
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 데이터 결합 검토서 조회
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : DacRvwVo
     */
    public DacRvwVo selectRvwTmplt(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectRvwTmplt", dacRvwVo);
	}

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
    public DacRvwVo selectStpRvw(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectStpRvw", dacRvwVo);
	}

    /**
     * @Method Name : selectAcptAprpCnt
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 연구접수 검토서 제출여부 조회
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : int
     */
    public int selectAcptAprpCnt(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectAcptAprpCnt", dacRvwVo);
	}

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
    public DacRvwVo selectRjcRsnContView(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectRjcRsnContView", dacRvwVo);
	}

    /**
     * @Method Name : changeDacRvwStep
     * @작성일 : 2023. 3. 14.
     * @작성자 : bhs
     * @Method 설명 : 데이터 심의단계 변경
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return :
     */
    public void insertDacRvwCurrStep(DacRvwVo dacRvwVo) {
		update(sqlNameSpace + "insertDacRvwCurrStep", dacRvwVo);
	}

    /**
     * @Method Name : updateDacRvwStat
     * @작성일 : 2023. 3. 14.
     * @작성자 : bhs
     * @Method 설명 : 데이터 심의상태 변경
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return :
     */
    public void updateDacRvwStat(DacRvwVo dacRvwVo) {
		update(sqlNameSpace + "updateDacRvwStat", dacRvwVo);
	}

    /**
     * @Method Name : insertRsrAcptAprp
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 데이터 심의양식 정보 저장(관리자용 검토서 양식)
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return :
     */
    public void insertRsrAcptAprp(DacRvwVo dacRvwVo) {
		insert(sqlNameSpace + "insertRsrAcptAprp", dacRvwVo);
	}

    /**
     * @Method Name : updateRsrAcptAprp
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 데이터 심의양식 정보 변경(관리자용 검토서 양식)
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return :
     */
    public void updateRsrAcptAprp(DacRvwVo dacRvwVo) {
		update(sqlNameSpace + "updateRsrAcptAprp", dacRvwVo);
	}

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
    public void insertPrvdRvw(DacRvwVo dacRvwVo) {
		insert(sqlNameSpace + "insertPrvdRvw", dacRvwVo);
	}


	/**
	 * 사무국 접수 등록 갯수
	 * @param dacRvwVo
	 * @return
	 */
	public int selectRevAplcRschCheck(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectRevAplcRschCheck", dacRvwVo);
	}

	public void insertRevAplcRsch(DacRvwVo dacRvwVo) {
		insert(sqlNameSpace + "insertRevAplcRsch", dacRvwVo);

	}

	/**
	 * 임상 사무국 접수 완려 여부 확인
	 * @param dacRvwVo
	 * @return
	 */
	public String checkAplcRschDataTpcd01(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "checkAplcRschDataTpcd01", dacRvwVo);

	}

	/**
	 * 공공,결활 사무국 접수 완려 여부 확인
	 * @param dacRvwVo
	 * @return
	 */
	public String checkAplcRschDataTpcdOther(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "checkAplcRschDataTpcdOther", dacRvwVo);
	}

	/**
	 * 신청 심의 히스토리 테이블 등록
	 * @param dacRvwVo
	 */
	public void insertDtapStatHst(EgovMap map) {
		insert(sqlNameSpace + "insertDtapStatHst", map);
	}

    public Map<String, Object> selectDetailDataAplcSendPay(DacRvwVo dacRvwVo) {
		return selectOne(sqlNameSpace + "selectDetailDataAplcSendPay", dacRvwVo);
	}

	public void updateClcInfPblAmt(DacRvwVo dacRvwVo) {
		update(sqlNameSpace + "updateClcInfPblAmt", dacRvwVo);
	}

	/**
	  * @Method Name : updateDataAplcInfo
	  * @date : 2023. 4. 28.
	  * @Method 설명 :
	  *  <p>	
	  *     신청 테이블 정보 변경. 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void updateDataAplcInfo(EgovMap param) {
		update(sqlNameSpace + "updateDataAplcInfo", param);
		
	}
}
