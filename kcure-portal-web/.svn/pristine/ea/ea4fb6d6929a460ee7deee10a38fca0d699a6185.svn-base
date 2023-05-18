package kcure.portal.sys.usr.stt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovFileScrty;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.NtceUserInfo;
import kcure.portal.cmn.alm.service.AlmService;
import kcure.portal.sys.usr.stt.service.UsrSttService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.usr.service.impl
  * @FileName : UsrServiceImpl.java
  * @since : 2023. 1. 30.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	사용자관리에 관한 ServiceImpl 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("usrSttService")
public class UsrSttServiceImpl extends EgovAbstractServiceImpl implements UsrSttService{

	public static String initPw = "1234";	//임시비밀번호

	@Resource(name="usrSttDAO")
    private UsrSttDAO usrSttDAO;

	@Resource(name = "almService")
	private AlmService almService;

	@Override
	public List<UsrVO> selectUserList(UsrVO usrVO) throws Exception {

		String[] tempList = null;
		String userStcd = usrVO.getUserStcd();
		if(userStcd.indexOf(",") > 0) {
			tempList = usrVO.getUserStcd().split(",");
		}else {
			tempList = new String[1];
			tempList[0] = userStcd;
		}

		usrVO.setUserStcdList(tempList);
		return usrSttDAO.selectUserList(usrVO);
	}

	@Override
	public int selectUserListTotCnt(UsrVO usrVO) throws Exception {
		return usrSttDAO.selectUserListTotCnt(usrVO);
	}

	@Override
	public List<Map<String,Object>> selectUsrHstList(UsrVO usrVO) throws Exception {
		return usrSttDAO.selectUsrHstList(usrVO);
	}

	@Override
	public int selectUsrHstListTotCnt(UsrVO usrVO) throws Exception {
		return usrSttDAO.selectUsrHstListTotCnt(usrVO);
	}

	@Override
	public List<?> selectUsrAuthList(UsrVO usrVO) throws Exception {
		return usrSttDAO.selectUsrAuthList(usrVO);
	}

	@Override
	public void updateUsr(UsrVO usrVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		List<String> usrList = usrVO.getUsrList();
		String userStcd = usrVO.getUserStcd();
		String statChanRsnCont = usrVO.getStatChanRsnCont();

		for(int i=0; i < usrList.size(); i++) {
			String userId = usrList.get(i);
			UsrVO updateVO = new UsrVO();
			if(!"".equals(userStcd) && userStcd != null) {
				updateVO.setUserStcd(userStcd);
				updateVO.setAfchgStcd(userStcd);
			} else {
				//패스워드 초기화
				String saltValue = EgovFileScrty.getSalt();
				String pass = EgovFileScrty.saltEncryptPassword(initPw,saltValue);
				//String pass = EgovFileScrty.encryptPassword(initPw, userId);
				updateVO.setLoginPswd(pass);
				updateVO.setPswdSltVl(saltValue);
			}

			updateVO.setStatChanRsnCont(statChanRsnCont);
			updateVO.setUserId(userId);
			updateVO.setFrstRegpId(user.getId());
			updateVO.setLastModpId(user.getId());
			usrSttDAO.updateUsr(updateVO);
			if(!"".equals(userStcd) && userStcd != null) {
				String ntceSignCd = "";
				boolean almYn = true;
				boolean emailYn = true;
				//승인일경우
				if(CommonEnum.userStcd.STCD03.stcd().equals(userStcd)) {
					//승인시 일반연구자 권한 등록
					updateVO.setAuthId(CommonEnum.usertHstAuthIdInfo.AUTHID006.authId());
					updateVO.setGmtYn(CommonEnum.usertHstAuthIdInfo.AUTHID006.gmtYn());
					updateVO.setDelYn(CommonEnum.usertHstAuthIdInfo.AUTHID006.delYn());
					ntceSignCd = NtceUserInfo.NTCE_SIGNUP_01.getSpDtlcd();
					//반려일 경우
				}else if(CommonEnum.userStcd.STCD02.stcd().equals(userStcd)) {
					updateVO.setAuthId(CommonEnum.usertHstAuthIdInfo.AUTHID999.authId());
					updateVO.setGmtYn(CommonEnum.usertHstAuthIdInfo.AUTHID999.gmtYn());
					updateVO.setDelYn(CommonEnum.usertHstAuthIdInfo.AUTHID999.delYn());
					ntceSignCd = NtceUserInfo.NTCE_SIGNUP_02.getSpDtlcd();
					almYn = false;
				}
				changUserAuthInfo(updateVO,almYn,emailYn ,ntceSignCd);
			}
		}
	}

	/**
	  * @Method Name : changUserAuthInfo
	  * @date : 2023. 3. 31.
	  * @Method 설명 :
	  *  <p>
	  *     권한 변경 이력 남기기.
	  *  </p>
	  * @param : UsrVO
	  * @param : almYn 알람등록 여부
	  * @param : emailYn 이메일 전송여부
	  * @param : ntceSignup 알람메세지 타입
	  * @return :
	 * @throws Exception
	  */
	public void changUserAuthInfo(UsrVO updateVO, boolean almYn, boolean emailYn,String ntceSignup) throws Exception {
		//사용자 이력 등록
		usrSttDAO.insertUsrHst(updateVO);
		if(emailYn ) {
			try {
				almService.registAlrm(ntceSignup, updateVO.getUserId(), updateVO.getAuthId());
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		}

	}

	@Override
	public List<?> selectCdCbo(String param) throws Exception {
		return usrSttDAO.selectCdCbo(param);
	}

	@Override
	public UsrVO selectUserChanRsn(UsrVO param) {
		return usrSttDAO.selectUserChanRsn(param);
	}
}
