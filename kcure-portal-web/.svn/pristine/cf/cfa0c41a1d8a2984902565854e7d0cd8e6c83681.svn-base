package kcure.portal.sys.bbs.qna.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.bbs.qna.service.impl.QnaAnsVO;
import kcure.portal.sys.bbs.qna.service.impl.QnaQstnVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.qna.service
  * @FileName : BbsQnaService.java
  * @since : 2023. 3. 7.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	QNA Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface BbsQnaService {
	/**
	  * @Method Name : selectQnaList
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : Qna 목록
	  *  <p>
	  *  </p>
	  * @param : QnaQstnVO qnaQstnVO
	  * @return :
	  */
	public List<Map<String,Object>> selectQnaList(QnaQstnVO qnaQstnVO) throws Exception;
	/**
	  * @Method Name : selectQnaListTotCnt
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : Qna 목록 Count
	  *  <p>
	  *  </p>
	  * @param : QnaQstnVO qnaQstnVO
	  * @return :
	  */
	public int selectQnaListTotCnt(QnaQstnVO qnaQstnVO) throws Exception;

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
	public Map<String,Object> selectQnaDetail(QnaQstnVO qnaQstnVO) throws Exception;

	/**
	  * @Method Name : saveQnaAns
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	Qna 답변 저장
	  *  </p>
	  * @param : QnaAnsVO qnaAnsVO
	  * @return :
	  */
	public void saveQnaAns(QnaAnsVO qnaAnsVO) throws Exception;

	/**
	  * @Method Name : deleteQna
	  * @작성일 : 2023. 3. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	Qna 삭제
	  *  </p>
	  * @param : QnaAnsVO qnaAnsVO
	  * @return :
	  */
	public void deleteQna(QnaQstnVO qnaQstnVO) throws Exception;
}
