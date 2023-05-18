package kcure.portal.dac.clc.inf.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.LoginVO;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.cmn.service.KcureDadaServiceFileMngUtil;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.dac.clc.inf.service.ClcInfReserchService;

@Service("ClcInfReserchService")
public class ClcInfReserchServiceImpl extends EgovAbstractServiceImpl implements ClcInfReserchService{

	@Resource(name = "ClcInfReserchDAO")
    private ClcInfReserchDAO clcInfReserchDAO;

	@Resource(name = "KcureDadaServiceFileMngUtil")
    private KcureDadaServiceFileMngUtil fileMngUtil;

	/**
	  * @Method Name : insertClcInfReserch
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 - 연구정보 저장
	  *  </p>
	  * @param : ClcInfReserchVo 연구정보
	 * @throws Exception
	  */
	@Override
	public String insertClcInfReserch(ClcInfReserchVo clcInfReserchVo) throws Exception {
		String dataAplcNo = clcInfReserchDAO.selectDataAplcNo(clcInfReserchVo);
		clcInfReserchVo.setDataAplcNo(dataAplcNo);

		//파일 등록
		if(clcInfReserchVo.getFile01() !=null && !CommonUtils.empty(clcInfReserchVo.getFile01().getOriginalFilename())  ) {

			DataServiceFileVO result = fileMngUtil.parseFileInf(clcInfReserchVo.getFile01(), clcInfReserchVo.getDataAplcNo(), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),"01","","");
			insertDataFileInfo(result);
		}
		//파일 등록
		if(clcInfReserchVo.getFile02() !=null && !CommonUtils.empty(clcInfReserchVo.getFile02().getOriginalFilename())  ) {
			DataServiceFileVO result = fileMngUtil.parseFileInf(clcInfReserchVo.getFile02(), clcInfReserchVo.getDataAplcNo(), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),"02","","");
			insertDataFileInfo(result);
		}
		//파일 등록
		if(clcInfReserchVo.getFile03() !=null && !CommonUtils.empty(clcInfReserchVo.getFile03().getOriginalFilename())  ) {
			DataServiceFileVO result = fileMngUtil.parseFileInf(clcInfReserchVo.getFile03(), clcInfReserchVo.getDataAplcNo(), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),"03","","");
			insertDataFileInfo(result);
		}
		//파일 등록
		if(clcInfReserchVo.getFile04() !=null && !CommonUtils.empty(clcInfReserchVo.getFile04().getOriginalFilename())  ) {
			DataServiceFileVO result = fileMngUtil.parseFileInf(clcInfReserchVo.getFile04(), clcInfReserchVo.getDataAplcNo(), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),"04","","");
			insertDataFileInfo(result);
		}
		//파일 등록
		if(clcInfReserchVo.getFile05() !=null && !CommonUtils.empty(clcInfReserchVo.getFile05().getOriginalFilename())  ) {
			DataServiceFileVO result = fileMngUtil.parseFileInf(clcInfReserchVo.getFile05(), clcInfReserchVo.getDataAplcNo(), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),"05","","");
			insertDataFileInfo(result);
		}

		//		등록
		clcInfReserchDAO.insertClcInfReserch(clcInfReserchVo);
		
		//히스토리 테이블 저장
		Map<String,Object> hstmMp = new HashMap<String, Object>();
		hstmMp.put("dataAplcNo", clcInfReserchVo.getDataAplcNo());
		hstmMp.put("cdClcd", "APLC");
		hstmMp.put("dtapStpSpcd", CommonEnum.DataServiceStep.STEP01.stepCd());
		hstmMp.put("userId", clcInfReserchVo.getUserId());
		clcInfReserchDAO.insertDtapStatHst(hstmMp);
		
		return dataAplcNo ;
	}

	private void insertDataFileInfo(DataServiceFileVO result) throws Exception {
		DataServiceFileVO deleteFile = fileMngUtil.selectFileOne(result);
		if(deleteFile != null && !CommonUtils.empty(deleteFile.getDataAplcNo()) ) {
			//기존 파일 삭제
			fileMngUtil.deletetDataFile(deleteFile);
		}
		//현재 파일 등록
		fileMngUtil.insertDataFile(result);

	}


	/**
	  * @Method Name : selectDetailClcInfReserch
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	연구정보 상세 검색
	  *  </p>
	  * @param :
	  * @return :
	  */
	@Override
	public ClcInfReserchVo selectDetailClcInfReserch(ClcInfReserchVo clcInfReserchVo) {
		return clcInfReserchDAO.selectDetailClcInfReserch(clcInfReserchVo);
	}

	/**
	  * @Method Name : updateClcInfReserch
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  서비스 신청 - 연구정보 수정
	  *  </p>
	  * @param :
	  * @return :
	 * @throws Exception
	  */
	@Override
	public void updateClcInfReserch(ClcInfReserchVo clcInfReserchVo) throws Exception {
		clcInfReserchDAO.updateClcInfReserch(clcInfReserchVo);
		clcInfReserchVo.setAplcStpSpcd(CommonEnum.DataServiceStep.STEP02.stepCd());

		//상태값 변경
		String nextStep = "";

		if("01".equals(clcInfReserchVo.getSaveGb())) {	//임시 저장 버튼
			nextStep = CommonEnum.DataServiceStep.STEP02.stepCd();
		}else {											//다음 단계 버튼
			nextStep = CommonEnum.DataServiceStep.STEP03.stepCd();
			//히스토리 테이블 저장
			Map<String,Object> hstmMp = new HashMap<String, Object>();
			hstmMp.put("dataAplcNo", clcInfReserchVo.getDataAplcNo());
			hstmMp.put("cdClcd", "APLC");
			hstmMp.put("dtapStpSpcd", CommonEnum.DataServiceStep.STEP02.stepCd());
			hstmMp.put("userId", clcInfReserchVo.getUserId());
			clcInfReserchDAO.insertDtapStatHst(hstmMp);
		}
		changeClcinfStep(clcInfReserchVo, nextStep);
	}

	private void changeClcinfStep(ClcInfReserchVo clcInfReserchVo, String nextClcinfStep) {

		ClcInfReserchVo  targetData = clcInfReserchDAO.selectDetailClcInfReserch(clcInfReserchVo);
		if(targetData.getAplcStpSpcd().equals(clcInfReserchVo.getAplcStpSpcd())) {
			clcInfReserchVo.setAplcStpSpcd(nextClcinfStep);
			clcInfReserchDAO.changeClcinfStep(clcInfReserchVo);
		}

	}

	/**
	  * @Method Name : selectClcInfRsp
	  * @작성일 : 2023. 2. 24.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  </p>
	  * @param :
	  * @return :
	  */
	@Override
	public List<ClcInfRspVo> selectClcInfRsp(ClcInfRspVo clcInfRspVo) {
		return clcInfReserchDAO.selectClcInfRsp(clcInfRspVo);
	}

	@Override
	public List<Map<String, String>> getPrtiList(String instClsSpcd) {
		return clcInfReserchDAO.getPrtiList(instClsSpcd);
	}

	@Override
	public List<LoginVO> selectUserPopUp(LoginVO schLoginVO) {
		return clcInfReserchDAO.selectUserPopUp(schLoginVO);
	}

	/**
	  * @Method Name : saveClcInfRsp
	  * @작성일 : 2023. 2. 27.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	연구자 정보 저장
	  *  </p>
	  * @param :
	  * @return :
	 * @throws Exception
	  */
	@Override
	public void saveClcInfRsp(ClcInfRspVo clcInfRspVo,MultipartHttpServletRequest multiRequest) throws Exception {

		//기존 연구자 정보 삭제
		//삭제처리
		if(clcInfRspVo.getDeleteSpcdIdList() != null && clcInfRspVo.getDeleteSpcdIdList().length > 0 ) {
			//파일 삭제 필요
			String[] attfSpcdList = {CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd()};
			String[] attdNmSpcdList = {"07"};
			DataServiceFileVO param = new DataServiceFileVO();
			param.setDataAplcNo(clcInfRspVo.getDataAplcNo());
			param.setAttfSpcdList(attfSpcdList);
			param.setAttdNmSpcdList(attdNmSpcdList);
			param.setAttfOwnrIdList(new String[] {});
			List<DataServiceFileVO> result = fileMngUtil.selectFileList(param);
			//파일 정보
			fileMngUtil.deletetDataFiles(result);
			//서비스 연구자 저장 정보 삭제.
			clcInfReserchDAO.deleteClcInfRsp(clcInfRspVo);
		}

		if(!CommonUtils.empty(clcInfRspVo.getClcInfRspList()) && clcInfRspVo.getClcInfRspList().size() > 0) {
			boolean fileSetted = false;
			for(ClcInfRspVo vo : clcInfRspVo.getClcInfRspList()) {
				vo.setDataAplcNo(clcInfRspVo.getDataAplcNo());
				vo.setUserId(clcInfRspVo.getUserId());

				if (!fileSetted) {
					fileSetted = true;
					//첨부파일
					vo.setFile07(multiRequest.getFile("file07"));
					//파일 등록
					if(vo.getFile07() !=null && !CommonUtils.empty(vo.getFile07().getOriginalFilename())  ) {
						DataServiceFileVO result = fileMngUtil.parseFileInf(vo.getFile07(), vo.getDataAplcNo(), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),"07",vo.getRsrpId(),"");
						insertDataFileInfo(result);
					}
				}

				if(vo.getActionType().equals("insert")) {
					//등록
					clcInfReserchDAO.insertClcInfRsp(vo);
				}else if(vo.getActionType().equals("update")) {
					clcInfReserchDAO.updateClcInfRsp(vo);
				}
			}
		}
		ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
		clcInfReserchVo.setDataAplcNo(clcInfRspVo.getDataAplcNo());
		clcInfReserchVo.setAplcStpSpcd(CommonEnum.DataServiceStep.STEP03.stepCd());

		//상태값 변경
		String nextStep = "";

		if("01".equals(clcInfReserchVo.getSaveGb())) {	//임시 저장 버튼
			nextStep = CommonEnum.DataServiceStep.STEP03.stepCd();
		}else {											//다음 단계 버튼
			nextStep = CommonEnum.DataServiceStep.STEP04.stepCd();
			//히스토리 테이블 저장
			Map<String,Object> hstmMp = new HashMap<String, Object>();
			hstmMp.put("dataAplcNo", clcInfReserchVo.getDataAplcNo());
			hstmMp.put("cdClcd", "APLC");
			hstmMp.put("dtapStpSpcd", CommonEnum.DataServiceStep.STEP03.stepCd());
			hstmMp.put("userId", clcInfRspVo.getUserId());
			clcInfReserchDAO.insertDtapStatHst(hstmMp);
		}
		changeClcinfStep(clcInfReserchVo, nextStep);
	}

	/**
	  * @Method Name : deleteTmpDataAplcDts
	  * @작성일 : 2023. 3. 10.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  서비스_데이터신청데이터셋_추가데이터 템프 테이블 삭제
	  *  </p>
	  * @param : 서비스 신청 번호
	  */
	@Override
	public void deleteTmpDataAplcDts(Map param) throws Exception {
		clcInfReserchDAO.deleteTmpDataAplcDts(param);
	}

	@Override
	public void updateClcInfReserch01(ClcInfReserchVo clcInfReserchVo) throws Exception {
		//파일 등록(연구계획서)
		if(clcInfReserchVo.getFile04() !=null) {
			if(!CommonUtils.empty(clcInfReserchVo.getFile04().getOriginalFilename())) {
				DataServiceFileVO result = fileMngUtil.parseFileInf(clcInfReserchVo.getFile04(), clcInfReserchVo.getDataAplcNo(), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),CommonEnum.attNmSpcdInfo.ATTNMSPCD04.attNmSpcd(),"","");
				insertDataFileInfo(result);
			}else {
				//파일 삭제
				DataServiceFileVO fileVO = new DataServiceFileVO();
				fileVO.setDataAplcNo(clcInfReserchVo.getDataAplcNo());
				fileVO.setAttfSpcd(CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd());
				fileVO.setAttdNmSpcd(CommonEnum.attNmSpcdInfo.ATTNMSPCD04.attNmSpcd());
				DataServiceFileVO deleteFile = fileMngUtil.selectFileOne(fileVO);

				if(deleteFile != null && !CommonUtils.empty(deleteFile.getDataAplcNo()) ) {
					//파일 삭제
					fileMngUtil.deletetDataFile(deleteFile);
				}
			}
		}
		//파일 등록(IRB 결과통지서)
		if(clcInfReserchVo.getFile12() !=null) {
			if(!CommonUtils.empty(clcInfReserchVo.getFile12().getOriginalFilename())) {
				DataServiceFileVO result = fileMngUtil.parseFileInf(clcInfReserchVo.getFile12(), clcInfReserchVo.getDataAplcNo(), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),CommonEnum.attNmSpcdInfo.ATTNMSPCD12.attNmSpcd(),"","");
				insertDataFileInfo(result);
			}else {
				DataServiceFileVO fileVO = new DataServiceFileVO();
				fileVO.setDataAplcNo(clcInfReserchVo.getDataAplcNo());
				fileVO.setAttfSpcd(CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd());
				fileVO.setAttdNmSpcd(CommonEnum.attNmSpcdInfo.ATTNMSPCD12.attNmSpcd());
				DataServiceFileVO deleteFile = fileMngUtil.selectFileOne(fileVO);

				if(deleteFile != null && !CommonUtils.empty(deleteFile.getDataAplcNo()) ) {
					//파일 삭제
					fileMngUtil.deletetDataFile(deleteFile);
				}
			}
		}

		if(clcInfReserchVo.getFile13() !=null) {
			if(!CommonUtils.empty(clcInfReserchVo.getFile13().getOriginalFilename())) {
				DataServiceFileVO result = fileMngUtil.parseFileInf(clcInfReserchVo.getFile13(), clcInfReserchVo.getDataAplcNo(), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),CommonEnum.attNmSpcdInfo.ATTNMSPCD13.attNmSpcd(),"","");
				insertDataFileInfo(result);
			}else {
				DataServiceFileVO fileVO = new DataServiceFileVO();
				fileVO.setDataAplcNo(clcInfReserchVo.getDataAplcNo());
				fileVO.setAttfSpcd(CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd());
				fileVO.setAttdNmSpcd(CommonEnum.attNmSpcdInfo.ATTNMSPCD13.attNmSpcd());
				DataServiceFileVO deleteFile = fileMngUtil.selectFileOne(fileVO);

				if(deleteFile != null && !CommonUtils.empty(deleteFile.getDataAplcNo()) ) {
					//파일 삭제
					fileMngUtil.deletetDataFile(deleteFile);
				}
			}
		}

		//master 테이블 업데이트
		clcInfReserchDAO.updateClcInfReserch01(clcInfReserchVo);

		//요약 테이블 저장
		clcInfReserchDAO.insertDataAplcSmryv(clcInfReserchVo);

		clcInfReserchVo.setAplcStpSpcd(CommonEnum.DataServiceStep.STEP01.stepCd());

		//상태값 변경
		String nextStep = "";

		if("01".equals(clcInfReserchVo.getSaveGb())) {	//임시 저장 버튼
			nextStep = CommonEnum.DataServiceStep.STEP01.stepCd();
		}else {											//다음 단계 버튼
			nextStep = CommonEnum.DataServiceStep.STEP02.stepCd();
			//히스토리 테이블 저장
			Map<String,Object> hstmMp = new HashMap<String, Object>();
			hstmMp.put("dataAplcNo", clcInfReserchVo.getDataAplcNo());
			hstmMp.put("cdClcd", "APLC");
			hstmMp.put("dtapStpSpcd", CommonEnum.DataServiceStep.STEP01.stepCd());
			hstmMp.put("userId", clcInfReserchVo.getUserId());
			clcInfReserchDAO.insertDtapStatHst(hstmMp);
		}
		changeClcinfStep(clcInfReserchVo, nextStep);
	}

	@Override
	public List<Map<String, Object>> selectRdrtItemList() throws Exception {
		return clcInfReserchDAO.selectRdrtItemList();
	}

	@Override
	public ClcInfReserchVo selectDataAplcSmry(ClcInfReserchVo clcInfReserchVo) throws Exception {
		return clcInfReserchDAO.selectDataAplcSmry(clcInfReserchVo);
	}
}

