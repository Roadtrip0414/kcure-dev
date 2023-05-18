package kcure.portal.sys.rsr.ext.web.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.com.service.impl.ComVO;
import kcure.portal.sys.rsr.ext.web.service.impl.RsrDataExtSearchVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.rsr.ext.web.service
 * @FileName : RsrDataExtService.java
 * @since : 2023.05.10
 * @version 1.0
 * @author : pgj
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
public interface RsrDataExtService {

	List<ComVO> selectExtComCodeList(ComVO searchVO) throws Exception;

	List<Map<String, Object>> selectDataExtAplcList(RsrDataExtSearchVO searchVO) throws Exception;

	int selectDataExtAplcTotCnt(RsrDataExtSearchVO searchVO) throws Exception;

	Map<String, Object> detailDataExtAplc(RsrDataExtSearchVO searchVO) throws Exception;

	void updateDataExtAplc(Map<String, Object> param) throws Exception;

	void updateDataExtAplcCpl(Map<String, Object> param, boolean runHst) throws Exception;

}
