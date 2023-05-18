package kcure.portal.cmn.iim.service.impl;

import java.util.List;

public class ComOpenVO {
	
	public List<FileDataVO> fileDataList;
	public List<OpenDataVO> openDataList;
	public List<StndDataVO> stndDataList;
	public List<DatasetVO> datasetList;
	
	
	public List<FileDataVO> getFileDataList() {
		return fileDataList;
	}
	public void setFileDataList(List<FileDataVO> fileDataList) {
		this.fileDataList = fileDataList;
	}
	public List<OpenDataVO> getOpenDataList() {
		return openDataList;
	}
	public void setOpenDataList(List<OpenDataVO> openDataList) {
		this.openDataList = openDataList;
	}
	public List<StndDataVO> getStndDataList() {
		return stndDataList;
	}
	public void setStndDataList(List<StndDataVO> stndDataList) {
		this.stndDataList = stndDataList;
	}
	public List<DatasetVO> getDatasetList() {
		return datasetList;
	}
	public void setDatasetList(List<DatasetVO> datasetList) {
		this.datasetList = datasetList;
	}

}
