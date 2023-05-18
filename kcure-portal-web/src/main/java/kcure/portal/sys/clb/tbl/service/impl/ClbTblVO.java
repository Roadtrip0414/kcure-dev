package kcure.portal.sys.clb.tbl.service.impl;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.clb.tbl.service.impl
 * @FileName : ClbTblVO.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	표준테이블관리 처리를 위한 VO 클래스르를 정의한다
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.02.01   kyh           최초생성
 *  </pre>
 */

public class ClbTblVO extends ComDefaultVO {

	private static final long serialVersionUID = 1L;
	
	/* KCURE_COM_TBL_DFND */
	private String tblEnm;
	private String tblKnm;
	private int tblOrd;
	private String crcnNm;
	private String lclsNm;
	private String mclsNm;
	private String ldngDtrnCont;
	private String collBldtColKnm;
	private String collBldtColEnm;
	private String dtsLclsCd;
	private String dtsLclsNm;

	/* KCURE_COM_COL_DFND */
	private String colEnm;
	private String colKnm;
	private int colOrd;
	private String dataTpCont;
	private String pkOrd;
	private String domnNm;
	private String colExplCont;
	private String colVlCont;
	
	/* CMM */
	private String frstRegpId;
	private String frstRgstDt;
	
	/* SEARCH */
	private String srchCrcnNm;
	private String srchDtsLclsCd;
	private String oldTblEnm;	//PK 저장용
	private String oldColEnm;	//PK 저장용
	
	/* Tree Val */
	private String treeOrdId;
	private String treeChildId;
	private String treeVwNm;
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
	public int getTblOrd() {
		return tblOrd;
	}
	public void setTblOrd(int tblOrd) {
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
	public String getLdngDtrnCont() {
		return ldngDtrnCont;
	}
	public void setLdngDtrnCont(String ldngDtrnCont) {
		this.ldngDtrnCont = ldngDtrnCont;
	}
	public String getCollBldtColKnm() {
		return collBldtColKnm;
	}
	public void setCollBldtColKnm(String collBldtColKnm) {
		this.collBldtColKnm = collBldtColKnm;
	}
	public String getCollBldtColEnm() {
		return collBldtColEnm;
	}
	public void setCollBldtColEnm(String collBldtColEnm) {
		this.collBldtColEnm = collBldtColEnm;
	}
	public String getColEnm() {
		return colEnm;
	}
	public void setColEnm(String colEnm) {
		this.colEnm = colEnm;
	}
	public String getColKnm() {
		return colKnm;
	}
	public void setColKnm(String colKnm) {
		this.colKnm = colKnm;
	}
	public int getColOrd() {
		return colOrd;
	}
	public void setColOrd(int colOrd) {
		this.colOrd = colOrd;
	}
	public String getDataTpCont() {
		return dataTpCont;
	}
	public void setDataTpCont(String dataTpCont) {
		this.dataTpCont = dataTpCont;
	}
	public String getPkOrd() {
		return pkOrd;
	}
	public void setPkOrd(String pkOrd) {
		this.pkOrd = pkOrd;
	}
	public String getDomnNm() {
		return domnNm;
	}
	public void setDomnNm(String domnNm) {
		this.domnNm = domnNm;
	}
	public String getColExplCont() {
		return colExplCont;
	}
	public void setColExplCont(String colExplCont) {
		this.colExplCont = colExplCont;
	}
	public String getColVlCont() {
		return colVlCont;
	}
	public void setColVlCont(String colVlCont) {
		this.colVlCont = colVlCont;
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
	public String getSrchCrcnNm() {
		return srchCrcnNm;
	}
	public void setSrchCrcnNm(String srchCrcnNm) {
		this.srchCrcnNm = srchCrcnNm;
	}
	public String getOldTblEnm() {
		return oldTblEnm;
	}
	public void setOldTblEnm(String oldTblEnm) {
		this.oldTblEnm = oldTblEnm;
	}
	public String getOldColEnm() {
		return oldColEnm;
	}
	public void setOldColEnm(String oldColEnm) {
		this.oldColEnm = oldColEnm;
	}
	public String getTreeOrdId() {
		return treeOrdId;
	}
	public void setTreeOrdId(String treeOrdId) {
		this.treeOrdId = treeOrdId;
	}
	public String getTreeChildId() {
		return treeChildId;
	}
	public void setTreeChildId(String treeChildId) {
		this.treeChildId = treeChildId;
	}
	public String getTreeVwNm() {
		return treeVwNm;
	}
	public void setTreeVwNm(String treeVwNm) {
		this.treeVwNm = treeVwNm;
	}
	public String getSrchDtsLclsCd() {
		return srchDtsLclsCd;
	}
	public void setSrchDtsLclsCd(String srchDtsLclsCd) {
		this.srchDtsLclsCd = srchDtsLclsCd;
	}
	public String getDtsLclsCd() {
		return dtsLclsCd;
	}
	public void setDtsLclsCd(String dtsLclsCd) {
		this.dtsLclsCd = dtsLclsCd;
	}
	public String getDtsLclsNm() {
		return dtsLclsNm;
	}
	public void setDtsLclsNm(String dtsLclsNm) {
		this.dtsLclsNm = dtsLclsNm;
	}
}
