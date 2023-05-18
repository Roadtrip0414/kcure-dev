package kcure.portal.myp.rsc.inf.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.DataTpcd;
import kcure.portal.cmn.CommonEnum.DtuAplcProgStcd;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.cmn.service.KcureDadaServiceFileMngUtil;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchDAO;
import kcure.portal.dac.clc.inf.service.impl.Clcinf2DAO;
import kcure.portal.myp.rsc.inf.service.MypRscInfService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.rsc.inf.service.impl
 * @FileName : MypRscInfServiceImpl.java
 * @since : 2023. 02. 01.
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 나의연구에 대한 비즈니스 구현 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.02.01   kyh           최초생성
 *  </pre>
 */
@Service("mypRscInfService")
public class MypRscInfServiceImpl extends EgovAbstractServiceImpl implements MypRscInfService {

	@Resource(name="clcinf2DAO")
	private Clcinf2DAO clcinf2DAO;

	@Resource(name="mypRscInfDAO")
	private MypRscInfDAO mypRscInfDAO;

	@Resource(name = "KcureDadaServiceFileMngUtil")
    private KcureDadaServiceFileMngUtil fileMngUtil;
	
	@Resource(name = "ClcInfReserchDAO")
    private ClcInfReserchDAO clcInfReserchDAO;

