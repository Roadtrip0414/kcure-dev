package kcure.portal.cmn.api.prt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.api.prt.service.impl
  * @FileName : ApiPrtDAO.java
  * @since : 2023. 3. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	참여기관 API DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("apiPrtDAO")
public class ApiPrtDAO extends EgovComAbstractDAO{
	/**
	  * @Method Name : deleteSvcDttoAplc
	  * @작성일 : 2023. 3. 9.
	  * @작성자 : parkgu
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 반출 신청 삭제
	  *  </p>
	  * @param : map Map<String, Object>
	  * @return :
	  */
	public void deleteSvcDttoAplc(Map<String, Object> item) throws Exception {
		delete("Api.deleteSvcDttoAplc", item);
	}
	
	/** 
	  * @Method Name : deleteSvcDttoProg
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 반출 신청 첨부파일 관리정보 삭제
	  *  </p>
	  * @param : map Map<String, Object>
	  * @return :
	  */
	public void deleteSvcDttoProg(List<Map<String, Object>> list) throws Exception {
		delete("Api.deleteSvcDttoProg", list);
	}

	/** 
	  * @Method Name : deleteSvcAttf
	  * @작성일 : 2023. 3. 9.
	  * @작성자 : parkgu
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 첨부파일 삭제
	  *  </p>
	  * @param : map Map<String, Object>
	  * @return :
	  */
	public void deleteSvcAttf(List<Map<String, Object>> list) throws Exception {
		delete("Api.deleteSvcAttf", list);
	}

	/**
	  * @Method Name : insertSvcDttoAplc
	  * @작성일 : 2023. 3. 9.
	  * @작성자 : parkgu
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 반출 신청 저장
	  *  </p>
	  * @param : map Map<String, Object>
	  * @return :
	  */
	public void insertSvcDttoAplc(Map<String, Object> item) throws Exception {
		insert("Api.insertSvcDttoAplc", item);
	}

	/**
	  * @Method Name : insertSvcAttf
	  * @작성일 : 2023. 3. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
 	  *  <p>
 	  *  	데이터 신청 첨부파일 저장
	  *  </p>
	  * @param : map Map<String, Object>
	  * @return :
	  */
	public void insertSvcAttf(List<Map<String, Object>> list) throws Exception {
		insert("Api.insertSvcAttf", list);
	}
	
	/** 
	  * @Method Name : insertSvcDttoProg
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	반출데이터 첨부파일 관리정보 저장
	  *  </p>
	  * @param : map Map<String, Object>
	  * @return :
	  */
	public void insertSvcDttoProg(List<Map<String, Object>> list) throws Exception {
		insert("Api.insertSvcDttoProg", list);
	}

	/**
	  * @Method Name : selectAttfSeq
	  * @작성일 : 2023. 3. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 첨부파일 번호 조회
	  *  </p>
	  * @param : 신청번호 String
	  * @return : 첨부파일 번호 int
	  */
	public int selectAttfSeq(String dataAplcNo) throws Exception {
		return selectOne("Api.selectAttfSeq",dataAplcNo);
	}
	
	/**
	  * @Method Name : selectSvcRsrAsmtNo
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 과제관리번호 조회
	  *  </p>
	  * @param : 신청번호 String
	  * @return : 과제관리번호 String
	  */
	public String selectSvcRsrAsmtNo(String dataAplcNo) throws Exception {
		return selectOne("Api.selectSvcRsrAsmtNo",dataAplcNo);
	}
}
