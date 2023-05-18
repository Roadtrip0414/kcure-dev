package kcure.portal.sys.clb.tbl.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.ObjectUtils;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.clb.tbl.service.ClbTblService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.clb.tbl.service.impl
 * @FileName : ClbTblServiceImpl.java
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

@Service("sysClbTblService")
public class ClbTblServiceImpl extends EgovAbstractServiceImpl implements ClbTblService {

	@Resource(name="sysClbTblDAO")
    private ClbTblDAO clbTblDAO;
	
	/**
	 * @Method Name : selectSrchCrcnNmList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 : 암종 목록 조회
	 * @param : String
	 * @return : List
	 */
	@Override
	public List<?> selectSrchCrcnNmList() throws Exception {
		return clbTblDAO.selectSrchCrcnNmList();
	}

    /**
	 * @Method Name : selectClsTblList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  분류및테이블관리 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<ClbTblVO> selectClsTblList(ClbTblVO clbTblVO) throws Exception {
		return clbTblDAO.selectClsTblList(clbTblVO);
	}

    /**
	 * @Method Name : saveClsTbl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  분류및테이블관리 C/U/D
	 * @param : model
	 * @return :
	 */
	@Override
	public void saveClsTbl(GridParameterMap gridParameterMap) throws Exception {
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
    			clbTblVO.setTblKnm(ObjectUtils.toString(saveObj.get("tblKnm")));
    			clbTblVO.setTblOrd(Integer.parseInt(ObjectUtils.toString(saveObj.get("tblOrd"))));
    			//clbTblVO.setCrcnNm(ObjectUtils.toString(saveObj.get("crcnNm")));
    			clbTblVO.setLclsNm(ObjectUtils.toString(saveObj.get("lclsNm")));
    			clbTblVO.setMclsNm(ObjectUtils.toString(saveObj.get("mclsNm")));
    			clbTblVO.setLdngDtrnCont(ObjectUtils.toString(saveObj.get("ldngDtrnCont")));
    			clbTblVO.setCollBldtColKnm(ObjectUtils.toString(saveObj.get("collBldtColKnm")));
    			clbTblVO.setCollBldtColEnm(ObjectUtils.toString(saveObj.get("collBldtColEnm")));
    			clbTblVO.setFrstRegpId(user.getId());
    			clbTblVO.setDtsLclsCd(ObjectUtils.toString(saveObj.get("dtsLclsCd")));
    			
    			//PK 중복처리를 위해 삭제를 먼저 한다(엑셀업로드용)
    			clbTblVO.setOldTblEnm(ObjectUtils.toString(saveObj.get("oldTblEnm")));
    			if (clbTblVO.getOldTblEnm().equals(clbTblVO.getTblEnm())) {
    				clbTblDAO.deleteClsTbl(clbTblVO);
    			}
				
    			clbTblDAO.insertClsTbl(clbTblVO);
    		}
    	}

    	//수정
    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject saveObj = (JSONObject) obj;

    			ClbTblVO clbTblVO = new ClbTblVO();
    			clbTblVO.setTblEnm(ObjectUtils.toString(saveObj.get("tblEnm")));
    			clbTblVO.setTblKnm(ObjectUtils.toString(saveObj.get("tblKnm")));
    			clbTblVO.setTblOrd(Integer.parseInt(ObjectUtils.toString(saveObj.get("tblOrd"))));
    			//clbTblVO.setCrcnNm(ObjectUtils.toString(saveObj.get("crcnNm")));
    			clbTblVO.setLclsNm(ObjectUtils.toString(saveObj.get("lclsNm")));
    			clbTblVO.setMclsNm(ObjectUtils.toString(saveObj.get("mclsNm")));
    			clbTblVO.setLdngDtrnCont(ObjectUtils.toString(saveObj.get("ldngDtrnCont")));
    			clbTblVO.setCollBldtColKnm(ObjectUtils.toString(saveObj.get("collBldtColKnm")));
    			clbTblVO.setCollBldtColEnm(ObjectUtils.toString(saveObj.get("collBldtColEnm")));
    			clbTblVO.setFrstRegpId(user.getId());
    			clbTblVO.setDtsLclsCd(ObjectUtils.toString(saveObj.get("dtsLclsCd")));
    			
    			//PK 변경 시 처리
    			clbTblVO.setOldTblEnm(ObjectUtils.toString(saveObj.get("oldTblEnm")));
    			if (clbTblVO.getOldTblEnm().equals(clbTblVO.getTblEnm())) {
    				clbTblDAO.updateClsTbl(clbTblVO);
    			} else {
    				clbTblDAO.deleteClsTbl(clbTblVO);
        			clbTblDAO.insertClsTbl(clbTblVO);
    			}
    		}
    	}

    	//삭제
    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject saveObj = (JSONObject) obj;

    			ClbTblVO clbTblVO = new ClbTblVO();
    			clbTblVO.setOldTblEnm(ObjectUtils.toString(saveObj.get("oldTblEnm")));
    			
    			clbTblDAO.deleteClsTbl(clbTblVO);
    		}
    	}
	}

	/**
	 * @Method Name : selectDtsMclsCdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 : 대분류 목록 조회
	 * @param : String
	 * @return : List
	 */
	public List<Map<String, Object>> selectDtsMclsCdList() throws Exception {
		return clbTblDAO.selectDtsMclsCdList();
	}
}
