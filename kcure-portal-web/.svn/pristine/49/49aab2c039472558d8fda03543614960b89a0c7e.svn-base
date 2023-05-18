package kcure.portal.sys.rsr.tkin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum.DtuAplcProgStcd;
import kcure.portal.sys.rsr.tkin.service.RsrTkinService;

@Service("rsrTkinService")
public class RsrTkinServiceImpl extends EgovAbstractServiceImpl implements RsrTkinService {

	@Resource(name="rsrTkinDAO")
    private RsrTkinDAO rsrTkinDAO;

    public List<Map<String, Object>> selectSvcTkinAplcList(RsrTkinSearchVO searchVO) throws Exception {
        return rsrTkinDAO.selectSvcTkinAplcList(searchVO);
    }

    public int selectSvcTkinAplcListTotCnt(RsrTkinSearchVO searchVO) throws Exception {
        return rsrTkinDAO.selectSvcTkinAplcListTotCnt(searchVO);
    }

    public Map<String, Object> selectSvcTkinAplc(RsrTkinSearchVO searchVO) throws Exception {
        return rsrTkinDAO.selectSvcTkinAplc(searchVO);
    }

	@Override
	public Map<String, Object> selectSvcTkinAplcDetail(Map<String, Object> paramap) throws Exception {
		return rsrTkinDAO.selectSvcTkinAplcDetail(paramap);
	}

	@Override
	public List<Map<String, Object>> selectSvcTkinAplcFileList(Map<String, Object> paramap) throws Exception {
		return rsrTkinDAO.selectSvcTkinAplcFileList(paramap);
	}

	@Override
	public void saveTkinAplcProg(Map<String, Object> paramap) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int tkInFileListCnt =Integer.parseInt(paramap.get("tkInFileListCnt") + "");		
		
		int tkinOkCnt = 0;
		int tkinRjctCnt = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(int i=0;i < tkInFileListCnt;i++) {
			map = new  HashMap<String, Object>();
			map.put("userId", sessionVo.getId());
			map.put("rsrAsmtNo", (String) paramap.get("rsrAsmtNo"));
			map.put("tkinDtapNo", (String) paramap.get("tkinDtapNo"));
			map.put("dataAplcNo", (String) paramap.get("dataAplcNo"));
			map.put("attfSeq", Integer.parseInt((String) paramap.get("tkinAttfSeq_" + i)));
			map.put("tkinDataProgStcd", (String) paramap.get("tkinDataProgStcd_" + i));
			map.put("rjcRsnCont", (String) paramap.get("rjcRsnCont_" + i));
			
			if(DtuAplcProgStcd.STCDU02.getStcd().equals(String.valueOf(paramap.get("tkinDataProgStcd_" + i)))){
				tkinOkCnt++;
			}else if(DtuAplcProgStcd.STCDU03.getStcd().equals(String.valueOf(paramap.get("tkinDataProgStcd_" + i)))){
				tkinRjctCnt++;
			}
			//반입파일 상태변경
			rsrTkinDAO.updateTkinAplcFileProgStcd(map);
		}
		map = new  HashMap<String, Object>();
		map.put("userId", sessionVo.getId());
		map.put("dataAplcNo", String.valueOf(paramap.get("dataAplcNo")));
		map.put("rsrAsmtNo", String.valueOf(paramap.get("rsrAsmtNo")));
		map.put("tkinDtapNo", String.valueOf( paramap.get("tkinDtapNo")));
		
		if(tkInFileListCnt == tkinOkCnt) {
			map.put("tkinDataProgStcd", DtuAplcProgStcd.STCDU02.getStcd());
			map.put("datpStatSpcd", "0000000037");
		}else if(tkInFileListCnt == tkinRjctCnt){
			map.put("tkinDataProgStcd", DtuAplcProgStcd.STCDU03.getStcd());
			map.put("datpStatSpcd", "0000000039");
		}else {
			map.put("tkinDataProgStcd", DtuAplcProgStcd.STCDU04.getStcd());
			map.put("datpStatSpcd", "0000000038");
		}
		//반입신청 상태변경
		rsrTkinDAO.updateTkinAplcProgStcd(map);
		//반입신청이력 상태변경
		rsrTkinDAO.insertDtapStatHst(map);
	}

}
