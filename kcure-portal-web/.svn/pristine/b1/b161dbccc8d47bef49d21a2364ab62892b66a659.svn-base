package kcure.portal.sys.rsr.tkin.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.rsr.tkin.service.impl.RsrTkinSearchVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.dti.service
  * @FileName : RsrDtiService.java
  * @since : 2023.05.08
  * @version 1.0
  * @author : bhs
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
public interface RsrTkinService {
	/**
	  * @Method Name : selectSvcTkinAplcList
	  * @작성일 : 2023.05.08
	  * @작성자 : bhs
	  * @Method 설명 : 데이터반입관리 검색
	  *  <p>
	  *  </p>
	  * @param : rsrTkinSearchVO RsrTkinSearchVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String, Object>> selectSvcTkinAplcList(RsrTkinSearchVO searchVO) throws Exception;

	/**
	  * @Method Name : selectSvcTkinAplcListTotCnt
	  * @작성일 : 2023.05.08
	  * @작성자 : bhs
	  * @Method 설명 : 데이터반입관리 검색 카운트
	  *  <p>
	  *  </p>
	  * @param : rsrDtoSearchVO RsrDtoSearchVO
	  * @return : int
	  */
	public int selectSvcTkinAplcListTotCnt(RsrTkinSearchVO searchVO) throws Exception;
	
	/**
	  * @Method Name : selectSvcTkinAplcDetail
	  * @작성일 : 2023.05.08
	  * @작성자 : bhs
	  * @Method 설명 : 데이터반입관리 상세
	  *  <p>
	  *  </p>
	  * @param : Map<String,Object>
	  * @return : Map<String,Object>
	  */
	public Map<String, Object> selectSvcTkinAplcDetail(Map<String, Object> paramap) throws Exception;
	
	/**
	  * @Method Name : selectSvcTkinAplcFileList
	  * @작성일 : 2023.05.08
	  * @작성자 : bhs
	  * @Method 설명 : 데이터반입관리 상세
	  *  <p>
	  *  </p>
	  * @param : Map<String,Object>
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String, Object>> selectSvcTkinAplcFileList(Map<String, Object> paramap) throws Exception;

	/**
	  * @Method Name : selectSvcTkinAplc
	  * @작성일 : 2023.05.08
	  * @작성자 : bhs
	  * @Method 설명 : 데이터반입관리 상세
	  *  <p>
	  *  </p>
	  * @param : rsrTkinSearchVO RsrTkinSearchVO
	  * @return : Map<String,Object>
	  */
	public Map<String, Object> selectSvcTkinAplc(RsrTkinSearchVO searchVO) throws Exception;
	
	/**
	  * @Method Name : saveTkinAplcProg
	  * @작성일 : 2023.05.08
	  * @작성자 : bhs
	  * @Method 설명 : 데이터반입관리 상태 저장
	  *  <p>
	  *  </p>
	  * @param : Map<String, Object> paramap
	  * @return : 
	  */
	public void saveTkinAplcProg(Map<String, Object> paramap) throws Exception;

}

