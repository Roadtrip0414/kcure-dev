package kcure.portal.sys.ctg.cds.service.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("ctgCdsDetlDAO")
public class CtgCdsDetlDAO extends EgovComAbstractDAO{
	public List<CtgCdsDetlVO> selectCdsDetlList(CtgCdsDetlVO ctgCdsDetlVO) throws Exception {
        return selectList("CdsDetl.selectCdsDetlList", ctgCdsDetlVO);
    }

    public int selectCdsDetlListTotCnt(CtgCdsDetlVO ctgCdsDetlVO)  throws Exception {
        return (Integer)selectOne("CdsDetl.selectCdsDetlListTotCnt", ctgCdsDetlVO);
    }

    public int insertCdsDetl(CtgCdsDetlVO ctgCdsDetlVO) throws Exception {
        return insert("CdsDetl.insertCdsDetl", ctgCdsDetlVO);
    }

    public int updateCdsDetl(CtgCdsDetlVO ctgCdsDetlVO) throws Exception {
        return update("CdsDetl.updateCdsDetl", ctgCdsDetlVO);
    }

    public int deleteCdsDetl(CtgCdsDetlVO ctgCdsDetlVO) throws Exception {
        return delete("CdsDetl.deleteCdsDetl", ctgCdsDetlVO);
    }
}
