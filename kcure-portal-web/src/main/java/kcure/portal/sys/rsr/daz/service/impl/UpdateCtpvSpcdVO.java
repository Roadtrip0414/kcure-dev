package kcure.portal.sys.rsr.daz.service.impl;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.daz.service.impl
  * @FileName : UpdateCtpvSpcdVO.java
  * @since : 2023. 3. 16
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 : 서비스_참여기관 ctpv_spcd 업데이트용 VO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class UpdateCtpvSpcdVO extends ComDefaultVO{

	private static final long serialVersionUID = 1L;

	private String prtiId;
	private String ctpvSpcd;
	private String lastModpId;

	public String getPrtiId() {
		return prtiId;
	}
	public void setPrtiId(String prtiId) {
		this.prtiId = prtiId;
	}

	public String getCtpvSpcd() {
		return ctpvSpcd;
	}
	public void setCtpvSpcd(String ctpvSpcd) {
		this.ctpvSpcd = ctpvSpcd;
	}

	public String getLastModpId() {
		return lastModpId;
	}
	public void setLastModpId(String lastModpId) {
		this.lastModpId = lastModpId;
	}
}