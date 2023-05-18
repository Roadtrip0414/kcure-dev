package kcure.portal.cmn.api.lgn.service.impl;

import java.util.Map;

import egovframework.com.cmm.service.EgovProperties;
import kcure.portal.cmn.util.CommonUtils;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.api.lgn.service.impl
  * @FileName : LgnVdiVO.java
  * @since : 2023. 3. 2.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : VDI 로그인 인증 VO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class LgnVdiVO {

	public String isLogin;
	public String loginFailMsg;
	public String nasUrl = EgovProperties.getProperty("nas.ftp.url");
	public String nasId = EgovProperties.getProperty("nas.ftp.id");
	public String nasPw = EgovProperties.getProperty("nas.ftp.pwd");
	public String nasPort = EgovProperties.getProperty("nas.ftp.port");
	public String nasBaseFolder = EgovProperties.getProperty("nas.ftp.baseFolder");
	public String nasEncoding = EgovProperties.getProperty("nas.ftp.encoding");
	public String today = CommonUtils.getNow("yyyyMMdd");

	public Map<String,Object> applyResult;

	public String getIsLogin() {
		return isLogin;
	}

	public void setIsLogin(String isLogin) {
		this.isLogin = isLogin;
	}

	public String getLoginFailMsg() {
		return loginFailMsg;
	}

	public void setLoginFailMsg(String loginFailMsg) {
		this.loginFailMsg = loginFailMsg;
	}

	public String getNasUrl() {
		return nasUrl;
	}

	public void setNasUrl(String nasUrl) {
		this.nasUrl = nasUrl;
	}

	public String getNasId() {
		return nasId;
	}

	public void setNasId(String nasId) {
		this.nasId = nasId;
	}

	public String getNasPw() {
		return nasPw;
	}

	public void setNasPw(String nasPw) {
		this.nasPw = nasPw;
	}

	public String getNasPort() {
		return nasPort;
	}

	public void setNasPort(String nasPort) {
		this.nasPort = nasPort;
	}

	public String getNasEncoding() {
		return nasEncoding;
	}

	public void setNasEncoding(String nasEncoding) {
		this.nasEncoding = nasEncoding;
	}

	public Map<String, Object> getApplyResult() {
		return applyResult;
	}

	public void setApplyResult(Map<String, Object> applyResult) {
		this.applyResult = applyResult;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getNasBaseFolder() {
		return nasBaseFolder;
	}

	public void setNasBaseFolder(String nasBaseFolder) {
		this.nasBaseFolder = nasBaseFolder;
	}

}
