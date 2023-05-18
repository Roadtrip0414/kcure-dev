package kcure.portal.sys.dac.rvw.service.impl;

import java.io.Serializable;

public class DacRvwVo  implements Serializable{


	private static final long serialVersionUID = -2539271416155600773L;

	public String dataAplcNo; //	데이터신청번호
	public String prtiId; //참여기관ID
	public String prtiNm; //참여기관명
	public String rvwStpSpcd; //심의진행단계코드
	public String rvwStpSpcdNm; //심의진행단계코드명
	public String rvwTmpId; //템플릿 ID
	public int rvwStpSeq; //심의진행단계순번
	public String rvwStpStcd; //심의상태코드
	public String rjcRsnCont; //반려사유
	public String rvwStdt; //심의기간 시작일
	public String rvwEddt; //심의기간 종료일
	
	public String ovpSpcd; //종합의견구분코드
	public String ovpCont; //종합의견내용
	public String apldSbstCont; //신청서제출현황내용
	public String dataCmbNcsCont; //데이터결합필요성내용
	public String detlCmpCont; //세부적합성내용
	public String etcConfCont; //기타구성내용
	public String reqRangCont; //요청범위내용
	public String reqVarCont; //요청변수내용
	
	public String preSpcd; //이전심의진행단계코드
	public String nextSpcd; //다음진행단계코드
	public String nextRvwStpStcd; //다음진행단계 상태코드
	
	public String lstStpSpcd; //마지막진행단계코드
	public String maxStep; //전체진행순서

	public String frstRegpId;
	public String frstRgstDt;
	public String lastModpId;
	public String lastModfDt;
	
	public String isMod; //수정여부
	
	public String rsrSbjNm; //연구주제명
	public String irbApriNm; //IRB승인기관명
	public String irbNo; //IRB번호
	public String clntAcntNm; //폐쇠망분석센터명
	public String rsrSpcd; //연구구분코드
	public String rsrSpcdNm; //연구유형명
	public String rsrSdt; //연구시작일자
	public String rsrEdt; //연구종료일자
	public String rsrPrpsCont; //연구목적내용
	public String rsrSbjCont; //연구주제내용
	public String kywCont; //키워드내용
	
	public String no;
	public String email;
	public String userNm;
	public String rvwPrncPstNm;
	public String userMbphNo;
	public String rvwPstPn;
	public String wCmplte;
	public String htmlStr;
	public String isWcmplteYn;
	
	public String histRvwStpSpcd; //히스토리 접근 진행단계코드
	public String stpSts;
	public String dataTpcd;
	public String userId;
	public String moveUriYn;
	//보완신청, 반려 상태코드
	public String rjcStpStcd;
	
	/**
	 * 공공입력금액
	 */
	public int pblInpAmt = 0;

	/**
	 * 공공결제금액
	 */
	public int pblStlmAmt = 0;
	//신청 상태
	public String aplcProgStcd;
	
	
	
