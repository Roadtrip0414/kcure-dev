package kcure.portal.sys.dac.rvw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.NtceUserInfo;
import kcure.portal.cmn.CommonEnum.rvwStpSpcdInfo;
import kcure.portal.cmn.alm.service.AlmService;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.dac.rvw.service.DacRvwAplcDtsService;


@Service("dacRvwAplcDtsService")
public class DacRvwAplcDtsServiceImpl extends EgovAbstractServiceImpl implements DacRvwAplcDtsService {

	@Resource(name="dacRvwAplcDtsDAO")
    private DacRvwAplcDtsDAO dacRvwAplcDtsDAO;

	@Resource(name = "almService")
	private AlmService almService;

	@Override
	public List<Map<String, Object>> selectRevPrtiList(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectRevPrtiList(dacRvwVo);
	}

	@Override
	public int selectRevPrtiTotCnt(ComDefaultVO comDefaultVO) throws Exception {
		return dacRvwAplcDtsDAO.selectRevPrtiTotCnt(comDefaultVO);
	}

	@Override
	public List<DataServiceFileVO> selectDataServiceFileList(DataServiceFileVO dataVo) throws Exception {
		return dacRvwAplcDtsDAO.selectDataServiceFileList(dataVo);
	}

	@Override
	public boolean saveRevAplcRsch(DacRvwVo dacRvwVo) throws Exception {
		boolean checkYn = false;
		int checkCnt = dacRvwAplcDtsDAO.selectRevAplcRschCheck(dacRvwVo);
		//등록된 내역이 없으면.
		if(checkCnt < 1) {
			dacRvwAplcDtsDAO.insertRevAplcRsch(dacRvwVo);
		}
		//연구접수 완료 여부.
		String chekYn = "N";
		//임상일 경우 의정원에서만 승인하면 완료됨.- 결합의 경우 의정원에서만 
		if( CommonEnum.DataTpcd.SPCD01.spcd().equals(dacRvwVo.getDataTpcd())   
				|| CommonEnum.DataTpcd.SPCD03.spcd().equals(dacRvwVo.getDataTpcd())
				) {
			chekYn = dacRvwAplcDtsDAO.checkAplcRschDataTpcd01(dacRvwVo);
		}else {
			chekYn = dacRvwAplcDtsDAO.checkAplcRschDataTpcdOther(dacRvwVo);
		}
		
		//승인전체 완료 이면 다음 스템으로 진행.
		if(chekYn.equals("Y")) {
			checkYn = true;
			dacRvwVo.setNextRvwStpStcd(CommonEnum.rvwStpSpcdInfo.valueOfStpSpcdInfo(dacRvwVo.getNextSpcd()).stpStartCode());
			addHistInfo(dacRvwVo);
		}
		
		
		return checkYn;
	}

	/**
	 * 히스토리 등록
	 * @param dataAplcNo
	 * @param nextSpcd
	 * @param stpStartCode
	 */
	private void addHistInfo(DacRvwVo dacRvwVo)throws Exception {
		EgovMap map = new EgovMap();
		map.put("dataAplcNo", dacRvwVo.getDataAplcNo());
		map.put("dataTpcd", dacRvwVo.getDataTpcd());
		map.put("dtapStpSpcd", dacRvwVo.getNextSpcd());
		map.put("detlCd", dacRvwVo.getNextRvwStpStcd());
		map.put("userId", dacRvwVo.getUserId());
		
		makeStepDtapHst(map);
		
		
	}
	
	@Override
	public void makeStepDtapHst(EgovMap map) throws Exception{
		dacRvwAplcDtsDAO.insertDtapStatHst(map);
		
	}

	@Override
	public void saveRevPrti(DacRvwVo dacRvwVo) throws Exception {
		//심의단계 저장
		//insertDacRvwCurrStep(dacRvwVo, dacRvwVo.nextSpcd);
		dacRvwVo.setNextRvwStpStcd(CommonEnum.rvwStpSpcdInfo.valueOfStpSpcdInfo(dacRvwVo.getNextSpcd()).stpStartCode());
		//히스토리 남기기.
		addHistInfo(dacRvwVo);
	}


	private void insertDacRvwCurrStep(DacRvwVo dacRvwVo, String nextStep) throws Exception{
		DacRvwVo  targetData = dacRvwAplcDtsDAO.selectDetailDataAplcRvw(dacRvwVo);

		if(targetData.getRvwStpSpcd().equals(dacRvwVo.getRvwStpSpcd())) {
			dacRvwVo.setRvwStpStcd(rvwStpSpcdInfo.valueOfStpSpcdInfo(nextStep).stpStartCode());
			dacRvwVo.setRvwStpSpcd(nextStep);
			dacRvwAplcDtsDAO.insertDacRvwCurrStep(dacRvwVo);
		}
	}

