package kcure.portal.sys.bbs.qna.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.service.CommonFileService;
import kcure.portal.cmn.service.CommonServiceFileMngUtil;
import kcure.portal.cmn.service.impl.CommonFileVO;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.sys.bbs.qna.service.BbsQnaService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.qna.service.impl
  * @FileName : BbsQnaServiceImpl.java
  * @since : 2023. 3. 7.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	QNA ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("bbsQnaService")
public class BbsQnaServiceImpl extends EgovAbstractServiceImpl implements BbsQnaService {
	@Resource(name="bbsQnaDAO")
    private BbsQnaDAO bbsQnaDAO;

	@Resource(name = "commonFileService")
	private CommonFileService commonFileService;

	@Resource(name="CommonServiceFileMngUtil")
	private CommonServiceFileMngUtil fileUtil;

	@Override
	public List<Map<String, Object>> selectQnaList(QnaQstnVO qnaQstnVO) throws Exception {
		return bbsQnaDAO.selectQnaList(qnaQstnVO);
	}

	@Override
	public int selectQnaListTotCnt(QnaQstnVO qnaQstnVO) throws Exception {
		return bbsQnaDAO.selectQnaListTotCnt(qnaQstnVO);
	}

	@Override
	public Map<String, Object> selectQnaDetail(QnaQstnVO qnaQstnVO) throws Exception {

		//문의 글 클릭 시 접수 상태 변경
		if("01".equals(qnaQstnVO.getQstnDlnStcd())) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			qnaQstnVO.setLastModpId(user.getId());
			qnaQstnVO.setQstnActpId(user.getId());		//접수자ID
			qnaQstnVO.setQstnDlnStcd("02");				//질문접수
			bbsQnaDAO.updateQnaQstn(qnaQstnVO);
		}

		Map<String, Object> resultMap = bbsQnaDAO.selectQnaDetail(qnaQstnVO);
		resultMap.put("userMbphNo", CommonUtils.phone_format(String.valueOf(resultMap.get("userMbphNo"))));
		return resultMap;
	}

	@Override
	public void saveQnaAns(QnaAnsVO qnaAnsVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		qnaAnsVO.setFrstRegpId(user.getId());
		qnaAnsVO.setLastModpId(user.getId());

		if(qnaAnsVO.getAnsSeq() > 0) {
			bbsQnaDAO.updateQnaAns(qnaAnsVO);
		}else {
			bbsQnaDAO.insertQnaAns(qnaAnsVO);

			QnaQstnVO qnaQstnVO = new QnaQstnVO();
			qnaQstnVO.setLastModpId(user.getId());
			qnaQstnVO.setDsgnAnspId(user.getId());		//답변자ID
			qnaQstnVO.setQstnDlnStcd("03");				//답변완료
			qnaQstnVO.setQstnId(qnaAnsVO.getQstnId());
			bbsQnaDAO.updateQnaQstn(qnaQstnVO);
		}
	}

	@Override
	public void deleteQna(QnaQstnVO qnaQstnVO) throws Exception {

		//파일 정보 조회
		CommonFileVO fileVO = new CommonFileVO();
		fileVO.setAtchFileId(qnaQstnVO.getAttfId());
		List<CommonFileVO> fileList = commonFileService.selectCommonFiles(fileVO);

		//첨부파일 삭제
		if(fileList.size() > 0) {
			fileUtil.deleteCommonFiles(fileList);
		}
		//답변 삭제
		bbsQnaDAO.deleteQnaAns(qnaQstnVO.getQstnId());
		//문의 삭제
		bbsQnaDAO.deleteQnaQstn(qnaQstnVO.getQstnId());
	}

}
