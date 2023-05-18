package kcure.portal.dac.clc.inf.service.impl;

import java.io.Serializable;

public class TblDfndVo  implements Serializable{

	/**
	*
	*/
	private static final long serialVersionUID = -2539271416155600773L;
	
	
	public String tblEnm; //	테이블 영문명
	public String tblKnm; //	데이블 한글명
	public String tblOrd; //테이블 순서
	public String crcnNm; //암종명
	public String lclsNm; //대분류명
	public String mclsNm; //중분류명
	
	
	
	public String getTblEnm() {
		return tblEnm;
	}
	public void setTblEnm(String tblEnm) {
		this.tblEnm = tblEnm;
	}
	public String getTblKnm() {
		return tblKnm;
	}
	public void setTblKnm(String tblKnm) {
		this.tblKnm = tblKnm;
	}
	public String getTblOrd() {
		return tblOrd;
	}
	public void setTblOrd(String tblOrd) {
		this.tblOrd = tblOrd;
	}
	public String getCrcnNm() {
		return crcnNm;
	}
	public void setCrcnNm(String crcnNm) {
		this.crcnNm = crcnNm;
	}
	public String getLclsNm() {
		return lclsNm;
	}
	public void setLclsNm(String lclsNm) {
		this.lclsNm = lclsNm;
	}
	public String getMclsNm() {
		return mclsNm;
	}
	public void setMclsNm(String mclsNm) {
		this.mclsNm = mclsNm;
	}
	
}
