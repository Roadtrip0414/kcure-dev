package kcure.portal.dac.clc.inf.service.impl;

import java.io.Serializable;
import java.util.List;

public class ClcInfRspListVo  implements Serializable{	
	
	
	
	
	/**
	*
	*/
	private static final long serialVersionUID = 2570528001260615765L;
	
	private List<ClcInfRspVo> clcInfRspVo;
	
	 

	public List<ClcInfRspVo> getClcInfRspVo() {
		return clcInfRspVo;
	}



	public void setClcInfRspVo(List<ClcInfRspVo> clcInfRspVo) {
		this.clcInfRspVo = clcInfRspVo;
	}



	@Override
	public String toString() {
		return "ClcInfRspListVo [clcInfRspVo=" + clcInfRspVo + "]";
	}


	
}
