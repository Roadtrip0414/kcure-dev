package kcure.portal.cmn.tags.service.impl;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("TagsDAO")
public class TagsDAO extends EgovComAbstractDAO {
	private static final String sqlNameSpace = "KcureTags.";
	
	
	public List<ComCdDetailVo> searchCommonCodeDetailList(ComCdDetailVo comCd) {
		return selectList(sqlNameSpace + "searchCommonCodeDetailList", comCd);
	}
	
	
}
