package kcure.portal.myp.usr.wth.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.myp.usr.wth.service.MypUsrWthService;
import kcure.portal.sys.usr.stt.service.impl.UsrSttDAO;
import kcure.portal.sys.usr.stt.service.impl.UsrVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.usr.wth.service.impl
 * @FileName : MypUsrWthServiceImpl.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 회원탈퇴에 대한 비즈니스 구현 클래스를 정의한다.
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
@Service("mypUsrWthService")
public class MypUsrWthServiceImpl extends EgovAbstractServiceImpl implements MypUsrWthService {
	
	@Resource(name="mypUsrWthDAO")
	private MypUsrWthDAO mypUsrWthDAO;

	@Resource(name="usrSttDAO")
    private UsrSttDAO usrSttDAO;
	
	/**
	 * @Method Name : saveMypUsrWthChg
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   회원탈퇴 처리
	 * @param : model
	 * @return :
	 */
	@Override
	public void saveMypUsrWthChg(HashMap<String, Object> paramMap) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		paramMap.put("userId", sessionVo.getId());
		paramMap.put("frstRegpId", sessionVo.getId());
		
		mypUsrWthDAO.updateMypUsrWth(paramMap);	//회원 탈퇴처리
		
		UsrVO usrHstVO = new UsrVO();
		usrHstVO.setUserId(sessionVo.getId());
		usrHstVO.setAfchgStcd("99"); //탈퇴
		//TODO : 추후 확인필요 ( authid, gmtYn delYn 하드코딩된 상태임 )
		usrHstVO.setAuthId("00000");
		usrHstVO.setGmtYn("N");
		usrHstVO.setDelYn("Y");
		usrHstVO.setStatChanRsnCont("사용자에 의한 탈퇴");	//탈퇴사유
		usrHstVO.setFrstRegpId(sessionVo.getId());
		usrHstVO.setLastModpId(sessionVo.getId());
		usrSttDAO.insertUsrHst(usrHstVO);	//회원 탈퇴이력 저장
	}
}
