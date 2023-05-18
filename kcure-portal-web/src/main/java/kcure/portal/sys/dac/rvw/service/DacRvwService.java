package kcure.portal.sys.dac.rvw.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.dac.rvw.service.impl.DacRvwSearchVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.dac.rvw.service
  * @FileName : DacRvwService.java
  * @since : 2023. 3. 10.
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
public interface DacRvwService {
	/**
	  * @Method Name : selectRvwStpSpcdList
	  * @작성일 : 2023. 3. 13.
	  * @작성자 : parkgu
	  * @Method 설명 : 데이터신청관리 화면의 진행상태 목록
	  *  <p>
	  *  </p>
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String, Object>> selectRvwStpSpcdList() throws Exception;

	/**
	  * @Method Name : selectDataAplcRvwList
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : parkgu
	  * @Method 설명 : 데이터신청관리 검색
	  *  <p>
	  *  </p>
	  * @param : dacRvwSearchVO DacRvwSearchVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String, Object>> selectDataAplcRvwList(DacRvwSearchVO searchVO) throws Exception;

	/**
	  * @Method Name : selectDataAplcRvwListTotCnt
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : parkgu
	  * @Method 설명 : 데이터신청관리 검색 카운트
	  *  <p>
	  *  </p>
	  * @param : dacRvwSearchVO DacRvwSearchVO
	  * @return : int
	  */
	public int selectDataAplcRvwListTotCnt(DacRvwSearchVO searchVO) throws Exception;
}

