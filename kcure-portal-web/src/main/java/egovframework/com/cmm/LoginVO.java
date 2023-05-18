package egovframework.com.cmm;

import java.io.Serializable;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.03.03		박지욱		최초 생성
 * @ 2021.05.30		정진오		디지털원패스 사용자키/세션값 추가
 *
 *  @author 공통서비스 개발팀 박지욱
 *  @since 2009.03.03
 *  @version 1.0
 *  @see
 *  
 */
public class LoginVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	
	/** 아이디 */
	private String id;
	/** 이름 */
	private String name;
	/** 주민등록번호 */
	private String ihidNum;
	/** 이메일주소 */
	private String email;
	/** 비밀번호 */
	private String password;
	/** 비밀번호 힌트 */
	private String passwordHint;
	/** 비밀번호 정답 */
	private String passwordCnsr;
	/** 사용자구분 */
	private String userSe;
	/** 조직(부서)ID */
	private String orgnztId;
	/** 조직(부서)명 */
	private String orgnztNm;
	/** 고유아이디 */
	private String uniqId;
	/** 로그인 후 이동할 페이지 */
	private String url;
	/** 사용자 IP정보 */
	private String ip;
	/** GPKI인증 DN */
	private String dn;
	/** 디지털원패스 사용자키 */
	private String onepassUserkey;
	/** 디지털원패스 사용자세션값 */
	private String onepassIntfToken;
	/** 접속방식( I : 로그인 / O : 로그아웃 ) */
	private String conectMthd;
	
	private String logId;
	
	/** 비밀번호솔트값 */
	private String pswdSltVl;
	/** 사용자상태코드 */
	private String userStcd;
	/** 참여기관ID */
	private String prtiId;
	/** 참여기관명 */
	private String prtiNm;
	/** 사용자이동전화번호 */
	private String userMbphNo;
	/** 사용자가입매체코드 */
	private String userEntMedmCd;
	/** 가입매체수신ID */
	private String entMedmRcvId;
	/** 이용약관동의여부 */
	private String trmAgrYn;
	/** 개인정보수집이용동의여부 */
	private String pinfCnuAgrYn;
	/** 개인정보제3자제공동의여부 */
	private String pinfSp3pAgrYn;
	/** 이메일수신동의여부 */
	private String emailRcvAgrYn;
	/** SMS수신동의여부 */
	private String smsRcvAgrYn;
	
	/** 사용자메뉴모드( 01 : 사용자영역 / 02 : 관리자영역 ) */
	private String usrMnuMode;
	/** 현재메뉴URI */
	private String currMnuUri;
	/** 관리자권한보유여부 */
	private String admAuthPossYn;	
	
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getConectMthd() {
		return conectMthd;
	}
	public void setConectMthd(String conectMthd) {
		this.conectMthd = conectMthd;
	}
	/**
	 * id attribute 를 리턴한다.
	 * @return String
	 */
	public String getId() {
		return id;
	}
	/**
	 * id attribute 값을 설정한다.
	 * @param id String
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * name attribute 를 리턴한다.
	 * @return String
	 */
	public String getName() {
		return name;
	}
	/**
	 * name attribute 값을 설정한다.
	 * @param name String
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * ihidNum attribute 를 리턴한다.
	 * @return String
	 */
	public String getIhidNum() {
		return ihidNum;
	}
	/**
	 * ihidNum attribute 값을 설정한다.
	 * @param ihidNum String
	 */
	public void setIhidNum(String ihidNum) {
		this.ihidNum = ihidNum;
	}
	/**
	 * email attribute 를 리턴한다.
	 * @return String
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * email attribute 값을 설정한다.
	 * @param email String
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * password attribute 를 리턴한다.
	 * @return String
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * password attribute 값을 설정한다.
	 * @param password String
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * passwordHint attribute 를 리턴한다.
	 * @return String
	 */
	public String getPasswordHint() {
		return passwordHint;
	}
	/**
	 * passwordHint attribute 값을 설정한다.
	 * @param passwordHint String
	 */
	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}
	/**
	 * passwordCnsr attribute 를 리턴한다.
	 * @return String
	 */
	public String getPasswordCnsr() {
		return passwordCnsr;
	}
	/**
	 * passwordCnsr attribute 값을 설정한다.
	 * @param passwordCnsr String
	 */
	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}
	/**
	 * userSe attribute 를 리턴한다.
	 * @return String
	 */
	public String getUserSe() {
		return userSe;
	}
	/**
	 * userSe attribute 값을 설정한다.
	 * @param userSe String
	 */
	public void setUserSe(String userSe) {
		this.userSe = userSe;
	}
	/**
	 * orgnztId attribute 를 리턴한다.
	 * @return String
	 */
	public String getOrgnztId() {
		return orgnztId;
	}
	/**
	 * orgnztId attribute 값을 설정한다.
	 * @param orgnztId String
	 */
	public void setOrgnztId(String orgnztId) {
		this.orgnztId = orgnztId;
	}
	/**
	 * uniqId attribute 를 리턴한다.
	 * @return String
	 */
	public String getUniqId() {
		return uniqId;
	}
	/**
	 * uniqId attribute 값을 설정한다.
	 * @param uniqId String
	 */
	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}
	/**
	 * url attribute 를 리턴한다.
	 * @return String
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * url attribute 값을 설정한다.
	 * @param url String
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	/**
	 * ip attribute 를 리턴한다.
	 * @return String
	 */
	public String getIp() {
		return ip;
	}
	/**
	 * ip attribute 값을 설정한다.
	 * @param ip String
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}
	/**
	 * dn attribute 를 리턴한다.
	 * @return String
	 */
	public String getDn() {
		return dn;
	}
	/**
	 * dn attribute 값을 설정한다.
	 * @param dn String
	 */
	public void setDn(String dn) {
		this.dn = dn;
	}
	/**
	 * @return the orgnztNm
	 */
	public String getOrgnztNm() {
		return orgnztNm;
	}
	/**
	 * @param orgnztNm the orgnztNm to set
	 */
	public void setOrgnztNm(String orgnztNm) {
		this.orgnztNm = orgnztNm;
	}
	
	/**
	 * 디지털원패스 사용자키를 리턴한다.
	 * @return onepassUserkey
	 */
	public String getOnepassUserkey() {
		return onepassUserkey;
	}
	/**
	 * 디지털원패스 사용자키를 설정한다.
	 * @param onepassUserkey
	 */
	public void setOnepassUserkey(String onepassUserkey) {
		this.onepassUserkey = onepassUserkey;
	}
	/**
	 * 디지털원패스 사용자세션값을 리턴한다.
	 * @return
	 */
	public String getOnepassIntfToken() {
		return onepassIntfToken;
	}
	/**
	 * 디지털원패스 사용자세션값을 설정한다.
	 * @param onepassIntfToken
	 */
	public void setOnepassIntfToken(String onepassIntfToken) {
		this.onepassIntfToken = onepassIntfToken;
	}
	public String getPswdSltVl() {
		return pswdSltVl;
	}
	public void setPswdSltVl(String pswdSltVl) {
		this.pswdSltVl = pswdSltVl;
	}
	public String getUserStcd() {
		return userStcd;
	}
	public void setUserStcd(String userStcd) {
		this.userStcd = userStcd;
	}
	public String getPrtiId() {
		return prtiId;
	}
	public void setPrtiId(String prtiId) {
		this.prtiId = prtiId;
	}
	public String getUserMbphNo() {
		return userMbphNo;
	}
	public void setUserMbphNo(String userMbphNo) {
		this.userMbphNo = userMbphNo;
	}
	public String getUserEntMedmCd() {
		return userEntMedmCd;
	}
	public void setUserEntMedmCd(String userEntMedmCd) {
		this.userEntMedmCd = userEntMedmCd;
	}
	public String getEntMedmRcvId() {
		return entMedmRcvId;
	}
	public void setEntMedmRcvId(String entMedmRcvId) {
		this.entMedmRcvId = entMedmRcvId;
	}
	public String getTrmAgrYn() {
		return trmAgrYn;
	}
	public void setTrmAgrYn(String trmAgrYn) {
		this.trmAgrYn = trmAgrYn;
	}
	public String getPinfCnuAgrYn() {
		return pinfCnuAgrYn;
	}
	public void setPinfCnuAgrYn(String pinfCnuAgrYn) {
		this.pinfCnuAgrYn = pinfCnuAgrYn;
	}
	public String getPinfSp3pAgrYn() {
		return pinfSp3pAgrYn;
	}
	public void setPinfSp3pAgrYn(String pinfSp3pAgrYn) {
		this.pinfSp3pAgrYn = pinfSp3pAgrYn;
	}
	public String getEmailRcvAgrYn() {
		return emailRcvAgrYn;
	}
	public void setEmailRcvAgrYn(String emailRcvAgrYn) {
		this.emailRcvAgrYn = emailRcvAgrYn;
	}
	public String getSmsRcvAgrYn() {
		return smsRcvAgrYn;
	}
	public void setSmsRcvAgrYn(String smsRcvAgrYn) {
		this.smsRcvAgrYn = smsRcvAgrYn;
	}
	public String getUsrMnuMode() {
		return usrMnuMode;
	}
	public void setUsrMnuMode(String usrMnuMode) {
		this.usrMnuMode = usrMnuMode;
	}
	public String getCurrMnuUri() {
		return currMnuUri;
	}
	public void setCurrMnuUri(String currMnuUri) {
		this.currMnuUri = currMnuUri;
	}	
	public String getAdmAuthPossYn() {
		return admAuthPossYn;
	}
	public void setAdmAuthPossYn(String admAuthPossYn) {
		this.admAuthPossYn = admAuthPossYn;
	}	
	public String getPrtiNm() {
		return prtiNm;
	}
	public void setPrtiNm(String prtiNm) {
		this.prtiNm = prtiNm;
	}
	
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", name=" + name + ", ihidNum=" + ihidNum + ", email=" + email + ", password="
				+ password + ", passwordHint=" + passwordHint + ", passwordCnsr=" + passwordCnsr + ", userSe=" + userSe
				+ ", orgnztId=" + orgnztId + ", orgnztNm=" + orgnztNm + ", uniqId=" + uniqId + ", url=" + url + ", ip="
				+ ip + ", dn=" + dn + ", onepassUserkey=" + onepassUserkey + ", onepassIntfToken=" + onepassIntfToken
				+ ", conectMthd=" + conectMthd + ", logId=" + logId
				+ ", pswdSltVl=" + pswdSltVl + ", userStcd=" + userStcd + ", prtiId=" + prtiId + ", prtiNm=" + prtiNm + ", userMbphNo=" + userMbphNo
				+ ", userEntMedmCd=" + userEntMedmCd + ", entMedmRcvId=" + entMedmRcvId + ", trmAgrYn=" + trmAgrYn + ", pinfCnuAgrYn=" + pinfCnuAgrYn
				+ ", pinfSp3pAgrYn=" + pinfSp3pAgrYn + ", emailRcvAgrYn=" + emailRcvAgrYn + ", smsRcvAgrYn=" + smsRcvAgrYn
				+ ", usrMnuMode=" + usrMnuMode + ", currMnuUri=" + currMnuUri + ", admAuthPossYn=" + admAuthPossYn + "]";	
	}
}
