package kcure.portal.sys.dac.rvw.service.impl;




import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.NtceUserInfo;
import kcure.portal.cmn.alm.service.AlmService;
import kcure.portal.sys.dac.rvw.service.DacRvwAplcDtsService;
import kcure.portal.sys.dac.rvw.service.DacRvwDataPrvdService;

@Service("DacRvwDataPrvdService")
public class DacRvwDataPrvdServiceImpl extends EgovAbstractServiceImpl implements DacRvwDataPrvdService {

	
	
	@Resource(name="DacRvwDataPrvdDAO")
    private DacRvwDataPrvdDAO dacRvwDataPrvdDAO;
	
	@Resource(name = "almService")
	private AlmService almService;
	
	@Resource(name = "dacRvwAplcDtsService")
    private DacRvwAplcDtsService dacRvwAplcDtsService;
	
	@Resource(name="dacRvwAplcDtsDAO")
    private DacRvwAplcDtsDAO dacRvwAplcDtsDAO;
	
	/**
	  * @Method Name : selectDataPrvd
	  * @작성일 : 2023. 3. 16.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@Override
	public List<DacRvwDataPrvdVo> selectDataPrvd(DacRvwDataPrvdVo dacRvwDataPrvdVo) {
		return dacRvwDataPrvdDAO.selectDataPrvd(dacRvwDataPrvdVo);
	}


	/**
	  * @Method Name : saveDataPrvd
	  * @작성일 : 2023. 3. 16.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  </p>
	  * @param : 
	  * @return :
	 * @throws Exception 
	  */
	@Override
	public void saveDataPrvd(DacRvwDataPrvdVo[] insertDataList) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		DacRvwVo dacRvwVo = new DacRvwVo();
    	dacRvwVo.setDataAplcNo(insertDataList[0].getDataAplcNo());
    	//심의 진행정보 조회
    	DacRvwVo basicInfoVo = dacRvwAplcDtsService.selectDetailDataAplcRvw(dacRvwVo);
    	dacRvwVo.setDataTpcd(basicInfoVo.getDataTpcd());
    	
		//데이터 제공 상태 저장.
		for(DacRvwDataPrvdVo vo : insertDataList) {
			//
			if(vo.getRvwStpStcd().equals( CommonEnum.rvwStpSpcdInfo.STP_SPCD08.stpEndCode() )
				||  "RC02".equals( vo.getRvwStpStcd()) ) {
				vo.setUserId(sessionVo.getId());
				dacRvwDataPrvdDAO.insertDataPrvd(vo);
			}
		}
		
		EgovMap param = new EgovMap();
		param.put("dataAplcNo", basicInfoVo.getDataAplcNo());
		param.put("userId", sessionVo.getId());
		
