package kcure.portal.cmn.tags.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.cmn.tags.service.TagsService;

@Service("TagsService")
public class TagsServiceImpl extends EgovAbstractServiceImpl implements TagsService {

	@Resource(name="TagsDAO")
    private TagsDAO tagsDAO;

	@Override
	public List<ComCdDetailVo> searchCommonCodeDetailList(ComCdDetailVo comCd) {
		return tagsDAO.searchCommonCodeDetailList(comCd);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
