package kcure.portal.sys.rsr.smn.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.rsr.smn.service.RsrSmnService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.smn.service.impl
  * @FileName : RsrSmnServiceImpl.java
  * @since : 2023. 3. 30.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	과제별 관리 메모 ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("RsrSmnService")
public class RsrSmnServiceImpl extends EgovAbstractServiceImpl implements RsrSmnService{

	@Resource(name="RsrSmnDAO")
    private RsrSmnDAO rsrSmnDAO;

	@Override
	public List<Map<String, Object>> selectSbjMemoList(ComDefaultVO searchVO) throws Exception {
		return rsrSmnDAO.selectSbjMemoList(searchVO);
	}

	@Override
	public int selectSbjMemoListTotCnt(ComDefaultVO searchVO) throws Exception {
		return rsrSmnDAO.selectSbjMemoListTotCnt(searchVO);
	}

	@Override
	public Map<String, Object> selectSbjMemoDetail(Map<String, Object> map) throws Exception {
		return rsrSmnDAO.selectSbjMemoDetail(map);
	}

	@Override
	public void saveSbjMeno(Map<String, Object> map) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		map.put("userId", user.getId());
		rsrSmnDAO.insertSbjMeno(map);
	}

}
