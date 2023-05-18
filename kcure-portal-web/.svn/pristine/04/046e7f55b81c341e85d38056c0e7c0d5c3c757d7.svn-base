package kcure.portal.cmn.api.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.uss.umt.service.impl.UmtVO;

@Repository("sampleDAO")
public class SampleDAO extends EgovComAbstractDAO{
	
	public UmtVO viewUser(String id) throws Exception {
		return selectOne("Test.selectUserOne", id);
	}
	
	public List<UmtVO> listUser() throws Exception {
		return selectList("Test.selectUserList");
	}

}
