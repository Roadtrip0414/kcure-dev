package kcure.portal.sys.dac.prc.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.springframework.stereotype.Repository;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.dac.prc.service.impl
  * @FileName : DacPrcDAO.java
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
@Repository("dacPrcDAO")
public class DacPrcDAO extends EgovComAbstractDAO {

    /**
      * @Method Name : selectSvcPrtiSpCdIs01
      * @작성일 : 2023. 3. 10.
      * @작성자 : parkgu
      * @Method 설명 : 기관 심의자 목록 조회
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : List<Map<String,Object>>
      */
	public List<Map<String,Object>> selectSvcPrtiSpCdIs01(ComDefaultVO comDefaultVO) throws Exception {
        return selectList("Dac.selectSvcPrtiSpCdIs01", comDefaultVO);
    }

    /**
	 * 기관 심의자 여부 저장
	 * @param map Map<String,Object>
	 * @exception Exception
	 */
    public void saveUserRvwPrncYn(Map<String,Object> map) throws Exception {
        update("Dac.saveUserRvwPrncYn", map);
    }

    /**
     * @Method Name : selectUserList
     * @작성일 : 2023. 3. 10.
     * @작성자 : parkgu
     * @Method 설명 : 기관 심의자용 회원 검색
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : List<Map<String,Object>>
     */
	public List<Map<String,Object>> selectUserList(Map<String, String> param) throws Exception {
       return selectList("Dac.selectUserList", param);
	}
}
