package kcure.portal.dac.clc.inf.service.impl;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ClcInfRspVo  implements Serializable{

	/**
	*
	*/
	private static final long serialVersionUID = -3978022285160514412L;

	public String dataAplcNo; //	데이터신청번호
	public String rsrpId; //	연구자id
	public String rsrpNm; //	연구자명
	public String rsrpPstNm; //	연구자직위명
	public String rsrpSpcd; //	연구자구분코드
	public String rsrpSpcdNm; //	연구자구분코드명
	public String rsrPrtSdt; //	연구참여시작일자
	public String rsrPrtEdt; //	연구참여종료일자
	public String pinfCnuAgrYn; //	개인정보수집이용동의여부
	public String scrAgrYn; //	보안동의여부
	public String frstRegpId; //	최초등록자id
	public String frstRgstDt; //	최초등록일시
	public String lastModpId; //	최종수정자id
	public String lastModfDt; //	최종수정일시
	public String rsrAplpYn; //연구신청자여부
	public String prtiId; //참여기관  ID
	public String prtiNm; //참여기관명
	public String userMbphNo1; // 사용자 전화번호
	public String userMbphNo2; // 사용자 전화번호
	public String userMbphNo3; // 사용자 전화번호

	public String email; // 사용자 email
	public String userId; // 로그인 야이디
	public String actionType; // insert,update
	public String DeleteSpcdId ; // 삭제할 정보
	public String[] deleteSpcdIdList ; // 삭제

	public String allListYn;

	public int attfseq;

	public String histDataArray;

	public String[] histDataArrays;
	
	public String gubun;


	public String file07AttfStrNm;
	public String file07AttfPthNm;
	public String file07AttfNm;

	public String file08AttfStrNm;
	public String file08AttfPthNm;
	public String file08AttfNm;

	public MultipartFile file07 = null; //개인정보수집이용동의서
	public MultipartFile file08 = null; //보안각서

	public String dataTpcd; //데이터신청 구분코드 (임상,공공,결합)
	public String datpStatSpcd; //데이터신청상태구분코드
	public String cdClcd;
	public String dtapStpSpcd;
	public String detlCd;
	public String vrtUseYn;
	
	public String dtsLclsCd;

	/**
	* 신청단계구분코드
	* 그룹코드 : APLC_STP_SPCD
	  그룹코드명 : 신청단계구분코드
		예시)
		01.신청개요
		02.연구정보
		03.연구자정보
		04.자료요청
		05.요청정보보기
		06.제출완료
	*/
	public String aplcStpSpcd;

	public String saveGb;

	
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getFile07AttfStrNm() {
		return file07AttfStrNm;
	}
	public void setFile07AttfStrNm(String file07AttfStrNm) {
		this.file07AttfStrNm = file07AttfStrNm;
	}
	public String getFile07AttfPthNm() {
		return file07AttfPthNm;
	}
	public void setFile07AttfPthNm(String file07AttfPthNm) {
		this.file07AttfPthNm = file07AttfPthNm;
	}
	public String getFile07AttfNm() {
		return file07AttfNm;
	}
	public void setFile07AttfNm(String file07AttfNm) {
		this.file07AttfNm = file07AttfNm;
	}
	public String getFile08AttfStrNm() {
		return file08AttfStrNm;
	}
	public void setFile08AttfStrNm(String file08AttfStrNm) {
		this.file08AttfStrNm = file08AttfStrNm;
	}
	public String getFile08AttfPthNm() {
		return file08AttfPthNm;
	}
	public void setFile08AttfPthNm(String file08AttfPthNm) {
		this.file08AttfPthNm = file08AttfPthNm;
	}
	public String getFile08AttfNm() {
		return file08AttfNm;
	}
	public void setFile08AttfNm(String file08AttfNm) {
		this.file08AttfNm = file08AttfNm;
	}
	public MultipartFile getFile08() {
		return file08;
	}
	public void setFile08(MultipartFile file08) {
		this.file08 = file08;
	}
	public MultipartFile getFile07() {
		return file07;
	}
	public void setFile07(MultipartFile file07) {
		this.file07 = file07;
	}
	public String[] getDeleteSpcdIdList() {
		return deleteSpcdIdList;
	}
	public void setDeleteSpcdIdList(String[] deleteSpcdIdList) {
		this.deleteSpcdIdList = deleteSpcdIdList;
	}
	public String getDeleteSpcdId() {
		return DeleteSpcdId;
	}
	public void setDeleteSpcdId(String DeleteSpcdId) {
		//리스트 형으로 변경
		if (DeleteSpcdId.isEmpty()) {
			setDeleteSpcdIdList(new String[] {});
		} else {
			setDeleteSpcdIdList(DeleteSpcdId.split(","));
		}
		this.DeleteSpcdId = DeleteSpcdId;
	}
	public String getActionType() {
		return actionType;
	}
	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	private List<ClcInfRspVo> clcInfRspList;



	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public List<ClcInfRspVo> getClcInfRspList() {
		return clcInfRspList;
	}
	public void setClcInfRspList(List<ClcInfRspVo> clcInfRspList) {
		this.clcInfRspList = clcInfRspList;
	}
	public String getUserMbphNo1() {
		return userMbphNo1;
	}
	public void setUserMbphNo1(String userMbphNo1) {
		this.userMbphNo1 = userMbphNo1;
	}
	public String getUserMbphNo2() {
		return userMbphNo2;
	}
	public void setUserMbphNo2(String userMbphNo2) {
		this.userMbphNo2 = userMbphNo2;
	}
	public String getUserMbphNo3() {
		return userMbphNo3;
	}
	public void setUserMbphNo3(String userMbphNo3) {
		this.userMbphNo3 = userMbphNo3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPrtiId() {
		return prtiId;
	}
	public void setPrtiId(String prtiId) {
		this.prtiId = prtiId;
	}
	public String getPrtiNm() {
		return prtiNm;
	}
	public void setPrtiNm(String prtiNm) {
		this.prtiNm = prtiNm;
	}
	public String getRsrAplpYn() {
		return rsrAplpYn;
	}
	public void setRsrAplpYn(String rsrAplpYn) {
		this.rsrAplpYn = rsrAplpYn;
	}
	public String getRsrpNm() {
		return rsrpNm;
	}
	public void setRsrpNm(String rsrpNm) {
		this.rsrpNm = rsrpNm;
	}
	public String getDataAplcNo() {
		return dataAplcNo;
	}
	public void setDataAplcNo(String dataAplcNo) {
		this.dataAplcNo = dataAplcNo;
	}
	public String getRsrpId() {
		return rsrpId;
	}
	public void setRsrpId(String rsrpId) {
		this.rsrpId = rsrpId;
	}
	public String getRsrpPstNm() {
		return rsrpPstNm;
	}
	public void setRsrpPstNm(String rsrpPstNm) {
		this.rsrpPstNm = rsrpPstNm;
	}
	public String getRsrpSpcd() {
		return rsrpSpcd;
	}
	public void setRsrpSpcd(String rsrpSpcd) {
		this.rsrpSpcd = rsrpSpcd;
	}
	public String getRsrpSpcdNm() {
		return rsrpSpcdNm;
	}
	public void setRsrpSpcdNm(String rsrpSpcdNm) {
		this.rsrpSpcdNm = rsrpSpcdNm;
	}
	public String getRsrPrtSdt() {
		return rsrPrtSdt;
	}
	public void setRsrPrtSdt(String rsrPrtSdt) {
		this.rsrPrtSdt = rsrPrtSdt;
	}
	public String getRsrPrtEdt() {
		return rsrPrtEdt;
	}
	public void setRsrPrtEdt(String rsrPrtEdt) {
		this.rsrPrtEdt = rsrPrtEdt;
	}
	public String getPinfCnuAgrYn() {
		return pinfCnuAgrYn;
	}
	public void setPinfCnuAgrYn(String pinfCnuAgrYn) {
		this.pinfCnuAgrYn = pinfCnuAgrYn;
	}
	public String getScrAgrYn() {
		return scrAgrYn;
	}
	public void setScrAgrYn(String scrAgrYn) {
		this.scrAgrYn = scrAgrYn;
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

	public String getAllListYn() {
		return allListYn;
	}
	public void setAllListYn(String allListYn) {
		this.allListYn = allListYn;
	}
	public int getAttfseq() {
		return attfseq;
	}
	public void setAttfseq(int attfseq) {
		this.attfseq = attfseq;
	}
	public String getHistDataArray() {
		return histDataArray;
	}
	public void setHistDataArray(String histDataArray) {
		this.histDataArray = histDataArray;
	}
	public String[] getHistDataArrays() {
		return histDataArrays;
	}
	public void setHistDataArrays(String[] histDataArrays) {
		this.histDataArrays = histDataArrays;
	}
	public String getAplcStpSpcd() {
		return aplcStpSpcd;
	}
	public void setAplcStpSpcd(String aplcStpSpcd) {
		this.aplcStpSpcd = aplcStpSpcd;
	}
	public String getDataTpcd() {
		return dataTpcd;
	}
	public void setDataTpcd(String dataTpcd) {
		this.dataTpcd = dataTpcd;
	}
	public String getDatpStatSpcd() {
		return datpStatSpcd;
	}
	public void setDatpStatSpcd(String datpStatSpcd) {
		this.datpStatSpcd = datpStatSpcd;
	}
	public String getCdClcd() {
		return cdClcd;
	}
	public void setCdClcd(String cdClcd) {
		this.cdClcd = cdClcd;
	}
	public String getDtapStpSpcd() {
		return dtapStpSpcd;
	}
	public void setDtapStpSpcd(String dtapStpSpcd) {
		this.dtapStpSpcd = dtapStpSpcd;
	}
	public String getDetlCd() {
		return detlCd;
	}
	public void setDetlCd(String detlCd) {
		this.detlCd = detlCd;
	}

	public String getVrtUseYn() {
		return vrtUseYn;
	}
	public void setVrtUseYn(String vrtUseYn) {
		this.vrtUseYn = vrtUseYn;
	}

	public String getSaveGb() {
		return saveGb;
	}
	public void setSaveGb(String saveGb) {
		this.saveGb = saveGb;
	}
	public String getDtsLclsCd() {
		return dtsLclsCd;
	}
	public void setDtsLclsCd(String dtsLclsCd) {
		this.dtsLclsCd = dtsLclsCd;
	}
	
	
	
	@Override
	public String toString() {
		return "ClcInfRspVo [dataAplcNo=" + dataAplcNo + ", rsrpId=" + rsrpId + ", rsrpNm=" + rsrpNm + ", rsrpPstNm="
				+ rsrpPstNm + ", rsrpSpcd=" + rsrpSpcd + ", rsrpSpcdNm=" + rsrpSpcdNm + ", rsrPrtSdt=" + rsrPrtSdt
				+ ", rsrPrtEdt=" + rsrPrtEdt + ", pinfCnuAgrYn=" + pinfCnuAgrYn + ", scrAgrYn=" + scrAgrYn
				+ ", frstRegpId=" + frstRegpId + ", frstRgstDt=" + frstRgstDt + ", lastModpId=" + lastModpId
				+ ", lastModfDt=" + lastModfDt + ", rsrAplpYn=" + rsrAplpYn + ", prtiId=" + prtiId + ", prtiNm="
				+ prtiNm + ", userMbphNo1=" + userMbphNo1 + ", userMbphNo2=" + userMbphNo2 + ", userMbphNo3="
				+ userMbphNo3 + ", email=" + email + ", userId=" + userId + ", actionType=" + actionType
				+ ", DeleteSpcdId=" + DeleteSpcdId + ", deleteSpcdIdList=" + Arrays.toString(deleteSpcdIdList)
				+ ", allListYn=" + allListYn + ", attfseq=" + attfseq + ", histDataArray=" + histDataArray
				+ ", histDataArrays=" + Arrays.toString(histDataArrays) + ", file07AttfStrNm=" + file07AttfStrNm
				+ ", file07AttfPthNm=" + file07AttfPthNm + ", file07AttfNm=" + file07AttfNm + ", file08AttfStrNm="
				+ file08AttfStrNm + ", file08AttfPthNm=" + file08AttfPthNm + ", file08AttfNm=" + file08AttfNm
				+ ", file07=" + file07 + ", file08=" + file08 + ", dataTpcd=" + dataTpcd + ", datpStatSpcd="
				+ datpStatSpcd + ", cdClcd=" + cdClcd + ", dtapStpSpcd=" + dtapStpSpcd + ", detlCd=" + detlCd
				+ ", vrtUseYn=" + vrtUseYn + ", dtsLclsCd=" + dtsLclsCd + ", aplcStpSpcd=" + aplcStpSpcd + ", saveGb="
				+ saveGb + ", clcInfRspList=" + clcInfRspList + "]";
	}
	
	
	
}
