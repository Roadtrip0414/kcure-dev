package kcure.portal.sys.rsr.dac.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.rsr.dac.service.impl.RsrDacSearchVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.dac.service
  * @FileName : RsrDacService.java
  * @since : 2023. 3. 15
  * @version 1.0
  * @author : parkgu
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
public interface RsrDacService {
	/**
	  * @Method Name : selectDataAplcEndList
	  * @작성일 : 2023. 3. 15
	  * @작성자 : parkgu
	  * @Method 설명 : 데이터신청관리 검색
	  *  <p>
	  *  </p>
	  * @param : rsrDacSearchVO RsrDacSearchVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String, Object>> selectDataAplcEndList(RsrDacSearchVO searchVO) throws Exception;

	/**
	  * @Method Name : selectDataAplcEndListTotCnt
	  * @작성일 : 2023. 3. 15
	  * @작성자 : parkgu
	  * @Method 설명 : 데이터신청관리 검색 카운트
	  *  <p>
	  *  </p>
	  * @param : rsrDacSearchVO RsrDacSearchVO
	  * @return : int
	  */
	public int selectDataAplcEndListTotCnt(RsrDacSearchVO searchVO) throws Exception;
}

