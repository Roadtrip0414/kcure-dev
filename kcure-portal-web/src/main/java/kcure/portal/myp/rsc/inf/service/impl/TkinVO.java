package kcure.portal.myp.rsc.inf.service.impl;

public class TkinVO {
	
	private static final long serialVersionUID = -2539271416155600773L;
	
	private String rsrAsmtNo;
	private String tkinDtapNo;
	private String dataAplcNo;
	private int attfSeq;
	private String tkinDataProgStcd;
	private String userId;
	private String tkinDtapYmd;
	private String tkinDataNmCont;
	private String tkinDataPrpsCont;
	
	
	
	
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
	public String getDataAplcNo() {
		return dataAplcNo;
	}
	public void setDataAplcNo(String dataAplcNo) {
		this.dataAplcNo = dataAplcNo;
	}
	public int getAttfSeq() {
		return attfSeq;
	}
	public void setAttfSeq(int attfSeq) {
		this.attfSeq = attfSeq;
	}
	public String getTkinDataProgStcd() {
		return tkinDataProgStcd;
	}
	public void setTkinDataProgStcd(String tkinDataProgStcd) {
		this.tkinDataProgStcd = tkinDataProgStcd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTkinDtapYmd() {
		return tkinDtapYmd;
	}
	public void setTkinDtapYmd(String tkinDtapYmd) {
		this.tkinDtapYmd = tkinDtapYmd;
	}
	public String getTkinDataNmCont() {
		return tkinDataNmCont;
	}
	public void setTkinDataNmCont(String tkinDataNmCont) {
		this.tkinDataNmCont = tkinDataNmCont;
	}
	public String getTkinDataPrpsCont() {
		return tkinDataPrpsCont;
	}
	public void setTkinDataPrpsCont(String tkinDataPrpsCont) {
		this.tkinDataPrpsCont = tkinDataPrpsCont;
	}
	
	
	@Override
	public String toString() {
		return "TkinVO [rsrAsmtNo=" + rsrAsmtNo + ", tkinDtapNo=" + tkinDtapNo + ", dataAplcNo=" + dataAplcNo
				+ ", attfSeq=" + attfSeq + ", tkinDataProgStcd=" + tkinDataProgStcd + ", userId=" + userId + "]";
	}

}
