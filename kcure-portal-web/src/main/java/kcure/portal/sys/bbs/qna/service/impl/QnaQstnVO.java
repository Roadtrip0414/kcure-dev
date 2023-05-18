package kcure.portal.sys.bbs.qna.service.impl;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.qna.service.impl
  * @FileName : QnaQstnVO.java
  * @since : 2023. 3. 7.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	QNA 질문 VO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class QnaQstnVO extends ComDefaultVO {

	private static final long serialVersionUID = 1L;

	private String qstnId       = "";
	private String qstnTtlNm    = "";
	private String qstnCont     = "";
	private String qstnActpId   = "";
	private String dsgnAnspId   = "";
	private String qstnOpnYn    = "";
	private String wtrPswd      = "";
	private String qstnClsSpcd  = "";
	private String qstnDlnStcd  = "";
	private String frstRegpId   = "";
	private String frstRgstDt   = "";
	private String lastModpId   = "";
	private String lastModfDt   = "";
	private String ansDt   		= "";
	private String attfId   	= "";
	private String userId   	= "";
	private String prtiId   	= "";
	private String instGnrSpcd  = "";

	public String getQstnId() {
		return qstnId;
	}
	public void setQstnId(String qstnId) {
		this.qstnId = qstnId;
	}
	public String getQstnTtlNm() {
		return qstnTtlNm;
	}
	public void setQstnTtlNm(String qstnTtlNm) {
		this.qstnTtlNm = qstnTtlNm;
	}
	public String getQstnCont() {
		return qstnCont;
	}
	public void setQstnCont(String qstnCont) {
		this.qstnCont = qstnCont;
	}
	public String getQstnActpId() {
		return qstnActpId;
	}
	public void setQstnActpId(String qstnActpId) {
		this.qstnActpId = qstnActpId;
	}
	public String getDsgnAnspId() {
		return dsgnAnspId;
	}
	public void setDsgnAnspId(String dsgnAnspId) {
		this.dsgnAnspId = dsgnAnspId;
	}
	public String getQstnOpnYn() {
		return qstnOpnYn;
	}
	public void setQstnOpnYn(String qstnOpnYn) {
		this.qstnOpnYn = qstnOpnYn;
	}
	public String getWtrPswd() {
		return wtrPswd;
	}
	public void setWtrPswd(String wtrPswd) {
		this.wtrPswd = wtrPswd;
	}
	public String getQstnClsSpcd() {
		return qstnClsSpcd;
	}
	public void setQstnClsSpcd(String qstnClsSpcd) {
		this.qstnClsSpcd = qstnClsSpcd;
	}
	public String getQstnDlnStcd() {
		return qstnDlnStcd;
	}
	public void setQstnDlnStcd(String qstnDlnStcd) {
		this.qstnDlnStcd = qstnDlnStcd;
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
	public String getAnsDt() {
		return ansDt;
	}
	public void setAnsDt(String ansDt) {
		this.ansDt = ansDt;
	}
	public String getAttfId() {
		return attfId;
	}
	public void setAttfId(String attfId) {
		this.attfId = attfId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPrtiId() {
		return prtiId;
	}
	public void setPrtiId(String prtiId) {
		this.prtiId = prtiId;
	}
	public String getInstGnrSpcd() {
		return instGnrSpcd;
	}
	public void setInstGnrSpcd(String instGnrSpcd) {
		this.instGnrSpcd = instGnrSpcd;
	}

}
