package kcure.portal.sys.aum.mng.service;

import java.util.List;
import java.util.Map;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.aum.service
  * @FileName : AumService.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
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
public interface AumMngService {

	/**
	  * @Method Name : selectAuthorList
	  * @작성일 : 2023. 1. 4.
	  * @작성자 : hjjeon
	  * @Method 설명 : 개별사용자에게 할당된 권한리스트 조회
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectAuthorList(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : selectAuthorListTotCnt
	  * @작성일 : 2023. 1. 4.
	  * @작성자 : hjjeon
	  * @Method 설명 : 목록조회 카운트를 반환한다
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : int
	  */
	public int selectAuthorListTotCnt(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : saveAuthor
	  * @작성일 : 2023. 1. 4.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자의 시스테접근권한를 화면에서 입력하여 입력항목의 정합성을 체크하고 데이터베이스에 저장
	  *  <p>
	  *  </p>
	  * @param : gridParameterMap GridParameterMap
	  * @return :
	  */
	public void saveAuthor(GridParameterMap gridParameterMap) throws Exception;

	/**
	  * @Method Name : selectAuthAllList
	  * @작성일 : 2023. 1. 25.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 전체 목록
	  *  <p>
	  *  </p>
	  * @param :
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectAuthAllList() throws Exception;

	/**
	  * @Method Name : selectAuthAllListTotCnt
	  * @작성일 : 2023. 1. 26.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 전체 목록 총갯수
	  *  <p>
	  *  </p>
	  * @param :
	  * @return : int
	  */
	public int selectAuthAllListTotCnt() throws Exception;
}

