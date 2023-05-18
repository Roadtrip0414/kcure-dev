package kcure.portal.sys.rsr.ext.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.com.service.impl.ComVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.rsr.ext.web.service.impl
 * @FileName : RsrDataExtDAO.java
 * @since : 2023.05.10
 * @version 1.0
 * @author : pgj
 * @프로그램 설명 :	데이터 연잔 / 보관 관리
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
@Repository("rsrDataExtDAO")
public class RsrDataExtDAO extends EgovComAbstractDAO {

	public List<ComVO> selectExtComCodeList(ComVO searchVO) throws Exception {
		return selectList("Ext.selectExtComCodeList", searchVO);
	}

	public List<Map<String, Object>> selectDataExtAplcList(RsrDataExtSearchVO searchVO) throws Exception {
		return selectList("Ext.selectDataExtAplcList", searchVO);
	}

	public int selectDataExtAplcTotCnt(RsrDataExtSearchVO searchVO) throws Exception {
		return (Integer)selectOne("Ext.selectDataExtAplcTotCnt", searchVO);
	}

	public Map<String, Object> detailDataExtAplc(RsrDataExtSearchVO searchVO) {
		return selectOne("Ext.detailDataExtAplc", searchVO);
	}

	public int updateDataExtAplc(Map<String, Object> param) {
		return update("Ext.updateDataExtAplc", param);
	}

	public int updateDataExtIrb(Map<String, Object> param) {
		return update("Ext.updateDataExtIrb", param);
	}

	public int updateDataExtAplcCpl(Map<String, Object> param) {
		return update("Ext.updateDataExtAplcCpl", param);
	}

	public void insertDataExtHst(Map<String, Object> param) {
		insert("Ext.insertDataExtHst", param);
	}

}
