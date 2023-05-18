package kcure.portal.sys.cmm.config;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.myp.svc.alm.service.MypSvcAlmService;
import kcure.portal.sys.mnu.mng.service.MnuMngService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.cmm.config
  * @FileName : MenuPreparer.java
  * @since : 2023. 1. 5.
  * @version 1.0
  * @author : bhs
  * @프로그램 설명 :
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  2023.01.05   bhs           최초생성
  *  2023.02.14   kyh           GNB 메뉴 조회 수정
  *  </pre>
  */

public class MenuPreparer  implements ViewPreparer{

	@Autowired
	private MnuMngService mnuService;

	@Autowired
	private MypSvcAlmService mypSvcAlmService;

	@Override
	public void execute(Request tilesRequest, AttributeContext attributeContext)  throws PreparerException {
		try {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			
			HttpServletRequest requestInfo = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			String nowPageUri = requestInfo.getRequestURI();
			String nowPageUriPatt = "";
			
			String usrMnuMode = "01";	//사용자메뉴모드( 01 : 사용자영역 / 02 : 관리자영역 )
			String loginId = "";
			
			if (user != null) {
				usrMnuMode = user.getUsrMnuMode();
				loginId = user.getId();
				user.setCurrMnuUri(nowPageUri);		//현재메뉴URI
			}
			
			//URI패턴값 셋팅
			if (nowPageUri.contains("/")) {
				String[] nowPageUriPattArr = nowPageUri.split("/");
				for (int i = 1; i < (nowPageUriPattArr.length - 1) ;i++) {
					nowPageUriPatt = nowPageUriPatt + "/" + nowPageUriPattArr[i];
				}
				nowPageUriPatt = nowPageUriPatt + "/";
			}

			HashMap<String, Object> paramMap = new HashMap<>();
			paramMap.put("menuDmnSpcd", usrMnuMode);
			paramMap.put("loginId", loginId);
			paramMap.put("nowPageUriPatt", nowPageUriPatt);
			
			//GNB 메뉴 조회
			List<?> gnbMenuList = mnuService.getGnbMenuList(paramMap);
			
			//마이페이지 메뉴 조회
			paramMap.put("menuDmnSpcd", "03"); //메뉴영역코드 변경(03 : 마이페이지)
			List<?> mypMenuList = mnuService.getGnbMenuList(paramMap);

			//상단 navigation 조회
			List<?> navMenuList = mnuService.getNavMenuList(paramMap);

			//상단 메뉴명 조회
			Map<String, Object> nowMenuInfo = mnuService.getNowMenuInfo(paramMap);

			//나의알림 카운트 조회
			int mypSvcAlmCnt = mypSvcAlmService.selectMypSvcAlmCnt(paramMap);

			attributeContext.putAttribute("gnbMenuList", new Attribute(gnbMenuList), true);
			attributeContext.putAttribute("mypMenuList", new Attribute(mypMenuList), true);
			attributeContext.putAttribute("navMenuList", new Attribute(navMenuList), true);
			attributeContext.putAttribute("nowMenuInfo", new Attribute(nowMenuInfo), true);
			attributeContext.putAttribute("mypSvcAlmCnt", new Attribute(mypSvcAlmCnt), true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

