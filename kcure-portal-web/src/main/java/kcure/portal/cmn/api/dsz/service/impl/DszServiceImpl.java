package kcure.portal.cmn.api.dsz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kcure.portal.cmn.api.dsz.service.DszService;




/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.dsz.service.impl
 * @FileName : DszServiceImpl.java
 * @since : 2023. 2. 13.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	안심활용센터 API serviceImpl
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
@Service("dszService")
public class DszServiceImpl implements DszService {

	@Resource(name="dszDAO")
    private DszDAO dszDAO;
	
	@Override
	public int insertReserve(ResvVO resvVO) throws Exception {
		
		return dszDAO.insertReserve(resvVO);
	}

	@Override
	public int checkPrtiIdValid(String param) throws Exception {
		return dszDAO.checkPrtiIdValid(param);
	}

}
