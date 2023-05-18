package kcure.portal.sys.clb.col.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.clb.tbl.service.impl.ClbTblVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.clb.col.service.impl
 * @FileName : ClbColDAO.java
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

@Repository("sysClbColDAO")
public class ClbColDAO extends EgovComAbstractDAO {
	
	private static final String sqlNameSpace = "sysClbTbl.";

    /**
	 * @Method Name : selectClsTblColTreeList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 트리 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<ClbTblVO> selectClsTblColTreeList(ClbTblVO clbTblVO) throws Exception {
		return selectList(sqlNameSpace + "selectClsTblColTreeList", clbTblVO);
	}

    /**
	 * @Method Name : selectClsColList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<ClbTblVO> selectClsColList(ClbTblVO clbTblVO) throws Exception {
		return selectList(sqlNameSpace + "selectClsColList", clbTblVO);
	}

	/**
	 * @Method Name : selectClsColListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	public int selectClsColListTotCnt(ClbTblVO clbTblVO) throws Exception {
		return selectOne(sqlNameSpace + "selectClsColListTotCnt", clbTblVO);
	}

    /**
	 * @Method Name : C/U/D ClsCol
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 C/U/D
	 * @param : model
	 * @return :
	 */
	public void insertClsCol(ClbTblVO clbTblVO) throws Exception {
		insert(sqlNameSpace + "insertClsCol", clbTblVO);
	}
	
	public void updateClsCol(ClbTblVO clbTblVO) throws Exception {
		update(sqlNameSpace + "updateClsCol", clbTblVO);
	}
	
	public void deleteClsCol(ClbTblVO clbTblVO) throws Exception {
		delete(sqlNameSpace + "deleteClsCol", clbTblVO);
	}
}
