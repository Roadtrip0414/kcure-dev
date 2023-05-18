package kcure.portal.sys.rsr.daz.service.impl;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.daz.service.impl
  * @FileName : RsrDazSearchVO.java
  * @since : 2023. 3. 16
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 : 서비스 참여기관 검색 VO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class RsrDazSearchVO extends ComDefaultVO{

	private static final long serialVersionUID = 1L;

	private String prtiId;
	private String prtiNm;

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
}