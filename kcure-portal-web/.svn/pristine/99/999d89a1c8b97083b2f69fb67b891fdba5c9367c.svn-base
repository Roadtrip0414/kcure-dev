package kcure.portal.sys.etc.alm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.etc.alm.service.EtcAlmService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.etc.alm.service.impl
  * @FileName : EtcAlmServiceImpl.java
  * @since : 2023. 3. 31.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	알림관리 ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("EtcAlmService")
public class EtcAlmServiceImpl extends EgovAbstractServiceImpl implements EtcAlmService {

	@Resource(name="EtcAlmDAO")
    private EtcAlmDAO etcAlmDAO;

	@Override
	public List<Map<String, Object>> selectNtceMsgList(ComDefaultVO comDefaultVO) throws Exception {
		return etcAlmDAO.selectNtceMsgList(comDefaultVO);
	}

	@Override
	public int selectNtceMsgListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
		return etcAlmDAO.selectNtceMsgListTotCnt(comDefaultVO);
	}

	@Override
	public Map<String, Object> selectNtceMsgDetail(Map<String, Object> map) throws Exception {
		return etcAlmDAO.selectNtceMsgDetail(map);
	}

	@Override
	public void updateNtceMsg(Map<String, Object> map) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		map.put("userId", user.getId());
		etcAlmDAO.updateNtceMsg(map);
	}
}
