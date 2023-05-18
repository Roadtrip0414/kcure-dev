package kcure.portal.cmn.service;

import java.util.List;

import kcure.portal.cmn.service.impl.CommonFileVO;

/**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.cmn.service
  * @FileName : CommonFileService.java
  * @since : 2023. 3. 3.
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 공통 첨부파일
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  2023. 3. 3.       shpark        최초 생성
  *  </pre>
  */
public interface CommonFileService {

	/**
	  * @Method Name : insertCommonFileInfo
	  * @작성일 : 2023. 3. 3.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  서비스 신청 첨부파일
	  *  </p>
	  * @param : List<CommonFileVO>
	  * @return : String
	  */
	String insertCommonFileInfo(List<CommonFileVO> result, String atchFileId) throws Exception;

	/**
	  * @Method Name : deletetCommonFileInfo
	  * @작성일 : 2023. 3. 6.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 첨부파일 삭제
	  *  </p>
	  * @param : CommonFileVO fileVO
	  * @return :
	  */
	int deleteCommonFileInfo(CommonFileVO fileVO);

	/**
	  * @Method Name : deleteCommonDetailFileInfo
	  * @작성일 : 2023. 3. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	첨부파일 상세 테이블 삭제
	  *  </p>
	  * @param : CommonFileVO fileVO
	  * @return : int
	  */
	int deleteCommonDetailFileInfo(CommonFileVO fileVO);

	/**
	  * @Method Name : selectCommonFiles
	  * @작성일 : 2023. 3. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	첨부파일 정보 조회
	  *  </p>
	  * @param : String atchFileId
	  * @return : List<CommonFileVO>
	  */
	List<CommonFileVO> selectCommonFiles(CommonFileVO fileVO);

	/**
	  * @Method Name : addFileLog
	  * @작성일 : 2023. 3. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	첨부파일 다운로드 로그 저장
	  *  </p>
	  * @param : CommonFileVO fileVO
	  * @return :
	  */
	void addFileLog(CommonFileVO fileVO);

}
