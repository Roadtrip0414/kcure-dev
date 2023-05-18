package kcure.portal.sys.clb.tbl.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.clb.tbl.service.impl
 * @FileName : ClbTblDAO.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 : 표준테이블관리 처리를 위한 DAO 클래스를 정의한다.
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

@Repository("sysClbTblDAO")
public class ClbTblDAO extends EgovComAbstractDAO {
	
	private static final String sqlNameSpace = "sysClbTbl.";

	/**
	 * @Method Name : selectSrchCrcnNmList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 : 암종 목록 조회
	 * @param : String
	 * @return : List
	 */
	public List<?> selectSrchCrcnNmList() throws Exception {
		return selectList(sqlNameSpace + "selectSrchCrcnNmList");
	}

    /**
	 * @Method Name : selectClsTblList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  분류및테이블관리 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<ClbTblVO> selectClsTblList(ClbTblVO clbTblVO) throws Exception {
		return selectList(sqlNameSpace + "selectClsTblList", clbTblVO);
	}

    /**
	 * @Method Name : C/U/D ClsTbl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  분류및테이블관리 C/U/D
	 * @param : model
	 * @return :
	 */
	public void insertClsTbl(ClbTblVO clbTblVO) throws Exception {
		insert(sqlNameSpace + "insertClsTbl", clbTblVO);
	}
	
	public void updateClsTbl(ClbTblVO clbTblVO) throws Exception {
		update(sqlNameSpace + "updateClsTbl", clbTblVO);
	}
	
	public void deleteClsTbl(ClbTblVO clbTblVO) throws Exception {
		delete(sqlNameSpace + "deleteClsTbl", clbTblVO);
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
		return selectList(sqlNameSpace + "selectDtsMclsCdList");
	}
}
