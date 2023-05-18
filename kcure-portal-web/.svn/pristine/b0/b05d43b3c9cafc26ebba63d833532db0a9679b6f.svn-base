package kcure.portal.sys.pim.mng.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.pim.mng.service
  * @FileName : PimService.java
  * @since : 2023. 2. 6.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	참여기관 관리 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface PimMngService {
	/**
	  * @Method Name : selectPrtiList
	  * @작성일 : 2023. 2. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 : 참여기관 관리 목록 조회
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return :
	  */
	public List<Map<String,Object>> selectPrtiList(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : selectPrtiListTotCnt
	  * @작성일 : 2023. 2. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 : 참여기관 관리 목록 총 갯수
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : int
	  */
	public int selectPrtiListTotCnt(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : savePrti
	  * @작성일 : 2023. 2. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 : 참여기관 관리 저장
	  *  <p>
	  *  </p>
	  * @param : gridParameterMap GridParameterMap
	  * @return : String
	  */
	public String savePrti(GridParameterMap gridParameterMap) throws Exception;

	/**
	  * @Method Name : selectPrtiAllList
	  * @작성일 : 2023. 2. 1.
	  * @작성자 : hjjeon
	  * @Method 설명 : 기관 코드 콤보 조회
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return : List
	  */
	public List<?> selectPrtiAllList(String param) throws Exception;
}
