package kcure.portal.bbs.ntc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kcure.portal.bbs.ntc.service.NtcService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.ntc.service.impl
  * @FileName : NtcServiceImpl.java
  * @since : 2023. 3. 13.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	공지사항 ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("NtcService")
public class NtcServiceImpl implements NtcService{

	@Resource(name = "NtcDAO")
	private NtcDAO ntcDAO;

	@Override
	public List<Map<String, Object>> selectNtcList(NtcVO ntcVO) {
		return ntcDAO.selectNtcList(ntcVO);
	}

	@Override
	public int selectNtcListTotCnt(NtcVO ntcVO) {
		return ntcDAO.selectNtcListTotCnt(ntcVO);
	}

	@Override
	public Map<String, Object> selectNtcDetail(NtcVO ntcVO) throws Exception {
		//조회수 update
	    int rdcnt = ntcDAO.selectMaxRdcnt(ntcVO);
	    ntcVO.setRdcnt(rdcnt);
	    ntcDAO.updateRdcnt(ntcVO);

		return ntcDAO.selectNtcDetail(ntcVO);
	}

}
