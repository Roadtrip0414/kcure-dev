package kcure.portal.sys.rsr.ext.web.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.sys.com.service.impl.ComVO;
import kcure.portal.sys.rsr.ext.web.service.RsrDataExtService;

@Service("rsrDataExtService")
public class RsrDataExtServiceImpl extends EgovAbstractServiceImpl  implements RsrDataExtService {
	
	@Resource(name="rsrDataExtDAO")
	private RsrDataExtDAO rsrDataExtDAO;

	@Override
	public List<ComVO> selectExtComCodeList(ComVO searchVO) throws Exception {
		return rsrDataExtDAO.selectExtComCodeList(searchVO);
	}

	@Override
	public List<Map<String, Object>> selectDataExtAplcList(RsrDataExtSearchVO searchVO) throws Exception {
		return rsrDataExtDAO.selectDataExtAplcList(searchVO);
	}

	@Override
	public int selectDataExtAplcTotCnt(RsrDataExtSearchVO searchVO) throws Exception {
		return rsrDataExtDAO.selectDataExtAplcTotCnt(searchVO);
	}

	@Override
	public Map<String, Object> detailDataExtAplc(RsrDataExtSearchVO searchVO) throws Exception {
		return rsrDataExtDAO.detailDataExtAplc(searchVO);
	}

	@Override
	public void updateDataExtAplc(Map<String, Object> param) throws Exception {
		rsrDataExtDAO.insertDataExtHst(param); /* 로그를 쌓는다. */
		int cnt = rsrDataExtDAO.updateDataExtAplc(param);
		if(cnt == 1) {
			if("Y".equals(param.get("extdProgStcd")) && "04".equals(param.get("extdStcd"))) { // IRB연구기간 연장 심의는 바로 기간 연장 반영 로직
				int irbCnt = rsrDataExtDAO.updateDataExtIrb(param);
				if(irbCnt != 1) {
					throw new Exception("IRB연구유효기간 연장 업데이트 오류");
				}
			}
			if(!"04".equals(param.get("extdStcd")) && "U05".equals(param.get("extdProgStcd"))) { // IRB연구기간이 아니고 결제 완료인(결제금액 0원) 경우 기간 연장 반영 로직 
				updateDataExtAplcCpl(param, false);
			}
		} else {
			throw new Exception("데이터 연장 / 보관 처리 업데이트 오류");
		}
	}

	@Override
	public void updateDataExtAplcCpl(Map<String, Object> param, boolean runHst) throws Exception {
		if(runHst) { // 결제 금액이 0인 경우 승인에서 이미 이력을 쌓기 때문에 연장하기 action에서 온 경우만 이력을 쌓는다.
			rsrDataExtDAO.insertDataExtHst(param); /* 로그를 쌓는다. */
			int uptCnt = rsrDataExtDAO.updateDataExtAplc(param); // 진행상태를 업데이트 한다.
			if(uptCnt != 1) {
				throw new Exception("데이터 연장 / 보관 처리 업데이트 오류");
			}
		}
		int cnt = rsrDataExtDAO.updateDataExtAplcCpl(param);
		if(cnt != 1) {
			throw new Exception("데이터 연장 / 보관 처리 결제완료 업데이트 오류");
		}
	}

}
