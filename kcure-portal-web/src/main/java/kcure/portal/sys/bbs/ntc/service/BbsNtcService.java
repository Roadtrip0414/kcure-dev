package kcure.portal.sys.bbs.ntc.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.bbs.ntc.service.impl.BbsVO;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.service
  * @FileName : BbsService.java
  * @since : 2023. 2. 8.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	게시판 관리 service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface BbsNtcService {

	/**
	 * @Method Name : selectNtcList
	 * @작성일 : 2023. 2. 7.
	 * @작성자 : hjjeon
	 * @Method 설명 : 공지사항 게시판 목록 조회
	 *  <p>
	 *  </p>
	 * @param : bbsVO BbsVO
	 * @return : List<Map<String,Object>>
	 */
	public List<Map<String,Object>> selectNtcList(BbsVO bbsVO) throws Exception;

	/**
	  * @Method Name : selectBbsList
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 게시판 목록 조회
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectBbsList(BbsVO bbsVO) throws Exception;
	/**
	  * @Method Name : selectBbsListTotCnt
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 게시판 목록 총 갯수
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return : int
	  */
	public int selectBbsListTotCnt(BbsVO bbsVO) throws Exception;

	/**
	  * @Method Name : selectBbsDetail
	  * @작성일 : 2023. 2. 8.
	  * @작성자 : hjjeon
	  * @Method 설명 : 게시판 상세 조회
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectBbsDetail(BbsVO bbsVO) throws Exception;

	/**
	  * @Method Name : saveBbs
	  * @작성일 : 2023. 2. 8.
	  * @작성자 : hjjeon
	  * @Method 설명 : 게시판 글 저장
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return :
	  */
	public void saveBbs(BbsVO bbsVO) throws Exception;

	/**
	  * @Method Name : deleteBbs
	  * @작성일 : 2023. 2. 8.
	  * @작성자 : hjjeon
	  * @Method 설명 : 게시판 글 삭제
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return :
	  */
	public void deleteBbs(BbsVO bbsVO) throws Exception;
}
