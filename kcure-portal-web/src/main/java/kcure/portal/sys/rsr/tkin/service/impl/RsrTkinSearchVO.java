package kcure.portal.sys.rsr.tkin.service.impl;

import egovframework.com.cmm.ComDefaultVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.rsr.tkin.service.impl
 * @FileName : RsrTkinSearchVO.java
 * @since : 2023.05.08
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	데이터반입관리 검색용 VO
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
public class RsrTkinSearchVO extends ComDefaultVO {
	private static final long serialVersionUID = -2539271416155600773L;

	private String userNm;
	private String tkinAplcDtFrom;
	private String tkinAplcDtTo;
	private String tkinDataNmCont;
	private String tkinDataProgStcd;
	private String rsrAsmtNo;
	private String tkinDtapNo;
	private String tkinDtapYmd;
	
	
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getTkinAplcDtFrom() {
		return tkinAplcDtFrom;
	}
	public void setTkinAplcDtFrom(String tkinAplcDtFrom) {
		this.tkinAplcDtFrom = tkinAplcDtFrom;
	}
	public String getTkinAplcDtTo() {
		return tkinAplcDtTo;
	}
	public void setTkinAplcDtTo(String tkinAplcDtTo) {
		this.tkinAplcDtTo = tkinAplcDtTo;
	}
	public String getTkinDataNmCont() {
		return tkinDataNmCont;
	}
	public void setTkinDataNmCont(String tkinDataNmCont) {
		this.tkinDataNmCont = tkinDataNmCont;
	}
	public String getTkinDataProgStcd() {
		return tkinDataProgStcd;
	}
	public void setTkinDataProgStcd(String tkinDataProgStcd) {
		this.tkinDataProgStcd = tkinDataProgStcd;
	}
	public String getRsrAsmtNo() {
		return rsrAsmtNo;
	}
	public void setRsrAsmtNo(String rsrAsmtNo) {
		this.rsrAsmtNo = rsrAsmtNo;
	}
	public String getTkinDtapNo() {
		return tkinDtapNo;
	}
	public void setTkinDtapNo(String tkinDtapNo) {
		this.tkinDtapNo = tkinDtapNo;
	}
	public String getTkinDtapYmd() {
		return tkinDtapYmd;
	}
	public void setTkinDtapYmd(String tkinDtapYmd) {
		this.tkinDtapYmd = tkinDtapYmd;
	}

	@Override
	public String toString() {
		return "RsrTkinSearchVO [userNm=" + userNm + ", tkinAplcDtFrom=" + tkinAplcDtFrom + ", tkinAplcDtTo="
				+ tkinAplcDtTo + ", tkinDataNmCont=" + tkinDataNmCont + ", tkinDataProgStcd=" + tkinDataProgStcd
				+ ", rsrAsmtNo=" + rsrAsmtNo + ", tkinDtapNo=" + tkinDtapNo + ", tkinDtapYmd=" + tkinDtapYmd + "]";
	}

}
