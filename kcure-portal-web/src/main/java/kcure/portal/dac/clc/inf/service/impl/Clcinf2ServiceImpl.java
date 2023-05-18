package kcure.portal.dac.clc.inf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.AplcProgStcd;
import kcure.portal.cmn.CommonEnum.NtceUserInfo;
import kcure.portal.cmn.alm.service.AlmService;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.cmn.service.KcureDadaServiceFileMngUtil;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.dac.clc.inf.service.Clcinf2Service;


@Service("clcinf2Service")
public class Clcinf2ServiceImpl implements Clcinf2Service{

	@Resource(name="clcinf2DAO")
	private Clcinf2DAO clcinf2DAO;

	@Resource(name = "ClcInfReserchDAO")
    private ClcInfReserchDAO clcInfReserchDAO;

	@Resource(name = "KcureDadaServiceFileMngUtil")
    private KcureDadaServiceFileMngUtil fileMngUtil;

	@Resource(name = "almService")
	private AlmService almService;
	
	@Override
	public List<ColDfndVo> selectColDfndList(Map paramap) throws Exception {
		return clcinf2DAO.selectColDfndList(paramap);
	}

	@Override
	public ClcInfReserchVo selectDetailClcInfReserch(ClcInfReserchVo clcInfReserchVo) throws Exception {
		return clcinf2DAO.selectDetailClcInfReserch(clcInfReserchVo);
	}

	@Override
	public ClcInfRspVo selectClcInfRsp(String dataAplcNo) throws Exception {
		return clcinf2DAO.selectClcInfRsp(dataAplcNo);
	}

	@Override
	public List<ClcInfRspVo> selectClcInfRspList(String dataAplcNo) throws Exception {
		return clcinf2DAO.selectClcInfRspList(dataAplcNo);
	}

	@Override
	public int selectClcInfRspCnt(String dataAplcNo) throws Exception {
		return clcinf2DAO.selectClcInfRspCnt(dataAplcNo);
	}

	@Override
	public List<ClcInfReqTreeVo> selectDtsTreeList(String prtiId) throws Exception {
		return clcinf2DAO.selectDtsTreeList(prtiId);
	}

	@Override
	public List<HashMap<String, Object>> selectTmplte1List(HashMap<String, Object> paramap) throws Exception {
		return clcinf2DAO.selectTmplte1List(paramap);
	}

	@Override
	public List<HashMap<String, Object>> selectTmplte2List(HashMap<String, Object> paramap) throws Exception {
		return clcinf2DAO.selectTmplte2List(paramap);
	}

	@Override
	public List<HashMap<String, Object>> selectTmplte3List(HashMap<String, Object> paramap) throws Exception {
		return clcinf2DAO.selectTmplte3List(paramap);
	}

	@Override
	public List<HashMap<String, Object>> selectTmplte4List(HashMap<String, Object> paramap) throws Exception {
		return clcinf2DAO.selectTmplte4List(paramap);
	}

	@Override
	public List<HashMap<String, Object>> selectTmplte5List(HashMap<String, Object> paramap) throws Exception {
		return clcinf2DAO.selectTmplte5List(paramap);
	}

	@Override
	public int insertAplcTempDts(List<HashMap<String, Object>> paramList) throws Exception {
		HashMap paramMap = new HashMap();

		int resultCnt = 0;

		if( paramList.size() > 0 ){
            for (int i = 0; i < paramList.size(); i++) {
                resultCnt += clcinf2DAO.insertAplcTempDts(paramList.get(i));
            }
        }

		return resultCnt;
	}

