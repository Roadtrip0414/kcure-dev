package kcure.portal.cmn.service;

import java.util.List;

/**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.cmn.service
  * @FileName : DataFileService.java
  * @since : 2023. 3. 3.
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 데이터 신청 첨부파일
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
public interface DataFileService {

	/**
	  * @Method Name : insertDataFileInfo
	  * @작성일 : 2023. 3. 3.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  서비스 신청 첨부파일
	  *  </p>
	  * @param :
	  * @return :
	  */
	int insertDataFileInfo(DataServiceFileVO result);

	/**
	  * @Method Name : deletetDataFileInfo
	  * @작성일 : 2023. 3. 6.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 첨부파일 삭제
	  *  </p>
	  * @param :
	  * @return :
	  */
	int deletetDataFileInfo(DataServiceFileVO result);

	/**
	  * @Method Name : selectFileOne
	  * @작성일 : 2023. 3. 6.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 파일 검색 ( 1개 )
	  *  </p>
	  * @param :
	  * @return :
	  */
	DataServiceFileVO selectFileOne(DataServiceFileVO result);

	/**
	  * @Method Name : selectPrtiNm
	  * @작성일 : 2023. 3. 6.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	참여기관 명 가져오기.
	  *  </p>
	  * @param :
	  * @return :
	  */
	String selectPrtiNm(String prtiId);

	void addFileLog(DataServiceFileVO fileVO);

	List<DataServiceFileVO> selectFiles(DataServiceFileVO dataServiceFileVO);

	/**
	  * @Method Name : selectSvcDataAllFile
	  * @작성일 : 2023. 4. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 첨부파일 조회(ALL)
	  *  </p>
	  * @param : dataAplcNo 신청번호
	  * @return : List<DataServiceFileVO>
	  */
	List<DataServiceFileVO> selectSvcDataAllFile(String dataAplcNo) throws Exception;

	/**
	  * @Method Name : deleteSvcDataAllFile
	  * @작성일 : 2023. 4. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 첨부파일 삭제
	  *  </p>
	  * @param : dataAplcNo 신청번호
	  * @return :
	  */
	public void deleteSvcDataAllFile(String dataAplcNo) throws Exception;

}
