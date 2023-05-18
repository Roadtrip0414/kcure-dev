package kcure.portal.example.web;

import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import kcure.portal.bbs.ntc.service.NtcService;
import kcure.portal.bbs.ntc.service.impl.NtcVO;
import kcure.portal.cmn.api.cmm.UploadedFileVo;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.cmn.util.SendFtpUtil;
import kcure.portal.example.service.ExampleService;
import kcure.portal.example.service.impl.ExEditorVO;
import kcure.portal.sys.bbs.dur.service.impl.DataUtlcVO;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import egovframework.com.cmm.service.EgovProperties;

/**
 * @FileName : ExampleController.java
 * @Project : kcure-portal-web
 * @since : 2022. 12. 22.
 * @version 1.0
 * @author : shpark
 * @프로그램 설명 :  예제페이지 작성
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *      </pre>
 */
@Controller
@RequestMapping("/portal/example")
public class ExampleController {
	private static final Logger LOGGER = LoggerFactory.getLogger(ExampleController.class);


   @Resource(name = "ExampleService")
   private ExampleService exampleService;


	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "NtcService")
	private NtcService ntcService;

	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	// 첨부파일 관련
	@Resource(name="EgovFileMngService")
	private EgovFileMngService fileMngService;

	@RequestMapping(value = "/sample/nonCheck/viewSample.do")
	public String viewSample(ModelMap model) {
		return "kcure/portal/example/ViewSample";
	}

	/**
	 * @Method Name : viewLibIntroduce
	 * @작성일 : 2022. 12. 22.
	 * @작성자 : shpark
	 * @Method 설명 : 그리드 예제 페이지 호출
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/realgrid/nonCheck/viewRealgridExample.do")
	public String viewLibIntroduce(ModelMap model) {
		return "kcure/portal/example/realGrid/ViewRealgridExample";
	}

	/**
	 * @Method Name : selectRealgridExample
	 * @작성일 : 2022. 12. 22.
	 * @작성자 : shpark
	 * @Method 설명 : 그리드 예제 select - 현재 공지사항 select
	 * @param ntcVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/realgrid/nonCheck/selectRealgridExample.do")
	public ModelAndView selectRealgridExample(@ModelAttribute("searchVO") NtcVO ntcVO, ModelMap model) {
		// 공지사항을 기본으로 sample 구성
		ntcVO.setPageUnit(propertyService.getInt("pageUnit"));
		ntcVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(ntcVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(ntcVO.getPageUnit());
		paginationInfo.setPageSize(ntcVO.getPageSize());

		ntcVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ntcVO.setLastIndex(paginationInfo.getLastRecordIndex());
		ntcVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		ntcVO.setBbsId("BBSMSTR_000000000001");

		int totCnt = ntcService.selectNtcListTotCnt(ntcVO);;

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute(GridVar.gridView, ntcService.selectNtcList(ntcVO));
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}

	/**
	 * @Method Name : saveRealgridExample
	 * @작성일 : 2022. 12. 25.
	 * @작성자 : shpark
	 * @Method 설명 : realGrid 저장 샘플 ( request 만 표출 )
	 * @param gridData
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/realgrid/nonCheck/saveRealgridExample.do")
	public ModelAndView saveRealgridExample(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
		NtcVO[] aa = gridParameterMap.getCreate(NtcVO.class);
		NtcVO[] bb = gridParameterMap.getDelete(NtcVO.class);
		JSONArray cc = gridParameterMap.getCreate();

		/* 그리드 데이터 사용 예제 */
		for (NtcVO n : aa) {
			System.out.println(n);
		}

		for (NtcVO create : gridParameterMap.getCreate(NtcVO.class)) {
			System.out.println(create.toString());
		}

		for (Object obj : cc) {
			JSONObject childObj = (JSONObject) obj;
			System.out.println(childObj);
		}

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}



	/**
	  * @Method Name : getComboRealgridExample
	  * @date : 2022. 12. 29.
	  * @Method 설명 :
	  *  <p>
	  *     RealGrid Combo Box 데이터 전송
	  *  </p>
	  * @param : searchVO 조회조건
	  * @return : comboList 위한 공지사항 리스트 ( json 가능 )
	  */
	@ResponseBody
	@RequestMapping(value = "/realgrid/nonCheck/getComboRealgridExample.do")
	public List<Map<String, Object>>   getComboRealgridExample( @ModelAttribute("searchVO") NtcVO ntcVO,ModelMap model) throws Exception {
		// 공지사항을 기본으로 sample 구성
		ntcVO.setPageUnit(propertyService.getInt("pageUnit"));
		ntcVO.setPageSize(propertyService.getInt("pageSize"));
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(ntcVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(ntcVO.getPageUnit());
		paginationInfo.setPageSize(ntcVO.getPageSize());

		ntcVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ntcVO.setLastIndex(paginationInfo.getLastRecordIndex());
		ntcVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		ntcVO.setBbsId("BBSMSTR_000000000001");
		List<Map<String, Object>> comboList = ntcService.selectNtcList(ntcVO);
		return comboList;
	}


	/**
	  * @Method Name : insertCkEdiotrExample
	  * @date : 2023. 1. 9.
	  * @Method 설명 :
	  *  <p>
	  *     에디터 등록 화면예제
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/ckeditor/nonCheck/insertCkEditorExample.do")
	public String insertCkEdiotrExample(ModelMap model) {
		return "kcure/portal/example/ckeditor/InsertCkEditorExample";
	}

	/**
	  * @Method Name : updateCkEditorExampleForm
	  * @date : 2023. 1. 9.
	  * @Method 설명 :
	  *  <p>
	  *     에디터 수정화면 예제
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/ckeditor/nonCheck/updateCkEditorExampleForm.do")
	public String updateCkEditorExampleForm(ExEditorVO exEditorVO,ModelMap model) {
		model.addAttribute("ExEditor", exampleService.selectDetail(exEditorVO));
		return "kcure/portal/example/ckeditor/UpdateCkEditorExample";
	}



	/**
	  * @Method Name : saveEdiotrExample
	  * @date : 2023. 1. 5.
	  * @Method 설명 : 에디터 등록예제
	  *  <p>
	  *     에디터 등록예제
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/ckeditor/nonCheck/saveEditorExample.do")
	public ModelAndView saveEdiotrExample(ExEditorVO exEditorVO,BindingResult bindingResult, ModelMap model) {
		exampleService.editorInsert(exEditorVO);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}

	/**
	  * @Method Name : updateEditor
	  * @date : 2023. 1. 9.
	  * @Method 설명 :
	  *  <p>
	  *     에디터 수정예제
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/ckeditor/nonCheck/updateEditor.do")
	public ModelAndView updateEditor(ExEditorVO exEditorVO,BindingResult bindingResult, ModelMap model) {
		exampleService.editorUpdate(exEditorVO);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}


	/**
	  * @Method Name : viewCkEdiotrExample
	  * @date : 2023. 1. 6.
	  * @Method 설명 :
	  *  <p>
	  *     에디터 상세 조회
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/ckeditor/nonCheck/detailViewCkEditorExample.do")
	public String detailViewCkEditorExample(ExEditorVO exEditorVO,ModelMap model) {
		model.addAttribute("ExEditor", exampleService.selectDetail(exEditorVO));
		return "kcure/portal/example/ckeditor/DetailViewCkEditorExample";
	}


	/**
	  * @Method Name : viewCkEditorExample
	  * @date : 2023. 1. 9.
	  * @Method 설명 :
	  *  <p>
	  *     에디터 리스트 화면
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/ckeditor/nonCheck/viewCkEditorExample.do")
	public String viewCkEditorExample(ExEditorVO exEditorVO,ModelMap model) {
		return "kcure/portal/example/ckeditor/ViewCkEditorExample";
	}


	/**
	  * @Method Name : selectCkEditorExample
	  * @date : 2023. 1. 9.
	  * @Method 설명 :
	  *  <p>
	  *     에디터 리스트 조회
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/ckeditor/nonCheck/selectCkEditorExample.do")
	public ModelAndView selectCkEditorExample(ExEditorVO exEditorVO,ModelMap model) {
		exEditorVO.setPageUnit(propertyService.getInt("pageUnit"));
		exEditorVO.setPageSize(propertyService.getInt("pageSize"));
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(exEditorVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(exEditorVO.getPageUnit());
		paginationInfo.setPageSize(exEditorVO.getPageSize());
		exEditorVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		exEditorVO.setLastIndex(paginationInfo.getLastRecordIndex());
		exEditorVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		List<ExEditorVO> resultList = exampleService.selectList(exEditorVO);
		int totCnt = exampleService.selectListCnt(exEditorVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute(GridVar.gridView,resultList);
		model.addAttribute(GridVar.gridPage, paginationInfo);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}


	/**
	  * @Method Name : detailAjaxErr
	  * @date : 2023. 1. 16.
	  * @Method 설명 :
	  *  <p>
	  *     AJAX 에러 처리
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/sample/nonCheck/detailAjaxErr.do")
	public String detailAjaxErr(ModelMap model) {
		return "kcure/portal/example/sample/DetailAjaxErr";
	}

	@RequestMapping(value = "/sample/nonCheck/ajaxErr.do")
	public ModelAndView ajaxErr(@RequestParam Map<String, Object> commandMap) throws Exception {

    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("jsonView");
    	LOGGER.info("-------------------------");
    	LOGGER.info(commandMap.toString());
    	LOGGER.info("-------------------------");
    	boolean check = true;
		if(check) {
			throw new EgovBizException("ajax 에러 처리");
		}
		return modelAndView;
	}

	/**
	 * @Method Name : viewChartExample
	 * @작성일 : 2023. 01. 13.
	 * @작성자 : bhs
	 * @Method 설명 : 차트 예제 페이지 호출
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/chart/nonCheck/viewChartExample/{type}", method= RequestMethod.GET)
	public String viewChartExample(ModelMap model, @PathVariable String type, HttpServletRequest request) {
		// type : 1 ->  XY차트,  type : 2 ->  PIE차트,  type : 3 ->  피라미드차트,  type : 4 ->  2개차트(XY, PIE)
		return "kcure/portal/example/chart/viewChartExample" + type;
	}

	@RequestMapping(value = "/file/nonCheck/viewFileExample.do")
	public String viewFileExample(ModelMap model) {

		List<Map> resultList = exampleService.selectFileList();
		model.addAttribute("fileList",resultList);

		return "kcure/portal/example/file/ViewFileExample";
	}


	/**
	  * @Method Name : detailViewFileExample
	  * @date : 2023. 1. 16.
	  * @Method 설명 :
	  *  <p>
	  *     파일 업로드 샘플
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/file/nonCheck/InsertFileExample.do")
	public String insertFileExample(ModelMap model) {
		//
		return "kcure/portal/example/file/InsertFileExample";
	}

	private List<UploadedFileVo> getUploadedFiles(List<FileVO> results, String atchFileId) {
		List<UploadedFileVo> uploadedFiles = new ArrayList<UploadedFileVo>();
		for (FileVO fileVo : results) {
			int fileSnCur = Integer.parseInt(fileVo.getFileSn());
			String name = fileVo.getOrignlFileNm();
			long size = Long.valueOf(fileVo.getFileMg());
			String requestUrl = ""; //request.getRequestURL().toString();
			String url = "/cmm/fms/nonCheck/FileDown.do?atchFileId=" + atchFileId + "&fileSn=" + fileSnCur + "&crrent_url_info=" + requestUrl;
			String deleteUrl = "/portal/example/file/nonCheck/deleteFile.do?name=" + name + "&atchFileId=" + atchFileId + "&fileSn=" + fileSnCur;
			UploadedFileVo uploadedFileVo = new UploadedFileVo(name, size, url, atchFileId, deleteUrl);
			uploadedFiles.add(uploadedFileVo);
		}

		return uploadedFiles;
	}

    @RequestMapping(value="/file/nonCheck/submitWithFile.do")
    public ModelAndView submitWithFile(final MultipartHttpServletRequest multiRequest,
    		@ModelAttribute("searchVO") DataUtlcVO dataUtlcVO, ModelMap model) throws Exception {
    	//첨부파일 등록
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<UploadedFileVo> uploadedFiles = new ArrayList<UploadedFileVo>();
		if(!files.isEmpty()){
			List<FileVO> results = fileUtil.parseFileInf(files, "SAMPLE_", 0, "", "");
			String atchFileId = fileMngService.insertFileInfs(results);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
			uploadedFiles = getUploadedFiles(results, atchFileId);

			if(dataUtlcVO.getRsdAttfId().isEmpty()) {
				dataUtlcVO.setRsdAttfId(atchFileId);
			}
		}

		model.addAttribute("files", uploadedFiles);
    	model.addAttribute("searchVO", dataUtlcVO);

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

	@RequestMapping(value = "/file/nonCheck/uploadFile.do")
	public ModelAndView updateFile(ModelMap model, final MultipartHttpServletRequest multiRequest, HttpServletRequest request) throws Exception  {
		/**
		* 기존 전자정부 방식 일경우
		* 지정된 경로 ( /kcure-portal-web/src/main/resources/egovframework/egovProps/globals.properties -->   Globals.fileStorePath 경로에 변경된 파일 명으로 저장.)
		* 현재 지정되 방식이 없어 전자정부 방식으로 구현함.
		* 마스터 테이블: COMTNFILE , 디테일 테이블 :  COMTNFILEDETAIL
		**/
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		final int fileSn = Integer.parseInt(multiRequest.getParameter("fileSn"));
		final String atchFileId = multiRequest.getParameter("atchFileId");
		List<UploadedFileVo> uploadedFiles = new ArrayList<UploadedFileVo>();
		if (!files.isEmpty()) {
			List<FileVO> results = fileUtil.parseFileInf(files, "SAMPLE_", fileSn, atchFileId, "");
			fileMngService.insertFileInfs(results);
			uploadedFiles = getUploadedFiles(results, atchFileId);
		}

		model.addAttribute("files", uploadedFiles);
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}

	@RequestMapping(value = "/file/nonCheck/deleteFile.do")
	public ModelAndView deleteFile(ModelMap model, HttpServletRequest request) throws Exception  {
		String name = request.getParameter("name");
		String atchFileId = request.getParameter("atchFileId");
		String fileSn = request.getParameter("fileSn");

		FileVO fileVo = new FileVO();
		fileVo.setAtchFileId(atchFileId);
		fileVo.setFileSn(fileSn);
		fileMngService.deleteFileInf(fileVo);

		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put(name, true);
		List<Map<String, Boolean>> files = new ArrayList<Map<String, Boolean>>();
		model.addAttribute("files", files);
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}

	@RequestMapping(value = "/file/nonCheck/detailViewFileExample.do")
	public String detailViewFileExample(ModelMap model,@RequestParam("atchFileId") String atchFileId) throws Exception  {
		model.addAttribute("atchFileId",atchFileId);
		return "kcure/portal/example/file/DetailViewFileExample";
	}

	/**
	  * @Method Name : viewNasFtpExample
	  * @date : 2023. 1. 16.
	  * @Method 설명 :
	  *  <p>
	  *     viewNasFtpExample 샘플
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/ftp/nonCheck/viewNasFtpExample.do")
	public String viewNasFtpExample(HttpServletRequest request, ModelMap model) {
		String actChk = request.getParameter("actChk");
		String sendFolder = request.getParameter("sendFolder");

		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
    	if (flashMap!=null) {
    		model.addAttribute("actMessage", (String)flashMap.get("actMessage"));
    		sendFolder = (String)flashMap.get("sendFolder");
    		actChk = (String)flashMap.get("actChk");
    	}

    	if (sendFolder == null || "".equals(sendFolder)) {
    		sendFolder = "/K-CURE/cro/P01-APLC-20230223-007/TEST01@naver.com/20230308";
    	}

    	if ("fileRead".equals(actChk)) {
    		SendFtpUtil ftp = new SendFtpUtil();

        	try {
        		ftp.connect();

        		//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
        		sendFolder = ftp.chkFolderPath(sendFolder, "N");

        		try {
	    			model.addAttribute("fileList", ftp.readFileList(sendFolder));
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}

        		ftp.disconnect();
        	} catch(Exception e) {
        		e.printStackTrace();
        	}
    	}

    	model.addAttribute("sendFolder", sendFolder);
    	model.addAttribute("actChk", actChk);
    	return "kcure/portal/example/ftp/viewNasFtpExample";
	}

	@RequestMapping(value = "/ftp/nonCheck/sendFtpExample.do")
	public String sendFtpExample(MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes) {
		String sendFolder = multiRequest.getParameter("sendFolder");

		List<MultipartFile> fileList = multiRequest.getFiles("sendFile");

    	SendFtpUtil ftp = new SendFtpUtil();
    	InputStream fis = null;

    	try {
    		ftp.connect();

    		//파일업로드 경로 추출. 저장로직이기 때문에 폴더까지 미리 생성한다.
    		sendFolder = ftp.chkFolderPath(sendFolder, "Y");

    		for (int i=0; i < fileList.size() ; i++) {
        		if (!fileList.get(i).getOriginalFilename().equals("")) {
    				String filename = fileList.get(i).getOriginalFilename();

    	    		try {
    	    			fis = (InputStream)fileList.get(i).getInputStream();
    	    			ftp.storeFile(sendFolder, filename, fis);
    	    		} catch (Exception e) {
    	    			e.printStackTrace();
    	    		} finally {
    	    			if(fis != null) {
    	    				fis.close();
    	    			}
    	    		}
    			}
    		}

    		ftp.disconnect();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}

    	redirectAttributes.addFlashAttribute("actChk", "fileRead");
    	redirectAttributes.addFlashAttribute("sendFolder", sendFolder);
    	redirectAttributes.addFlashAttribute("actMessage", "파일이 등록되었습니다.");
    	return "redirect:/portal/example/ftp/nonCheck/viewNasFtpExample.do";
	}

	@RequestMapping(value = "/ftp/nonCheck/downFtpExample.do")
	public void downFtpExample(MultipartHttpServletRequest multiRequest, HttpServletResponse response) {
		String sendFolder = multiRequest.getParameter("sendFolder");
		String fileName = multiRequest.getParameter("fileName");

    	SendFtpUtil ftp = new SendFtpUtil();

		OutputStream outputStream = null;
		InputStream inputStream = null;

    	try {
    		ftp.connect();

    		//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
    		sendFolder = ftp.chkFolderPath(sendFolder, "N");

    		try {
        		outputStream = new BufferedOutputStream(response.getOutputStream());
        		inputStream = ftp.downFile(sendFolder, fileName);

    			byte[] bytesArray = new byte[4096];
                int bytesRead = -1;

        		response.setContentType("application/octet-stream");
        	    response.setHeader("Content-Disposition", "attachment; filename=" +  URLEncoder.encode(fileName, "utf-8") + ";");

                while ((bytesRead = inputStream.read(bytesArray)) != -1) {
                    outputStream.write(bytesArray, 0, bytesRead);
                }
    		} catch (Exception e) {
    			e.printStackTrace();
			} finally {
	            outputStream.close();
	            inputStream.close();
			}

    		ftp.disconnect();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
	}

	@RequestMapping(value = "/ftp/nonCheck/delFtpExample.do")
	public String delFtpExample(MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes) {
		String sendFolder = multiRequest.getParameter("sendFolder");
		String fileName = multiRequest.getParameter("fileName");

    	SendFtpUtil ftp = new SendFtpUtil();

    	try {
    		ftp.connect();

    		//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
    		sendFolder = ftp.chkFolderPath(sendFolder, "N");

    		ftp.delFile(sendFolder, fileName);

    		ftp.disconnect();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}

    	redirectAttributes.addFlashAttribute("actChk", "fileRead");
    	redirectAttributes.addFlashAttribute("sendFolder", sendFolder);
    	redirectAttributes.addFlashAttribute("actMessage", "파일이 삭제되었습니다.");
    	return "redirect:/portal/example/ftp/nonCheck/viewNasFtpExample.do";
	}

	@RequestMapping(value = "/ftp/nonCheck/allDownFtpExample.do")
	public String allDownFtpExample(MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes) {
		String sendFolder = multiRequest.getParameter("sendFolder");

    	SendFtpUtil ftp = new SendFtpUtil();

    	try {
    		ftp.connect();

    		//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
    		sendFolder = ftp.chkFolderPath(sendFolder, "N");

    		ftp.allDownFile(sendFolder);

    		ftp.disconnect();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}

    	redirectAttributes.addFlashAttribute("actChk", "fileRead");
    	redirectAttributes.addFlashAttribute("sendFolder", sendFolder);
    	redirectAttributes.addFlashAttribute("actMessage", "파일이 일괄다운로드되었습니다.");
    	return "redirect:/portal/example/ftp/nonCheck/viewNasFtpExample.do";
	}

	@RequestMapping(value = "/ftp/nonCheck/allDelFtpExample.do")
	public String allDelFtpExample(MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes) {
		String sendFolder = multiRequest.getParameter("sendFolder");

    	SendFtpUtil ftp = new SendFtpUtil();

    	try {
    		ftp.connect();

    		//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
    		sendFolder = ftp.chkFolderPath(sendFolder, "N");

    		ftp.allDelFile(sendFolder);

    		ftp.disconnect();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}

    	redirectAttributes.addFlashAttribute("actChk", "fileRead");
    	redirectAttributes.addFlashAttribute("sendFolder", sendFolder);
    	redirectAttributes.addFlashAttribute("actMessage", "파일이 일괄삭제되었습니다.");
    	return "redirect:/portal/example/ftp/nonCheck/viewNasFtpExample.do";
	}


	@RequestMapping(value = "/jsmind/nonCheck/ViewJsMindExample.do")
	public String ViewJsMaindExample(ModelMap model) throws Exception  {
		return "kcure/portal/example/jsmind/ViewJsMindExample";
	}


	@RequestMapping(value = "/map/nonCheck/ViewMapExample.do")
	public String ViewMapExample(ModelMap model) throws Exception  {
		return "kcure/portal/example/map/ViewMapExample";
	}


	@RequestMapping(value = "/elastic/nonCheck/viewElasticExample.do")
	public String ViewElasticExample(ModelMap model) throws Exception  {
		return "kcure/portal/example/elastic/ViewElasticExample";
	}

	@RequestMapping(value = "/elastic/nonCheck/searchExample.do")
    public ResponseEntity<String> searchExample(@RequestBody JSONObject requestJson) throws Exception {
		try {
			String path = (String)requestJson.get("path");
			int size = (int)requestJson.get("size");
			String query = (String)requestJson.get("query");
			String response = getElasticResponse(path, size, query);
			return ResponseEntity.ok(response);
		} catch(Exception e) {
			return ResponseEntity.ok(e.toString());
		}
    }

	private String getElasticResponse(String path, int size, String query) throws Exception {
		String url = EgovProperties.getProperty("elastic.url") + ":" + EgovProperties.getProperty("elastic.port");

//		05.17 10:43 수정
//		System.out.print("Debug>>> (elastic url) " + url);

		String paramData = "{ \"size\":" + size + ", \"query\":" + query + " }";

//		System.out.print("Debug>>> (elastic parm) " + paramData);

		OkHttpClient client = new OkHttpClient().newBuilder().build();
		MediaType mediaType = MediaType.parse("application/json");

		okhttp3.RequestBody body = okhttp3.RequestBody.create(paramData, mediaType);
		okhttp3.Request request = new okhttp3.Request.Builder()
		  .url(url + path)
		  .method("POST", body)
		  .addHeader("Content-Type", "application/json")
		  .build();
		okhttp3.Response response = client.newCall(request).execute();

		String strResponse = response.body().string();

//		System.out.print("Debug>>> (elastic response) " + strResponse);
//수정끝
		return strResponse;
	}
}
