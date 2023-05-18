package kcure.portal.cmn.service.impl;


import org.springframework.stereotype.Service;

import kcure.portal.cmn.service.CommonFileService;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.service.impl
  * @FileName : CommonFileServiceImpl.java
  * @since : 2023. 3. 8.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	공통 첨부파일 ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("commonFileService")
public class CommonFileServiceImpl extends EgovAbstractServiceImpl implements CommonFileService {


	@Resource(name = "commonFileDAO")
    private CommonFileDAO commonFileDAO;

	@Override
	public String insertCommonFileInfo(List<CommonFileVO> result, String atchFileId) throws Exception {

		if (result.size() != 0) {
			atchFileId = commonFileDAO.insertCommonFileInfo(result, atchFileId);
		}
		if (atchFileId == "") {
			atchFileId = null;
		}
		return atchFileId;
	}

	@Override
	public int deleteCommonFileInfo(CommonFileVO fileVO) {

		String atchFileId = fileVO.getAtchFileId();
		//펌부파일 마스터 테이블 삭제
		int seq = commonFileDAO.deleteCommonFileInfo(atchFileId);

		//첨부파일 상세 테이블 삭제
		//파일ID(atch_file_id)에 걸린 첨부파일 전부 삭제
		CommonFileVO detailFileVO = new CommonFileVO();
		detailFileVO.setAtchFileId(atchFileId);
		commonFileDAO.deleteCommonDetailFileInfo(detailFileVO);

		return seq;
	}

	@Override
	public void addFileLog(CommonFileVO fileVO) {
		commonFileDAO.addFileLog(fileVO);
	}


	@Override
	public List<CommonFileVO> selectCommonFiles(CommonFileVO fileVO) {
		return commonFileDAO.selectCommonFiles(fileVO);
	}

	@Override
	public int deleteCommonDetailFileInfo(CommonFileVO fileVO) {
		return commonFileDAO.deleteCommonDetailFileInfo(fileVO);
	}
}
