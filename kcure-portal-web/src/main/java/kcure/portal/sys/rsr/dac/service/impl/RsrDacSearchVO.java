package kcure.portal.sys.rsr.dac.service.impl;

import egovframework.com.cmm.ComDefaultVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.rsr.dac.service.impl
 * @FileName : RsrDacSearchVO.java
 * @since : 2023. 3. 15
 * @version 1.0
 * @author : parkgu
 * @프로그램 설명 :	데이터신청관리 검색용 VO
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
public class RsrDacSearchVO extends ComDefaultVO {
	private static final long serialVersionUID = -2539271416155600773L;

	private String rsrEdtFrom;
	private String rsrEdtTo;
	private String rsrRstExists;

	public String getRsrEdtFrom() {
		return rsrEdtFrom;
	}
	public void setRsrEdtFrom(String rsrEdtFrom) {
		this.rsrEdtFrom = rsrEdtFrom.replace("-", "");
	}

	public String getRsrEdtTo() {
		return rsrEdtTo;
	}
	public void setRsrEdtTo(String rsrEdtTo) {
		this.rsrEdtTo = rsrEdtTo.replace("-", "");
	}

	public String getRsrRstExists() {
		return rsrRstExists;
	}
	public void setRsrRstExists(String rsrRstExists) {
		this.rsrRstExists = rsrRstExists;
	}
}
