package kcure.portal.sys.clb.col.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.ObjectUtils;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.clb.col.service.ClbColService;
import kcure.portal.sys.clb.tbl.service.impl.ClbTblVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.clb.col.service.impl
 * @FileName : ClbColServiceImpl.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	표준테이블관리 처리를 위한 비즈니스 구현 클래스를 정의한다.
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

@Service("sysClbColService")
public class ClbColServiceImpl extends EgovAbstractServiceImpl implements ClbColService {

	@Resource(name="sysClbColDAO")
    private ClbColDAO clbColDAO;

    /**
	 * @Method Name : selectClsTblColTreeList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 트리 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<ClbTblVO> selectClsTblColTreeList(ClbTblVO clbTblVO) throws Exception {
		return clbColDAO.selectClsTblColTreeList(clbTblVO);
	}

    /**
	 * @Method Name : selectClsColList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<ClbTblVO> selectClsColList(ClbTblVO clbTblVO) throws Exception {
		return clbColDAO.selectClsColList(clbTblVO);
	}

	/**
	 * @Method Name : selectClsColListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	@Override
	public int selectClsColListTotCnt(ClbTblVO clbTblVO) throws Exception {
		return clbColDAO.selectClsColListTotCnt(clbTblVO);
	}

    /**
	 * @Method Name : saveClsCol
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 C/U/D
	 * @param : model
	 * @return :
	 */
	@Override
	public void saveClsCol(GridParameterMap gridParameterMap) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	JSONArray createArr = gridParameterMap.getCreate();
    	JSONArray updateArr = gridParameterMap.getUpdate();
    	JSONArray deleteArr = gridParameterMap.getDelete();

    	//추가
    	if(createArr.size() > 0) {
    		for (Object obj : createArr) {
    			JSONObject saveObj = (JSONObject) obj;

    			ClbTblVO clbTblVO = new ClbTblVO();
    			clbTblVO.setTblEnm(ObjectUtils.toString(saveObj.get("tblEnm")));
    			clbTblVO.setColEnm(ObjectUtils.toString(saveObj.get("colEnm")));
    			clbTblVO.setColKnm(ObjectUtils.toString(saveObj.get("colKnm")));
    			clbTblVO.setColOrd(Integer.parseInt(ObjectUtils.toString(saveObj.get("colOrd"))));
    			clbTblVO.setDataTpCont(ObjectUtils.toString(saveObj.get("dataTpCont")));
    			clbTblVO.setPkOrd(ObjectUtils.toString(saveObj.get("pkOrd")));
    			clbTblVO.setDomnNm(ObjectUtils.toString(saveObj.get("domnNm")));
    			clbTblVO.setColExplCont(ObjectUtils.toString(saveObj.get("colExplCont")));
    			clbTblVO.setColVlCont(ObjectUtils.toString(saveObj.get("colVlCont")));
    			clbTblVO.setFrstRegpId(user.getId());
    			
    			//PK 중복처리를 위해 삭제를 먼저 한다(엑셀업로드용)
    			clbTblVO.setOldTblEnm(ObjectUtils.toString(saveObj.get("oldTblEnm")));
    			clbTblVO.setOldColEnm(ObjectUtils.toString(saveObj.get("oldColEnm")));
    			if (clbTblVO.getOldTblEnm().equals(clbTblVO.getTblEnm()) && clbTblVO.getOldColEnm().equals(clbTblVO.getColEnm())) {
    				clbColDAO.deleteClsCol(clbTblVO);
    			}
				
    			clbColDAO.insertClsCol(clbTblVO);
    		}
    	}

    	//수정
    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject saveObj = (JSONObject) obj;

    			ClbTblVO clbTblVO = new ClbTblVO();
    			clbTblVO.setTblEnm(ObjectUtils.toString(saveObj.get("tblEnm")));
    			clbTblVO.setColEnm(ObjectUtils.toString(saveObj.get("colEnm")));
    			clbTblVO.setColKnm(ObjectUtils.toString(saveObj.get("colKnm")));
    			clbTblVO.setColOrd(Integer.parseInt(ObjectUtils.toString(saveObj.get("colOrd"))));
    			clbTblVO.setDataTpCont(ObjectUtils.toString(saveObj.get("dataTpCont")));
    			clbTblVO.setPkOrd(ObjectUtils.toString(saveObj.get("pkOrd")));
    			clbTblVO.setDomnNm(ObjectUtils.toString(saveObj.get("domnNm")));
    			clbTblVO.setColExplCont(ObjectUtils.toString(saveObj.get("colExplCont")));
    			clbTblVO.setColVlCont(ObjectUtils.toString(saveObj.get("colVlCont")));
    			clbTblVO.setFrstRegpId(user.getId());
    			
    			//PK 변경 시 처리
    			clbTblVO.setOldTblEnm(ObjectUtils.toString(saveObj.get("oldTblEnm")));
    			clbTblVO.setOldColEnm(ObjectUtils.toString(saveObj.get("oldColEnm")));
    			if (clbTblVO.getOldTblEnm().equals(clbTblVO.getTblEnm()) && clbTblVO.getOldColEnm().equals(clbTblVO.getColEnm())) {
    				clbColDAO.updateClsCol(clbTblVO);
    			} else {
    				clbColDAO.deleteClsCol(clbTblVO);
    				clbColDAO.insertClsCol(clbTblVO);
    			}
    		}
    	}

    	//삭제
    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject saveObj = (JSONObject) obj;

    			ClbTblVO clbTblVO = new ClbTblVO();
    			clbTblVO.setOldTblEnm(ObjectUtils.toString(saveObj.get("oldTblEnm")));
    			clbTblVO.setOldColEnm(ObjectUtils.toString(saveObj.get("oldColEnm")));
    			
    			clbColDAO.deleteClsCol(clbTblVO);
    		}
    	}
	}
}
