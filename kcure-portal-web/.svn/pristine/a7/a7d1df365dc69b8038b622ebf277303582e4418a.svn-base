package kcure.portal.sys.com.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import kcure.portal.sys.com.service.ComService;

@Service("comService")
public class ComServiceImpl  extends EgovAbstractServiceImpl implements ComService {

	@Resource(name="comDAO")
    private ComDAO comDAO;

	@Override
	public List<ComVO> selectComList(ComVO comVO) throws Exception {
		return comDAO.selectComList(comVO);
	}
}
