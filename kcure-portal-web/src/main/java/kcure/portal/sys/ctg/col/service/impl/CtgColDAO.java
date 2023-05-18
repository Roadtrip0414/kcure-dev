package kcure.portal.sys.ctg.col.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import kcure.portal.sys.cmm.service.impl.ComAbstractDAO;

@Repository("ctgColDAO")
public class CtgColDAO extends ComAbstractDAO{
	public List<CtgColVO> selectDtsColDfndList(CtgColVO ctgColVO) throws Exception {
        return selectList("DtsColDfnd.selectDtsColDfndList", ctgColVO);
    }

    public int selectDtsColDfndListTotCnt(CtgColVO ctgColVO)  throws Exception {
        return (Integer)selectOne("DtsColDfnd.selectDtsColDfndListTotCnt", ctgColVO);
    }

	public int insertDtsColDfnd(CtgColVO ctgColVO) throws Exception {
        return insert("DtsColDfnd.insertDtsColDfnd", ctgColVO);
    }

    public int updateDtsColDfnd(CtgColVO ctgColVO) throws Exception {
        return update("DtsColDfnd.updateDtsColDfnd", ctgColVO);
    }

    public int deleteDtsColDfnd(CtgColVO ctgColVO) throws Exception {
        return delete("DtsColDfnd.deleteDtsColDfnd", ctgColVO);
    }
}
