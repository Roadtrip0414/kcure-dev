package kcure.portal.uat.uia.service.impl;

import java.io.Serializable;

/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.uat.uia.service.impl
  * @FileName : KcureLoginVO.java
  * @since : 2023. 2. 1. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :	Login VO class
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class KcureLoginVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6166628439885179461L;
	
	private String userId;
	//사용자성명
	private String userNm;
	// 로그인비밀번호
	private String loginPswd;
	//개인식별번호
	private String pin;
	//비밀번호솔트값
	private String pswdSltVl;
	//사용자상태코드
	private String userStcd;
	//참여기관ID
	private String prtiId;
	// 참여기관명
	private String prtiNm;
	//사용자이동전화번호
	private String userMbphNo;
	//사용자가입매체코드
	private String userEntMedmCd;
	//가입매체수신ID
	private String entMedmRcvId;
	//이용약관동의여부
	private String trmAgrYn;
	//개인정보활용동의여부
	private String pinfUseAgrYn;
	//사용자가입일시
	private String userEntDt;
	//사용자승인일시
	private String userAprvDt;
	//휴면상태변경일시
	private String drmtStatChanDt;
	//사용자탈퇴일시
	private String userWthdDt;
	//최종로그인일시
	private String lastLoginDt;
	//이메일수신동의여부
	private String emailRcvAgrYn;
	//SMS수신동의여부
	private String smsRcvAgrYn;
	//개인정보수집이용동의여부
	private String pinfCnuAgrYn;
	//개인정보제3자제공동의여부
	private String pinfSp3pAgrYn;
	//관리자권한보유여부
	private String admAuthPossYn;
	
	private String frstRegpId;
	private String frstRgstDt;
	private String lastModpId;
	private String lastModfDt;
	
	public String getFrstRegpId() {
		return frstRegpId;
	}
	public void setFrstRegpId(String frstRegpId) {
		this.frstRegpId = frstRegpId;
	}
	public String getFrstRgstDt() {
		return frstRgstDt;
	}
	public void setFrstRgstDt(String frstRgstDt) {
		this.frstRgstDt = frstRgstDt;
	}
	public String getLastModpId() {
		return lastModpId;
	}
	public void setLastModpId(String lastModpId) {
		this.lastModpId = lastModpId;
	}
	public String getLastModfDt() {
		return lastModfDt;
	}
	public void setLastModfDt(String lastModfDt) {
		this.lastModfDt = lastModfDt;
	}
	public String getSmsRcvAgrYn() {
		return smsRcvAgrYn;
	}
	public void setSmsRcvAgrYn(String smsRcvAgrYn) {
		this.smsRcvAgrYn = smsRcvAgrYn;
	}
	public String getEmailRcvAgrYn() {
		return emailRcvAgrYn;
	}
	public void setEmailRcvAgrYn(String emailRcvAgrYn) {
		this.emailRcvAgrYn = emailRcvAgrYn;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getLoginPswd() {
		return loginPswd;
	}
	public void setLoginPswd(String loginPswd) {
		this.loginPswd = loginPswd;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
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
	public String getPinfUseAgrYn() {
		return pinfUseAgrYn;
	}
	public void setPinfUseAgrYn(String pinfUseAgrYn) {
		this.pinfUseAgrYn = pinfUseAgrYn;
	}
	public String getUserEntDt() {
		return userEntDt;
	}
	public void setUserEntDt(String userEntDt) {
		this.userEntDt = userEntDt;
	}
	public String getUserAprvDt() {
		return userAprvDt;
	}
	public void setUserAprvDt(String userAprvDt) {
		this.userAprvDt = userAprvDt;
	}
	public String getDrmtStatChanDt() {
		return drmtStatChanDt;
	}
	public void setDrmtStatChanDt(String drmtStatChanDt) {
		this.drmtStatChanDt = drmtStatChanDt;
	}
	public String getUserWthdDt() {
		return userWthdDt;
	}
	public void setUserWthdDt(String userWthdDt) {
		this.userWthdDt = userWthdDt;
	}
	public String getLastLoginDt() {
		return lastLoginDt;
	}
	public void setLastLoginDt(String lastLoginDt) {
		this.lastLoginDt = lastLoginDt;
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
		return "KcureLoginVO [userId=" + userId + ", userNm=" + userNm + ", loginPswd=" + loginPswd + ", pin=" + pin
				+ ", pswdSltVl=" + pswdSltVl + ", userStcd=" + userStcd + ", prtiId=" + prtiId + ", prtiNm=" + prtiNm + ", userMbphNo="
				+ userMbphNo + ", userEntMedmCd=" + userEntMedmCd + ", entMedmRcvId=" + entMedmRcvId + ", trmAgrYn="
				+ trmAgrYn + ", pinfUseAgrYn=" + pinfUseAgrYn + ", userEntDt=" + userEntDt + ", userAprvDt="
				+ userAprvDt + ", drmtStatChanDt=" + drmtStatChanDt + ", userWthdDt=" + userWthdDt + ", lastLoginDt="
				+ lastLoginDt + ", emailRcvAgrYn=" + emailRcvAgrYn + ", smsRcvAgrYn=" + smsRcvAgrYn
				+ ", pinfCnuAgrYn=" + pinfCnuAgrYn + ", pinfSp3pAgrYn=" + pinfSp3pAgrYn + ", admAuthPossYn=" + admAuthPossYn
				+ ", frstRegpId=" + frstRegpId + ", frstRgstDt=" + frstRgstDt + ", lastModpId=" + lastModpId
				+ ", lastModfDt=" + lastModfDt + "]";
	}
}
