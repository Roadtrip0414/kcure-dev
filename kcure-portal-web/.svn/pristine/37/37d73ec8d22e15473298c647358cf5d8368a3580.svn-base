package kcure.portal.dac.clc.inf.web;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.egovframe.rte.fdl.access.service.EgovUserDetailsHelper;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.DataServiceStep;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.cmn.util.AesUtil;
import kcure.portal.cmn.util.RsaUtil;
import kcure.portal.cmn.util.SendFtpUtil;
import kcure.portal.dac.clc.inf.service.ClcInfReserchService;
import kcure.portal.dac.clc.inf.service.Clcinf2Service;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReqTreeVo;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;
import kcure.portal.dac.clc.inf.service.impl.ClcInfRspVo;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/dac/clc/inf")
public class ClcInf2Controller {

	@Resource(name = "clcinf2Service")
	private Clcinf2Service clcinf2Service;

	@Resource(name = "ClcInfReserchService")
	private ClcInfReserchService clcInfReserchService;

	/**
	  * @Method Name : viewClcInfReqData
	  * @작성일 : 2023. 2. 22.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *   step3 자료요청(임상,공공,결합)
	  *  </p>
	  * @param :
	  * @return : step3 자료요청 페이지
	  */
  @RequestMapping(value="/viewClcInfReqData.do")
  public String viewClcInfReqData(@ModelAttribute("clcInfReserchVo") ClcInfReserchVo clcInfReserchVo, ModelMap model) throws Exception {
	 clcInfReserchVo = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);
	 model.addAttribute("clcInfReserchVo", clcInfReserchVo);

	 List<ClcInfReqTreeVo> treeList =  new ArrayList<ClcInfReqTreeVo>();
	 String retunUrl = null;

	 //임상데이터 신청
	 if("01".equals(clcInfReserchVo.getDataTpcd())){
	  	treeList = clcinf2Service.selectPrtiTreeList01();
	   	retunUrl = "kcure/portal/dac/clc/inf/ViewClcInfReqData";
	 }
	 //공공데이터 신청
	 else if("02".equals(clcInfReserchVo.getDataTpcd())){
	   	treeList = clcinf2Service.selectPrtiTreeList02(clcInfReserchVo);
	   	retunUrl = "kcure/portal/dac/clc/inf/ViewPubInfReqData";
	 }
	 //결합데이터 신청
	 else if("03".equals(clcInfReserchVo.getDataTpcd())){
	   	treeList = clcinf2Service.selectPrtiTreeList03();
	   	retunUrl = "kcure/portal/dac/clc/inf/ViewComboInfReqData";
	 }

	 model.addAttribute("treeList", treeList);
	 model.addAttribute("naviDataAplcNo", clcInfReserchVo.dataAplcNo);
	 model.addAttribute("naviStepCd", clcInfReserchVo.aplcStpSpcd);
	 model.addAttribute("naviUrlsByStepCd", DataServiceStep.getUrlsByStepCd());

