package kcure.portal.cmn.service.impl;


import org.springframework.stereotype.Service;
import kcure.portal.cmn.service.DataFileService;
import kcure.portal.cmn.service.DataServiceFileVO;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

 /**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.cmn.service.impl
  * @FileName : DataFileServiceImpl.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :	서비스 파일
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
@Service("DataFileService")
public class DataFileServiceImpl extends EgovAbstractServiceImpl implements DataFileService{


	@Resource(name = "DataFileDAO")
    private DataFileDAO dataFileDAO;


	/**
	  * @Method Name : insertDataFileInfo
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	첨부파일 등록
	  *  </p>
	  * @param :
	  * @return :
	  */
	@Override
	public int insertDataFileInfo(DataServiceFileVO fileVO) {
		return dataFileDAO.insertDataFileInfo(fileVO);
	}


	/**
	  * @Method Name : deletetDataFileInfo
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  첨부파일 삭제
	  *  </p>
	  * @param :
	  * @return :
	  */
	@Override
	public int deletetDataFileInfo(DataServiceFileVO fileVO) {
		return dataFileDAO.deletetDataFileInfo(fileVO);
	}


	/**
	  * @Method Name : selectFileOne
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	파일 select ( 단건 )
	  *  </p>
	  * @param :
	  * @return :
	  */
	@Override
	public DataServiceFileVO selectFileOne(DataServiceFileVO fileVO) {
		return dataFileDAO.selectFileOne(fileVO);
	}


	/**
	  * @Method Name : selectPrtiNm
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	참여기관명 검색
	  *  </p>
	  * @param :
	  * @return :
	  */
	@Override
	public String selectPrtiNm(String prtiId) {
		return dataFileDAO.selectPrtiNm(prtiId);
	}


	/**
	  * @Method Name : addFileLog
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	파일다운로드 이력 등록
	  *  </p>
	  * @param :
	  * @return :
	  */
	@Override
	public void addFileLog(DataServiceFileVO fileVO) {
		dataFileDAO.addFileLog(fileVO);

	}


	/**
	  * @Method Name : selectFiles
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	파일 검색 ( 다건 )
	  *  </p>
	  * @param :
	  * @return :
	  */
	@Override
	public List<DataServiceFileVO> selectFiles(DataServiceFileVO fileVO) {
		return dataFileDAO.selectFiles(fileVO);
	}


	@Override
	public void deleteSvcDataAllFile(String dataAplcNo) throws Exception {
		dataFileDAO.deleteSvcDataAllFile(dataAplcNo);
	}


	@Override
	public List<DataServiceFileVO> selectSvcDataAllFile(String dataAplcNo) throws Exception {
		return dataFileDAO.selectSvcDataAllFile(dataAplcNo);
	}

}
