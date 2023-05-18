package kcure.portal.sys.rsr.dau.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.rsr.dau.web
 * @FileName : RsrDauDAO.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터 활용관리 처리를 위한 DAO 클래스를 정의한다.
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
@Repository("sysRsrDauDAO")
public class RsrDauDAO extends EgovComAbstractDAO {
	
	private static final String sqlNameSpace = "sysRsrDau.";	

    /**
	 * @Method Name : selectRsrDauAdmAuthCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   사무국권한 카운트
	 * @param : model
	 * @return :
	 */
	public int selectRsrDauAdmAuthCnt(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectRsrDauAdmAuthCnt", paramMap);
	}

	/**
	 * @Method Name : selectRsrDauSiDoList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 존재 시도 조회
	 * @param : model
	 * @return :
	 */
	public List<ComCdDetailVo> selectRsrDauSiDoList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectRsrDauSiDoList", paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauPrtiIdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauPrtiIdList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectRsrDauPrtiIdList", paramMap);
	}

    /**
	 * @Method Name : selectRsrDauListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	public int selectRsrDauListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectRsrDauListTotCnt", paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectRsrDauList", paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauDtu
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 신청내역 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectRsrDauDtu(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectRsrDauDtu", paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauAcidList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 분석자 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauAcidList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectRsrDauAcidList", paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauDszRsvList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 예약좌석 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauDszRsvList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectRsrDauDszRsvList", paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauDsgnYmdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 지정일자 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauDsgnYmdList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectRsrDauDsgnYmdList", paramMap);
	}
	
	/**
	 * @Method Name : selectRsrDauPrtiSeatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 센터 좌석 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectRsrDauPrtiSeatList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectRsrDauPrtiSeatList", paramMap);
	}
	
	/**
	 * @Method Name : insertRsrDauDszRsv
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 예약좌석 등록
	 * @param : model
	 * @return :
	 */
	public void insertRsrDauDszRsv(HashMap<String, Object> paramMap) throws Exception {
		update(sqlNameSpace + "insertRsrDauDszRsv", paramMap);
	}
	
	/**
	 * @Method Name : updateRsrDauDtu
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   데이터 활용관리 수정
	 * @param : model
	 * @return :
	 */
	public void updateRsrDauDtu(HashMap<String, Object> paramMap) throws Exception {
		update(sqlNameSpace + "updateRsrDauDtu", paramMap);
	}
	
	/**
	 * @Method Name : updateRsrDauDtu
	 * @작성일 : 2023. 05. 03.
	 * @작성자 : parkgu
	 * @Method 설명 :   데이터 활용관리 수정 후 히스토리 저장
	 * @param : model
	 * @return :
	 */
	public void insertDtapStatHst(HashMap<String, Object> paramMap) throws Exception {
		update(sqlNameSpace + "insertDtapStatHst", paramMap);
	}
}
