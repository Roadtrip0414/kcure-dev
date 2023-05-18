package kcure.portal.dvz.pbl.svl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dvz.pbl.svl.service.impl
 * @FileName : DvzPblSvlDAO.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터시각화 공공라이브러리 암생존자에 대한 DAO 클래스를 정의한다.
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
@Repository("dvzPblSvlDAO")
public class DvzPblSvlDAO extends EgovComAbstractDAO {
	
	private static final String sqlNameSpace = "dvzPblSvl.";

	/**
	 * @Method Name : selectDvzPblSvlGenderStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회 : 요약그래프용 성별 통계 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblSvlGenderStatList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzPblSvlGenderStatList", paramMap);
	}

	/**
	 * @Method Name : selectDvzPblSvlStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblSvlStatList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzPblSvlStatList", paramMap);
	}

	/**
	 * @Method Name : selectDvzPblSvlStatSidoList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회(시도별)
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblSvlStatSidoList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzPblSvlStatSidoList", paramMap);
	}

	/**
	 * @Method Name : selectDvzPblSvlStatAgeList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회(연령별)
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblSvlStatAgeList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzPblSvlStatAgeList", paramMap);
	}

	/**
	 * @Method Name : selectDvzPblSvlGenderYrStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회 : 연령별 그래프용 성별 통계 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblSvlGenderYrStatList(HashMap<String, Object> paramMap) throws Exception {
		return selectList(sqlNameSpace + "selectDvzPblSvlGenderYrStatList", paramMap);
	}
}
