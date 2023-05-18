package kcure.portal.sys.etc.srv.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.sys.etc.service
  * @FileName : EtcService.java
  * @since : 2023. 3. 29.
  * @version 1.0
  * @author : kyj
  * @프로그램 설명 :
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface EtcSrvService {

	/**
	  * @Method Name : selectSrvyList
	  * @작성일 : 2023. 3. 29.
      * @작성자 : kyj
	  * @Method 설명 : 설문조사 리스트 조회
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectSrvyList(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : selectSrvyListTotCnt
	  * @작성일 : 2023. 3. 29.
      * @작성자 : kyj
	  * @Method 설명 : 리스트 목록 카운트
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : int
	  */
	public int selectSrvyListTotCnt(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : saveSrvy
	  * @작성일 : 2023. 3. 29.
      * @작성자 : kyj
	  * @Method 설명 : 설문조사 리스트 저장, 수정, 삭제
	  *  <p>
	  *  </p>
	  * @param : gridParameterMap GridParameterMap
	  * @return :
	  */
	public void saveSrvy(GridParameterMap gridParameterMap) throws Exception;
}