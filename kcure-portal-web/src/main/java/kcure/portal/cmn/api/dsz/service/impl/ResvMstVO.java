package kcure.portal.cmn.api.dsz.service.impl;

import java.util.List;

public class ResvMstVO {
	
	public String totalSeat; //총 자리 수
	public String totalReserveSeat; //총 예약 된 수
	
	public List<ResvItemVO> list;

	public String getTotalSeat() {
		return totalSeat;
	}

	public void setTotalSeat(String totalSeat) {
		this.totalSeat = totalSeat;
	}

	public String getTotalReserveSeat() {
		return totalReserveSeat;
	}

	public void setTotalReserveSeat(String totalReserveSeat) {
		this.totalReserveSeat = totalReserveSeat;
	}

	public List<ResvItemVO> getList() {
		return list;
	}

	public void setList(List<ResvItemVO> list) {
		this.list = list;
	}
	
}
