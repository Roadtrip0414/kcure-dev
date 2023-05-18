package kcure.portal.sys.dac.prc.service.impl;

import egovframework.com.cmm.ComDefaultVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.dac.prc.service.impl
 * @FileName : DacPrcSearchVO.java
 * @since : 2023. 3. 13.
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
public class DacPrcSearchVO extends ComDefaultVO {
	private static final long serialVersionUID = -2539271416155600773L;

	private String dataAplcYmdFrom;
	private String dataAplcYmdTo;
	private String rvwStpSpcd;

	public String getDataAplcYmdFrom() {
		return dataAplcYmdFrom;
	}
	public void setDataAplcYmdFrom(String dataAplcYmdFrom) {
		this.dataAplcYmdFrom = dataAplcYmdFrom.replace("-", "");
	}

	public String getDataAplcYmdTo() {
		return dataAplcYmdTo;
	}
	public void setDataAplcYmdTo(String dataAplcYmdTo) {
		this.dataAplcYmdTo = dataAplcYmdTo.replace("-", "");
	}

	public String getRvwStpSpcd() {
		return rvwStpSpcd;
	}
	public void setRvwStpSpcd(String rvwStpSpcd) {
		this.rvwStpSpcd = rvwStpSpcd;
	}
}
