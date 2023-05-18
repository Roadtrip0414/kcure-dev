package kcure.portal.cmn.iim.service.impl;

public class DatasetVO {
	
	public String id;
	public String title;
	public String desc;
	public String keywords;
	public String providing_scope;
	public int view_cnt;
	public String category_cd;
	public String category_nm;
	public String new_category_cd;
	public String new_category_nm;
	public String list_type;
	public String updated_at;
	public String created_at;
	public String is_deleted;
	public String collection_method;
	public String ownership_grounds;
	public int download_cnt;
	public String page_url;
	public String org_cd;
	public String org_nm;
	public String is_requested_data;
	public String register_status;
	public String ext;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getProviding_scope() {
		return providing_scope;
	}
	public void setProviding_scope(String providing_scope) {
		this.providing_scope = providing_scope;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getCategory_cd() {
		return category_cd;
	}
	public void setCategory_cd(String category_cd) {
		this.category_cd = category_cd;
	}
	public String getCategory_nm() {
		return category_nm;
	}
	public void setCategory_nm(String category_nm) {
		this.category_nm = category_nm;
	}
	public String getNew_category_cd() {
		return new_category_cd;
	}
	public void setNew_category_cd(String new_category_cd) {
		this.new_category_cd = new_category_cd;
	}
	public String getNew_category_nm() {
		return new_category_nm;
	}
	public void setNew_category_nm(String new_category_nm) {
		this.new_category_nm = new_category_nm;
	}
	public String getList_type() {
		return list_type;
	}
	public void setList_type(String list_type) {
		this.list_type = list_type;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}
	public String getCollection_method() {
		return collection_method;
	}
	public void setCollection_method(String collection_method) {
		this.collection_method = collection_method;
	}
	public String getOwnership_grounds() {
		return ownership_grounds;
	}
	public void setOwnership_grounds(String ownership_grounds) {
		this.ownership_grounds = ownership_grounds;
	}
	public int getDownload_cnt() {
		return download_cnt;
	}
	public void setDownload_cnt(int download_cnt) {
		this.download_cnt = download_cnt;
	}
	public String getPage_url() {
		return page_url;
	}
	public void setPage_url(String page_url) {
		this.page_url = page_url;
	}
	public String getOrg_cd() {
		return org_cd;
	}
	public void setOrg_cd(String org_cd) {
		this.org_cd = org_cd;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getIs_requested_data() {
		return is_requested_data;
	}
	public void setIs_requested_data(String is_requested_data) {
		this.is_requested_data = is_requested_data;
	}
	public String getRegister_status() {
		return register_status;
	}
	public void setRegister_status(String register_status) {
		this.register_status = register_status;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	
	
	@Override
	public String toString() {
		return "DatasetVO [id=" + id + ", title=" + title + ", desc=" + desc + ", keywords=" + keywords
				+ ", providing_scope=" + providing_scope + ", view_cnt=" + view_cnt + ", category_cd=" + category_cd
				+ ", category_nm=" + category_nm + ", new_category_cd=" + new_category_cd + ", new_category_nm="
				+ new_category_nm + ", list_type=" + list_type + ", updated_at=" + updated_at + ", created_at="
				+ created_at + ", is_deleted=" + is_deleted + ", collection_method=" + collection_method
				+ ", ownership_grounds=" + ownership_grounds + ", download_cnt=" + download_cnt + ", page_url="
				+ page_url + ", org_cd=" + org_cd + ", org_nm=" + org_nm + ", is_requested_data=" + is_requested_data
				+ ", register_status=" + register_status + ", ext=" + ext + "]";
	}

}
