package kcure.portal.myp.svc.alm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.myp.svc.alm.service.MypSvcAlmService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.svc.alm.service.impl
 * @FileName : MypSvcAlmServiceImpl.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 알림에 대한 비즈니스 구현 클래스를 정의한다.
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
@Service("mypSvcAlmService")
public class MypSvcAlmServiceImpl extends EgovAbstractServiceImpl implements MypSvcAlmService {
	
	@Resource(name="mypSvcAlmDAO")
	private MypSvcAlmDAO mypSvcAlmDAO;
	
	/**
	 * @Method Name : selectMypSvcAlmCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  조회 전 나의알림 카운트
	 * @param : model
	 * @return :
	 */
	@Override
	public int selectMypSvcAlmCnt(HashMap<String, Object> paramMap) throws Exception {
		return mypSvcAlmDAO.selectMypSvcAlmCnt(paramMap);
	}
	
    /**
	 * @Method Name : selectMypSvcAlmListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	@Override
	public int selectMypSvcAlmListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return mypSvcAlmDAO.selectMypSvcAlmListTotCnt(paramMap);
	}
	
	/**
	 * @Method Name : selectMypSvcAlmList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypSvcAlmList(HashMap<String, Object> paramMap) throws Exception {
		return mypSvcAlmDAO.selectMypSvcAlmList(paramMap);
	}
	
	/**
	 * @Method Name : updateMypSvcAlmAllCnfrYn
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 확인여부 전체수정
	 * @param : model
	 * @return :
	 */
	@Override
	public void updateMypSvcAlmAllCnfrYn(HashMap<String, Object> paramMap) throws Exception {
		mypSvcAlmDAO.updateMypSvcAlmAllCnfrYn(paramMap);
	}
	
	/**
	 * @Method Name : selectMypSvcAlm
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 상세 정보 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public Map<String, Object> selectMypSvcAlm(HashMap<String, Object> paramMap) throws Exception {
		return mypSvcAlmDAO.selectMypSvcAlm(paramMap);
	}
	
	/**
	 * @Method Name : updateMypSvcAlmClckYn
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   알림 클릭여부 수정
	 * @param : model
	 * @return :
	 */
	@Override
	public void updateMypSvcAlmClckYn(HashMap<String, Object> paramMap) throws Exception {
		mypSvcAlmDAO.updateMypSvcAlmClckYn(paramMap);
	}
}
