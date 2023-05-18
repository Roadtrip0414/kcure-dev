package kcure.portal.sys.rsr.daz.service.impl;

import java.util.Map;
import java.util.List;
import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

@Repository("rsrDazDAO")
public class RsrDazDAO extends EgovComAbstractDAO{
	public List<Map<String, Object>> selectSvcPrtiSpCdIs02(RsrDazSearchVO searchVO) throws Exception {
        return selectList("Daz.selectSvcPrtiSpCdIs02", searchVO);
    }

    public int selectSvcPrtiSpCdIs02TotCnt(ComDefaultVO searchVO)  throws Exception {
        return (Integer)selectOne("Daz.selectSvcPrtiSpCdIs02TotCnt", searchVO);
    }

    public int updateSvcPrtiCtpvSpcd(UpdateCtpvSpcdVO vo) throws Exception {
        return update("Daz.updateSvcPrtiCtpvSpcd", vo);
    }


	public List<Map<String, Object>> selectSvcPrtiDszList(ComDefaultVO searchVO) throws Exception {
        return selectList("Daz.selectSvcPrtiDszList", searchVO);
    }

    public int selectSvcPrtiDszListTotCnt(ComDefaultVO searchVO)  throws Exception {
        return (Integer)selectOne("Daz.selectSvcPrtiDszListTotCnt", searchVO);
    }

    public int insertSvcPrtiDsz(SvcPrtiDszVO svcPrtiDszVO) throws Exception {
        return insert("Daz.insertSvcPrtiDsz", svcPrtiDszVO);
    }

    public int updateSvcPrtiDsz(SvcPrtiDszVO svcPrtiDszVO) throws Exception {
        return update("Daz.updateSvcPrtiDsz", svcPrtiDszVO);
    }

    public int deleteSvcPrtiDsz(SvcPrtiDszVO svcPrtiDszVO) throws Exception {
        return delete("Daz.deleteSvcPrtiDsz", svcPrtiDszVO);
    }
}
