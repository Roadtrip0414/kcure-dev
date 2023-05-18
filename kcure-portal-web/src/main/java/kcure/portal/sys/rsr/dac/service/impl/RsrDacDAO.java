package kcure.portal.sys.rsr.dac.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.springframework.stereotype.Repository;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.dac.service.impl
  * @FileName : RsrDacDAO.java
  * @since : 2023. 3. 15
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 :	데이터 종료 관리
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("rsrDacDAO")
public class RsrDacDAO extends EgovComAbstractDAO {
    /**
     * @Method Name : selectDataAplcEnd
     * @작성일 : 2023. 3. 15
     * @작성자 : parkgu
     * @Method 설명 : 데이터 종료 관리 목록 조회
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : List<Map<String,Object>>
     */
	public List<Map<String, Object>> selectDataAplcEndList(RsrDacSearchVO searchVO) throws Exception {
        return selectList("Dac.selectDataAplcEndList", searchVO);
    }

    /**
      * @Method Name : selectDataAplcEndTotCnt
      * @작성일 : 2023. 3. 15
      * @작성자 : parkgu
      * @Method 설명 : 데이터 종료 관리 목록 카운트
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : int
      */
    public int selectDataAplcEndListTotCnt(RsrDacSearchVO searchVO)  throws Exception {
        return (Integer)selectOne("Dac.selectDataAplcEndListTotCnt", searchVO);
    }
}
