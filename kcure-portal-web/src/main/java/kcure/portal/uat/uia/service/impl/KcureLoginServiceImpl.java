package kcure.portal.uat.uia.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.config.EgovLoginConfig;
import egovframework.com.cop.ems.service.EgovSndngMailRegistService;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import kcure.portal.cmn.api.cmm.Constants;
import kcure.portal.cmn.api.lgn.service.LgnService;
import kcure.portal.cmn.api.lgn.service.impl.LgnPrtiVO;
import kcure.portal.cmn.api.lgn.service.impl.LgnVdiVO;
import kcure.portal.uat.uia.service.KcureLoginService;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;

/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.uat.uia.service.impl
  * @FileName : KcureLoginServiceImpl.java
  * @since : 2023. 1. 31.
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :	일반 로그인을 처리하는 비즈니스 구현 클래스
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("KcureLoginService")
public class KcureLoginServiceImpl extends EgovAbstractServiceImpl implements KcureLoginService {

    @Resource(name="kcureLoginDAO")
    private LoginDAO loginDAO;

    /** EgovSndngMailRegistService */
	@Resource(name = "sndngMailRegistService")
    private EgovSndngMailRegistService sndngMailRegistService;

	@Resource(name = "egovLoginConfig")
	EgovLoginConfig egovLoginConfig;

	@Resource(name="lgnService")
    private LgnService lgnService;

	/**
	 * 로그인인증제한을 조회한다.
	 * @param vo LoginVO
	 * @return Map
	 * @exception Exception
	 */
    public Map<?,?> getLoginIncorrect(KcureLoginVO vo) throws Exception{
    	return loginDAO.getLoginIncorrect(vo);
    }

    /**
  	 * 로그인인증제한을 처리한다.
  	 * @param vo LoginVO
  	 * @param vo mapLockUserInfo
  	 * @return String
  	 * @exception Exception
  	 */
      public String processLoginIncorrect(KcureLoginVO vo, Map<?,?> mapLockUserInfo) throws Exception{
      	String sRtnCode = "C";
      	String enpassword = EgovFileScrty.saltEncryptPassword(vo.getLoginPswd(), (String)mapLockUserInfo.get("pswdSltVl"));
      	Map<String,String> mapParam = new HashMap<String,String>();
  		mapParam.put("userId", EgovStringUtil.isNullToString(vo.getUserId()));
  		if( ((String)mapLockUserInfo.get("loginPswd")).equals(enpassword) ){
  			mapParam.put("updateAt", "E");
      		loginDAO.updateLoginIncorrect(mapParam);
      		sRtnCode = "E";
  		}
      	return sRtnCode;
      }


	/**
	 *
	 * api 로그인 체크 서비스
	 * @param userId 로그인 아이디
	 * @param passWord 로그인 아이디
	*/
	@Override
	public LgnPrtiVO apiPrtiLoginCheck(String prtiId, String userId, String passWord) {
		LgnPrtiVO result = new LgnPrtiVO();
		KcureLoginVO loginVO = new KcureLoginVO();
		loginVO.setUserId(userId);
		loginVO.setPrtiId(prtiId);
		try {
			Boolean loginChk = checkLogin(loginVO,passWord);
			result.setIsLogin(String.valueOf(loginChk));

			if(!loginChk) {
				result.setLoginFailMsg("입력하신 비밀번호가 틀립니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			result.setIsLogin("false");
			result.setLoginFailMsg("Exception 발생");
		}
		return result ;
	}

	/**
	 * api 로그인 체크 서비스
	 * @param userId 로그인 아이디
	 * @param passWord 로그인 아이디
	 * @return {login=true, auth=[300, 400]}
	*/
	@Override
	public LgnVdiVO apiVdiLoginCheck(String userId, String passWord) {

		LgnVdiVO result = new LgnVdiVO();

		try {
			KcureLoginVO loginVO = new KcureLoginVO();
			loginVO.setUserId(userId);
			if(checkLogin(loginVO,passWord)) {
				result.setIsLogin("true");

				//로그인 유저가 가진 권한 코드 목록
				List<Map<String,Object>> authList =  loginDAO.getAuthList(loginVO);

				List<Map<String,Object>> authCodeList = new ArrayList<Map<String,Object>>();
				Map<String,Object> authCodeMap = new HashMap<String, Object>();

				if(authList.size() > 0) {

					for(Map<String, Object> authMap : authList) {
						if(Constants.API.AU006.equals(authMap.get("authCode"))) {	//신청자
							authCodeMap.put(authMap.get("authCode").toString(), lgnService.selectSvcDataAplcList(userId));
						}else if(Constants.API.AU005.equals(authMap.get("authCode"))) {	//심의 의원
							authCodeMap.put(authMap.get("authCode").toString(), lgnService.selectSvcDataAplcRvwList(userId));
						}
					}

				}
				authCodeList.add(authCodeMap);

				Map<String,Object> applyResultMap = new HashMap<String, Object>();
				applyResultMap.put("authCode", authCodeList);
				result.setApplyResult(applyResultMap);
			}else {
				result.setIsLogin("false");
				result.setNasId("");
				result.setNasPw("");
				result.setNasUrl("");
				result.setNasPort("");
				result.setNasBaseFolder("");
				result.setNasEncoding("");
				result.setLoginFailMsg("입력하신 비밀번호가 틀립니다.");
				result.setApplyResult(null);
			}
		} catch (Exception e) {
			e.printStackTrace();

			result.setIsLogin("false");
			result.setNasId("");
			result.setNasPw("");
			result.setNasUrl("");
			result.setNasPort("");
			result.setNasBaseFolder("");
			result.setNasEncoding("");
			result.setLoginFailMsg("Exception 발생");
			result.setApplyResult(null);
		}
      	return result;
	}


	private boolean checkLogin(KcureLoginVO loginVO,String passWord) throws Exception {
		Map<?,?> mapLockUserInfo = (EgovMap)this.getLoginIncorrect(loginVO);
		boolean result = false;
		if(mapLockUserInfo != null){
			String enpassword = EgovFileScrty.saltEncryptPassword(passWord, (String)mapLockUserInfo.get("pswdSltVl"));
			//비밀번호가 같으면.
			if( ((String)mapLockUserInfo.get("loginPswd")).equals(enpassword) ) {
				result = true;
			}
		}
		return result;
	}







}