	/**
	 * @Method Name : selectRscInfNavCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  //나의연구 메뉴별 카운트 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public Map<String, Object> selectRscInfNavCnt(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectRscInfNavCnt(paramMap);
	}

	/**
	 * @Method Name : selectMypRscAplcListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	@Override
	public int selectMypRscAplcListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscAplcListTotCnt(paramMap);
	}

	/**
	 * @Method Name : selectMypRscAplcList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscAplcList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscAplcList(paramMap);
	}

    /**
	 * @Method Name : selectMypRscInfAplListTotCnt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 목록 총 카운트
	 * @param : model
	 * @return :
	 */
	@Override
	public int selectMypRscInfAplListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfAplListTotCnt(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfAplList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfAplList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfAplList(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfAplc
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 내용 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public Map<String, Object> selectMypRscInfAplc(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfAplc(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfUseList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfUseList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfUseList(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfTkinList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfTkinList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfTkinList(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfUse
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 내역 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public Map<String, Object> selectMypRscInfUse(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfUse(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfUseAcidList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 분석자목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfUseAcidList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfUseAcidList(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfUseDszRsvList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 좌석목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfUseDszRsvList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfUseDszRsvList(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfRspList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 연구자 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfRspList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfRspList(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfDszSiDoList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 존재 시도 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<ComCdDetailVo> selectMypRscInfDszSiDoList(ComCdDetailVo comCd) throws Exception {
		return mypRscInfDAO.selectMypRscInfDszSiDoList(comCd);
	}

	/**
	 * @Method Name : selectMypRscInfDszPrtiIdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 안심활용센터 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfDszPrtiIdList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfDszPrtiIdList(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfCalExceptList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 제외기간 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfCalExceptList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfCalExceptList(paramMap);
	}

	/**
	 * @Method Name : saveMypRscInfUseAplc
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 정보 저장
	 * @param : model
	 * @return :
	 */
	@Override
	public void saveMypRscInfUseAplc(MultipartHttpServletRequest request) throws Exception {

		/**************************************
         * 2023.05.01
         * gGeon
         * parameter 값 수정
         **************************************/
		
		String dataTpcd = (String)request.getParameter("dataTpcd");    // 데이터신청구분
		
		String dataAplcNo = (String)request.getParameter("dataAplcNo");
    	String rsrAsmtNo = (String)request.getParameter("rsrAsmtNo");	//연구과제번호
    	String aenvSpcd = (String)request.getParameter("aenvSpcd");    // 분석환경 구분코드
    	String vrtDvceCd = (String)request.getParameter("vrtAnlsDvceCont");    // 가상화분석도구코드
    	
    	String dszInstId = null;
    			
    	//안심활용센터기관ID
    	if(DataTpcd.SPCD01.spcd().equals(dataTpcd)) {
    		dszInstId = (String)request.getParameter("dszInstId");		
    	}else if(DataTpcd.SPCD02.spcd().equals(dataTpcd)){
    		dszInstId = "M0019"; 
    	}
    			
    	String[] rsrpId = (String[])request.getParameterValues("rsrpId");
    	String calDsgnYmdList = (String)request.getParameter("calDsgnYmdList");
    	String calDsgnYmdExptList = (String)request.getParameter("calDsgnYmdExptList");

    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar calendar = Calendar.getInstance();
        String strToday = sdf.format(calendar.getTime());


        /**************************************
         * 2023.04.28
         * gGeon
         * 데이터활용신청 번호 아래의 체계로 변경
         * DTU-YYYYMMDD-999
         **************************************/
        //String dtuAplcNo = prtiId + "-DUAL-" + strToday + "-";
        String dtuAplcNo = "DTU-"+strToday+"-";

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("dtuAplcNo", dtuAplcNo);

    	dtuAplcNo = dtuAplcNo + mypRscInfDAO.selectMypRscInfUseDtuAplcNoMax(paramMap);	//데이터활용신청번호 채번

    	//기간정보 설정
    	List<Map<String, Object>> dszDsgnList = new ArrayList<Map<String, Object>>();
    	int calLoop = 0;

    	//신청가능한 날짜 셋팅
    	String[] calDsgnYmd = calDsgnYmdList.split(",");
    	for (int i = 1; i < calDsgnYmd.length ; i++) {
    		HashMap<String, Object> subParamMap = new HashMap<>();
			subParamMap.put("calDsgnYmd", (String)calDsgnYmd[i]);

			calendar.set(Integer.parseInt(calDsgnYmd[i].substring(0, 4)), Integer.parseInt(calDsgnYmd[i].substring(4, 6))-1, Integer.parseInt(calDsgnYmd[i].substring(6, 8)));
			if (calendar.get(Calendar.DAY_OF_WEEK) == 1 || calendar.get(Calendar.DAY_OF_WEEK) == 7) {
				subParamMap.put("hldYn", "Y");
			} else {
				subParamMap.put("hldYn", "N");
			}

			subParamMap.put("excpYmdYn", "N");

    		dszDsgnList.add(calLoop++, subParamMap);
    	}

    	//제외 날짜 셋팅
    	if (calDsgnYmdExptList != null && !"".equals(calDsgnYmdExptList)) {
    		String[] calDsgnYmdExpt = calDsgnYmdExptList.split(",");
        	for (int i = 1; i < calDsgnYmdExpt.length ; i++) {
        		HashMap<String, Object> subParamMap = new HashMap<>();
    			subParamMap.put("calDsgnYmd", (String)calDsgnYmdExpt[i]);
    			subParamMap.put("hldYn", "N");
    			subParamMap.put("excpYmdYn", "Y");

        		dszDsgnList.add(calLoop++, subParamMap);
        	}
    	}

    	//날짜순서대로 정렬
    	Collections.sort(dszDsgnList, new Comparator<Map<String, Object>>() {
			@Override
			public int compare(Map<String, Object> o1, Map<String, Object> o2) {
				String calDsgnYmd1 = (String) o1.get("calDsgnYmd");
				String calDsgnYmd2 = (String) o2.get("calDsgnYmd");
				return calDsgnYmd1.compareTo(calDsgnYmd2);
			}
		});

    	String dszDsgnSdt = "";
    	String dszDsgnEdt = "";
		for (int i=0; i<dszDsgnList.size(); i++) {
			HashMap<String, Object> subParamMap = (HashMap<String, Object>) dszDsgnList.get(i);
			dszDsgnEdt = (String)subParamMap.get("calDsgnYmd");

			if (i == 0) dszDsgnSdt = (String)subParamMap.get("calDsgnYmd");
    	}

    	//안심활용센터예약 저장
		paramMap.put("rsrAsmtNo", rsrAsmtNo);
    	paramMap.put("dataAplcNo", dataAplcNo);
    	paramMap.put("dtuAplcNo", dtuAplcNo);
    	paramMap.put("aenvSpcd", aenvSpcd);
    	paramMap.put("dszInstId", dszInstId);
    	paramMap.put("vrtDvceCd", vrtDvceCd);
    	paramMap.put("dszDsgnSdt", dszDsgnSdt);
    	paramMap.put("dszDsgnEdt", dszDsgnEdt);
    	paramMap.put("dtuAplcProgStcd", "U01");
    	paramMap.put("frstRegpId", user.getId());

		mypRscInfDAO.insertMypRscInfUseDtu(paramMap);

		//데이터활용신청분석자 저장
		for (int i=0; i<rsrpId.length; i++) {
    		HashMap<String, Object> subParamMap = new HashMap<>();
    		subParamMap.put("rsrAsmtNo", rsrAsmtNo);
    		subParamMap.put("dataAplcNo", dataAplcNo);
    		subParamMap.put("dtuAplcNo", dtuAplcNo);
    		subParamMap.put("dataAplcId", (String)rsrpId[i]);
    		subParamMap.put("frstRegpId", user.getId());

			mypRscInfDAO.insertMypRscInfUseDtuAcid(subParamMap);
    	}

		//활용센터지정일자 저장
		for (int i=0; i<dszDsgnList.size(); i++) {
			HashMap<String, Object> subParamMap = (HashMap<String, Object>) dszDsgnList.get(i);
			subParamMap.put("rsrAsmtNo", rsrAsmtNo);
			subParamMap.put("dataAplcNo", dataAplcNo);
			subParamMap.put("dtuAplcNo", dtuAplcNo);
			subParamMap.put("ymdSeq", i+1);
//			subParamMap.put("calDsgnYmd", (String)rsrpId[i]);
//			subParamMap.put("hldYn", (String)rsrpId[i]);
//			subParamMap.put("excpYmdYn", (String)rsrpId[i]);
			subParamMap.put("frstRegpId", user.getId());

			mypRscInfDAO.insertMypRscInfUseDsgnYmd(subParamMap);
    	}

    	//첨부파일 저장
		/**************************************
         * 2023.05.01
         * gGeon
         * 반입파일 제외 로 수정
         **************************************/
//    	MultipartFile file = request.getFile("file");
//
//    	if (file != null && !CommonUtils.empty(file.getOriginalFilename())) {
//    		DataServiceFileVO result = fileMngUtil.parseFileInfDsz(file, dataAplcNo, CommonEnum.DataAttfSpcd.ATTFSPCD04.attfSpcd(),"81",user.getId(),"", dtuAplcNo);
//
//    		//현재 파일 등록
//    		fileMngUtil.insertDataFile(result);
//    	}
	}

	/**
	 * @Method Name : saveMypRscInfInAplc
	 * @작성일 : 2023. 05. 03.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 정보 저장
	 * @param : model
	 * @return :
	 */
	@Override
	public void saveMypRscInfInAplc(MultipartHttpServletRequest request) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		String userId = sessionVo.getId();
		String dataAplcNo = (String)request.getParameter("dataAplcNo");
    	String rsrAsmtNo = (String)request.getParameter("rsrAsmtNo");	//연구과제번호
    	String tkinDataNmCont = (String)request.getParameter("tkinDataNmCont");	//연구과제번호
    	String tkinDataPrpsCont = (String)request.getParameter("tkinDataPrpsCont");	//연구과제번호

    	String fileName = null;
    	String originalFilename = null;

    	int fileSeq = 0;

    	TkinVO vo = new TkinVO();
    	vo.setDataAplcNo(dataAplcNo);
    	vo.setRsrAsmtNo(rsrAsmtNo);
    	vo.setTkinDataProgStcd(DtuAplcProgStcd.STCDU01.getStcd());
    	vo.setTkinDataNmCont(tkinDataNmCont);
    	vo.setTkinDataPrpsCont(tkinDataPrpsCont);
    	vo.setUserId(userId);

    	//반입데이터신청 등록
    	mypRscInfDAO.insertMypRscInfTkin(vo);

    	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

    	HashMap<String, Object> paramMap1 = new HashMap<String, Object>();

    	for (Iterator<String> iterator = request.getFileNames(); iterator.hasNext();) {
    		MultipartFile multipartFile = multipartRequest.getFile(iterator.next());
    		fileName = multipartFile.getName();
			originalFilename = multipartFile.getOriginalFilename();

			if (multipartFile != null && !CommonUtils.empty(multipartFile.getOriginalFilename())) {
				//첨부파일 등록
	    		DataServiceFileVO result = fileMngUtil.parseFileInf(multipartFile, dataAplcNo, CommonEnum.DataAttfSpcd.ATTFSPCD04.attfSpcd(), "91", userId, sessionVo.getPrtiId());
	    		fileSeq = insertDataFileInfo(result);

	    		//반입데이터신청 등록
	    		paramMap1 = new HashMap<String, Object>();
	    		paramMap1.put("rsrAsmtNo", vo.getRsrAsmtNo());
	    		paramMap1.put("tkinDtapNo", vo.getTkinDtapNo());
	    		paramMap1.put("dataAplcNo", vo.getDataAplcNo());
	    		paramMap1.put("attfSeq", fileSeq);
	    		paramMap1.put("tkinDataProgStcd", DtuAplcProgStcd.STCDU01.getStcd());
	    		paramMap1.put("userId", userId);

	    		//반입파일명세서인 경우 'Y' 적용
	    		if("attachFlMst".equals(fileName)) {
	    			paramMap1.put("tkinFileSttmYn", "Y");
	    		}else {
	    			paramMap1.put("tkinFileSttmYn", "N");
	    		}

	    		mypRscInfDAO.insertMypRscInfTkinProg(paramMap1);
	    	}
    	}

    	//반입신청 이력등록
		HashMap<String, Object> paramMap2 = new HashMap<String, Object>();
		paramMap2.put("dataAplcNo", dataAplcNo);
		paramMap2.put("datpStatSpcd", "0000000036");
		paramMap2.put("userId", userId);
    	mypRscInfDAO.insertDtapStatHst(paramMap2);
	}

	/**
	 * @Method Name : selectMypRscInfIn
	 * @작성일 : 2023. 05. 04.
	 * @작성자 : bhs
	 * @Method 설명 :  반입 신청 내역 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfIn(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfIn(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfOutList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfOutList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfOutList(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfOut
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 내역 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfOut(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfOut(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfOutFileList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 파일 목록 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public List<Map<String, Object>> selectMypRscInfOutFileList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfOutFileList(paramMap);
	}

	/**
	 * @Method Name : selectMypRscInfRsrRslt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  연구성과 조회
	 * @param : model
	 * @return :
	 */
	@Override
	public Map<String, Object> selectMypRscInfRsrRslt(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfRsrRslt(paramMap);
	}

	/**
	 * @Method Name : saveMypRscInfRsrRslt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  연구성과 저장
	 * @param : model
	 * @return :
	 */
	@Override
	public void saveMypRscInfRsrRslt(HashMap<String, Object> paramMap) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		paramMap.put("frstRegpId", user.getId());

		mypRscInfDAO.saveMypRscInfRsrRslt(paramMap);
	}

	@Override
	public void deleteSvcDataAplc(String dataAplcNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dataAplcNo", dataAplcNo);
		map.put("cnclYn", "Y");	//취소여부
		mypRscInfDAO.updateSvcDataAplcCncl(map);
//		//신청 테이블 삭제
//		mypRscInfDAO.deleteSvcDataAplc(dataAplcNo);
//
//		//신청 첨부파일 일괄 삭제
//		fileMngUtil.deleteSvcDataAllFiles(dataAplcNo);
//
//		//신청자 삭제
//		mypRscInfDAO.deleteSvcRsp(dataAplcNo);
//
//		//신청 데이터셋 삭제
//		ClcInfRspVo clcInfRspVo = new ClcInfRspVo();
//		clcInfRspVo.setDataAplcNo(dataAplcNo);
//		clcinf2DAO.deleteAllDataAplcDts(clcInfRspVo);
//		clcinf2DAO.deleteAllAddDataAplcDts(clcInfRspVo);
//
//		//신청 심의 삭제
//		mypRscInfDAO.deleteSvcDataAplcRvw(dataAplcNo);
//		//신청 제공기관 삭제
//		mypRscInfDAO.deleteSvcDataPrvdInst(dataAplcNo);

	}

	@Override
	public Map<String, Object> selectDataAplcDetail(Map<String, Object> map) throws Exception {
		return mypRscInfDAO.selectDataAplcDetail(map);
	}

	@Override
	public List<Map<String, Object>> selectDataPrvdInstList(Map<String, Object> map) throws Exception {
		return mypRscInfDAO.selectDataPrvdInstList(map);
	}

	@Override
	public int selectMypRscInfInListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfInListTotCnt(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectMypRscInfInList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfInList(paramMap);
	}

	private int insertDataFileInfo(DataServiceFileVO result) throws Exception {
		fileMngUtil.insertDataFile(result);
		return result.getAttfSeq();
	}

	@Override
	public Map<String, Object> selectSrvyLnk() throws Exception {
		return mypRscInfDAO.selectSrvyLnk();
	}

	@Override
	public Map<String, Object> selectDataAplcRvw(String dataAplcNo) throws Exception {
		return mypRscInfDAO.selectDataAplcRvw(dataAplcNo);
	}

	@Override
	public int selectMypRscInfTkinListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfTkinListTotCnt(paramMap);
	}

	@Override
	public Map<String, Object> selectMypRscInfInDetail(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfInDetail(paramMap);
	}

	@Override
	public Map<String, Object> selectMypRscInfTkInDetailInfo(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfTkInDetailInfo(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectMypRscInfTkInFileList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfTkInFileList(paramMap);
	}

	@Override
	public List<ExtnVO> selectExtnList(HashMap<String, Object> paramMap) {
		return mypRscInfDAO.selectExtnList(paramMap);
	}

	@Override
	public List<HashMap<String, Object>> selectExtnSubList(ExtnVO extnVO) throws Exception {
		return mypRscInfDAO.selectExtnSubList(extnVO);
	}

	@Override
	public Map<String, Object> selectExtnPopup(EgovMap map) throws Exception {
		return mypRscInfDAO.selectExtnPopup(map);
	}

	@Override
	public Map<String, Object> selectExtnPayPopup(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectExtnPayPopup(paramMap);
	}
	
	@Override
	public int selectMypRscInfUseListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfUseListTotCnt(paramMap);
	}

	@Override
	public int selectMypRscInfOutListTotCnt(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfOutListTotCnt(paramMap);
	}
	
	@Override
	public Map<String, Object> selectMypRscInfOutApl(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfOutApl(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectMypRscInfTkOutFileList(HashMap<String, Object> paramMap) throws Exception {
		return mypRscInfDAO.selectMypRscInfTkOutFileList(paramMap);
	}
	
	@Override
	public Map<String, Object> checkExtdStcdCnt(ExtnVO extnVO) throws Exception {
		return mypRscInfDAO.checkExtdStcdCnt(extnVO);
	}

	/**
	 * 보관 /연장 신청 저장.
	 */
	@Override
	public void saveReqExit(HashMap<String, Object> commandMap, MultipartHttpServletRequest multiRequest) throws Exception {
		/*
		"02"	"보관연장신청"
		"03"	"재사용신청"
		"04"	"연구유효기간연장신청"
		*/
		EgovMap map = new EgovMap();
    	map.put("dataAplcNo",  commandMap.get("dataAplcNo"));
    	map.put("userId", commandMap.get("userId"));
    	
		//"01"	"가상화사용연장신청"
		if(CommonEnum.ExtdStcd.STCD01.getStcd().equals( commandMap.get("extdStcd") )) {
	    	final MultipartFile file = multiRequest.getFile("file13");
	    	if(!CommonUtils.empty(file.getOriginalFilename())) {
				//DataServiceFileVO result = fileMngUtil.parseFileInf(file, commandMap.get("dataAplcNo"), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),CommonEnum.attNmSpcdInfo.ATTNMSPCD13.attNmSpcd(),"","");
				DataServiceFileVO result = fileMngUtil.parseFileInf(file, (String)commandMap.get("dataAplcNo"), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),CommonEnum.attNmSpcdInfo.ATTNMSPCD13.attNmSpcd(),"","");
				int fileSeq = insertDataFileInfo(result);				
				commandMap.put("rdcRtAttfSeq", fileSeq);
			}
			
			//데이터활용 종료일자 세팅.
			commandMap.put("dtuEdt", commandMap.get("inputDtuEdt"));
			commandMap.put("dataKepSdt", commandMap.get("dtuSdt"));
			commandMap.put("dataKepEdt", commandMap.get("dtuEdt"));			
			commandMap.put("extdProgStcd", CommonEnum.DtuAplcProgStcd.STCDU01.getStcd());
			
		// "02", "보관연장신청"
		}else if(CommonEnum.ExtdStcd.STCD02.getStcd().equals( commandMap.get("extdStcd") )) {
			//보관연장 
			commandMap.put("dataKepEdt", commandMap.get("inputDataKepEdt"));
			commandMap.put("extdProgStcd", CommonEnum.DtuAplcProgStcd.STCDU01.getStcd());
			
//		03 재사용신청
		}else if(CommonEnum.ExtdStcd.STCD03.getStcd().equals( commandMap.get("extdStcd") )) {
			final MultipartFile file = multiRequest.getFile("file13");
	    	if(!CommonUtils.empty(file.getOriginalFilename())) {
				DataServiceFileVO result = fileMngUtil.parseFileInf(file, (String)commandMap.get("dataAplcNo"), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),CommonEnum.attNmSpcdInfo.ATTNMSPCD13.attNmSpcd(),"","");
				int fileSeq = insertDataFileInfo(result);				
				commandMap.put("rdcRtAttfSeq", fileSeq);
			}
			
			//데이터활용 종료일자 세팅.
	    	commandMap.put("dtuSdt", commandMap.get("inputDtuSdt"));
			commandMap.put("dtuEdt", commandMap.get("inputDtuEdt"));
			commandMap.put("dataKepSdt", commandMap.get("dtuSdt"));
			commandMap.put("dataKepEdt", commandMap.get("dtuEdt"));			
			commandMap.put("extdProgStcd", CommonEnum.DtuAplcProgStcd.STCDU01.getStcd());
//			04 연구유효기간연장신청			
		}else if(CommonEnum.ExtdStcd.STCD04.getStcd().equals( commandMap.get("extdStcd") )) {
			//			IRB연구계획첨부파일
			final MultipartFile file04 = multiRequest.getFile("file04");
	    	if(!CommonUtils.empty(file04.getOriginalFilename())) {
				DataServiceFileVO result = fileMngUtil.parseFileInf(file04, (String)commandMap.get("dataAplcNo"), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),CommonEnum.attNmSpcdInfo.ATTNMSPCD04.attNmSpcd(),"","");
				int fileSeq = insertDataFileInfo(result);				
				commandMap.put("irbRsrPlanAttfSeq", fileSeq);
			}
	    	//	    	IRB결과통지첨부파일순번
	    	final MultipartFile file12 = multiRequest.getFile("file12");
	    	if(!CommonUtils.empty(file12.getOriginalFilename())) {
				DataServiceFileVO result = fileMngUtil.parseFileInf(file12, (String)commandMap.get("dataAplcNo"), CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd(),CommonEnum.attNmSpcdInfo.ATTNMSPCD12.attNmSpcd(),"","");
				int fileSeq = insertDataFileInfo(result);				
				commandMap.put("irbRsltAvtsmtAttfSeq", fileSeq);
			}
	    	
	    	commandMap.put("extdProgStcd", CommonEnum.DtuAplcProgStcd.STCDU01.getStcd());
		}
		//보관/연장 등록
		mypRscInfDAO.insertReqExit(commandMap);
		//히스토리 테이블 저장
		Map<String,Object> hstmMp = new HashMap<String, Object>();
		hstmMp.put("dataAplcNo", commandMap.get("dataAplcNo"));
		hstmMp.put("cdClcd", "EXTD");
		hstmMp.put("dtapStpSpcd", commandMap.get("extdStcd"));
		hstmMp.put("detlCd", commandMap.get("extdProgStcd"));
		hstmMp.put("userId", commandMap.get("userId"));
		clcInfReserchDAO.insertDtapStatHst(hstmMp);
	}

	/**
	  * @Method Name : getDefaultExtdInfo
	  * @date : 2023. 5. 12.
	  * @Method 설명 :
	  *  <p>	
	  *     보완/연장  기본데이터 조회
	  *  </p>
	  * @param : 
	  * @return :
	  */
	private ExtnVO getDefaultExtdInfo(HashMap<String, Object> commandMap) {
		return mypRscInfDAO.getDefaultExtdInfo(commandMap);
	}

	@Override
	public int updateFileUnldYn(HashMap<String, Object> commandMap) throws Exception {
		return mypRscInfDAO.updateFileUnldYn(commandMap);
	}

	
}
