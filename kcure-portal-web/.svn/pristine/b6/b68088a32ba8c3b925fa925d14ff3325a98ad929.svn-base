package kcure.portal.sys.rsr.tkin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.dto.service.impl
  * @FileName : RsrDtiDAO.java
  * @since : 2023.05.08
  * @version 1.0
  * @author : bhs
  * @프로그램 설명 :	데이터반입관리
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("rsrTkinDAO")
public class RsrTkinDAO extends EgovComAbstractDAO {
	
	private static final String sqlNameSpace = "Tkin.";
	
    /**
     * @Method Name : selectSvcTkinAplcList
     * @작성일 : 2023.05.08
     * @작성자 : bhs
     * @Method 설명 : 데이터반입관리 목록 조회
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : List<Map<String,Object>>
     */
	public List<Map<String, Object>> selectSvcTkinAplcList(RsrTkinSearchVO searchVO) throws Exception {
        return selectList(sqlNameSpace + "selectSvcTkinAplcList", searchVO);
    }

    /**
      * @Method Name : selectSvcTkinAplcListTotCnt
      * @작성일 : 2023.05.08
      * @작성자 : bhs
      * @Method 설명 : 데이터반입관리 목록 카운트
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : int
      */
    public int selectSvcTkinAplcListTotCnt(RsrTkinSearchVO searchVO)  throws Exception {
        return (Integer)selectOne(sqlNameSpace + "selectSvcTkinAplcListTotCnt", searchVO);
    }

    /**
     * @Method Name : selectSvcTkinAplcDetail
     * @작성일 : 2023.05.08
     * @작성자 : bhs
     * @Method 설명 : 데이터반입관리 상세 조회
     *  <p>
     *  </p>
     * @param : Map<String,Object>
     * @return : Map<String,Object>
     */
	public Map<String, Object> selectSvcTkinAplcDetail(Map<String, Object> paramap) throws Exception {
        return selectOne(sqlNameSpace + "selectSvcTkinAplcDetail", paramap);
    }
	
	 /**
     * @Method Name : selectSvcTkinAplcFileList
     * @작성일 : 2023.05.08
     * @작성자 : bhs
     * @Method 설명 : 데이터반입관리 반입파일 목록 조회
     *  <p>
     *  </p>
     * @param : Map<String,Object>
     * @return : List<Map<String,Object>>
     */
	public List<Map<String, Object>> selectSvcTkinAplcFileList(Map<String, Object> paramap) throws Exception {
        return selectList(sqlNameSpace + "selectSvcTkinAplcFileList", paramap);
    }
    
    /**
     * @Method Name : selectSvcTkinAplc
     * @작성일 : 2023.05.08
     * @작성자 : bhs
     * @Method 설명 : 데이터반입관리 목록 조회
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : List<Map<String,Object>>
     */
	public Map<String, Object> selectSvcTkinAplc(RsrTkinSearchVO searchVO) throws Exception {
        return selectOne(sqlNameSpace + "selectSvcTkinAplc", searchVO);
    }

    /**
     * @Method Name : updateTkinAplcFileProgStcd
     * @작성일 : 2023.05.08
     * @작성자 : bhs
     * @Method 설명 : 데이터반입관리 파일상태 수정
     *  <p>
     *  </p>
     * @param : Map<String, Object> update
     * @return : int
     */
   public int updateTkinAplcFileProgStcd(Map<String, Object> update)  throws Exception {
       return update(sqlNameSpace + "updateTkinAplcFileProgStcd", update);
   }
   
   /**
    * @Method Name : updateTkinAplcProgStcd
    * @작성일 : 2023.05.08
    * @작성자 : bhs
    * @Method 설명 : 데이터반입관리 상태 수정
    *  <p>
    *  </p>
    * @param : Map<String, Object> update
    * @return : int
    */
  public int updateTkinAplcProgStcd(Map<String, Object> update)  throws Exception {
      return update(sqlNameSpace + "updateTkinAplcProgStcd", update);
  }
  
  /**
   * @Method Name : insertDtapStatHst
   * @작성일 : 2023.05.09
   * @작성자 : bhs
   * @Method 설명 : 데이터반입관리 신청이력 등록
   *  <p>
   *  </p>
   * @param : Map<String, Object> update
   * @return : int
   */
 public int insertDtapStatHst(Map<String, Object> update)  throws Exception {
     return insert(sqlNameSpace + "insertDtapStatHst", update);
 }
  
}