	@Override
	public void updateDacRvwStat(DacRvwVo dacRvwVo) throws Exception {
		EgovMap param = new EgovMap();
		param.put("dataAplcNo", dacRvwVo.getDataAplcNo());
		param.put("userId", dacRvwVo.getUserId());
		param.put("aplcProgStcd", dacRvwVo.getAplcProgStcd());
		//신청테이블 상태 변경.		
		dacRvwAplcDtsDAO.updateDataAplcInfo(param);
		//히스토리 남기기.
		EgovMap map = new EgovMap();
		map.put("dataAplcNo", dacRvwVo.getDataAplcNo());
		map.put("dataTpcd", dacRvwVo.getDataTpcd());
		map.put("dtapStpSpcd", dacRvwVo.getRvwStpSpcd());
		map.put("detlCd", dacRvwVo.getRvwStpStcd());
		map.put("userId", dacRvwVo.getUserId());
		makeStepDtapHst(map);
		
		almService.registAlrm(NtceUserInfo.NTCE_DATA_02.getSpDtlcd(), dacRvwVo.getDataAplcNo(), "");
		
		/*
		try {
			//데이터 신청 반려시 알람등록
			almService.registAlrm(NtceUserInfo.NTCE_DATA_02.getSpDtlcd(), dacRvwVo.getDataAplcNo(), "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
	}

	@Override
	public void insertRsrAcptAprp(DacRvwVo dacRvwVo) throws Exception {
		dacRvwAplcDtsDAO.insertRsrAcptAprp(dacRvwVo);
	}

	@Override
	public void insertPrvdRvw(DacRvwVo dacRvwVo) throws Exception {
		dacRvwAplcDtsDAO.insertPrvdRvw(dacRvwVo);
	}

	@Override
	public DacRvwVo selectDetailDataAplcRvw(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectDetailDataAplcRvw(dacRvwVo);
	}

	@Override
	public DacRvwVo selectStpRvw(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectStpRvw(dacRvwVo);
	}

	@Override
	public DacRvwVo selectPrvdRvw(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectPrvdRvw(dacRvwVo);
	}

	@Override
	public DacRvwVo selectRjcRsnContView(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectRjcRsnContView(dacRvwVo);
	}

	@Override
	public void updateRsrAcptAprp(DacRvwVo dacRvwVo) throws Exception {
		dacRvwAplcDtsDAO.updateRsrAcptAprp(dacRvwVo);
	}

	@Override
	public int selectAcptAprpCnt(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectAcptAprpCnt(dacRvwVo);
	}

	@Override
	public DacRvwVo selectRvwTmplt(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectRvwTmplt(dacRvwVo);
	}

	@Override
	public List<DacRvwVo> selectDetailDataAplcRvwList(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectDetailDataAplcRvwList(dacRvwVo);
	}

	@Override
	public DacRvwVo selectDetailDataAplcRvw2(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectDetailDataAplcRvw2(dacRvwVo);
	}

	@Override
	public Map<String, Object> selectDetailDataAplcSendPay(DacRvwVo dacRvwVo) throws Exception {
		return dacRvwAplcDtsDAO.selectDetailDataAplcSendPay(dacRvwVo);
	}

	@Override
	public void updateClcInfPblAmt(DacRvwVo dacRvwVo)throws Exception {
		
		dacRvwAplcDtsDAO.updateClcInfPblAmt(dacRvwVo);
		//공공의 경우
		if(CommonEnum.DataTpcd.SPCD02.spcd().equals(dacRvwVo.getDataTpcd())) {
			//단계구분코드 등록
			dacRvwVo.setNextRvwStpStcd("RC01");
			
		}else {
			//단계구분코드 등록
			dacRvwVo.setNextRvwStpStcd(CommonEnum.rvwStpSpcdInfo.valueOfStpSpcdInfo(dacRvwVo.getNextSpcd()).stpStartCode());
		}
		
		addHistInfo(dacRvwVo);		
	}

	/**
	 * 보완요청
	 */
	@Override
	public void updateSplmntReq(DacRvwVo dacRvwVo) throws Exception {
		EgovMap param = new EgovMap();
		param.put("dataAplcNo", dacRvwVo.getDataAplcNo());
		param.put("userId", dacRvwVo.getUserId());
		param.put("aplcProgStcd", dacRvwVo.getAplcProgStcd());
		//신청테이블 상태 변경.		
		dacRvwAplcDtsDAO.updateDataAplcInfo(param);
		//히스토리 남기기.
		EgovMap map = new EgovMap();
		map.put("dataAplcNo", dacRvwVo.getDataAplcNo());
		map.put("dataTpcd", dacRvwVo.getDataTpcd());
		map.put("dtapStpSpcd", dacRvwVo.getRvwStpSpcd());
		map.put("detlCd", dacRvwVo.getRvwStpStcd());
		map.put("userId", dacRvwVo.getUserId());
		makeStepDtapHst(map);
		
		almService.registAlrm(NtceUserInfo.NTCE_DATA_04.getSpDtlcd(), dacRvwVo.getDataAplcNo(), "");
		
	}

	/**
	 *
	 */
	@Override
	public void updateRjcRgst(DacRvwVo dacRvwVo) throws Exception {
		//심의 반려사유 남기기
		dacRvwAplcDtsDAO.updateDacRvwStat(dacRvwVo);
	}
}
