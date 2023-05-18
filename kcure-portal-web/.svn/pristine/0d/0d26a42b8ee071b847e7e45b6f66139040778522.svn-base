package kcure.portal.sys.clb.tbl.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.clb.tbl.service.impl.ClbTblVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.clb.tbl.service
 * @FileName : ClbTblService.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	표준테이블관리에 대한 Service Interface를 정의한다.
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

public interface ClbTblService {
	/**
	 * @Method Name : selectSrchCrcnNmList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 : 암종 목록 조회
	 * @param : String
	 * @return : List
	 */
	public List<?> selectSrchCrcnNmList() throws Exception;

    /**
	 * @Method Name : selectClsTblList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  분류및테이블관리 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<ClbTblVO> selectClsTblList(ClbTblVO clbTblVO) throws Exception;

    /**
	 * @Method Name : saveClsTbl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  분류및테이블관리 C/U/D
	 * @param : model
	 * @return :
	 */
	public void saveClsTbl(GridParameterMap gridParameterMap) throws Exception;

	/**
	 * @Method Name : selectDtsMclsCdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 : 대분류 목록 조회
	 * @param : String
	 * @return : List
	 */
	public List<Map<String, Object>> selectDtsMclsCdList() throws Exception;
}
