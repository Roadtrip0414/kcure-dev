package kcure.portal.bbs.kcn.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kcure.portal.bbs.kcn.service.KcnService;
import kcure.portal.bbs.ntc.service.impl.NtcDAO;
import kcure.portal.bbs.ntc.service.impl.NtcVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.kcn.service.impl
  * @FileName : KcnServiceImpl.java
  * @since : 2023. 3. 15.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	KCURE ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("KcnService")
public class KcnServiceImpl implements KcnService{

	/**
	 * KCURE소식 DAO
	 */
	@Resource(name = "KcnDAO")
	private KcnDAO kcnDAO;

	/**
	 * 공지사항DAO
	 */
	@Resource(name = "NtcDAO")
	private NtcDAO ntcDAO;

	@Override
	public List<Map<String, Object>> selectKcnList(NtcVO ntcVO) throws Exception {
		return kcnDAO.selectKcnList(ntcVO);
	}

	@Override
	public int selectKcnListTotCnt(NtcVO ntcVO) throws Exception {
		return kcnDAO.selectKcnListTotCnt(ntcVO);
	}

	@Override
	public Map<String, Object> selectKcnDetail(NtcVO ntcVO) throws Exception {
		//조회수 update
	    int rdcnt = ntcDAO.selectMaxRdcnt(ntcVO);
	    ntcVO.setRdcnt(rdcnt);
	    ntcDAO.updateRdcnt(ntcVO);

		return kcnDAO.selectKcnDetail(ntcVO);
	}

}