		//데이터 제공 
		if(basicInfoVo.getRvwStpStcd().equals( CommonEnum.rvwStpSpcdInfo.STP_SPCD08.stpStartCode())){
			
			param.put("rvwStpStcd", CommonEnum.rvwStpSpcdInfo.STP_SPCD08.stpEndCode());
			String checkYn = dacRvwDataPrvdDAO.getChcekDataPrvdStat(param);
			
			//모든 참여기관이 데이터 제공이 된경우 
			if("Y".equals(checkYn)) {
				//히스토리 남기기.
				param.put("dataTpcd", dacRvwVo.getDataTpcd());
				param.put("dtapStpSpcd", CommonEnum.rvwStpSpcdInfo.STP_SPCD08.stpSpcd());
				param.put("detlCd", CommonEnum.rvwStpSpcdInfo.STP_SPCD08.stpEndCode());
				dacRvwAplcDtsService.makeStepDtapHst(param);
				//신청테이블 상태 및 정보 업데이트
				dacRvwDataPrvdDAO.updateDataAplcInfo(param);				
				//연장신청마스터 테이블 등록
				dacRvwDataPrvdDAO.insertExtd(param);
				//알림 메일 발송
				//데이터 제공 완료 시 알람등록
				almService.registAlrm(NtceUserInfo.NTCE_DATA_01.getSpDtlcd(), dacRvwVo.getDataAplcNo(), "");
			}
			
		//결재완료
		}else {
			param.put("rvwStpStcd", "RC02");
			String checkYn = dacRvwDataPrvdDAO.getChcekDataPrvdStat(param);
			//모든 참여기관이 결재완료가 된경우 
			if("Y".equals(checkYn)) {
				param.put("rvwStpStcd", CommonEnum.rvwStpSpcdInfo.STP_SPCD08.stpStartCode());
				//데이터 제공상태로 변경.
				dacRvwDataPrvdDAO.updateDataPrvdStat(param);
				//결재완료 상태저장
				param.put("dataTpcd", dacRvwVo.getDataTpcd());
				param.put("dtapStpSpcd", CommonEnum.rvwStpSpcdInfo.STP_SPCD08.stpSpcd());
				param.put("detlCd", "RC02");
				dacRvwAplcDtsService.makeStepDtapHst(param);
				
				//데이터 제공 상태 저장.
				param.put("detlCd", CommonEnum.rvwStpSpcdInfo.STP_SPCD08.stpStartCode());
				dacRvwAplcDtsService.makeStepDtapHst(param);
				
				//알림 메일 발송
				//데이터 제공 완료 시 알람등록
				almService.registAlrm(NtceUserInfo.NTCE_DATA_01.getSpDtlcd(), dacRvwVo.getDataAplcNo(), "");
				
			}
			
		}
		
	}


	/**
	 * 제공기관 결합진행 상태 저장
	 * @throws Exception 
	 */
	@Override
	public void saveDataPrvdCmbn(DacRvwDataPrvdVo[] insertDataList) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		DacRvwVo dacRvwVo = new DacRvwVo();
    	dacRvwVo.setDataAplcNo(insertDataList[0].getDataAplcNo());
    	//심의 진행정보 조회
    	DacRvwVo basicInfoVo = dacRvwAplcDtsService.selectDetailDataAplcRvw(dacRvwVo);
    	dacRvwVo.setDataTpcd(basicInfoVo.getDataTpcd());
    	
		//데이터 제공 상태 저장.
		for(DacRvwDataPrvdVo vo : insertDataList) {
			//
			if(vo.getRvwStpStcd().equals( CommonEnum.rvwStpSpcdInfo.STP_SPCD10.stpEndCode() ) ) {
				vo.setUserId(sessionVo.getId());
				dacRvwDataPrvdDAO.insertDataPrvd(vo);
			}
		}
		
		EgovMap param = new EgovMap();
		param.put("dataAplcNo", basicInfoVo.getDataAplcNo());
		param.put("userId", sessionVo.getId());

		param.put("rvwStpStcd", CommonEnum.rvwStpSpcdInfo.STP_SPCD10.stpEndCode());
		String checkYn = dacRvwDataPrvdDAO.getChcekDataPrvdStat(param);
		
		//모든 참여기관이 데이터 제공이 된경우 
		if("Y".equals(checkYn)) {
			//히스토리 남기기.
			param.put("dataTpcd", dacRvwVo.getDataTpcd());
			param.put("dtapStpSpcd", CommonEnum.rvwStpSpcdInfo.STP_SPCD10.stpSpcd());
			param.put("detlCd", CommonEnum.rvwStpSpcdInfo.STP_SPCD10.stpEndCode());
			dacRvwAplcDtsService.makeStepDtapHst(param);
			//신청테이블 상태 및 정보 업데이트
			dacRvwDataPrvdDAO.updateDataAplcInfo(param);
			//연장신청마스터 테이블 등록
			dacRvwDataPrvdDAO.insertExtd(param);
			//알림 메일 발송
			//데이터 제공 완료 시 알람등록
			almService.registAlrm(NtceUserInfo.NTCE_DATA_01.getSpDtlcd(), dacRvwVo.getDataAplcNo(), "");
		}
		
	}
	
	
}
