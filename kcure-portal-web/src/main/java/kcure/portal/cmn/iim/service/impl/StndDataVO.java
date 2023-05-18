package kcure.portal.cmn.iim.service.impl;

public class StndDataVO implements BaseDataVO {

	public String list_title;
	public String desc;
	public String id;
	public String list_id;
	public String title;
	public String keywords;
	public String providing_scope;
	public String category_cd;
	public String category_nm;
	public String new_category_cd;
	public String new_category_nm;
	public String list_type;
	public String updated_dt;
	public String created_at;
	public String collection_method;
	public String ownership_grounds;
	public int req_cnt;
	public String org_cd;
	public String org_nm;
	public String is_requested_data;
	public String next_registration_date;
	public String dept_nm;


	public String getList_title() {
		return list_title;
	}
	public void setList_title(String list_title) {
		this.list_title = list_title;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getList_id() {
		return list_id;
	}
	public void setList_id(String list_id) {
		this.list_id = list_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getUpdated_dt() {
		return updated_dt;
	}
	public void setUpdated_dt(String updated_dt) {
		this.updated_dt = updated_dt;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
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
	public int getReq_cnt() {
		return req_cnt;
	}
	public void setReq_cnt(int req_cnt) {
		this.req_cnt = req_cnt;
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
	public String getNext_registration_date() {
		return next_registration_date;
	}
	public void setNext_registration_date(String next_registration_date) {
		this.next_registration_date = next_registration_date;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}



	@Override
	public String toString() {
		return "StandardDataListVO [list_title=" + list_title + ", desc=" + desc + ", id=" + id + ", list_id=" + list_id
				+ ", title=" + title + ", keywords=" + keywords + ", providing_scope=" + providing_scope
				+ ", category_cd=" + category_cd + ", category_nm=" + category_nm + ", new_category_cd="
				+ new_category_cd + ", new_category_nm=" + new_category_nm + ", list_type=" + list_type
				+ ", updated_dt=" + updated_dt + ", created_at=" + created_at + ", collection_method="
				+ collection_method + ", ownership_grounds=" + ownership_grounds + ", req_cnt=" + req_cnt + ", org_cd="
				+ org_cd + ", org_nm=" + org_nm + ", is_requested_data=" + is_requested_data
				+ ", next_registration_date=" + next_registration_date + ", dept_nm=" + dept_nm + "]";
	}


}
