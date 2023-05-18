package kcure.portal.sys.rsr.dto.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum.DtuAplcProgStcd;
import kcure.portal.sys.rsr.dto.service.RsrDtoService;

@Service("rsrDtoService")
public class RsrDtoServiceImpl extends EgovAbstractServiceImpl implements RsrDtoService {

	@Resource(name="rsrDtoDAO")
    private RsrDtoDAO rsrDtoDAO;

    public List<Map<String, Object>> selectSvcDttoAplcList(RsrDtoSearchVO searchVO) throws Exception {
        return rsrDtoDAO.selectSvcDttoAplcList(searchVO);
    }

    public int selectSvcDttoAplcListTotCnt(RsrDtoSearchVO searchVO) throws Exception {
        return rsrDtoDAO.selectSvcDttoAplcListTotCnt(searchVO);
    }

    public Map<String, Object> selectSvcDttoAplc(RsrDtoSearchVO searchVO) throws Exception {
        return rsrDtoDAO.selectSvcDttoAplc(searchVO);
    }

    public int updateDttoAplcProgStcd(Map<String, Object> update) throws Exception {
        return rsrDtoDAO.updateDttoAplcProgStcd(update);
    }

	@Override
	public List<Map<String, Object>> selectSvcDttoAplcFileList(RsrDtoSearchVO searchVO) throws Exception {
		return rsrDtoDAO.selectSvcDttoAplcFileList(searchVO);
	}

	@Override
	public void saveDttoAplcProg(Map<String, Object> paramap) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int dttoFileListCnt =Integer.parseInt(paramap.get("dttoFileListCnt") + "");		
		
		int dttoOkCnt = 0;
		int dttoRjctCnt = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();

		for(int i=0;i < dttoFileListCnt;i++) {
			map = new  HashMap<String, Object>();
			map.put("userId", sessionVo.getId());
			map.put("rsrAsmtNo", (String) paramap.get("rsrAsmtNo"));
			map.put("dttoAplcDt", (String) paramap.get("dttoAplcDt"));
			map.put("dataAplcNo", (String) paramap.get("dataAplcNo"));
			map.put("attfSeq", Integer.parseInt((String) paramap.get("dttoAttfSeq_" + i)));
			map.put("dttoAplcProgStcd", (String) paramap.get("dttoAplcProgStcd_" + i));
			map.put("rjcRsnCont", (String) paramap.get("rjcRsnCont_" + i));
			
			if(DtuAplcProgStcd.STCDU02.getStcd().equals(String.valueOf(paramap.get("dttoAplcProgStcd_" + i)))){
				dttoOkCnt++;
			}else if(DtuAplcProgStcd.STCDU03.getStcd().equals(String.valueOf(paramap.get("dttoAplcProgStcd_" + i)))){
				dttoRjctCnt++;
			}
			//반입파일 상태변경
			rsrDtoDAO.updateDttoAplcFileProgStcd(map);
		}
		map = new  HashMap<String, Object>();
		map.put("userId", sessionVo.getId());
		map.put("dataAplcNo", String.valueOf(paramap.get("dataAplcNo")));
		map.put("rsrAsmtNo", String.valueOf(paramap.get("rsrAsmtNo")));
		map.put("dttoAplcDt", String.valueOf( paramap.get("dttoAplcDt")));
		
		if(dttoFileListCnt == dttoOkCnt) {
			map.put("dttoAplcProgStcd", DtuAplcProgStcd.STCDU02.getStcd());
			map.put("datpStatSpcd", "0000000041");
		}else if(dttoFileListCnt == dttoRjctCnt){
			map.put("dttoAplcProgStcd", DtuAplcProgStcd.STCDU03.getStcd());
			map.put("datpStatSpcd", "0000000042");
		}else {
			map.put("dttoAplcProgStcd", DtuAplcProgStcd.STCDU04.getStcd());
			map.put("datpStatSpcd", "0000000043");
		}
		//반출신청 상태변경
		rsrDtoDAO.updateDttoAplcProgStcd(map);
		//반출신청이력 상태변경
		rsrDtoDAO.insertDtapStatHst(map);
	}
	
}
