package kcure.portal.cmn.service.impl;


import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.cmn.service.DataServiceFileVO;

import java.util.List;

import org.springframework.stereotype.Repository;

 /**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.cmn.service.impl
  * @FileName : DataFileDAO.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :	서비스 파일 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  2023. 3. 14.       shpark        최초 생성
  *  </pre>
  */
@Repository("DataFileDAO")
public class DataFileDAO extends EgovComAbstractDAO {

	public int insertDataFileInfo(DataServiceFileVO fileVO) {
		return insert("DataFile.insertDataFileInfo", fileVO);
	}

	public int deletetDataFileInfo(DataServiceFileVO fileVO) {
		return insert("DataFile.deletetDataFileInfo", fileVO);
	}

	public DataServiceFileVO selectFileOne(DataServiceFileVO fileVO) {
		return selectOne("DataFile.selectFileOne",fileVO);
	}

	public String selectPrtiNm(String prtiId) {
		return selectOne("DataFile.selectPrtiNm",prtiId);
	}

	public void addFileLog(DataServiceFileVO fileVO) {
		insert("DataFile.fileDownLog", fileVO);
	}

	public List<DataServiceFileVO> selectFiles(DataServiceFileVO fileVO) {
		return selectList("DataFile.selectFiles",fileVO);
	}

	/**
	  * @Method Name : selectSvcDataAllFile
	  * @작성일 : 2023. 4. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 첨부파일 정보(ALL)
	  *  </p>
	  * @param : dataAplcNo 신청번호
	  * @return : List<DataServiceFileVO>
	  */
	public List<DataServiceFileVO> selectSvcDataAllFile(String dataAplcNo) {
		return selectList("DataFile.selectSvcDataAllFile",dataAplcNo);
	}

	/**
	  * @Method Name : deleteSvcDataAllFile
	  * @작성일 : 2023. 4. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 첨부파일 전부 삭제
	  *  </p>
	  * @param : dataAplcNo 신청번호
	  * @return :
	  */
	public void deleteSvcDataAllFile(String dataAplcNo) throws Exception{
		delete("deleteSvcDataAllFile", dataAplcNo);
	}

}
