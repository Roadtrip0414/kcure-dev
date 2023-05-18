package kcure.portal.cmn.service.impl;


import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.stereotype.Repository;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.service.impl
  * @FileName : CommonFileDAO.java
  * @since : 2023. 3. 8.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	공통 파일 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("commonFileDAO")
public class CommonFileDAO extends EgovComAbstractDAO {

	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;

	/**
	  * @Method Name : insertCommonFileInfo
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공통 첨부파일 테이블 저장
	  *  </p>
	  * @param : fileList List<CommonFileVO>
	  * 		atchFileId 첨부파일ID
	  * @return : atchFileId String
	  */
	public String insertCommonFileInfo(List<CommonFileVO> fileList, String atchFileId) throws Exception {
		CommonFileVO vo = fileList.get(0);

		if(atchFileId.isEmpty()) {
			atchFileId = idgenService.getNextStringId();
			vo.setAtchFileId(atchFileId);
			insert("CommonFile.insertCommonFileInfo", vo);
		}

		Iterator<?> iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (CommonFileVO) iter.next();
			vo.setAtchFileId(atchFileId);
			insert("CommonFile.insertCommonDetailFileInfo", vo);
		}

		return atchFileId;
	}

	/**
	  * @Method Name : deleteCommonFileInfo
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공통 첨부파일 마스터 테이블 삭제
	  *  </p>
	  * @param : atchFileId 첨부파일ID
	  * @return : int
	  */
	public int deleteCommonFileInfo(String atchFileId) {
		return delete("CommonFile.deleteCommonFileInfo", atchFileId);
	}

	/**
	  * @Method Name : deleteCommonDetailFileInfo
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공통 첨부파일 상세 테이블 삭제
	  *  </p>
	  * @param : fileVO CommonFileVO
	  * @return : int
	  */
	public int deleteCommonDetailFileInfo(CommonFileVO fileVO) {
		return delete("CommonFile.deleteCommonDetailFileInfo", fileVO);
	}

	/**
	  * @Method Name : selectCommonFiles
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	첨부파일 정보 조회
	  *  </p>
	  * @param : fileVO CommonFileVO
	  * @return : List<CommonFileVO>
	  */
	public List<CommonFileVO> selectCommonFiles(CommonFileVO fileVO) {
		return selectList("CommonFile.selectCommonFiles", fileVO);
	}

	/**
	  * @Method Name : addFileLog
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	첨부파일 로그
	  *  </p>
	  * @param : fileVO CommonFileVO
	  * @return :
	  */
	public void addFileLog(CommonFileVO fileVO) {
		insert("CommonFile.fileDownLog", fileVO);
	}

}
