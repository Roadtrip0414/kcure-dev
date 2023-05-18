package kcure.portal.bbs.faq.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kcure.portal.bbs.faq.service.FaqService;
import kcure.portal.bbs.ntc.service.impl.NtcVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.faq.service.impl
  * @FileName : FaqServiceImpl.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	FAQ ServiceImpl
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("FaqService")
public class FaqServiceImpl implements FaqService{
	@Resource(name = "FaqDAO")
	private FaqDAO faqDAO;

	@Override
	public List<Map<String, Object>> selectFaqList(NtcVO ntcVO) throws Exception {
		return faqDAO.selectFaqList(ntcVO);
	}

	@Override
	public int selectFaqListTotCnt(NtcVO ntcVO) throws Exception {
		return faqDAO.selectFaqListTotCnt(ntcVO);
	}
}
