package kcure.portal.bbs.qna.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.bbs.qna.service.QnaService;
import kcure.portal.sys.bbs.qna.service.impl.QnaQstnVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.qna.service.impl
  * @FileName : QnaServiceImpl.java
  * @since : 2023. 3. 15.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	문의하기 ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("QnaService")
public class QnaServiceImpl implements QnaService {

	@Resource(name = "QnaDAO")
	private QnaDAO qnaDAO;

	@Override
	public List<Map<String, Object>> selectQnaList(QnaQstnVO qnaQstnVO) throws Exception {
		return qnaDAO.selectQnaList(qnaQstnVO);
	}

	@Override
	public int selectQnaListTotCnt(QnaQstnVO qnaQstnVO) throws Exception {
		return qnaDAO.selectQnaListTotCnt(qnaQstnVO);
	}

	@Override
	public Map<String, Object> selectQnaDetail(QnaQstnVO qnaQstnVO) throws Exception {
		Map<String, Object> detailMap = qnaDAO.selectQnaDetail(qnaQstnVO);
		return detailMap;
	}

	@Override
	public void insertQna(QnaQstnVO qnaQstnVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		qnaQstnVO.setUserId(user.getId());
		qnaDAO.insertQna(qnaQstnVO);
	}

}
