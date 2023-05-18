package kcure.portal.cmn.api.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kcure.portal.cmn.api.sample.service.SampleService;
import kcure.portal.uss.umt.service.impl.UmtVO;

@Service
public class SampleServiceImpl implements SampleService {
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;
	
	@Override
	public UmtVO viewUser(String id) throws Exception {
		return sampleDAO.viewUser(id);
	}

	@Override
	public List<UmtVO> listUser() throws Exception {
		return sampleDAO.listUser();
	}

}
