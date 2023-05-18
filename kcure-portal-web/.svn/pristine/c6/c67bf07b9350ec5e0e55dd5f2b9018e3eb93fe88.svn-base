package kcure.portal.sys.bbs.dur.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kcure.portal.sys.cmm.service.impl.ComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.dur.service.impl
  * @FileName : BbsDurDAO.java
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
@Repository("bbsDurDAO")
public class BbsDurDAO extends ComAbstractDAO {

	/**
	  * @Method Name : selectDataUtlcList
	  * @작성일 : 2023. 2. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터 활용사례 목록 조회
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectDataUtlcList(DataUtlcVO dataUtlcVO) throws Exception {
		return selectList("Bbs.selectDataUtlcList", dataUtlcVO);
	}

	/**
	  * @Method Name : selectDataUtlcListTotCnt
	  * @작성일 : 2023. 2. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터 활용사례 목록 총 갯수
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return : int
	  */
	public int selectDataUtlcListTotCnt(DataUtlcVO dataUtlcVO) throws Exception {
		return selectOne("Bbs.selectDataUtlcListTotCnt", dataUtlcVO);
	}

	/**
	  * @Method Name : insertDataUtlc
	  * @작성일 : 2023. 2. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터 활용사례 등록
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return :
	  */
	public void insertDataUtlc(DataUtlcVO dataUtlcVO) throws Exception {
		insert("Bbs.insertDataUtlc", dataUtlcVO);
	}

	/**
	  * @Method Name : updateDataUtlc
	  * @작성일 : 2023. 2. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터 활용사례 수정
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return :
	  */
	public void updateDataUtlc(DataUtlcVO dataUtlcVO) throws Exception {
		update("Bbs.updateDataUtlc", dataUtlcVO);
	}

	/**
	  * @Method Name : deleteDataUtlc
	  * @작성일 : 2023. 2. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터 활용사례 삭제
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return :
	  */
	public void deleteDataUtlc(DataUtlcVO dataUtlcVO) throws Exception {
		delete("Bbs.deleteDataUtlc", dataUtlcVO);
	}

	/**
	  * @Method Name : insertDataUtlcInst
	  * @작성일 : 2023. 2. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터 활용사례 기관 등록
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return :
	  */
	public void insertDataUtlcInst(DataUtlcVO dataUtlcVO) throws Exception {
		insert("Bbs.insertDataUtlcInst", dataUtlcVO);
	}

	/**
	  * @Method Name : deleteDataUtlcInst
	  * @작성일 : 2023. 2. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터 활용사례 기관 삭제
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return :
	  */
	public void deleteDataUtlcInst(DataUtlcVO dataUtlcVO) throws Exception {
		delete("Bbs.deleteDataUtlcInst", dataUtlcVO);
	}

	/**
	  * @Method Name : selectUtlcRgstSeq
	  * @작성일 : 2023. 2. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터활용사례 순번 조회
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return : int
	  */
	public int selectUtlcRgstSeq(DataUtlcVO dataUtlcVO) throws Exception {
		return selectOne("Bbs.selectUtlcRgstSeq",dataUtlcVO);
	}

	/**
	  * @Method Name : selectDataUtlcDetail
	  * @작성일 : 2023. 2. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터 활용사례 상세 조회
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectDataUtlcDetail(DataUtlcVO dataUtlcVO) throws Exception {
		return selectOne("Bbs.selectDataUtlcDetail", dataUtlcVO);
	}

	/**
	  * @Method Name : selectDataUtlcRsrInstDetail
	  * @작성일 : 2023. 2. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 : 데이터활용사례 기관 조회
	  *  <p>
	  *  </p>
	  * @param : dataUtlcVO DataUtlcVO
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectDataUtlcRsrInstDetail(DataUtlcVO dataUtlcVO) throws Exception {
		return selectOne("Bbs.selectDataUtlcRsrInstDetail", dataUtlcVO);
	}
}
