package kcure.portal.cmn.api.dsz.service;

import kcure.portal.cmn.api.dsz.service.impl.ResvVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.dsz.service
 * @FileName : DszService.java
 * @since : 2023. 2. 13.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	안심활용센터 API service
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
public interface DszService {
	
	/**
	  * @Method Name : insertReserve
	  * @작성일 : 2023. 2. 13.
	  * @작성자 : bhs
	  * @Method 설명 : 예약등록
	  *  <p>
	  *  </p>
	  * @param : ResvVO resvVO
	  * @return : 
	  */
	public int insertReserve(ResvVO resvVO) throws Exception;
	
	
	/**
	  * @Method Name : checkPrtiIdValid
	  * @작성일 : 2023. 04. 05.
	  * @작성자 : bhs
	  * @Method 설명 : 안심활용센터 기관코드 유효성 체크
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public int checkPrtiIdValid(String param) throws Exception;

}
