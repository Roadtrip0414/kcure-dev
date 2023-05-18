package kcure.portal.cmn.api.dsz.service.impl;

public class ResvVO {
	
	//의료기관ID
	public String prtiId;
	//좌석예약ID
	public String seatRsvId;
	//예약좌석번호
	public int rsvSeatNo;
	//예약일자
	public String rsvDt;
	//API수신일자
	public String apiRsvDt;
	//예약취소여부
	public String rsvCnclYn;
	//최초등록자ID
	public String frstRegpId;
	//최초등록일시
	public String frstRgstDt;
	//최종수정자ID
	public String lastModpId;
	//최종수정일시
	public String lastModfDt;

	
	public String getPrtiId() {
		return prtiId;
	}
	public void setPrtiId(String prtiId) {
		this.prtiId = prtiId;
	}
	public String getSeatRsvId() {
		return seatRsvId;
	}
	public void setSeatRsvId(String seatRsvId) {
		this.seatRsvId = seatRsvId;
	}
	public int getRsvSeatNo() {
		return rsvSeatNo;
	}
	public void setRsvSeatNo(int rsvSeatNo) {
		this.rsvSeatNo = rsvSeatNo;
	}
	public String getRsvDt() {
		return rsvDt;
	}
	public void setRsvDt(String rsvDt) {
		this.rsvDt = rsvDt;
	}
	public String getApiRsvDt() {
		return apiRsvDt;
	}
	public void setApiRsvDt(String apiRsvDt) {
		this.apiRsvDt = apiRsvDt;
	}
	public String getRsvCnclYn() {
		return rsvCnclYn;
	}
	public void setRsvCnclYn(String rsvCnclYn) {
		this.rsvCnclYn = rsvCnclYn;
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
	
	
	@Override
	public String toString() {
		return "ResvVO [prtiId=" + prtiId + ", seatRsvId=" + seatRsvId + ", rsvSeatNo=" + rsvSeatNo + ", rsvDt=" + rsvDt
				+ ", apiRsvDt=" + apiRsvDt + ", rsvCnclYn=" + rsvCnclYn + ", frstRegpId=" + frstRegpId + ", frstRgstDt="
				+ frstRgstDt + ", lastModpId=" + lastModpId + ", lastModfDt=" + lastModfDt + "]";
	}


	
}