	 return retunUrl;
  }
 


   /**
    * @Method Name : selectDtsTreeList
    * @작성일 : 2023. 3. 7.
    * @작성자 : bhs
    * @Method 설명 : 데이터셋 tree 조회
    *  <p>
    *  </p>
    * @param :
    * @return : String
    */
	@RequestMapping(value = "/selectDtsTreeList.do")
	public ModelAndView selectDtsTreeList(@RequestParam Map<String, Object> commandMap) throws Exception {
	   	ModelAndView modelAndView = new ModelAndView();
	   	modelAndView.setViewName("jsonView");
		String prtiId = (String) commandMap.get("prtiId");
		String gubun = (String) commandMap.get("gubun");
		String pblDtsSpcd = (String) commandMap.get("pblDtsSpcd");

		List<ClcInfReqTreeVo> treeList = new ArrayList<ClcInfReqTreeVo>();
		try {
			if("01".equals(gubun)) {
				if("01".equals(pblDtsSpcd)) {
					treeList = clcinf2Service.selectPub01DtsTreeList();
				}else if("02".equals(pblDtsSpcd)) {
					treeList = clcinf2Service.selectPub02DtsTreeList();
				}
			}else if("02".equals(gubun)){
				 treeList = clcinf2Service.selectDtsTreeList(prtiId);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

		modelAndView.addObject("dtsTreeCnt", treeList.size());
		modelAndView.addObject("dtsTreeList", treeList);

		return modelAndView;
	}

	/**
	  * @Method Name : saveTmpClcInfReqData
	  * @작성일 : 2023. 5. 1.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 임시저장
	  *  </p>
	  * @param : ClcInfReserchVo clcInfReserchVo
	  * @return : String returnURL
	  */
	@RequestMapping(value = "/saveTmpClcInfReqData.do")
	public String saveTmpClcInfReqData(@ModelAttribute("clcInfReserchVo") ClcInfReserchVo clcInfReserchVo, HttpServletRequest request, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		clcInfReserchVo.setUserId(sessionVo.getId());
		clcInfReserchVo.setPrtiId(sessionVo.getPrtiId());	//참여기관ID
		//model.addAttribute("targetStepUrl", "/portal/myp/rsc/inf/viewMypRscInfApl.do");		//마이페이지로
		model.addAttribute("resultMessage", "임시저장 되었습니다.");
		model.addAttribute("dataAplcNo", clcInfReserchVo.getDataAplcNo());
		model.addAttribute("targetStepUrl", CommonEnum.DataServiceStep.STEP04.stepUrl());
		
		return "kcure/portal/dac/clc/inf/ViewClcInfStepResult";
	}

	/**
	  * @Method Name : saveClcInfReqData
	  * @작성일 : 2023. 3. 10.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	데이터신청 정보 저장
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value="/saveClcInfReqData.do")
	public String saveClcInfReqData(@ModelAttribute ClcInfRspVo clcInfRspVo, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		clcInfRspVo.setUserId(sessionVo.getId());

		try {
			//임시데이터 -> 정식데이터로 등록 및 임시데이터 삭제
			clcinf2Service.saveReqData(clcInfRspVo);
		}catch(Exception e) {
			e.printStackTrace();
		}


		//성공시
		model.addAttribute("dataAplcNo", clcInfRspVo.getDataAplcNo());
		model.addAttribute("targetStepUrl", CommonEnum.DataServiceStep.STEP05.stepUrl());


		return "kcure/portal/dac/clc/inf/ViewClcInfStepResult";
   }

	/**
	  * @Method Name : saveClcInfReqViewData
	  * @작성일 : 2023. 3. 10.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	데이터신청 제출완료 저장
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value="/saveClcInfReqViewData.do")
	public String saveClcInfReqViewData(@ModelAttribute ClcInfRspVo clcInfRspVo, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		clcInfRspVo.setUserId(sessionVo.getId());

		//서비스 데이터 신청심의 및 데이터제공기관 등록
		clcinf2Service.saveAplcRvw(clcInfRspVo);

		model.addAttribute("dataAplcNo", clcInfRspVo.getDataAplcNo());
		model.addAttribute("targetStepUrl", CommonEnum.DataServiceStep.STEP06.stepUrl());

		return "kcure/portal/dac/clc/inf/ViewClcInfStepResult";
   }

   /**
	  * @Method Name : viewClcInfViewReqInfo
	  * @작성일 : 2023. 2. 22.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *   요청정보보기
	  *  </p>
	  * @param :
	  * @return : 요청정보보기 페이지
	  *  /portal/dac/clc/inf/viewClcInfViewReqInfo.do
	  */
	@RequestMapping(value="/viewClcInfViewReqInfo.do")
	public String viewClcInfViewReqInfo(@ModelAttribute("clcInfReserchVo") ClcInfReserchVo clcInfReserchVo, ModelMap model) throws Exception {
		clcInfReserchVo = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);
		ClcInfRspVo clcInfRspVo = clcinf2Service.selectClcInfRsp(clcInfReserchVo.getDataAplcNo());
		int rspCnt = clcinf2Service.selectClcInfRspCnt(clcInfReserchVo.getDataAplcNo());

		//연구신청 제출서류 파일리스트 가져오기
		DataServiceFileVO dataVo = new DataServiceFileVO();
		dataVo.setDataAplcNo(clcInfReserchVo.getDataAplcNo());
		dataVo.setAttfSpcd("01");

		List<DataServiceFileVO> fileList = clcinf2Service.selectDataServiceFileList(dataVo);

		model.addAttribute("clcInfRspList", clcinf2Service.selectClcInfRspList(clcInfReserchVo.getDataAplcNo()));	//연구자 정보 목록
		model.addAttribute("dataAplcSmry", clcInfReserchService.selectDataAplcSmry(clcInfReserchVo));				//가상화 환경 정보
		model.addAttribute("fileList", fileList);
		model.addAttribute("rspCnt", rspCnt);
		model.addAttribute("clcInfRspVo", clcInfRspVo);

		model.addAttribute("clcInfReserchVo", clcInfReserchVo);
		model.addAttribute("naviDataAplcNo", clcInfReserchVo.dataAplcNo);
		model.addAttribute("naviStepCd", clcInfReserchVo.aplcStpSpcd);
	    model.addAttribute("naviUrlsByStepCd", DataServiceStep.getUrlsByStepCd());

		return "kcure/portal/dac/clc/inf/ViewClcInfViewReqInfo";
	}


	 /**
	  * @Method Name : viewClcInfComplete
	  * @작성일 : 2023. 2. 22.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *   제출완료
	  *  </p>
	  * @param :
	  * @return : 제출완료 페이지
	  *  /portal/dac/clc/inf/viewClcInfComplete.do
	  */
	@RequestMapping(value="/viewClcInfComplete.do")
	public String viewClcInfComplete(@ModelAttribute("clcInfReserchVo") ClcInfReserchVo clcInfReserchVo, ModelMap model) throws Exception {
		clcInfReserchVo = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);

	    model.addAttribute("clcInfReserchVo", clcInfReserchVo);
	    model.addAttribute("naviDataAplcNo", clcInfReserchVo.dataAplcNo);
	    model.addAttribute("naviStepCd", clcInfReserchVo.aplcStpSpcd);
	    model.addAttribute("naviUrlsByStepCd", DataServiceStep.getUrlsByStepCd());

		return "kcure/portal/dac/clc/inf/ViewClcInfComplete";
	}


	 /**
	  * @Method Name : selectAplDtsList
	  * @작성일 : 2023. 3. 13.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *   신청데이터 목록조회
	  *  </p>
	  * @param :
	  * @return :
	  *  /portal/dac/clc/inf/selectAplDtsList.do
	  */
	@RequestMapping(value="/selectAplDtsList.do")
    public ModelAndView selectAplDtsList(@ModelAttribute ClcInfRspVo clcInfRspVo, ModelMap model) throws Exception {
		int listCnt = clcinf2Service.selectAplDtsListCnt(clcInfRspVo);
		List<HashMap<String, Object>> list = clcinf2Service.selectAplDtsList(clcInfRspVo);

        model.addAttribute(GridVar.gridView, list);
        model.addAttribute("totCnt", listCnt);

        ModelAndView modelAndView = new ModelAndView("jsonView", model);

        return modelAndView;
    }

	/**
     * @Method Name : selectMoreRspList
     * @작성일 : 2023. 2. 27.
     * @작성자 : bhs
     * @Method 설명 : 연구자 정보 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@RequestMapping(value = "/selectMoreRspList.do")
	public ModelAndView selectMoreRspList(@RequestParam Map<String, Object> commandMap) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("jsonView");

		String dataAplcNo = (String) commandMap.get("dataAplcNo");
		List<ClcInfRspVo> clcInfRspList = clcinf2Service.selectClcInfRspList(dataAplcNo);

		modelAndView.addObject("clcInfRspCnt", clcInfRspList.size());
		modelAndView.addObject("clcInfRspList", clcInfRspList);

		return modelAndView;
	}

	/**
     * @Method Name : selectAplDtsHistList
     * @작성일 : 2023. 2. 27.
     * @작성자 : bhs
     * @Method 설명 : 데이터신청 이력정보 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@ResponseBody
	@RequestMapping(value = "/selectAplDtsHistList.do", method = RequestMethod.POST)
    public ModelAndView selectAplDtsHistList(@RequestParam HashMap<String, Object> commandMap, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView");

	     try {
	         String dataAplcNo = commandMap.get("dataAplcNo") + "";

	         ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
	         clcInfReserchVo.setDataAplcNo(dataAplcNo);
	         clcInfReserchVo = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);

	         ClcInfRspVo clcInfRspVo = new ClcInfRspVo();
	         clcInfRspVo.setDataAplcNo(dataAplcNo);
	         List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

	         int result = DataServiceStep.STEP04.stepCd().compareTo(clcInfReserchVo.getAplcStpSpcd());

	         //진행상태구분이 데이터신청인 경우 임시저장 정보조회
	         if(result == 0) {
	        	 list = clcinf2Service.selectAplTmpDtsHistList(clcInfRspVo);
	         }
	         //진행상태구분이 데이터신청단계 보다 상위인 경우 제출데이터 조회
	         else if(result < 0){
	        	 list = clcinf2Service.selectAplDtsHistList(clcInfRspVo);
	         }

	         modelAndView.addObject("list", list);
             modelAndView.addObject("listCnt", list.size());
             modelAndView.addObject("resultCode", "Y");
	         modelAndView.addObject("message", "SUCCESS");
	     }catch(Exception e) {
	    	 modelAndView.addObject("resultCode", "N");
	         modelAndView.addObject("message", e.getMessage());
	     }
	     return modelAndView;
	}
	
	@RequestMapping(value="/apiHello.do")
	public String apiHello() throws Exception {
		System.out.println("=====apiHello=====");
		return "apiHello";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/apiToNcdc.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public  Object apiToNcdc (ClcInfReserchVo clcInfReserchVo) throws Exception {
		//System.out.println(clcInfReserchVo.toString());
		
		String apiList = clcinf2Service.selectNccApiList(clcInfReserchVo.getDataAplcNo());
		
		JSONObject finalData = new JSONObject();
		
		String publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAidnWiQiM7uEYkFUYm9nfw0em/hr+zANMS5hfB+WV3YOYfFBiOJVAHPqLlyO4UUFCBzlEl6luRILw0nLe/GndAMtdIasXENVQjuV430M/vNr/w3tHfwgs6YTV0Raw3WJISBTld/f8k8Hko+OAvN7MnWi51jmF+m3Ukd5I268QsC8sWRv/GOJ5xk+js9+t6X94vqWIxzdzwegtlsU+6L/xUu9vnnIFoWfTl/JKOauafbchBJzv1DAC00yeKWBvYtNKffxY//Eho7n8Q4rkLZK67UsQ4+98LK4YwSXyNzLGerfwr/5upSjYMWuGuuneFB6TkQIB6/ivsJBm5kY9Z89JwQIDAQAB";		
		
		String aesKey = AesUtil.generateSecretKey();
		//System.out.println("=====aesKey : "+aesKey);
		String kcureAesKey = RsaUtil.rsaEnc(aesKey, publicKey);
		//System.out.println("=====kcureAesKey : "+kcureAesKey);
		
		String aesEncJsonString = AesUtil.aes128Enc(apiList, aesKey);
		
		String fileAttachBinaryString = GetSendFile(clcInfReserchVo.getDataAplcNo(), "attach");
		fileAttachBinaryString = AesUtil.aes128Enc(fileAttachBinaryString, aesKey);
		
		String fileDatasetBinaryString = GetSendFile(clcInfReserchVo.getDataAplcNo(), "dataset");
		fileDatasetBinaryString = AesUtil.aes128Enc(fileDatasetBinaryString, aesKey);
		
		finalData.put("kcureToken", kcureAesKey);
		finalData.put("kcureData", aesEncJsonString);
		finalData.put("kcureFileAttachString", fileAttachBinaryString);
		finalData.put("kcureFileDatasetString", fileDatasetBinaryString);
		
		String inputLine = null;
		StringBuffer outResult = new StringBuffer();
		
		//URL url = new URL("http://localhost:8089/kcureToNcc"); //LOCAL
		URL url = new URL("http://101.79.86.138:8080/kcureToNcc"); //DEV
		try {
			// HTTP Connection 구하기
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        conn.setDoOutput(true);
	    	conn.setRequestMethod("POST");
	    	conn.setRequestProperty("Content-Type", "application/json");
	    	conn.setRequestProperty("Accept-Charset", "UTF-8"); 
	    	conn.setConnectTimeout(10000);
	    	conn.setReadTimeout(10000);
	    	
	    	OutputStream os = conn.getOutputStream();
	    	os.write(finalData.toJSONString().getBytes("UTF-8"));
	    	os.flush();
	    	
	    	// 리턴된 결과 읽기
	    	BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	    	while ((inputLine = in.readLine()) != null) {
	    		outResult.append(inputLine);
	    	}
	    	conn.disconnect();

	    	
		}catch(Exception e) {
    		e.printStackTrace();
    	}
		 
		return finalData;
	}
	
	
	@SuppressWarnings("unchecked")
	public  String GetSendFile (String dataAplcNo, String fileType) throws Exception {
    	
		String attdNmSpcd = (fileType.equals("dataset")) ? "06" : ""; //attach, dataset
		
		DataServiceFileVO vo = new DataServiceFileVO();
		vo.setDataAplcNo(dataAplcNo);
		vo.setAttdNmSpcd(attdNmSpcd);
		
    	List<Map<String, Object>> outFileList = clcinf2Service.selectNccApiFileList(vo);
    	
    	Map<String, Object> outFileInfo = null;
    	String sendFolder = "";
    	String fileName = "";
    	String sendFileName = "";
    	//String zipPath = "C:/tmp22/"; //LOCAL
    	String zipPath = "/home/centos/kcureToNcdc/"; //DEV
    	String zipCreatePath = zipPath+"/"+dataAplcNo+"_"+fileType+".zip"; //물리적으로 파일 생성될 경로
    	String fileBinary = new String();
    	
    	if(outFileList.size() > 0) {

			OutputStream outputStream = null;
			InputStream inputStream = null;
			ZipOutputStream zipOut = null;

			try {
				zipOut = new ZipOutputStream(new FileOutputStream(zipCreatePath));
        	    /* SFTP일 경우 연결 로직을 for문 밖에 놓아도 됨 */
        	    //SendFtpUtil ftp = new SendFtpUtil();
				//ftp.connect();

				for (int i=0; i < outFileList.size(); i++ ) {
					/* SFTP일 경우 연결 로직은 for문 안에 있어야 함 */
					//ftp 다운방식인 retrieveFileStream가 동시에 2개 이상 처리를 못하기 때문에 FTP를 여러번 연결한다.
					SendFtpUtil ftp = new SendFtpUtil();
					ftp.connect();

					outFileInfo = outFileList.get(i);

    				sendFolder = (String)outFileInfo.get("attfPthNm");
    				fileName = (String)outFileInfo.get("attfStrNm"); //물리파일명
    				sendFileName = (String)outFileInfo.get("attfNm");

					//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
		    		sendFolder = ftp.chkFolderPath(sendFolder, "N");

		    		inputStream = ftp.downFile(sendFolder, fileName);

					byte[] bytesArray = new byte[1024];
	        		int bytesRead = -1;

	        		ZipEntry zipEntry = new ZipEntry(fileName);
	    		    zipOut.putNextEntry(zipEntry);

	    		    while ((bytesRead = inputStream.read(bytesArray)) != -1) {
	    		    	zipOut.write(bytesArray, 0, bytesRead);
	                }

	    		    zipOut.closeEntry();

	    		    /* SFTP일 경우 연결 로직은 for문 안에 있어야 함 */
	    		    ftp.disconnect();
				}

				/* SFTP일 경우 연결 로직을 for문 밖에 놓아도 됨 */
				//ftp.disconnect();

				zipOut.close();

				//binary 변환
				File file = new File(zipCreatePath);
				fileBinary = fileToBinary(file);
    		} catch (Exception e) {
    			e.printStackTrace();
			} finally {
				if(zipOut != null) zipOut.close();
				if(outputStream != null) outputStream.close();
				if(inputStream != null) inputStream.close();
			}

    	}
		return fileBinary;

	}
	
	
	//파일객체를 바이너리 스트링으로 변경
	public static String fileToBinary(File file) {
	    String out = new String();
	    FileInputStream fis = null;
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	 
	    try {
	        fis = new FileInputStream(file);
	    } catch (FileNotFoundException e) {
	        System.out.println("Exception position : FileUtil - fileToString(File file)");
	    }
	 
	    int len = 0;
	    byte[] buf = new byte[1024];
	    try {
	        while ((len = fis.read(buf)) != -1) {
	            baos.write(buf, 0, len);
	        }
	 
	        byte[] fileArray = baos.toByteArray();
	        out = new String(base64Enc(fileArray));
	 
	        fis.close();
	        baos.close();
	    } catch (IOException e) {
	        System.out.println("Exception position : FileUtil - fileToString(File file)");
	    }
	 
	    return out;
	}
	 
	
	//바이너리 스트링을 파일로 변경
	public static File binaryToFile(String binaryFile, String filePath, String fileName) {
	    if ((binaryFile == null || "".equals(binaryFile)) || (filePath == null || "".equals(filePath))
	            || (fileName == null || "".equals(fileName))) { return null; }
	 
	    FileOutputStream fos = null;
	 
	    File fileDir = new File(filePath);
	    if (!fileDir.exists()) {
	        fileDir.mkdirs();
	    }
	 
	    File destFile = new File(filePath + fileName);
	 
	    byte[] buff = binaryFile.getBytes();
	    String toStr = new String(buff);
	    byte[] b64dec = base64Dec(toStr);
	 
	    try {
	        fos = new FileOutputStream(destFile);
	        fos.write(b64dec);
	        fos.close();
	    } catch (IOException e) {
	        System.out.println("Exception position : FileUtil - binaryToFile(String binaryFile, String filePath, String fileName)");
	    }
	 
	    return destFile;
	}

	
	public static byte[] base64Enc(byte[] buffer) {
	    return Base64.encodeBase64(buffer);
	}
	
	public static byte[] base64Dec(String toStr) {
	    return Base64.decodeBase64(toStr);
	}

	 

}
