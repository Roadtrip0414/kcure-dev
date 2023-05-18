package kcure.portal.sys.cdm.mng.service.Impl;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.cdm.mng.service.Impl
  * @FileName : CdmMngGrpVO.java
  * @since : 2023. 3. 8.
  * @version 1.0
  * @author : jyk
  * @프로그램 설명 :	공통 코드 VO
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
public class CdmMngGrpVO extends ComDefaultVO{

	/* 코드목록ID */
	private String grpCd ;

	/* 코드목록명 */
	private String grpCdNm;

	/* 설명 */
	private String grpCdExplCont ;

	/* 정렬순서 */
	private int grpCdOputOrd ;

	/* 코드사용여부 */
	private String grpCdUseYn ;

   //상위코드목록ID
	private String hghrGrpCd ;

	/* 처음생성아이디 */
	private	String frstRegpId ;

	/* 수정날짜 */
	private	String frstRgstDt ;

	/* 마지막수정아이디 */
	private	String lastModpId ;

	/* 마지막수정날짜 */
	private String lastModfDt ;

	private String dtsComCdYn = "N";

	public String getGrpCd() {
		return grpCd;
	}

	public void setGrpCd(String grpCd) {
		this.grpCd = grpCd;
	}

	public String getGrpCdNm() {
		return grpCdNm;
	}

	public void setGrpCdNm(String grpCdNm) {
		this.grpCdNm = grpCdNm;
	}

	public String getGrpCdExplCont() {
		return grpCdExplCont;
	}

	public void setGrpCdExplCont(String grpCdExplCont) {
		this.grpCdExplCont = grpCdExplCont;
	}

	public int getGrpCdOputOrd() {
		return grpCdOputOrd;
	}

	public void setGrpCdOputOrd(int grpCdOputOrd) {
		this.grpCdOputOrd = grpCdOputOrd;
	}

	public String getGrpCdUseYn() {
		return grpCdUseYn;
	}

	public void setGrpCdUseYn(String grpCdUseYn) {
		this.grpCdUseYn = grpCdUseYn;
	}

	public String getHghrGrpCd() {
		return hghrGrpCd;
	}

	public void setHghrGrpCd(String hghrGrpCd) {
		this.hghrGrpCd = hghrGrpCd;
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

	public String getDtsComCdYn() {
		return dtsComCdYn;
	}

	public void setDtsComCdYn(String dtsComCdYn) {
		this.dtsComCdYn = dtsComCdYn;
	}

	/* getter setter */
}
