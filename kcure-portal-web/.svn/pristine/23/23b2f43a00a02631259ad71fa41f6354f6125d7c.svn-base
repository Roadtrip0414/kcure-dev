package kcure.portal.sys.dac.prc.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.dac.prc.service.impl.DacPrcSearchVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.dac.prc.service
  * @FileName : DacPrcService.java
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
public interface DacPrcService {

	/**
	  * @Method Name : selectSvcPrtiSpCdIs01
	  * @작성일 : 2023. 3. 10.
	  * @작성자 : parkgu
	  * @Method 설명 : 기관 심의자 목록 조회
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectSvcPrtiSpCdIs01(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : saveUserRvwPrncYn
	  * @작성일 : 2023. 3. 10.
	  * @작성자 : parkgu
	  * @Method 설명 : 기관 심의자 여부 저장
	  *  <p>
	  *  </p>
	  * @param : gridParameterMap GridParameterMap
	  * @return :
	  */
	public void saveUserRvwPrncYn(GridParameterMap gridParameterMap) throws Exception;

	/**
	  * @Method Name : selectUserList
	  * @작성일 : 2023. 3. 13.
	  * @작성자 : parkgu
	  * @Method 설명 : 기관 심의자용 회원 검색
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String, Object>> selectUserList(Map<String, String> param) throws Exception;
}

