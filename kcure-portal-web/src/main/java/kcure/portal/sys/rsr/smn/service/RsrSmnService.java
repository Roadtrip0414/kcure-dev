package kcure.portal.sys.rsr.smn.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.smn.service
  * @FileName : RsrSmnService.java
  * @since : 2023. 3. 30.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	과제별 관리 메모 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface RsrSmnService {
	/**
	  * @Method Name : selectSbjMemoList
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	과제별 관리 메모 목록 조회
	  *  </p>
	  * @param : ComDefaultVO searchVO
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectSbjMemoList(ComDefaultVO searchVO) throws Exception;

    /**
     * @Method Name : selectSbjMemoListTotCnt
     * @작성일 : 2023. 3. 30.
     * @작성자 : hjjeon
     * @Method 설명 :
     *  <p>
     *  	과제별 관리 메모 목록 총갯수
     *  </p>
     * @param : ComDefaultVO searchVO
     * @return : List<Map<String, Object>>
     */
   public int selectSbjMemoListTotCnt(ComDefaultVO searchVO)  throws Exception;

   /**
    * @Method Name : selectSbjMemoDetail
    * @작성일 : 2023. 3. 30.
    * @작성자 : hjjeon
    * @Method 설명 :
    *  <p>
    *  	과제별 관리 메모 상세 조회
    *  </p>
    * @param : Map<String,Object> map
    * @return : Map<String,Object>
    */
  public Map<String,Object> selectSbjMemoDetail(Map<String,Object> map) throws Exception;

  /**
   * @Method Name : saveSbjMeno
   * @작성일 : 2023. 3. 30.
   * @작성자 : hjjeon
   * @Method 설명 :
   *  <p>
   *  	과제별 관리 메모 저장
   *  </p>
   * @param : Map<String,Object> map
   * @return :
   */
 public void saveSbjMeno(Map<String,Object> map) throws Exception;
}
