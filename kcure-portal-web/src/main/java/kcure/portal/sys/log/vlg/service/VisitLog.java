package kcure.portal.sys.log.vlg.service;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class VisitLog implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6387538537667453850L;
	
	private String vstRcrdYmd = "";
	private String vstrCnt = "";
	private String loginCnt = "";
	private String acmlVstrCnt = "";
	private String acmlLoginCnt = "";
	private String frstRegpId = "";
	private String frstRgstDt = "";
	private String lastModpId = "";
	private String lastModfDt = "";


	/**
	 * 검색시작일
	 */
	private String searchBgnDe = "";
	/**
	 * 검색조건
	 */
	private String searchCnd = "";
	/**
	 * 검색종료일
	 */
	private String searchEndDe = "";
	/**
	 * 정렬순서(DESC,ASC)
	 */
	private String sortOrdr = "";

	/** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;

    /** rowNo  */
	private int rowNo = 0;
	

	public String getSearchBgnDe() {
		return searchBgnDe;
	}

	public void setSearchBgnDe(String searchBgnDe) {
		this.searchBgnDe = searchBgnDe;
	}

	public String getSearchCnd() {
		return searchCnd;
	}

	public void setSearchCnd(String searchCnd) {
		this.searchCnd = searchCnd;
	}

	public String getSearchEndDe() {
		return searchEndDe;
	}

	public void setSearchEndDe(String searchEndDe) {
		this.searchEndDe = searchEndDe;
	}

	public String getSortOrdr() {
		return sortOrdr;
	}

	public void setSortOrdr(String sortOrdr) {
		this.sortOrdr = sortOrdr;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getRowNo() {
		return rowNo;
	}

	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}


	

	public String getVstRcrdYmd() {
		return vstRcrdYmd;
	}

	public void setVstRcrdYmd(String vstRcrdYmd) {
		this.vstRcrdYmd = vstRcrdYmd;
	}

	public String getVstrCnt() {
		return vstrCnt;
	}

	public void setVstrCnt(String vstrCnt) {
		this.vstrCnt = vstrCnt;
	}

	public String getLoginCnt() {
		return loginCnt;
	}

	public void setLoginCnt(String loginCnt) {
		this.loginCnt = loginCnt;
	}

	public String getAcmlVstrCnt() {
		return acmlVstrCnt;
	}

	public void setAcmlVstrCnt(String acmlVstrCnt) {
		this.acmlVstrCnt = acmlVstrCnt;
	}

	public String getAcmlLoginCnt() {
		return acmlLoginCnt;
	}

	public void setAcmlLoginCnt(String acmlLoginCnt) {
		this.acmlLoginCnt = acmlLoginCnt;
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
	/**
	 *
	 */
	@Override
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}