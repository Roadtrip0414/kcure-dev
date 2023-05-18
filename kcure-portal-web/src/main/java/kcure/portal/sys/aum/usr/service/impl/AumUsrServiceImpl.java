package kcure.portal.sys.aum.usr.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.alm.service.AlmService;
import kcure.portal.sys.aum.usr.service.AumUsrService;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.pim.mng.service.impl.PimMngDAO;
import kcure.portal.sys.usr.stt.service.impl.UsrSttDAO;
import kcure.portal.sys.usr.stt.service.impl.UsrVO;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.aum.usr.service.impl
  * @FileName : AumUsrServiceImpl.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	권한유저관리에 관한 ServiceImpl 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("aumUsrService")
public class AumUsrServiceImpl extends EgovAbstractServiceImpl implements AumUsrService {

	@Resource(name="aumUsrDAO")
    private AumUsrDAO aumUsrDAO;

	@Resource(name="pimMngDAO")
	private PimMngDAO pimMngDAO;

	@Resource(name = "almService")
	private AlmService almService;

	@Resource(name = "usrSttDAO")
	private UsrSttDAO usrSttDAO;

	@Override
	public List<Map<String,Object>> selectAuthorUserList(ComDefaultVO comDefaultVO) throws Exception {
		return aumUsrDAO.selectAuthorUserList(comDefaultVO);
	}

	@Override
	public int selectAuthorUserListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
		return aumUsrDAO.selectAuthorUserListTotCnt(comDefaultVO);
	}

	@Override
	public void saveAuthorUser(Map<String,Object> map) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	map.put("frstRegpId", user.getId());
    	map.put("lastModpId", user.getId());

    	List<String> oldAuthIdList = aumUsrDAO.selectUserAuthList(map);			//유저가 가진 권한 목록
    	List<String> newAuthIdList = Arrays.asList(String.valueOf(map.get("authIdArr")).split(","));	//화면에서 넘어온 권한 목록

    	List<String> delAuthIdList = oldAuthIdList.stream().filter(o -> newAuthIdList.stream()
				.noneMatch(Predicate.isEqual(o))).collect(Collectors.toList());

		List<String> addAuthIdList = newAuthIdList.stream().filter(n -> oldAuthIdList.stream()
				.noneMatch(Predicate.isEqual(n))).collect(Collectors.toList());

    	//권한 삭제 후 저장
    	aumUsrDAO.deleteAuthUser(map);

    	for(Object authId : newAuthIdList) {
    		map.put("authId", authId);
    		aumUsrDAO.insertAuthUser(map);
    	}

    	//유저 권한 이력 저장
    	UsrVO usrVO = new UsrVO();
    	usrVO.setFrstRegpId(user.getId());
    	usrVO.setLastModpId(user.getId());
    	usrVO.setUserId(String.valueOf(map.get("userId")));
    	usrVO.setStatChanRsnCont(String.valueOf(map.get("statChanRsnCont")));

    	if(addAuthIdList.size() > 0) {
    		for(String authId : addAuthIdList) {
    			usrVO.setAuthId(authId);
    			usrVO.setGmtYn("Y");
    			usrVO.setDelYn("N");
    			usrSttDAO.insertUsrHst(usrVO);
    		}
    	}

    	if(delAuthIdList.size() > 0) {
    		for(String authId : delAuthIdList) {
    			usrVO.setAuthId(authId);
    			usrVO.setGmtYn("N");
    			usrVO.setDelYn("Y");
    			usrSttDAO.insertUsrHst(usrVO);
    		}
    	}

//    	JSONArray createArr = gridParameterMap.getCreate();
//
//    	if(createArr.size() > 0) {
//    		for (Object obj : createArr) {
//    			JSONObject childObj = (JSONObject) obj;
//
//    			Map<String, Object> map = new HashMap<String, Object>();
//    			map.put("userId",childObj.get("userId").toString());
//    			map.put("frstRegpId", user.getId());
//    			map.put("lastModpId", user.getId());
//
//    			String authId = ObjectUtils.toString(childObj.get("authId"));
//
//    			if(!StringUtils.isEmpty(authId)) {
//    				String[] authIds = authId.split(",");
//
//    				for(int i=0; i < authIds.length; i++) {
//    					if(i == 0) aumUsrDAO.deleteAuthUser(map);
//    					if(!StringUtils.isEmpty(authIds[i]) && !"undefined".equals(authIds[i])) {
//    						map.put("authId",authIds[i]);
//    						aumUsrDAO.insertAuthUser(map);
//    					}
//
//    				}
//    			}
//
//    		}
//    	}
	}

	@Override
	public Map<String, Object> selectPrtiAdmin(String prtiId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<?> adminList = aumUsrDAO.selectPrtiAdmin(prtiId);
		String prtiNm = pimMngDAO.selectPrtiNm(prtiId);

		if(adminList.size() > 0) {
			map.put("isAdminExist", true);
		}else {
			map.put("isAdminExist", false);
			map.put("notExistlMsg", "접속 하신 참여기관 "+prtiNm+"에는 관리자 ID 가 존재 하지 않습니다. K-CURE Portal 에서 회원 가입 후 K-CURE 사무국에서 승인 처리된 후 로그인 해 주세요.");
		}

		return map;
	}

	@Override
	public Map<String, Object> selectAuthorUser(Map<String, Object> map) throws Exception {
		return aumUsrDAO.selectAuthorUser(map);
	}
}
