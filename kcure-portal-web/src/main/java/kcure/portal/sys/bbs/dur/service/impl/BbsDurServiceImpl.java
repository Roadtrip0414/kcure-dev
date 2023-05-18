package kcure.portal.sys.bbs.dur.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.sys.bbs.dur.service.BbsDurService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.dur.service.impl
  * @FileName : BbsDurServiceImpl.java
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
@Service("bbsDurService")
public class BbsDurServiceImpl extends EgovAbstractServiceImpl implements BbsDurService{
	@Resource(name="bbsDurDAO")
    private BbsDurDAO bbsDurDAO;

	@Override
	public List<Map<String, Object>> selectDataUtlcList(DataUtlcVO dataUtlcVO) throws Exception {
		return bbsDurDAO.selectDataUtlcList(dataUtlcVO);
	}

	@Override
	public int selectDataUtlcListTotCnt(DataUtlcVO dataUtlcVO) throws Exception {
		return bbsDurDAO.selectDataUtlcListTotCnt(dataUtlcVO);
	}

	@Override
	public void saveDataUtlc(DataUtlcVO dataUtlcVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		dataUtlcVO.setFrstRegpId(user.getId());
		dataUtlcVO.setLastModpId(user.getId());

		int utlcRgstSeq = dataUtlcVO.getUtlcRgstSeq();

		//데이터활용사례 저장
		if(utlcRgstSeq > 0) {
			bbsDurDAO.updateDataUtlc(dataUtlcVO);
		}else {
			utlcRgstSeq = bbsDurDAO.selectUtlcRgstSeq(dataUtlcVO);
			dataUtlcVO.setUtlcRgstSeq(utlcRgstSeq);
			bbsDurDAO.insertDataUtlc(dataUtlcVO);
		}

		//기관 저장
		String rsrInstId = dataUtlcVO.getRsrInstId();
		String rsrInstNm = dataUtlcVO.getRsrInstNm();

		if(rsrInstId.indexOf(",") > 0) {
			String[] instArr = rsrInstId.split(",");
			String[] instNmArr = rsrInstNm.split(",");

			if(instArr.length > 0) {
				bbsDurDAO.deleteDataUtlcInst(dataUtlcVO);

				for(int i=0; i < instArr.length; i++) {
					if(!instArr[i].isEmpty()) {
						dataUtlcVO.setRsrInstId(instArr[i]);
						dataUtlcVO.setRsrInstNm(instNmArr[i]);
						bbsDurDAO.insertDataUtlcInst(dataUtlcVO);
					}
				}
			}
		}else {
			bbsDurDAO.deleteDataUtlcInst(dataUtlcVO);
			bbsDurDAO.insertDataUtlcInst(dataUtlcVO);
		}
	}

	@Override
	public void deleteDataUtlc(DataUtlcVO dataUtlcVO) throws Exception {
		//기관 삭제
		bbsDurDAO.deleteDataUtlcInst(dataUtlcVO);
		//데이터활용사례 삭제
		bbsDurDAO.deleteDataUtlc(dataUtlcVO);
	}

	@Override
	public Map<String, Object> selectDataUtlcDetail(DataUtlcVO dataUtlcVO) throws Exception {
		return bbsDurDAO.selectDataUtlcDetail(dataUtlcVO);
	}

	@Override
	public Map<String, Object> selectDataUtlcRsrInstDetail(DataUtlcVO dataUtlcVO) throws Exception {
		return bbsDurDAO.selectDataUtlcRsrInstDetail(dataUtlcVO);
	}
}