	public void saveReqData(ClcInfRspVo clcInfRspVo) throws Exception {
		try {
			//임시등록 데이터 조회
			List<HashMap<String, Object>> tmpList = this.selectTmpDtsList(clcInfRspVo);
			List<HashMap<String, Object>> tmpAddList = this.selectTmpAplcAddTmpDtsList(clcInfRspVo);
			
			//히스토리단계에서 진입인 경우 이전제출 데이터 일괄삭제
			HashMap<String, Object> thisStp = this.selectAplDtsStep(clcInfRspVo);
			if(! CommonEnum.DataServiceStep.STEP04.stepCd().equals( String.valueOf(thisStp.get("aplcstpspcd")))) {
				//1.업로드 파일 제거
				String histDatas = clcInfRspVo.getHistDataArray();
				String histDataArray[] =  histDatas.split(",");

				//이전화면 보기단계에서 기적용 데이터 수정시 처리로직..
				clcInfRspVo.setHistDataArrays(histDataArray);

				List<ClcInfRspVo> delData = this.selectDtsList2(clcInfRspVo);
		        if(delData != null && delData.size() > 0) {
		        	for(int i=0;i< delData.size();i++) {
		        		//1.파일제거
		        		DataServiceFileVO fileVo = new DataServiceFileVO();
				       	fileVo.setDataAplcNo(delData.get(i).getDataAplcNo() + "");
				       	fileVo.setAttfSeq(delData.get(i).getAttfseq());
				       	fileVo.setAttfSpcd("06");
				       	fileVo.setAttdNmSpcd("06");

				       	DataServiceFileVO deleteFile = fileMngUtil.selectFileOne(fileVo);

						if(deleteFile != null && !CommonUtils.empty(deleteFile.getDataAplcNo()) ) {
							fileMngUtil.deletetDataFile(deleteFile);
						}
						//2.데이터셋 제거
						this.deleteDataAplcDts(delData.get(i));
						this.deleteAddDataAplcDts(delData.get(i));
		        	}
		         }
			}

			//제출데이터 등록
			if(tmpList.size() > 0) {
				for(int i=0;i<tmpList.size();i++) {					
					this.insertAplcDts(tmpList.get(i));
				}
			}

			if(tmpAddList.size() > 0) {
				for(int i=0;i<tmpAddList.size();i++) {
					this.insertAplcAddDts(tmpAddList.get(i));
				}
			}

			//임시등록 데이터 일괄삭제
			if(tmpList.size() > 0) {
				HashMap<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("dataAplcNo", clcInfRspVo.getDataAplcNo());

				clcInfReserchDAO.deleteTmpDataAplcDts(paramMap);
			}

			if(tmpAddList.size() > 0) {
				HashMap<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("dataAplcNo", clcInfRspVo.getDataAplcNo());

				clcinf2DAO.deleteTmpAddDataAplcDts(paramMap);
			}
			
			ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
			clcInfReserchVo.setUserId(clcInfRspVo.getUserId());
			clcInfReserchVo.setDataAplcNo(clcInfRspVo.getDataAplcNo());
			clcInfReserchVo.setAplcStpSpcd(CommonEnum.DataServiceStep.STEP04.stepCd());
			clcInfReserchVo.setDatpStatSpcd("0000000004");

			//상태값 변경
			changeClcinfStep(clcInfReserchVo,CommonEnum.DataServiceStep.STEP05.stepCd());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int insertAplcDts(HashMap<String, Object> paramMap) throws Exception {
		return clcinf2DAO.insertAplcDts(paramMap);
	}

	@Override
	public List<HashMap<String, Object>> selectTmpDtsList(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectTmpDtsList(clcInfRspVo);
	}

	@Override
	public List<DataServiceFileVO> selectDataServiceFileList(DataServiceFileVO dataVo) throws Exception {
		return clcinf2DAO.selectDataServiceFileList(dataVo);
	}

	@Override
	public int selectAplDtsListCnt(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectAplDtsListCnt(clcInfRspVo);
	}

	@Override
	public List<HashMap<String, Object>> selectAplDtsList(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectAplDtsList(clcInfRspVo);
	}

	@Override
	public int insertAplcRvw(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.insertAplcRvw(clcInfRspVo);
	}

	@Override
	public int insertPrvdInst(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.insertPrvdInst(clcInfRspVo);
	}

	@Override
	public void saveAplcRvw(ClcInfRspVo clcInfRspVo) throws Exception {
		ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
		clcInfReserchVo.setUserId(clcInfRspVo.getUserId());
		clcInfReserchVo.setDataAplcNo(clcInfRspVo.getDataAplcNo());
		clcInfReserchVo.setDataTpcd(clcInfRspVo.getDataTpcd());
		clcInfReserchVo.setAplcStpSpcd(CommonEnum.DataServiceStep.STEP05.stepCd());

		//신청상태 이력정보(접수완료) 설정
		clcInfReserchVo.setDatpStatSpcd("0000000006");
		
		//상태값 변경 및 이력상태 저장
		changeClcinfStep(clcInfReserchVo,CommonEnum.DataServiceStep.STEP06.stepCd());
		
		//등록 데이터 조회
		List<ClcInfRspVo> clcInfRspVoList = this.selectDtsList(clcInfRspVo);

		//데이터신청 심의정보 등록
		if(clcInfRspVoList.size() > 0) {
			if(clcinf2DAO.selectPrvdInstCnt(clcInfRspVoList.get(0)) > 0) {
				clcinf2DAO.deletePrvdInst(clcInfRspVoList.get(0));
			}
			for(int i=0;i<clcInfRspVoList.size();i++) {
				clcInfRspVoList.get(i).setUserId(clcInfRspVo.getUserId());
				this.insertPrvdInst(clcInfRspVoList.get(i));
			}
			if(clcinf2DAO.selectAplcRvwCnt(clcInfReserchVo) > 0) {
				clcinf2DAO.deleteAplcRvw(clcInfReserchVo);
			}
			this.insertAplcRvw(clcInfRspVo);
			
			//신청상태(임상/공공/결합) 이력정보(심의중) 설정 및 저장
			if("01".equals(clcInfRspVo.getDataTpcd())) {
				clcInfReserchVo.setDatpStatSpcd("0000000007");
			}else if("02".equals(clcInfRspVo.getDataTpcd())) {
				clcInfReserchVo.setDatpStatSpcd("0000000017"); 
			}else if("03".equals(clcInfRspVo.getDataTpcd())){
				clcInfReserchVo.setDatpStatSpcd("0000000027");
			}
			this.insertDtapStatHst(clcInfReserchVo);
			//데이터 신청 완료 알람등록
			almService.registAlrm(NtceUserInfo.NTCE_DATA_03.getSpDtlcd(), clcInfReserchVo.getDataAplcNo(), "");
			
			//데이터 제공기관 별 심의자들에게 알림 및 메일 발송
			almService.registAlrm(NtceUserInfo.NTCE_REVW_02.getSpDtlcd(), clcInfReserchVo.getDataAplcNo(), "");

			
		}
	}

	@Override
	public List<ClcInfRspVo> selectDtsList(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectDtsList(clcInfRspVo);
	}

	@Override
	public List<ClcInfRspVo> selectDtsList2(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectDtsList2(clcInfRspVo);
	}

	@Override
	public int insertAplcAddDts(HashMap<String, Object> paramMap) throws Exception {
		return clcinf2DAO.insertAplcAddDts(paramMap);
	}

	@Override
	public int updateAplcAddTmpDts(HashMap<String, Object> paramMap) throws Exception {
		return clcinf2DAO.updateAplcAddTmpDts(paramMap);
	}

	@Override
	public int insertAplcAddTmpDts(HashMap<String, Object> paramMap) throws Exception {
		return clcinf2DAO.insertAplcAddTmpDts(paramMap);
	}

	@Override
	public int selectTmpAplcAddTmpDtsCnt(HashMap<String, Object> paramMap) throws Exception {
		return clcinf2DAO.selectTmpAplcAddTmpDtsCnt(paramMap);
	}

	@Override
	public List<HashMap<String, Object>> selectTmpAplcAddTmpDtsList(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectTmpAplcAddTmpDtsList(clcInfRspVo);
	}

	@Override
	public void deleteTmpAddDataAplcDts(HashMap<String, Object> paramMap) throws Exception {
		clcinf2DAO.deleteTmpAddDataAplcDts(paramMap);
	}

	@Override
	public HashMap<String, Object> selectTmpDtsOne(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectTmpDtsOne(clcInfRspVo);
	}

	@Override
	public void deleteTmpAddDataAplcDtsOne(HashMap<String, Object> paramMap) throws Exception {
		clcinf2DAO.deleteTmpAddDataAplcDtsOne(paramMap);
	}

	@Override
	public void deleteTmpDataAplcDtsOne(HashMap<String, Object> paramMap) throws Exception {
		clcinf2DAO.deleteTmpDataAplcDtsOne(paramMap);
	}

	@Override
	public List<HashMap<String, Object>> selectAplTmpDtsHistList(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectAplTmpDtsHistList(clcInfRspVo);
	}
	
	@Override
	public List<HashMap<String, Object>> selectAplDtsHistList(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectAplDtsHistList(clcInfRspVo);
	}

	@Override
	public List<HashMap<String, Object>> selectAplDtsHistList2(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectAplDtsHistList2(clcInfRspVo);
	}

	@Override
	public List<HashMap<String, Object>> selectAplAddDtsHistList2(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectAplAddDtsHistList2(clcInfRspVo);
	}

	@Override
	public HashMap<String, Object> selectAplDtsStep(ClcInfRspVo clcInfRspVo) throws Exception {
		return clcinf2DAO.selectAplDtsStep(clcInfRspVo);
	}

	@Override
	public void deleteAllDataAplcDts(ClcInfRspVo clcInfRspVo) throws Exception {
		clcinf2DAO.deleteAllDataAplcDts(clcInfRspVo);
	}

	@Override
	public void deleteAllAddDataAplcDts(ClcInfRspVo clcInfRspVo) throws Exception {
		clcinf2DAO.deleteAllAddDataAplcDts(clcInfRspVo);
	}

	@Override
	public void deleteDataAplcDts(ClcInfRspVo clcInfRspVo) throws Exception {
		clcinf2DAO.deleteDataAplcDts(clcInfRspVo);
	}

	@Override
	public void deleteAddDataAplcDts(ClcInfRspVo clcInfRspVo) throws Exception {
		clcinf2DAO.deleteAddDataAplcDts(clcInfRspVo);
	}

	@Override
	public List<ClcInfReqTreeVo> selectPrtiTreeList01() throws Exception {
		return clcinf2DAO.selectPrtiTreeList01();
	}

	@Override
	public List<ClcInfReqTreeVo> selectPrtiTreeList02(ClcInfReserchVo vo) throws Exception {
		return clcinf2DAO.selectPrtiTreeList02(vo);
	}

	@Override
	public List<ClcInfReqTreeVo> selectPrtiTreeList03() throws Exception {
		return clcinf2DAO.selectPrtiTreeList03();
	}

	@Override
	public List<HashMap<String, Object>> selectPubTmplte1List(HashMap<String, Object> paramap) throws Exception {
		return clcinf2DAO.selectPubTmplte1List(paramap);
	}

	@Override
	public List<HashMap<String, Object>> selectPubTmplte2List(HashMap<String, Object> paramap) throws Exception {
		return clcinf2DAO.selectPubTmplte2List(paramap);
	}

	@Override
	public int insertDtapStatHst(ClcInfReserchVo clcInfReserchVo) throws Exception {
		return clcinf2DAO.insertDtapStatHst(clcInfReserchVo);
	}
	
	private void changeClcinfStep(ClcInfReserchVo clcInfReserchVo, String nextClcinfStep) {
		ClcInfReserchVo  targetData = clcInfReserchDAO.selectDetailClcInfReserch(clcInfReserchVo);

		if(targetData.getAplcStpSpcd().equals(AplcProgStcd.STCD06.aplcProgStcd()) 
				||  targetData.getAplcStpSpcd().equals(clcInfReserchVo.getAplcStpSpcd())) {
			clcInfReserchVo.setAplcStpSpcd(nextClcinfStep);
			clcInfReserchDAO.changeClcinfStep(clcInfReserchVo);
			
			//다음단계가 제출자료 단계인 경우 신청상태 심의중 상태로 변경저장	
			if(CommonEnum.DataServiceStep.STEP06.stepCd().equals(nextClcinfStep)) {
				clcInfReserchVo.setAplcProgStcd("03");
				clcinf2DAO.updateAplcProgStcd(clcInfReserchVo);
			}

			//데이터신청 이력저장 (이전단계에서 진행건은 제외)
			clcinf2DAO.insertDtapStatHst(clcInfReserchVo);
		}
	}

	@Override
	public List<ClcInfReqTreeVo> selectPub01DtsTreeList() throws Exception {
		return clcinf2DAO.selectPub01DtsTreeList();
	}
	
	@Override
	public List<ClcInfReqTreeVo> selectPub02DtsTreeList() throws Exception {
		return clcinf2DAO.selectPub02DtsTreeList();
	}

	@Override
	public void updateAplcProgStcd(ClcInfReserchVo vo) throws Exception {
		clcinf2DAO.updateAplcProgStcd(vo);
	}

	@Override
	public String selectNccApiList(String dataAplcNo) {
		return clcinf2DAO.selectNccApiList(dataAplcNo);
	}
	
	@Override
	public List<Map<String, Object>> selectNccApiFileList(DataServiceFileVO vo) throws Exception {
		return clcinf2DAO.selectNccApiFileList(vo);
	}

}
