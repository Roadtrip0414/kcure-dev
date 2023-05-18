package kcure.portal.sys.ctg.dts.service.impl;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.service.impl
  * @FileName : DtsDfndVO.java
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
public class CtgDtsVO extends ComDefaultVO{

	private static final long serialVersionUID = 1L;

	private String prtiId;
	private String dtsId;
	private String dtsKnm;
	private String useYn;
	private String frstRegpId;
	private String frstRgstDt;
	private String lastModpId;

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

	public String getDtsKnm() {
	    return dtsKnm;
	}

	public void setDtsKnm(String dtsKnm) {
	    this.dtsKnm = dtsKnm;
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
}