package kcure.portal.sys.usr.bfn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.sys.usr.bfn.service.UsrBfnService;
import kcure.portal.sys.usr.stt.service.impl.UsrVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.usr.bfn.service.impl
  * @FileName : UsrBfnServiceImpl.java
  * @since : 2023. 1. 30.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	Email 발송이력 현황에 관한 ServiceImpl 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("usrBfnService")
public class UsrBfnServiceImpl extends EgovAbstractServiceImpl implements UsrBfnService{

	@Resource(name="usrBfnDAO")
    private UsrBfnDAO usrBfnDAO;


	@Override
	public List<UsrVO> selectBfntHstList(UsrVO usrVO) throws Exception {
		return usrBfnDAO.selectBfntHstList(usrVO);
	}

	@Override
	public int selectBfntHstListTotCnt(UsrVO usrVO) throws Exception {
		return usrBfnDAO.selectBfntHstListTotCnt(usrVO);
	}
}
