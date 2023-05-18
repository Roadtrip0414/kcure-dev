package kcure.portal.sys.bbs.ntc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.util.TextUtility;
import kcure.portal.sys.bbs.ntc.service.BbsNtcService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.service.impl
  * @FileName : BbsServiceImpl.java
  * @since : 2023. 2. 8.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	게시판 관리 serviceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("bbsNtcService")
public class BbsNtcServiceImpl extends EgovAbstractServiceImpl implements BbsNtcService{
	@Resource(name="bbsNtcDAO")
    private BbsNtcDAO bbsNtcDAO;

	@Override
	public List<Map<String, Object>> selectNtcList(BbsVO bbsVO) throws Exception {
		return bbsNtcDAO.selectNtcList(bbsVO);
	}

	@Override
	public List<Map<String, Object>> selectBbsList(BbsVO bbsVO) throws Exception {
		return bbsNtcDAO.selectBbsList(bbsVO);
	}

	@Override
	public int selectBbsListTotCnt(BbsVO bbsVO) throws Exception {
		return bbsNtcDAO.selectBbsListTotCnt(bbsVO);
	}

	@Override
	public Map<String, Object> selectBbsDetail(BbsVO bbsVO) throws Exception {
		//조회수 update
//	    int rdcnt = bbsNtcDAO.selectMaxRdcnt(bbsVO);
//	    bbsVO.setRdcnt(rdcnt);
//	    bbsNtcDAO.updateRdcnt(bbsVO);

		return bbsNtcDAO.selectBbsDetail(bbsVO);
	}

	@Override
	public void saveBbs(BbsVO bbsVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		bbsVO.setFrstRegisterId(user.getId());
		bbsVO.setLastUpdusrId(user.getId());
		bbsVO.setNtcrId(user.getId());
		bbsVO.setNtcrNm(user.getName());
		bbsVO.setNttCn(TextUtility.getParamDecodeData(bbsVO.getNttCn()));

		long nttId = bbsVO.getNttId();

		if(nttId > 0) {
			bbsNtcDAO.updateBbs(bbsVO);
		}else {
			bbsNtcDAO.insertBbs(bbsVO);
		}
	}

	@Override
	public void deleteBbs(BbsVO bbsVO) throws Exception {
		bbsNtcDAO.deleteBbs(bbsVO);
	}

}
