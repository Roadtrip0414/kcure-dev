package kcure.portal.dvz.pbl.svl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.dvz.pbl.svl.service.DvzPblSvlService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dvz.pbl.svl.service.impl
 * @FileName : DvzPblSvlServiceImpl.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터시각화 공공라이브러리 암생존자에 대한 비즈니스 구현 클래스를 정의한다.
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
@Service("dvzPblSvlService")
public class DvzPblSvlServiceImpl extends EgovAbstractServiceImpl implements DvzPblSvlService {
	
	@Resource(name="dvzPblSvlDAO")
	private DvzPblSvlDAO dvzPblSvlDAO;

	/**
	 * @Method Name : selectDvzPblSvlGenderStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회 : 요약그래프용 성별 통계 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectDvzPblSvlGenderStatList(HashMap<String, Object> paramMap) throws Exception {
		return dvzPblSvlDAO.selectDvzPblSvlGenderStatList(paramMap);
	}

	/**
	 * @Method Name : selectDvzPblSvlStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectDvzPblSvlStatList(HashMap<String, Object> paramMap) throws Exception {
		if ("05".equals((String)paramMap.get("vslzDataStatTpcd"))) {	//지역(시도) 그래프 : 피라미드(맵)
			return dvzPblSvlDAO.selectDvzPblSvlStatSidoList(paramMap);
		} else if ("02".equals((String)paramMap.get("vslzDataStatTpcd"))) {	//연령별 그래프 : Historical 피라미드
			return dvzPblSvlDAO.selectDvzPblSvlStatAgeList(paramMap);
		} else {
			return dvzPblSvlDAO.selectDvzPblSvlStatList(paramMap);
		}
	}

	/**
	 * @Method Name : selectDvzPblSvlGenderYrStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회 : 연령별 그래프용 성별 통계 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectDvzPblSvlGenderYrStatList(HashMap<String, Object> paramMap) throws Exception {
		return dvzPblSvlDAO.selectDvzPblSvlGenderYrStatList(paramMap);
	}
}
