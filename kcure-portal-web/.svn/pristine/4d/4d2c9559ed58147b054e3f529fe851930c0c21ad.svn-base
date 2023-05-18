package kcure.portal.cmn.api.cmm;

import java.io.Serializable;

@SuppressWarnings("serial")
public class UploadedFileVo implements Serializable {
	private String name;
	private Long size;
	private String url;
	private String atchFileId;
	private String thumbnailUrl;
	private String deleteUrl;
	private String deleteType = "DELETE";
	
	public UploadedFileVo() {
		super();
	}
	
	public UploadedFileVo(String name, Long size, String url, String atchFileId, String delete_url) {
		super();
		this.name = name;
		this.size = size;
		this.url = url;
		this.atchFileId = atchFileId;
		this.deleteUrl = delete_url;
	}
	
	public String getName() {
		return this.name;
	}
	public long getSize() {
		return this.size;
	}
	public String getUrl() {
		return this.url;
	}
	public String getAtchFileId() {
		return this.atchFileId;
	}
	public String getThumbnailUrl() {
		return this.thumbnailUrl;
	}
	public String getDeleteUrl() {
		return this.deleteUrl;
	}
	public String getDeleteType() {
		return this.deleteType;
	}
}