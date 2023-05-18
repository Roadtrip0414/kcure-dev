package kcure.portal.bbs.qna.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.bbs.qna.service.impl.QnaQstnVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.qna.service
  * @FileName : QnaService.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 문의하기 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface QnaService {
	/**
	  * @Method Name : selectQnaList
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	문의하기 목록 조회
	  *  </p>
	  * @param : QnaQstnVO qnaQstnVO
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectQnaList(QnaQstnVO qnaQstnVO) throws Exception;

	/**
	  * @Method Name : selectQnaListTotCnt
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	문의하기 목록 총 갯수
	  *  </p>
	  * @param : QnaQstnVO qnaQstnVO
	  * @return : int
	  */
	public int selectQnaListTotCnt(QnaQstnVO qnaQstnVO) throws Exception;

	/**
	  * @Method Name : selectQnaDetail
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	문의하기 상세 조회
	  *  </p>
	  * @param : QnaQstnVO qnaQstnVO
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectQnaDetail(QnaQstnVO qnaQstnVO) throws Exception;

	/**
	  * @Method Name : insertQna
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	문의하기 저장
	  *  </p>
	  * @param : QnaQstnVO qnaQstnVO
	  * @return :
	  */
	public void insertQna(QnaQstnVO qnaQstnVO) throws Exception;
}
