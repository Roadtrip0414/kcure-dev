package kcure.portal.sys.rsr.ext.web.service.impl;

import egovframework.com.cmm.ComDefaultVO;

public class RsrDataExtSearchVO extends ComDefaultVO {

	private static final long serialVersionUID = -2024291588589876024L;
	
	// 리스트 화면 
	private String extdAplcRsnCont; // 신청사유
	private String extdStcd; // 구분
	private String extdProgStcd; // 진행상태
	private String dttoAplcDtFrom; // 신청일 시작
	private String dttoAplcDtTo; // 신정일 종료
	
	// 상세 화면
	private String rsrAsmtNo; // 연구과제번호
	private String extdAplcNo; // 연장신청번호
	private String dataAplcNo; // 데이터신청번호
	
	public String getExtdAplcRsnCont() {
		return extdAplcRsnCont;
	}
	public void setExtdAplcRsnCont(String extdAplcRsnCont) {
		this.extdAplcRsnCont = extdAplcRsnCont;
	}
	public String getExtdStcd() {
		return extdStcd;
	}
	public void setExtdStcd(String extdStcd) {
		this.extdStcd = extdStcd;
	}
	public String getExtdProgStcd() {
		return extdProgStcd;
	}
	public void setExtdProgStcd(String extdProgStcd) {
		this.extdProgStcd = extdProgStcd;
	}
	public String getDttoAplcDtFrom() {
		return dttoAplcDtFrom;
	}
	public void setDttoAplcDtFrom(String dttoAplcDtFrom) {
		this.dttoAplcDtFrom = dttoAplcDtFrom;
	}
	public String getDttoAplcDtTo() {
		return dttoAplcDtTo;
	}
	public void setDttoAplcDtTo(String dttoAplcDtTo) {
		this.dttoAplcDtTo = dttoAplcDtTo;
	}
	
	public String getRsrAsmtNo() {
		return rsrAsmtNo;
	}
	public void setRsrAsmtNo(String rsrAsmtNo) {
		this.rsrAsmtNo = rsrAsmtNo;
	}
	public String getExtdAplcNo() {
		return extdAplcNo;
	}
	public void setExtdAplcNo(String extdAplcNo) {
		this.extdAplcNo = extdAplcNo;
	}
	public String getDataAplcNo() {
		return dataAplcNo;
	}
	public void setDataAplcNo(String dataAplcNo) {
		this.dataAplcNo = dataAplcNo;
	}

	
}
