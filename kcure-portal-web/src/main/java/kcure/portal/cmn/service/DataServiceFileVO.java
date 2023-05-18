package kcure.portal.cmn.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class DataServiceFileVO implements Serializable {


    /**
     * 생성일자
     */
    public String creatDt = "";

    /**
     * 파일순번
     */
    public int attfSeq;
    /**
     * 파일저장경로
     */
    public String attfPthNm = "";
    /**
     * 원파일명
     */
    public String attfNm = "";

    /**
     * 구분코드명
     */
    public String attfCdnm = "";

    /**
    * Nas 저장 파일명
    */
    public String attfStrNm = "";

	/**
	 * 아이디
	 * */
    public String userId = "";
    /**
	 * ip
	 * */
    public String ip = "";
    /**
	 * menuUrl
	 * */
    public String menuUrl = "";

    /**
    * 데이터신청번호
    */
    public String dataAplcNo = "";

    /**
    * 첨부파일 구분코드
    * 그룹코드 : ATTF_SPCD
		그룹코드명 : 첨부파일구분코드
		예시)
		01.대이터신청자제출파일
		02.심의자의견제출파일
		03.승인후참여기관제공파일
		04.신청자반입파일
		05.신청자반출파일
    */
    public String attfSpcd = "";

    /**
    * 첨부서류명 구분코드
    * 그룹코드 : ATTD_NM_SPCD
		그룹코드명 : 첨부서류명구분코드
		예시)
		01.신청서
		02.연구요약서
		03.연구요약서(별지)
		04.연구계획서
		05.IRB승인문서
		06.기타(연구원증빙서류)
		07.개인정보수집이용동의서
		08.보안각서
		09.위원보안서약서
		10.회피신청서
		11.심의결과관련문서
		80.승인후참여기관제공파일
		81.신청자반입파일
		82.신청자반출파일
		99.기타
    */
    public String attdNmSpcd = "";


    /**
    * 첨부파일소유자ID
    */
    public String attfOwnrId = "";


    public String attfId = "";


    public String[] attfSpcdList;
    public String[] attdNmSpcdList;
    public String[] attfOwnrIdList;

    //데이터활용신청번호
    public String dtuAplcNo = "";



	public String[] getAttdNmSpcdList() {
		return attdNmSpcdList;
	}

	public void setAttdNmSpcdList(String[] attdNmSpcdList) {
		this.attdNmSpcdList = attdNmSpcdList;
	}

	public String[] getAttfSpcdList() {
		return attfSpcdList;
	}

	public void setAttfSpcdList(String[] attfSpcdList) {
		this.attfSpcdList = attfSpcdList;
	}

	public String[] getAttfOwnrIdList() {
		return attfOwnrIdList;
	}

	public void setAttfOwnrIdList(String[] attfOwnrIdList) {
		this.attfOwnrIdList = attfOwnrIdList;
	}

	public String getAttfStrNm() {
		return attfStrNm;
	}

	public void setAttfStrNm(String attfStrNm) {
		this.attfStrNm = attfStrNm;
	}

	public String getAttfNm() {
		return attfNm;
	}

	public void setAttfNm(String attfNm) {
		this.attfNm = attfNm;
	}

	public String getAttfCdnm() {
		return attfCdnm;
	}

	public void setAttfCdnm(String attfCdnm) {
		this.attfCdnm = attfCdnm;
	}

	public String getDataAplcNo() {
		return dataAplcNo;
	}

	public void setDataAplcNo(String dataAplcNo) {
		this.dataAplcNo = dataAplcNo;
	}

	public String getAttfSpcd() {
		return attfSpcd;
	}

	public void setAttfSpcd(String attfSpcd) {
		this.attfSpcd = attfSpcd;
	}

	public String getAttdNmSpcd() {
		return attdNmSpcd;
	}

	public void setAttdNmSpcd(String attdNmSpcd) {
		this.attdNmSpcd = attdNmSpcd;
	}

	public String getAttfOwnrId() {
		return attfOwnrId;
	}

	public void setAttfOwnrId(String attfOwnrId) {
		this.attfOwnrId = attfOwnrId;
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

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}


    /**
     * creatDt attribute를 리턴한다.
     *
     * @return the creatDt
     */
    public String getCreatDt() {
	return creatDt;
    }

    /**
     * creatDt attribute 값을 설정한다.
     *
     * @param creatDt
     *            the creatDt to set
     */
    public void setCreatDt(String creatDt) {
	this.creatDt = creatDt;
    }
    /**
     * toString 메소드를 대치한다.
     */
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }

	public int getAttfSeq() {
		return attfSeq;
	}

	public void setAttfSeq(int attfSeq) {
		this.attfSeq = attfSeq;
	}

	public String getAttfPthNm() {
		return attfPthNm;
	}

	public void setAttfPthNm(String attfPthNm) {
		this.attfPthNm = attfPthNm;
	}

	public String getDtuAplcNo() {
		return dtuAplcNo;
	}

	public void setDtuAplcNo(String dtuAplcNo) {
		this.dtuAplcNo = dtuAplcNo;
	}

}
