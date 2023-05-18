package kcure.portal.sys.rsr.dto.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.dto.service.impl
  * @FileName : RsrDtoDAO.java
  * @since : 2023.03.20
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 :	데이터반출관리
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("rsrDtoDAO")
public class RsrDtoDAO extends EgovComAbstractDAO {
    /**
     * @Method Name : selectSvcDttoAplcList
     * @작성일 : 2023.03.20
     * @작성자 : parkgu
     * @Method 설명 : 데이터반출관리 목록 조회
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : List<Map<String,Object>>
     */
	public List<Map<String, Object>> selectSvcDttoAplcList(RsrDtoSearchVO searchVO) throws Exception {
        return selectList("Dto.selectSvcDttoAplcList", searchVO);
    }

    /**
      * @Method Name : selectSvcDttoAplcListTotCnt
      * @작성일 : 2023.03.20
      * @작성자 : parkgu
      * @Method 설명 : 데이터반출관리 목록 카운트
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : int
      */
    public int selectSvcDttoAplcListTotCnt(RsrDtoSearchVO searchVO)  throws Exception {
        return (Integer)selectOne("Dto.selectSvcDttoAplcListTotCnt", searchVO);
    }

    /**
     * @Method Name : selectSvcDttoAplc
     * @작성일 : 2023.03.20
     * @작성자 : parkgu
     * @Method 설명 : 데이터반출관리 목록 조회
     *  <p>
     *  </p>
     * @param : searchVO RsrDtoSearchVO
     * @return : Map<String,Object>
     */
	public Map<String, Object> selectSvcDttoAplc(RsrDtoSearchVO searchVO) throws Exception {
        return selectOne("Dto.selectSvcDttoAplc", searchVO);
    }

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
   public int updateDttoAplcProgStcd(Map<String, Object> update)  throws Exception {
       return update("Dto.updateDttoAplcProgStcd", update);
   }
   
   /**
    * @Method Name : updateDttoAplcFileProgStcd
    * @작성일 : 2023.05.11
    * @작성자 : bhs
    * @Method 설명 : 데이터반출관리 파일상태 수정
    *  <p>
    *  </p>
    * @param : Map<String, Object> update
    * @return : int
    */
  public int updateDttoAplcFileProgStcd(Map<String, Object> update)  throws Exception {
      return update("Dto.updateDttoAplcFileProgStcd", update);
  }
   
   /**
    * @Method Name : selectSvcDttoAplcFileList
    * @작성일 : 2023.05.11
    * @작성자 : bhs
    * @Method 설명 : 데이터반출관리 반출파일 목록 조회
    *  <p>
    *  </p>
    * @param : searchVO RsrDtoSearchVO
    * @return : List<Map<String,Object>>
    */
	public List<Map<String, Object>> selectSvcDttoAplcFileList(RsrDtoSearchVO searchVO) throws Exception {
       return selectList("Dto.selectSvcDttoAplcFileList", searchVO);
   }
	
	/**
	   * @Method Name : insertDtapStatHst
	   * @작성일 : 2023.05.11
	   * @작성자 : bhs
	   * @Method 설명 : 데이터반출관리 신청이력 등록
	   *  <p>
	   *  </p>
	   * @param : Map<String, Object> update
	   * @return : int
	   */
	public int insertDtapStatHst(Map<String, Object> paramap)  throws Exception {
	    return insert("Dto.insertDtapStatHst", paramap);
	}
	 
}
