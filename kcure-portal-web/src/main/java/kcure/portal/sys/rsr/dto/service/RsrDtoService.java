package kcure.portal.sys.rsr.dto.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.rsr.dto.service.impl.RsrDtoSearchVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.dto.service
  * @FileName : RsrDtoService.java
  * @since : 2023.03.20
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 :
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface RsrDtoService {
	/**
	  * @Method Name : selectSvcDttoAplcList
	  * @작성일 : 2023.03.20
	  * @작성자 : parkgu
	  * @Method 설명 : 데이터반출관리 검색
	  *  <p>
	  *  </p>
	  * @param : rsrDtoSearchVO RsrDtoSearchVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String, Object>> selectSvcDttoAplcList(RsrDtoSearchVO searchVO) throws Exception;

	/**
	  * @Method Name : selectSvcDttoAplcListTotCnt
	  * @작성일 : 2023.03.20
	  * @작성자 : parkgu
	  * @Method 설명 : 데이터반출관리 검색 카운트
	  *  <p>
	  *  </p>
	  * @param : rsrDtoSearchVO RsrDtoSearchVO
	  * @return : int
	  */
	public int selectSvcDttoAplcListTotCnt(RsrDtoSearchVO searchVO) throws Exception;

	/**
	  * @Method Name : selectSvcDttoAplc
	  * @작성일 : 2023.03.20
	  * @작성자 : parkgu
	  * @Method 설명 : 데이터반출관리 상세
	  *  <p>
	  *  </p>
	  * @param : rsrDtoSearchVO RsrDtoSearchVO
	  * @return : Map<String,Object>
	  */
	public Map<String, Object> selectSvcDttoAplc(RsrDtoSearchVO searchVO) throws Exception;
	
	/**
	  * @Method Name : selectSvcDttoAplcFileList
	  * @작성일 : 2023.05.11
	  * @작성자 : bhs
	  * @Method 설명 : 데이터반출관리 파일목록 조회
	  *  <p>
	  *  </p>
	  * @param : rsrDtoSearchVO RsrDtoSearchVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String, Object>> selectSvcDttoAplcFileList(RsrDtoSearchVO searchVO) throws Exception;
	
	/**
	  * @Method Name : saveDttoAplcProg
	  * @작성일 : 2023.05.11
	  * @작성자 : bhs
	  * @Method 설명 : 데이터반출관리 상태 수정
	  *  <p>
	  *  </p>
	  * @param : Map<String, Object> update
	  * @return : 
	  */
	public void saveDttoAplcProg(Map<String, Object> update) throws Exception;

	/**
	  * @Method Name : updateDttoAplcProgStcd
	  * @작성일 : 2023.03.20
	  * @작성자 : parkgu
	  * @Method 설명 : 데이터반출관리 상태 수정
	  *  <p>
	  *  </p>
	  * @param : Map<String, Object> update
	  * @return : int
	  */
	public int updateDttoAplcProgStcd(Map<String, Object> update) throws Exception;
}

