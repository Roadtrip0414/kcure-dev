package kcure.portal.sys.dac.rvw.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.springframework.stereotype.Repository;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.dac.rvw.service.impl
  * @FileName : DacRvwDAO.java
  * @since : 2023. 3. 10.
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 :	권한관리에 대한 DAO 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("dacRvwDAO")
public class DacRvwDAO extends EgovComAbstractDAO {
    /**
     * @Method Name : selectDataAplcRvw
     * @작성일 : 2023. 3. 14.
     * @작성자 : parkgu
     * @Method 설명 : 데이터신청관리 목록 조회
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : List<Map<String,Object>>
     */
	public List<Map<String, Object>> selectDataAplcRvwList(DacRvwSearchVO searchVO) throws Exception {
       return selectList("Dac.selectDataAplcRvwList", searchVO);
   }

   /**
     * @Method Name : selectDataAplcRvwTotCnt
     * @작성일 : 2023. 3. 14.
     * @작성자 : parkgu
     * @Method 설명 : 데이터신청관리 목록 카운트
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : int
     */
   public int selectDataAplcRvwListTotCnt(DacRvwSearchVO searchVO)  throws Exception {
       return (Integer)selectOne("Dac.selectDataAplcRvwListTotCnt", searchVO);
   }

   /**
    * @Method Name : selectRvwStpSpcdList
    * @작성일 : 2023. 3. 14.
    * @작성자 : parkgu
    * @Method 설명 : 데이터신청관리 화면의 진행상태 목록
    *  <p>
    *  </p>
    * @return : List<Map<String,Object>>
    */
   public List<Map<String, Object>> selectRvwStpSpcdList() throws Exception {
	   return selectList("Dac.selectRvwStpSpcdList");
   }
}
