package kcure.portal.dvz.pbl.dth.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dvz.pbl.dth.service
 * @FileName : DvzPblDthService.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터시각화 공공라이브러리 암사망자에 대한 Service Interface를 정의한다.
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
public interface DvzPblDthService {
	/**
	 * @Method Name : selectDvzPblDthGenderStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회 : 요약그래프용 성별 통계 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblDthGenderStatList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectDvzPblDthStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectDvzPblDthStatList(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectStsPblCdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   공공 시각화 공통코드 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<Map<String, Object>> selectStsPblCdList(HashMap<String, Object> paramMap) throws Exception;
}
