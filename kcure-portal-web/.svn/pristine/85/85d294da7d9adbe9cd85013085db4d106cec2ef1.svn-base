package kcure.portal.sys.bbs.ntc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kcure.portal.sys.cmm.service.impl.ComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.service.impl
  * @FileName : BbsDAO.java
  * @since : 2023. 2. 8.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	게시판 관리 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("bbsNtcDAO")
public class BbsNtcDAO extends ComAbstractDAO {
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
	public List<Map<String,Object>> selectNtcList(BbsVO bbsVO) throws Exception {
		return selectList("Bbs.selectNtcList", bbsVO);
	}

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
	public List<Map<String,Object>> selectBbsList(BbsVO bbsVO) throws Exception {
		return selectList("Bbs.selectBbsList", bbsVO);
	}

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
	public int selectBbsListTotCnt(BbsVO bbsVO) throws Exception {
		return selectOne("Bbs.selectBbsListTotCnt", bbsVO);
	}

	/**
	  * @Method Name : selectBbsDetail
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 게시판 상세 조회
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectBbsDetail(BbsVO bbsVO) throws Exception {
		return selectOne("Bbs.selectBbsDetail", bbsVO);
	}

	/**
	  * @Method Name : insertBbs
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 게시글 등록
	  *  <p>
	  *  </p>
	  * @param :  bbsVO BbsVO
	  * @return :
	  */
	public void insertBbs(BbsVO bbsVO) throws Exception {
		insert("Bbs.insertBbs", bbsVO);
	}

	/**
	  * @Method Name : updateBbs
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 게시글 수정
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return :
	  */
	public void updateBbs(BbsVO bbsVO) throws Exception {
		insert("Bbs.updateBbs", bbsVO);
	}

	/**
	  * @Method Name : deleteBbs
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 게시글 삭제
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return :
	  */
	public void deleteBbs(BbsVO bbsVO) throws Exception {
		insert("Bbs.deleteBbs", bbsVO);
	}

	/**
	  * @Method Name : updateRdcnt
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 조회수 업데이트
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return :
	  */
	public void updateRdcnt(BbsVO bbsVO) throws Exception {
		insert("Bbs.updateRdcnt", bbsVO);
	}

	/**
	  * @Method Name : selectMaxRdcnt
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 조회수 조회
	  *  <p>
	  *  </p>
	  * @param : bbsVO BbsVO
	  * @return : int
	  */
	public int selectMaxRdcnt(BbsVO bbsVO) throws Exception {
		return selectOne("Bbs.selectMaxRdcnt", bbsVO);
	}
}
