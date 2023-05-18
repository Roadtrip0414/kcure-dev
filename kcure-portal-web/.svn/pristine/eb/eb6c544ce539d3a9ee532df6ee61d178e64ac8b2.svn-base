package kcure.portal.sys.clb.col.service;

import java.util.List;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.clb.tbl.service.impl.ClbTblVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.clb.col.service
 * @FileName : ClbColService.java
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
public interface ClbColService {
    /**
	 * @Method Name : selectClsTblColTreeList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 트리 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<ClbTblVO> selectClsTblColTreeList(ClbTblVO clbTblVO) throws Exception;

    /**
	 * @Method Name : selectClsColList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 목록 조회
	 * @param : model
	 * @return :
	 */
	public List<ClbTblVO> selectClsColList(ClbTblVO clbTblVO) throws Exception;

    /**
	 * @Method Name : selectClsColListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	public int selectClsColListTotCnt(ClbTblVO clbTblVO) throws Exception;

    /**
	 * @Method Name : saveClsTbl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 C/U/D
	 * @param : model
	 * @return :
	 */
	public void saveClsCol(GridParameterMap gridParameterMap) throws Exception;
}
