package kcure.portal.cmn.service.impl;

import java.io.Serializable;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.service.impl
  * @FileName : CommonFileVO.java
  * @since : 2023. 3. 8.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	공통 파일 VO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@SuppressWarnings("serial")
public class CommonFileVO implements Serializable {

	public String atchFileId;
	public String creatDt;
	public String useAt;
	public int fileSn = 0;
	public String fileStreCours;
	public String streFileNm;
	public String orignlFileNm;
	public String fileExtsn;
	public String fileCn;
	public long fileSize = 0;
	public String tmbnlYn = "N";

	//log 저장용
	public String ip = "";
	public String menuUrl = "";
	public String userId = "";

	/**
	 * location pathname
	 */
	public String baseUrl = "";


	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getCreatDt() {
		return creatDt;
	}
	public void setCreatDt(String creatDt) {
		this.creatDt = creatDt;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public int getFileSn() {
		return fileSn;
	}
	public void setFileSn(int fileSn) {
		this.fileSn = fileSn;
	}
	public String getFileStreCours() {
		return fileStreCours;
	}
	public void setFileStreCours(String fileStreCours) {
		this.fileStreCours = fileStreCours;
	}
	public String getStreFileNm() {
		return streFileNm;
	}
	public void setStreFileNm(String streFileNm) {
		this.streFileNm = streFileNm;
	}
	public String getOrignlFileNm() {
		return orignlFileNm;
	}
	public void setOrignlFileNm(String orignlFileNm) {
		this.orignlFileNm = orignlFileNm;
	}
	public String getFileExtsn() {
		return fileExtsn;
	}
	public void setFileExtsn(String fileExtsn) {
		this.fileExtsn = fileExtsn;
	}
	public String getFileCn() {
		return fileCn;
	}
	public void setFileCn(String fileCn) {
		this.fileCn = fileCn;
	}

	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getTmbnlYn() {
		return tmbnlYn;
	}
	public void setTmbnlYn(String tmbnlYn) {
		this.tmbnlYn = tmbnlYn;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBaseUrl() {
		return baseUrl;
	}
	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}

}