	public String getRjcStpStcd() {
		return rjcStpStcd;
	}
	public void setRjcStpStcd(String rjcStpStcd) {
		this.rjcStpStcd = rjcStpStcd;
	}
	public String getMoveUriYn() {
		return moveUriYn;
	}
	public void setMoveUriYn(String moveUriYn) {
		this.moveUriYn = moveUriYn;
	}
	public String getAplcProgStcd() {
		return aplcProgStcd;
	}
	public void setAplcProgStcd(String aplcProgStcd) {
		this.aplcProgStcd = aplcProgStcd;
	}
	public int getPblInpAmt() {
		return pblInpAmt;
	}
	public void setPblInpAmt(int pblInpAmt) {
		this.pblInpAmt = pblInpAmt;
	}
	public int getPblStlmAmt() {
		return pblStlmAmt;
	}
	public void setPblStlmAmt(int pblStlmAmt) {
		this.pblStlmAmt = pblStlmAmt;
	}
	public String getNextRvwStpStcd() {
		return nextRvwStpStcd;
	}
	public void setNextRvwStpStcd(String nextRvwStpStcd) {
		this.nextRvwStpStcd = nextRvwStpStcd;
	}
	public String getDataTpcd() {
		return dataTpcd;
	}
	public void setDataTpcd(String dataTpcd) {
		this.dataTpcd = dataTpcd;
	}
	public String getDataAplcNo() {
		return dataAplcNo;
	}
	public void setDataAplcNo(String dataAplcNo) {
		this.dataAplcNo = dataAplcNo;
	}
	public String getRvwStpSpcd() {
		return rvwStpSpcd;
	}
	public void setRvwStpSpcd(String rvwStpSpcd) {
		this.rvwStpSpcd = rvwStpSpcd;
	}
	public String getRvwTmpId() {
		return rvwTmpId;
	}
	public void setRvwTmpId(String rvwTmpId) {
		this.rvwTmpId = rvwTmpId;
	}
	public int getRvwStpSeq() {
		return rvwStpSeq;
	}
	public void setRvwStpSeq(int rvwStpSeq) {
		this.rvwStpSeq = rvwStpSeq;
	}
	public String getRvwStpStcd() {
		return rvwStpStcd;
	}
	public void setRvwStpStcd(String rvwStpStcd) {
		this.rvwStpStcd = rvwStpStcd;
	}
	public String getRjcRsnCont() {
		return rjcRsnCont;
	}
	public void setRjcRsnCont(String rjcRsnCont) {
		this.rjcRsnCont = rjcRsnCont;
	}
	public String getRvwStdt() {
		return rvwStdt;
	}
	public void setRvwStdt(String rvwStdt) {
		this.rvwStdt = rvwStdt;
	}
	public String getRvwEddt() {
		return rvwEddt;
	}
	public void setRvwEddt(String rvwEddt) {
		this.rvwEddt = rvwEddt;
	}
	public String getOvpSpcd() {
		return ovpSpcd;
	}
	public void setOvpSpcd(String ovpSpcd) {
		this.ovpSpcd = ovpSpcd;
	}
	public String getOvpCont() {
		return ovpCont;
	}
	public void setOvpCont(String ovpCont) {
		this.ovpCont = ovpCont;
	}
	public String getApldSbstCont() {
		return apldSbstCont;
	}
	public void setApldSbstCont(String apldSbstCont) {
		this.apldSbstCont = apldSbstCont;
	}
	public String getDataCmbNcsCont() {
		return dataCmbNcsCont;
	}
	public void setDataCmbNcsCont(String dataCmbNcsCont) {
		this.dataCmbNcsCont = dataCmbNcsCont;
	}
	public String getDetlCmpCont() {
		return detlCmpCont;
	}
	public void setDetlCmpCont(String detlCmpCont) {
		this.detlCmpCont = detlCmpCont;
	}
	public String getEtcConfCont() {
		return etcConfCont;
	}
	public void setEtcConfCont(String etcConfCont) {
		this.etcConfCont = etcConfCont;
	}
	public String getPrtiId() {
		return prtiId;
	}
	public void setPrtiId(String prtiId) {
		this.prtiId = prtiId;
	}
	public String getReqRangCont() {
		return reqRangCont;
	}
	public void setReqRangCont(String reqRangCont) {
		this.reqRangCont = reqRangCont;
	}
	public String getReqVarCont() {
		return reqVarCont;
	}
	public void setReqVarCont(String reqVarCont) {
		this.reqVarCont = reqVarCont;
	}
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPreSpcd() {
		return preSpcd;
	}
	public void setPreSpcd(String preSpcd) {
		this.preSpcd = preSpcd;
	}
	public String getNextSpcd() {
		return nextSpcd;
	}
	public void setNextSpcd(String nextSpcd) {
		this.nextSpcd = nextSpcd;
	}
	public String getMaxStep() {
		return maxStep;
	}
	public void setMaxStep(String maxStep) {
		this.maxStep = maxStep;
	}
	public String getIsMod() {
		return isMod;
	}
	public void setIsMod(String isMod) {
		this.isMod = isMod;
	}	
	public String getPrtiNm() {
		return prtiNm;
	}
	public void setPrtiNm(String prtiNm) {
		this.prtiNm = prtiNm;
	}
	public String getRsrSbjNm() {
		return rsrSbjNm;
	}
	public void setRsrSbjNm(String rsrSbjNm) {
		this.rsrSbjNm = rsrSbjNm;
	}
	public String getIrbApriNm() {
		return irbApriNm;
	}
	public void setIrbApriNm(String irbApriNm) {
		this.irbApriNm = irbApriNm;
	}
	public String getIrbNo() {
		return irbNo;
	}
	public void setIrbNo(String irbNo) {
		this.irbNo = irbNo;
	}
	public String getClntAcntNm() {
		return clntAcntNm;
	}
	public void setClntAcntNm(String clntAcntNm) {
		this.clntAcntNm = clntAcntNm;
	}
	public String getRsrSpcd() {
		return rsrSpcd;
	}
	public void setRsrSpcd(String rsrSpcd) {
		this.rsrSpcd = rsrSpcd;
	}
	public String getRsrSpcdNm() {
		return rsrSpcdNm;
	}
	public void setRsrSpcdNm(String rsrSpcdNm) {
		this.rsrSpcdNm = rsrSpcdNm;
	}
	public String getRsrSdt() {
		return rsrSdt;
	}
	public void setRsrSdt(String rsrSdt) {
		this.rsrSdt = rsrSdt;
	}
	public String getRsrEdt() {
		return rsrEdt;
	}
	public void setRsrEdt(String rsrEdt) {
		this.rsrEdt = rsrEdt;
	}
	public String getRsrPrpsCont() {
		return rsrPrpsCont;
	}
	public void setRsrPrpsCont(String rsrPrpsCont) {
		this.rsrPrpsCont = rsrPrpsCont;
	}
	public String getRsrSbjCont() {
		return rsrSbjCont;
	}
	public void setRsrSbjCont(String rsrSbjCont) {
		this.rsrSbjCont = rsrSbjCont;
	}
	public String getKywCont() {
		return kywCont;
	}
	public void setKywCont(String kywCont) {
		this.kywCont = kywCont;
	}	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getRvwPrncPstNm() {
		return rvwPrncPstNm;
	}
	public void setRvwPrncPstNm(String rvwPrncPstNm) {
		this.rvwPrncPstNm = rvwPrncPstNm;
	}
	public String getUserMbphNo() {
		return userMbphNo;
	}
	public void setUserMbphNo(String userMbphNo) {
		this.userMbphNo = userMbphNo;
	}
	public String getRvwPstPn() {
		return rvwPstPn;
	}
	public void setRvwPstPn(String rvwPstPn) {
		this.rvwPstPn = rvwPstPn;
	}
	public String getwCmplte() {
		return wCmplte;
	}
	public void setwCmplte(String wCmplte) {
		this.wCmplte = wCmplte;
	}
	public String getHtmlStr() {
		return htmlStr;
	}
	public void setHtmlStr(String htmlStr) {
		this.htmlStr = htmlStr;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getIsWcmplteYn() {
		return isWcmplteYn;
	}
	public void setIsWcmplteYn(String isWcmplteYn) {
		this.isWcmplteYn = isWcmplteYn;
	}
	public String getHistRvwStpSpcd() {
		return histRvwStpSpcd;
	}
	public void setHistRvwStpSpcd(String histRvwStpSpcd) {
		this.histRvwStpSpcd = histRvwStpSpcd;
	}
	public String getStpSts() {
		return stpSts;
	}
	public void setStpSts(String stpSts) {
		this.stpSts = stpSts;
	}
	public String getLstStpSpcd() {
		return lstStpSpcd;
	}
	public void setLstStpSpcd(String lstStpSpcd) {
		this.lstStpSpcd = lstStpSpcd;
	}
	public String getRvwStpSpcdNm() {
		return rvwStpSpcdNm;
	}
	public void setRvwStpSpcdNm(String rvwStpSpcdNm) {
		this.rvwStpSpcdNm = rvwStpSpcdNm;
	}
	
	
	@Override
	public String toString() {
		return "DacRvwVo [dataAplcNo=" + dataAplcNo + ", prtiId=" + prtiId + ", prtiNm=" + prtiNm + ", rvwStpSpcd="
				+ rvwStpSpcd + ", rvwStpSpcdNm=" + rvwStpSpcdNm + ", rvwTmpId=" + rvwTmpId + ", rvwStpSeq=" + rvwStpSeq
				+ ", rvwStpStcd=" + rvwStpStcd + ", rjcRsnCont=" + rjcRsnCont + ", rvwStdt=" + rvwStdt + ", rvwEddt="
				+ rvwEddt + ", ovpSpcd=" + ovpSpcd + ", ovpCont=" + ovpCont + ", apldSbstCont=" + apldSbstCont
				+ ", dataCmbNcsCont=" + dataCmbNcsCont + ", detlCmpCont=" + detlCmpCont + ", etcConfCont=" + etcConfCont
				+ ", reqRangCont=" + reqRangCont + ", reqVarCont=" + reqVarCont + ", preSpcd=" + preSpcd + ", nextSpcd="
				+ nextSpcd + ", lstStpSpcd=" + lstStpSpcd + ", maxStep=" + maxStep + ", frstRegpId=" + frstRegpId
				+ ", frstRgstDt=" + frstRgstDt + ", lastModpId=" + lastModpId + ", lastModfDt=" + lastModfDt
				+ ", isMod=" + isMod + ", rsrSbjNm=" + rsrSbjNm + ", irbApriNm=" + irbApriNm + ", irbNo=" + irbNo
				+ ", clntAcntNm=" + clntAcntNm + ", rsrSpcd=" + rsrSpcd + ", rsrSpcdNm=" + rsrSpcdNm + ", rsrSdt="
				+ rsrSdt + ", rsrEdt=" + rsrEdt + ", rsrPrpsCont=" + rsrPrpsCont + ", rsrSbjCont=" + rsrSbjCont
				+ ", kywCont=" + kywCont + ", no=" + no + ", email=" + email + ", userNm=" + userNm + ", rvwPrncPstNm="
				+ rvwPrncPstNm + ", userMbphNo=" + userMbphNo + ", rvwPstPn=" + rvwPstPn + ", wCmplte=" + wCmplte
				+ ", htmlStr=" + htmlStr + ", isWcmplteYn=" + isWcmplteYn + ", histRvwStpSpcd=" + histRvwStpSpcd
				+ ", stpSts=" + stpSts + ", userId=" + userId + "]";
	}


}
