package kcure.portal.sys.bbs.dur.service.impl;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.dur.service.impl
  * @FileName : DataUtlcVO.java
  * @since : 2023. 2. 10.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	데이터 활용사례 VO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class DataUtlcVO extends ComDefaultVO {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private int utlcRgstSeq = 0;
	private String rsrProgYr = "";
	private String rsrSpcd = "";
	private String rsrMtcd = "";
	private String rsrSbjNm = "";
	private String rsrSbjCont  = "";
	private String rsdAttfId = "";
	private String rsdUnldLmtYn = "";
	private int rsdUnldLmtYcnt = 0;
	private int rsrInstSeq = 0;
	private String rsrInstId = "";
	private String rsrInstNm = "";
	private String frstRegpId = "";
	private String frstRgstDt = "";
	private String lastModpId = "";
	private String lastModfDt = "";
	private String rsrInstNmEtc = "";
	private String viewYn = "";

	public int getUtlcRgstSeq() {
		return utlcRgstSeq;
	}
	public void setUtlcRgstSeq(int utlcRgstSeq) {
		this.utlcRgstSeq = utlcRgstSeq;
	}
	public String getRsrProgYr() {
		return rsrProgYr;
	}
	public void setRsrProgYr(String rsrProgYr) {
		this.rsrProgYr = rsrProgYr;
	}
	public String getRsrSpcd() {
		return rsrSpcd;
	}
	public void setRsrSpcd(String rsrSpcd) {
		this.rsrSpcd = rsrSpcd;
	}
	public String getRsrMtcd() {
		return rsrMtcd;
	}
	public void setRsrMtcd(String rsrMtcd) {
		this.rsrMtcd = rsrMtcd;
	}
	public String getRsrSbjNm() {
		return rsrSbjNm;
	}
	public void setRsrSbjNm(String rsrSbjNm) {
		this.rsrSbjNm = rsrSbjNm;
	}
	public String getRsrSbjCont() {
		return rsrSbjCont;
	}
	public void setRsrSbjCont(String rsrSbjCont) {
		this.rsrSbjCont = rsrSbjCont;
	}
	public String getRsdAttfId() {
		return rsdAttfId;
	}
	public void setRsdAttfId(String rsdAttfId) {
		this.rsdAttfId = rsdAttfId;
	}
	public String getRsdUnldLmtYn() {
		return rsdUnldLmtYn;
	}
	public void setRsdUnldLmtYn(String rsdUnldLmtYn) {
		this.rsdUnldLmtYn = rsdUnldLmtYn;
	}
	public int getRsdUnldLmtYcnt() {
		return rsdUnldLmtYcnt;
	}
	public void setRsdUnldLmtYcnt(int rsdUnldLmtYcnt) {
		this.rsdUnldLmtYcnt = rsdUnldLmtYcnt;
	}
	public int getRsrInstSeq() {
		return rsrInstSeq;
	}
	public void setRsrInstSeq(int rsrInstSeq) {
		this.rsrInstSeq = rsrInstSeq;
	}
	public String getRsrInstId() {
		return rsrInstId;
	}
	public void setRsrInstId(String rsrInstId) {
		this.rsrInstId = rsrInstId;
	}
	public String getRsrInstNm() {
		return rsrInstNm;
	}
	public void setRsrInstNm(String rsrInstNm) {
		this.rsrInstNm = rsrInstNm;
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
	public String getRsrInstNmEtc() {
		return rsrInstNmEtc;
	}
	public void setRsrInstNmEtc(String rsrInstNmEtc) {
		this.rsrInstNmEtc = rsrInstNmEtc;
	}
	public String getViewYn() {
		return viewYn;
	}
	public void setViewYn(String viewYn) {
		this.viewYn = viewYn;
	}
}
