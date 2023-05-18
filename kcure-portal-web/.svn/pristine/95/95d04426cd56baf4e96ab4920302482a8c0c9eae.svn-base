package kcure.portal.sys.bbs.qna.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kcure.portal.sys.cmm.service.impl.ComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.qna.service.impl
  * @FileName : BbsQnaDAO.java
  * @since : 2023. 3. 7.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	QNA DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("bbsQnaDAO")
public class BbsQnaDAO extends ComAbstractDAO {

	/**
	  * @Method Name : selectQnaList
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	qna 목록 조회
	  *  </p>
	  * @param : QnaQstnVO qnaQstnVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectQnaList(QnaQstnVO qnaQstnVO) throws Exception {
		return selectList("Bbs.selectQnaList", qnaQstnVO);
	}

	/**
	  * @Method Name : selectQnaListTotCnt
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	qna 목록 COUNT
	  *  </p>
	  * @param : QnaQstnVO qnaQstnVO
	  * @return : int
	  */
	public int selectQnaListTotCnt(QnaQstnVO qnaQstnVO) throws Exception {
		return selectOne("Bbs.selectQnaListTotCnt", qnaQstnVO);
	}

	/**
	  * @Method Name : selectQnaDetail
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	qna 상세 조회
	  *  </p>
	  * @param : QnaQstnVO qnaQstnVO
	  * @return : Map<String,Object>
	  */
	public Map<String,Object> selectQnaDetail(QnaQstnVO qnaQstnVO) throws Exception {
		return selectOne("Bbs.selectQnaDetail", qnaQstnVO);
	}

	/**
	  * @Method Name : insertQnaAns
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	Qna 답변 저장
	  *  </p>
	  * @param : QnaAnsVO qnaAnsVO
	  * @return :
	  */
	public void insertQnaAns(QnaAnsVO qnaAnsVO) throws Exception {
		insert("Bbs.insertQnaAns", qnaAnsVO);
	}

	/**
	  * @Method Name : updateQnaQstn
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	Qna 수정
	  *  </p>
	  * @param :  QnaQstnVO qnaQstnVO
	  * @return :
	  */
	public void updateQnaQstn(QnaQstnVO qnaQstnVO) throws Exception {
		update("Bbs.updateQnaQstn", qnaQstnVO);
	}

	/**
	  * @Method Name : updateQnaAns
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	Qna 답변 수정
	  *  </p>
	  * @param : QnaAnsVO qnaAnsVO
	  * @return :
	  */
	public void updateQnaAns(QnaAnsVO qnaAnsVO) throws Exception {
		update("Bbs.updateQnaAns", qnaAnsVO);
	}
	/**
	 *
	  * @Method Name : deleteQnaQstn
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	Qna 삭제
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public void deleteQnaQstn(String qstnId) throws Exception {
		delete("Bbs.deleteQnaQstn", qstnId);
	}

	/**
	  * @Method Name : deleteQnaAns
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	Qna 답변 삭제
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public void deleteQnaAns(String qstnId) throws Exception {
		delete("Bbs.deleteQnaAns", qstnId);
	}
}
