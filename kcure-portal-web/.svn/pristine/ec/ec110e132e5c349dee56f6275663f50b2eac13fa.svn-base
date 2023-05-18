package kcure.portal.dvz.pbl.ocr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dvz.pbl.ocr.service.impl
 * @FileName : DvzPblOcrDAO.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터시각화 공공라이브러리 암발생자에 대한 DAO 클래스를 정의한다.
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
@Repository("dvzPblOcrDAO")
public class DvzPblOcrDAO extends EgovComAbstractDAO {
	
	private static final String sqlNameSpace = "dvzPblOcr.";

	/**
	 * @Method Name : selectDvzPblLeftMnuList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   레프트 메뉴 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblLeftMnuList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzPblLeftMnuList", paramMap);
	}

	/**
	 * @Method Name : selectDvzPblOcrGenderStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회 : 요약그래프용 성별 통계 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblOcrGenderStatList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzPblOcrGenderStatList", paramMap);
	}

	/**
	 * @Method Name : selectDvzPblOcrStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblOcrStatList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzPblOcrStatList", paramMap);
	}

	/**
	 * @Method Name : selectDvzPblOcrStatSidoList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회(시도별)
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblOcrStatSidoList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzPblOcrStatSidoList", paramMap);
	}
}
