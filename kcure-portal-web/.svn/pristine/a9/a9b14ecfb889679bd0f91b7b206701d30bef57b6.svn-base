package kcure.portal.cmn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.service.KcureIndexService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.service.impl
 * @FileName : KcureIndexController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	kcure 메인화면에 대한 비즈니스 구현 클래스를 정의한다.
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
@Service("kcureIndexService")
public class KcureIndexServiceImpl extends EgovAbstractServiceImpl implements KcureIndexService {
	
	@Resource(name="kcureIndexDAO")
	private KcureIndexDAO kcureIndexDAO;

	/**
	 * @Method Name : selectBbsNtcListForMain
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   공지사항 리스트(메인화면용)
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectBbsNtcListForMain(HashMap<String, Object> paramMap) throws Exception {
		return kcureIndexDAO.selectBbsNtcListForMain(paramMap);
	}

	/**
	 * @Method Name : selectBbsFaqListForMain
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   FAQ 리스트(메인화면용)
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectBbsFaqListForMain(HashMap<String, Object> paramMap) throws Exception {
		return kcureIndexDAO.selectBbsFaqListForMain(paramMap);
	}
}
