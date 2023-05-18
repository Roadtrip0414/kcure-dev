package kcure.portal.cmn.api.lgn.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.api.lgn.service.LgnService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.api.lgn.service.impl
  * @FileName : LgnServiceImpl.java
  * @since : 2023. 3. 15.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	로그인 인증 API ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("lgnService")
public class LgnServiceImpl extends EgovAbstractServiceImpl implements LgnService{

	@Resource(name="lgnDAO")
    private LgnDAO lgnDAO;

	@Override
	public List<Map<String, Object>> selectSvcDataAplcList(String userId) throws Exception {

		List<Map<String,Object>> authDataList  = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> dataList = lgnDAO.selectSvcDataAplcList(userId);	//신청자 데이터 조회

		if(dataList.size() > 0) {

			for(int i=0; i < dataList.size(); i++) {
				Map<String,Object> dataMap = new LinkedHashMap<String, Object>();
				dataMap.put("dataAplcNo", dataList.get(i).get("dataAplcNo"));
				dataMap.put("dtuSdt", dataList.get(i).get("dtuSdt"));
				dataMap.put("dtuEdt", dataList.get(i).get("dtuEdt"));
				dataMap.put("cryOutApply", dataList.get(i).get("cryOutApply"));
				dataMap.put("prtiFile", dataList.get(i).get("prtiFile"));
				dataMap.put("carryFile", dataList.get(i).get("carryFile"));
				authDataList.add(dataMap);
			}
		}

		return authDataList;
	}

	@Override
	public List<Map<String, Object>> selectSvcDataAplcRvwList(String userId) throws Exception {
		List<Map<String,Object>> authDataList  = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> dataList = lgnDAO.selectSvcDataAplcRvwList(userId);
		if(dataList.size() > 0) {

			for(int i=0; i < dataList.size(); i++) {
				Map<String,Object> dataMap = new LinkedHashMap<String, Object>();
				dataMap.put("dataAplcNo", dataList.get(i).get("dataAplcNo"));
				dataMap.put("dtuSdt", dataList.get(i).get("dtuSdt"));
				dataMap.put("dtuEdt", dataList.get(i).get("dtuEdt"));
				dataMap.put("subFile", dataList.get(i).get("subFile"));
				authDataList.add(dataMap);
			}
		}
		return authDataList;
	}

}
