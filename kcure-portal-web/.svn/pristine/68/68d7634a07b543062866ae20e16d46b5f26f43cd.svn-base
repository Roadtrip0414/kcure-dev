package kcure.portal.dvz.clc.brs.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dvz.clc.brs.service.impl
 * @FileName : DvzClcBrsDAO.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터시각화 임상라이브러리 유방암에 대한 DAO 클래스를 정의한다.
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
@Repository("dvzClcBrsDAO")
public class DvzClcBrsDAO extends EgovComAbstractDAO {
	
	private static final String sqlNameSpace = "dvzClcBrs.";

	/**
	 * @Method Name : selectDvzClcTopMnuList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   최상위 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzClcTopMnuList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzClcTopMnuList", paramMap);
	}

	/**
	 * @Method Name : selectDvzClcLeftMnuList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   레프트 메뉴 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzClcLeftMnuList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzClcLeftMnuList", paramMap);
	}

	/**
	 * @Method Name : selectDvzClcMnuDtl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   메뉴 상세 정보 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectDvzClcMnuDtl(HashMap<String, Object> paramMap) throws Exception {
		return selectOne(sqlNameSpace + "selectDvzClcMnuDtl", paramMap);
	}

	/**
	 * @Method Name : selectStsClncCdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   임상 시각화 공통코드 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectStsClncCdList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectStsClncCdList", paramMap);
	}

	/**
	 * @Method Name : selectStsClncYrList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   임상 시각화 연도 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectStsClncYrList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectStsClncYrList", paramMap);
	}

	/**
	 * @Method Name : selectDvzClcStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzClcStatList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzClcStatList", paramMap);
	}
}
