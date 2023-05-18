package kcure.portal.sys.ctg.col.service.impl;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.service.impl
  * @FileName : DtsColDfndVO.java
  * @since : 2023. 2. 2.
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 : 데이터셋 관리에 대한 Vo 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class CtgColVO extends ComDefaultVO{

	private static final long serialVersionUID = 1L;

	private String prtiId;
	private String dtsId;
	private String colEnm;
	private String colKnm;
	private String colExplCont;
	private String dataTpCont;
	private String dataLnthCont;
	private String cdsYn;
	private String cdId;
	private String useYn;
	private String frstRegpId;
	private String frstRgstDt;
	private String lastModpId;
	private String lastModfDt;

	public String getPrtiId() {
		return prtiId;
	}

	public void setPrtiId(String prtiId) {
		this.prtiId = prtiId;
	}

	public String getDtsId() {
		return dtsId;
	}

	public void setDtsId(String dtsId) {
		this.dtsId = dtsId;
	}

	public String getColEnm() {
		return colEnm;
	}

	public void setColEnm(String colEnm) {
		this.colEnm = colEnm;
	}

	public String getColKnm() {
		return colKnm;
	}

	public void setColKnm(String colKnm) {
		this.colKnm = colKnm;
	}

	public String getColExplCont() {
		return colExplCont;
	}

	public void setColExplCont(String colExplCont) {
		this.colExplCont = colExplCont;
	}

	public String getDataTpCont() {
		return dataTpCont;
	}

	public void setDataTpCont(String dataTpCont) {
		this.dataTpCont = dataTpCont;
	}

	public String getDataLnthCont() {
		return dataLnthCont;
	}

	public void setDataLnthCont(String dataLnthCont) {
		this.dataLnthCont = dataLnthCont;
	}

	public String getCdsYn() {
		return cdsYn;
	}

	public void setCdsYn(String cdsYn) {
		this.cdsYn = cdsYn;
	}

	public String getCdId() {
		return cdId;
	}

	public void setCdId(String cdId) {
		this.cdId = cdId;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
}