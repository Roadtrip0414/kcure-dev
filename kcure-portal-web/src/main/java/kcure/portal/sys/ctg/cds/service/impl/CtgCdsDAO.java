package kcure.portal.sys.ctg.cds.service.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("ctgCdsDAO")
public class CtgCdsDAO extends EgovComAbstractDAO{
	public List<CtgCdsVO> selectCdsDfndList(CtgCdsVO ctgCdsVO) throws Exception {
        return selectList("CdsDfnd.selectCdsDfndList", ctgCdsVO);
    }

    public int selectCdsDfndListTotCnt(CtgCdsVO ctgCdsVO)  throws Exception {
        return (Integer)selectOne("CdsDfnd.selectCdsDfndListTotCnt", ctgCdsVO);
    }

    public int insertCdsDfnd(CtgCdsVO ctgCdsVO) throws Exception {
        return insert("CdsDfnd.insertCdsDfnd", ctgCdsVO);
    }

    public int updateCdsDfnd(CtgCdsVO ctgCdsVO) throws Exception {
        return update("CdsDfnd.updateCdsDfnd", ctgCdsVO);
    }

    public int deleteCdsDfnd(CtgCdsVO ctgCdsVO) throws Exception {
        return delete("CdsDfnd.deleteCdsDfnd", ctgCdsVO);
    }
}
