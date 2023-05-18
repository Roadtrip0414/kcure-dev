package kcure.portal.dvz.clc.brs.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.dvz.clc.brs.service.DvzClcBrsService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dvz.clc.brs.service.impl
 * @FileName : DvzClcBrsServiceImpl.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터시각화 임상라이브러리 유방암에 대한 비즈니스 구현 클래스를 정의한다.
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
@Service("dvzClcBrsService")
public class DvzClcBrsServiceImpl extends EgovAbstractServiceImpl implements DvzClcBrsService {
	
	@Resource(name="dvzClcBrsDAO")
	private DvzClcBrsDAO dvzClcBrsDAO;

	/**
	 * @Method Name : selectDvzClcTopMnuList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   최상위 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectDvzClcTopMnuList(HashMap<String, Object> paramMap) throws Exception {
		return dvzClcBrsDAO.selectDvzClcTopMnuList(paramMap);
	}

	/**
	 * @Method Name : selectDvzClcLeftMnuList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   레프트 메뉴 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectDvzClcLeftMnuList(HashMap<String, Object> paramMap) throws Exception {
		return dvzClcBrsDAO.selectDvzClcLeftMnuList(paramMap);
	}

	/**
	 * @Method Name : selectDvzClcMnuDtl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   메뉴 상세 정보 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public Map<String, Object> selectDvzClcMnuDtl(HashMap<String, Object> paramMap) throws Exception {
		return dvzClcBrsDAO.selectDvzClcMnuDtl(paramMap);
	}

	/**
	 * @Method Name : selectStsClncCdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   임상 시각화 공통코드 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectStsClncCdList(HashMap<String, Object> paramMap) throws Exception {
		return dvzClcBrsDAO.selectStsClncCdList(paramMap);
	}

	/**
	 * @Method Name : selectStsClncYrList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   임상 시각화 연도 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectStsClncYrList(HashMap<String, Object> paramMap) throws Exception {
		return dvzClcBrsDAO.selectStsClncYrList(paramMap);
	}

	/**
	 * @Method Name : selectDvzClcStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   통계결과 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectDvzClcStatList(HashMap<String, Object> paramMap) throws Exception {
		// 통계유형 셋팅 
		if ("02".equals((String)paramMap.get("vslzDataStatTpcd"))) {	//연령별
			paramMap.put("groupColNm", "STATS_AGE_SPCD");
		} else if ("03".equals((String)paramMap.get("vslzDataStatTpcd"))) {	//성별
			paramMap.put("groupColNm", "SEX_CD");
		} else if ("04".equals((String)paramMap.get("vslzDataStatTpcd"))) {	//기관별
			paramMap.put("groupColNm", "HOSP_CD");
		} else {	//연도별
			paramMap.put("groupColNm", "CRIT_YR");
		}
		
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(sessionVo != null && "03".equals(sessionVo.getUserStcd())) { // 연구자 권한 일 때만
		
			//상세설정 셋팅 : 성별
			String gndrCdList = "";
			if (paramMap.get("gndrCdAll") == null || !"ALL".equals((String)paramMap.get("gndrCdAll"))) {
				String[] gndrCd = (String[])paramMap.get("gndrCd");
				
				for (int i=0; i < gndrCd.length; i++) {
					if (i > 0) gndrCdList = gndrCdList + ",";
					
					gndrCdList = gndrCdList + "'" + (String)gndrCd[i] + "'";
					
					paramMap.put("gndrCdList", gndrCdList);
				}
			}
			
			//상세설정 셋팅 : 연령
			String ageCdList = "";
			if (paramMap.get("ageCdAll") == null || !"ALL".equals((String)paramMap.get("ageCdAll"))) {
				String[] ageCd = (String[])paramMap.get("ageCd");
				
				for (int i=0; i < ageCd.length; i++) {
					if (i > 0) ageCdList = ageCdList + ",";
					
					ageCdList = ageCdList + "'" + (String)ageCd[i] + "'";
					
					paramMap.put("ageCdList", ageCdList);
				}
			}
			
			//상세설정 셋팅 : 연도
			String critYrList = "";
			if (paramMap.get("critYrAll") == null || !"ALL".equals((String)paramMap.get("critYrAll"))) {
				String[] critYr = (String[])paramMap.get("critYr");
				
				for (int i=0; i < critYr.length; i++) {
					if (i > 0) critYrList = critYrList + ",";
					
					critYrList = critYrList + "'" + (String)critYr[i] + "'";
					
					paramMap.put("critYrList", critYrList);
				}
			}
			
			//상세설정 셋팅 : 기관
			String prtiCdList = "";
			if (paramMap.get("prtiCdAll") == null || !"ALL".equals((String)paramMap.get("prtiCdAll"))) {
				String[] prtiCd = (String[])paramMap.get("prtiCd");
				
				for (int i=0; i < prtiCd.length; i++) {
					if (i > 0) prtiCdList = prtiCdList + ",";
					
					prtiCdList = prtiCdList + "'" + (String)prtiCd[i] + "'";
					
					paramMap.put("prtiCdList", prtiCdList);
				}
			}
		
		}
		
		return dvzClcBrsDAO.selectDvzClcStatList(paramMap);
	}
}
