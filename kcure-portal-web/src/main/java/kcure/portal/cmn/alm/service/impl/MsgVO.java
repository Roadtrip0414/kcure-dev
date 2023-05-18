package kcure.portal.cmn.alm.service.impl;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.alm.service.impl
  * @FileName : AlmVO.java
  * @since : 2023. 3. 23.
  * @version 1.0
  * @author : bhs
  * @프로그램 설명 : 사용자 알림 메세지 VO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  2023.05.02    PSJ		데이터셋 신청 중 메일 전송 시 필요한 값 추가
  *  </pre>
  */
public class MsgVO {

	public String ntceMsgNo;
	public String ntceSpcd;
	public String ntceDetlSpcd;
	public String ntceMsgTtlNm;
	public String emailMsgTtlNm;
	public String ntceMsgCont;
	public String emailMsgCont;
	
	//2023.05.02  추가 PSJ
	public String userNm;
	public String dataAplpId;
	public String rsrSbjNm;
	public String rsrDt;
	public String dataTpcdNm;
	public String rjcRsnCont;
	
	public String getNtceMsgNo() {
		return ntceMsgNo;
	}
	public void setNtceMsgNo(String ntceMsgNo) {
		this.ntceMsgNo = ntceMsgNo;
	}
	public String getNtceSpcd() {
		return ntceSpcd;
	}
	public void setNtceSpcd(String ntceSpcd) {
		this.ntceSpcd = ntceSpcd;
	}
	public String getNtceDetlSpcd() {
		return ntceDetlSpcd;
	}
	public void setNtceDetlSpcd(String ntceDetlSpcd) {
		this.ntceDetlSpcd = ntceDetlSpcd;
	}
	public String getNtceMsgTtlNm() {
		return ntceMsgTtlNm;
	}
	public void setNtceMsgTtlNm(String ntceMsgTtlNm) {
		this.ntceMsgTtlNm = ntceMsgTtlNm;
	}
	public String getEmailMsgTtlNm() {
		return emailMsgTtlNm;
	}
	public void setEmailMsgTtlNm(String emailMsgTtlNm) {
		this.emailMsgTtlNm = emailMsgTtlNm;
	}
	public String getNtceMsgCont() {
		return ntceMsgCont;
	}
	public void setNtceMsgCont(String ntceMsgCont) {
		this.ntceMsgCont = ntceMsgCont;
	}
	public String getEmailMsgCont() {
		return emailMsgCont;
	}
	public void setEmailMsgCont(String emailMsgCont) {
		this.emailMsgCont = emailMsgCont;
	}
	
	
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getDataAplpId() {
		return dataAplpId;
	}
	public void setDataAplpId(String dataAplpId) {
		this.dataAplpId = dataAplpId;
	}
	public String getRsrSbjNm() {
		return rsrSbjNm;
	}
	public void setRsrSbjNm(String rsrSbjNm) {
		this.rsrSbjNm = rsrSbjNm;
	}
	public String getRsrDt() {
		return rsrDt;
	}
	public void setRsrDt(String rsrDt) {
		this.rsrDt = rsrDt;
	}
	public String getDataTpcdNm() {
		return dataTpcdNm;
	}
	public void setDataTpcdNm(String dataTpcdNm) {
		this.dataTpcdNm = dataTpcdNm;
	}
	public String getRjcRsnCont() {
		return rjcRsnCont;
	}
	public void setRjcRsnCont(String rjcRsnCont) {
		this.rjcRsnCont = rjcRsnCont;
	}
	
	@Override
	public String toString() {
		return "MsgVO [ntceMsgNo=" + ntceMsgNo + ", ntceSpcd=" + ntceSpcd + ", ntceDetlSpcd=" + ntceDetlSpcd
				+ ", ntceMsgTtlNm=" + ntceMsgTtlNm + ", emailMsgTtlNm=" + emailMsgTtlNm + ", ntceMsgCont=" + ntceMsgCont
				+ ", emailMsgCont=" + emailMsgCont + ", userNm=" + userNm + ", dataAplpId=" + dataAplpId + ", rsrSbjNm="
				+ rsrSbjNm + ", rsrDt=" + rsrDt + ", dataTpcdNm=" + dataTpcdNm + ", rjcRsnCont=" + rjcRsnCont + "]";
	}
	
	
}
