package kcure.portal.cmn.iim.service.impl;

public class ReqVO {
	
	public int page = 1;
	public int perPage = 3;
	public String orgNm;
	public String listTitle;

	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public String getOrgNm() {
		return orgNm;
	}
	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}
	public String getListTitle() {
		return listTitle;
	}
	public void setListTitle(String listTitle) {
		this.listTitle = listTitle;
	}
	
	
	@Override
	public String toString() {
		return "ReqVO [page=" + page + ", perPage=" + perPage + ", orgNm=" + orgNm + ", listTitle=" + listTitle + "]";
	}

}
