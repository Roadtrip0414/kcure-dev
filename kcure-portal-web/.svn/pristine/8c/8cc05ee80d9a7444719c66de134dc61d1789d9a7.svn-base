package kcure.portal.sys.cdm.mng.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cdm.mng.service.CdmMngService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.cdm.mng.web.Impl
 * @FileName : CdmMngServiceImpl.java
 * @since : 2023. 02. 10.
 * @version 1.0
 * @author : jyk
 * @프로그램 설명 :	공통코드관리 처리를 위한 비즈니스 구현 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.02.01   kyh           최초생성
 *  </pre>
 */

@Service("cdmMngService")
public class CdmMngServiceImpl extends EgovAbstractServiceImpl implements CdmMngService{

	@Resource(name="cdmManageDAO")
	private CdmMngDAO cdmMngDAO;

	/**
	 * 코드목록,검색목록을 조회
	 * @param vo SymDefaultVO
	 * @return List
	 * @exception Exception
	 */
	@Override
	public List<Map<String, Object>> selectGrpCdList(CdmMngGrpVO vo) throws Exception {
		return cdmMngDAO.selectGrpCdList(vo);
	}

	/**
	 * 마스터코드목록,검색목록 총건수를 조회한다.
	 * @param vo ComDefaultVO
	 * @return int
	 * @exception Exception
	 */
	@Override
	public int selectGrpCdListTotCnt(CdmMngGrpVO vo) throws Exception {
		return cdmMngDAO.selectGrpCdListTotCnt(vo);
	}

	@Override
	public void saveCdmCdData(GridParameterMap gridParameterMap, String userId) throws Exception {
		CdmMngGrpVO[] inserts = gridParameterMap.getCreate(CdmMngGrpVO.class);
		CdmMngGrpVO[] updates = gridParameterMap.getUpdate(CdmMngGrpVO.class);
		CdmMngGrpVO[] deletes = gridParameterMap.getDelete(CdmMngGrpVO.class);

		for (CdmMngGrpVO vo : inserts) {
			vo.setFrstRegpId(userId);
			vo.setLastModpId(userId);
			cdmMngDAO.insertGrpCd(vo);
		}
		for (CdmMngGrpVO vo : updates) {
			vo.setLastModpId(userId);
			cdmMngDAO.updateGrpCd(vo);
		}
		for (CdmMngGrpVO vo : deletes) {
			//코드 마스터 테이블 삭제
			cdmMngDAO.deleteGrpCd(vo);

			//상세 테이블 삭제
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("grpCd", vo.getGrpCd());
			cdmMngDAO.deleteDetailCd(map);
		}

	}

	/**
	 * 상세코드목록 조회한다.
	 * @param vo  PrmVO
	 * @return List Map
	 * @exception Exception
	 */
	@Override
	public List<Map<String, Object>> selectDetailCdList(CdmMngDetailVO vo) throws Exception {
		return cdmMngDAO.selectDetailCdList(vo);
	}
	/**
	 * 상세코드목록 총건수를 조회한다.
	 * @param vo  PrmVO
	 * @return Integer
	 * @exception Exception
	 */
	@Override
	public int selecthDetailCdListTotCnt(CdmMngDetailVO vo) throws Exception {
		return cdmMngDAO.selectDetailCdListTotCnt(vo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void saveCdmDetailCdData(GridParameterMap gridParameterMap, String userId) throws Exception {
		CdmMngDetailVO[] inserts = gridParameterMap.getCreate(CdmMngDetailVO.class);
		JSONArray updateArr = gridParameterMap.getUpdate();
		JSONArray deleteArr = gridParameterMap.getDelete();

		for (CdmMngDetailVO vo : inserts) {
			vo.setFrstRegpId(userId);
			vo.setLastModpId(userId);
			cdmMngDAO.insertDetailCd(vo);
		}

    	//수정
    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;

    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			map.put("cdOputOrd", Integer.parseInt(String.valueOf(childObj.get("cdOputOrd"))));
    			map.put("lastModpId", userId);
    			cdmMngDAO.updateDetailCd(map);
    		}
    	}

    	//삭제
    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;
    			Map<String, Object> map = new HashMap<String, Object>();
    			map.putAll(childObj);
    			cdmMngDAO.deleteDetailCd(map);
    		}
    	}
	}
}
