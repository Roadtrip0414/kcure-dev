package kcure.portal.sys.com.service.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("comDAO")
public class ComDAO extends EgovComAbstractDAO{
	public List<ComVO> selectComList(ComVO comVO) throws Exception {
        return selectList("Com.selectComList", comVO);
    }
}
