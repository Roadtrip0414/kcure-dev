package kcure.portal.dvz.pbl.dth.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.dvz.pbl.dth.service.DvzPblDthService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dvz.pbl.dth.service.impl
 * @FileName : DvzPblDthServiceImpl.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터시각화 공공라이브러리 암사망자에 대한 비즈니스 구현 클래스를 정의한다.
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
@Service("dvzPblDthService")
public class DvzPblDthServiceImpl extends EgovAbstractServiceImpl implements DvzPblDthService {
	
	@Resource(name="dvzPblDthDAO")
	private DvzPblDthDAO dvzPblDthDAO;

	/**
	 * @Method Name : selectDvzPblDthGenderStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회 : 요약그래프용 성별 통계 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectDvzPblDthGenderStatList(HashMap<String, Object> paramMap) throws Exception {
		return dvzPblDthDAO.selectDvzPblDthGenderStatList(paramMap);
	}

	/**
	 * @Method Name : selectDvzPblDthStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectDvzPblDthStatList(HashMap<String, Object> paramMap) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(sessionVo != null && "03".equals(sessionVo.getUserStcd())) { // 연구자 권한 일때만
			//상세설정 셋팅 : 사망원인
			String deadCausSpcdList = "";
			if (paramMap.get("deadCausSpcdAll") == null || !"ALL".equals((String)paramMap.get("deadCausSpcdAll"))) {
				String[] deadCausSpcd = (String[])paramMap.get("deadCausSpcd");
				
				for (int i=0; i < deadCausSpcd.length; i++) {
					if (i > 0) deadCausSpcdList = deadCausSpcdList + ",";
					
					deadCausSpcdList = deadCausSpcdList + "'" + (String)deadCausSpcd[i] + "'";
					
					paramMap.put("deadCausSpcdList", deadCausSpcdList);
				}
			}
		}
		
		if ("05".equals((String)paramMap.get("vslzDataStatTpcd"))) {	//지역(시도) 그래프 : 피라미드(맵)
			return dvzPblDthDAO.selectDvzPblDthStatSidoList(paramMap);
		} else {
			return dvzPblDthDAO.selectDvzPblDthStatList(paramMap);
		}
	}

	/**
	 * @Method Name : selectStsPblCdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   공공 시각화 공통코드 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectStsPblCdList(HashMap<String, Object> paramMap) throws Exception {
		return dvzPblDthDAO.selectStsPblCdList(paramMap);
	}
}