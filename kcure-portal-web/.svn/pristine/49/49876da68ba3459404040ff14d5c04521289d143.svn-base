package kcure.portal.sys.ctg.dts.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kcure.portal.sys.cmm.service.impl.ComAbstractDAO;

@Repository("ctgDtsDAO")
public class CtgDtsDAO extends ComAbstractDAO{
	public List<CtgDtsVO> selectDtsDfndList(CtgDtsVO ctgDtsVO) throws Exception {
        return selectList("DtsDfnd.selectDtsDfndList", ctgDtsVO);
    }

    public int selectDtsDfndListTotCnt(CtgDtsVO ctgDtsVO)  throws Exception {
        return (Integer)selectOne("DtsDfnd.selectDtsDfndListTotCnt", ctgDtsVO);
    }

	public List<CtgDtsVO> selectPrtiDtsList() throws Exception {
        return selectList("DtsDfnd.selectPrtiDtsList");
    }

	public int insertDtsDfnd(CtgDtsVO ctgDtsVO) throws Exception {
        return insert("DtsDfnd.insertDtsDfnd", ctgDtsVO);
    }

    public int updateDtsDfnd(CtgDtsVO ctgDtsVO) throws Exception {
        return update("DtsDfnd.updateDtsDfnd", ctgDtsVO);
    }

    public int deleteDtsDfnd(CtgDtsVO ctgDtsVO) throws Exception {
        return delete("DtsDfnd.deleteDtsDfnd", ctgDtsVO);
    }
}
