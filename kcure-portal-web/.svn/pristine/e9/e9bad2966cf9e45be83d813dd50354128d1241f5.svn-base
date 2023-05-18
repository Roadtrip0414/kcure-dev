package kcure.portal.cmn;

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

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.service.CommonFileService;
import kcure.portal.cmn.service.CommonServiceFileMngUtil;
import kcure.portal.cmn.service.impl.CommonFileVO;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.cmn.util.SendFtpUtil;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn
  * @FileName : CommonServiceFileController.java
  * @since : 2023. 3. 9.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 공통 첨부파일 Controller
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Controller
@RequestMapping("/portal/file")
public class CommonServiceFileController {
	@Resource(name = "commonUtils")
	private CommonUtils commonUtils;

	@Resource(name = "commonFileService")
	private CommonFileService commonFileService;

	@Resource(name = "CommonServiceFileMngUtil")
	private CommonServiceFileMngUtil fileUtil;

	/**
	  * @Method Name : getFileInfos
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	첨부파일 정보 조회
	  *  </p>
	  * @param : CommonFileVO commonFileVO
	  * @return : ModelAndView
	  */
	@RequestMapping(value = "/getFileInfos.do")
	public ModelAndView getFileInfos(@ModelAttribute("searchVO") CommonFileVO commonFileVO, ModelMap model) throws Exception  {
		String atchFileId = commonFileVO.getAtchFileId();
		List<CommonFileVO> fileList = commonFileService.selectCommonFiles(commonFileVO);

		List<Map<String,Object>> files = new ArrayList<Map<String,Object>>();
		if(fileList.size() > 0) {
			for(int i =0; i< fileList.size(); i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("oriName", fileList.get(i).getOrignlFileNm());
				map.put("name", fileList.get(i).getStreFileNm());
				map.put("url", fileList.get(i).getFileStreCours());
				map.put("deleteUrl", "/portal/file/deleteFile.do?name=" + fileList.get(i).getStreFileNm() + "&atchFileId=" + atchFileId + "&fileSn=" + fileList.get(i).getFileSn() + "&fileStreCours=" + fileList.get(i).getFileStreCours());
				map.put("tmbnlYn", fileList.get(i).getTmbnlYn());
				map.put("fileExtsn", fileList.get(i).getFileExtsn());
				map.put("fileSize", fileList.get(i).getFileSize());
				files.add(map);
			}
		}
		model.addAttribute("files", files);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}

	/**
	  * @Method Name : serviceFileDown
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	첨부파일 다운로드
	  *  </p>
	  * @param : request HttpServletRequest
	  * @return :
	  */
	@RequestMapping(value = "/fileDown.do")
	public void serviceFileDown(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		String baseUrl = request.getParameter("baseUrl");
		String downFolder = request.getParameter("url");
		String fileName = request.getParameter("oriName");
		String nasFileName = request.getParameter("nasFileName");
		String fileId = request.getParameter("atchFileId");

		downLoadFile(downFolder,fileName,nasFileName,response);
		//파일 다운로드 로그 남기기
		addFileLog(fileId, downFolder,fileName, baseUrl, request);
	}

	/**
	  * @Method Name : deleteFile
	  * @작성일 : 2023. 3. 9.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	첨부파일 삭제
	  *  </p>
	  * @param : request HttpServletRequest
	  * @return : ModelAndView
	  */
	@RequestMapping(value = "/deleteFile.do")
	public ModelAndView deleteFile(ModelMap model, HttpServletRequest request) throws Exception  {
		String name = request.getParameter("name");
		String atchFileId = request.getParameter("atchFileId");
		int fileSn = Integer.parseInt(request.getParameter("fileSn"));
		String fileStreCours = request.getParameter("fileStreCours");

		CommonFileVO fileVO = new CommonFileVO();
		fileVO.setAtchFileId(atchFileId);
		List<CommonFileVO> fileList = commonFileService.selectCommonFiles(fileVO);

		CommonFileVO deleteFileVO = new CommonFileVO();
		deleteFileVO.setAtchFileId(atchFileId);
		deleteFileVO.setFileSn(fileSn);
		deleteFileVO.setFileStreCours(fileStreCours);
		deleteFileVO.setStreFileNm(name);

		if(fileList.size() > 1) {
			//첨부파일 다건인 경우 첨부파일 상세테이블 정보만 삭제
			if(EgovProperties.getProperty("nas.img.filePath").equals(fileList.get(0).getFileStreCours())) {
				fileUtil.deleteThumbFiles(deleteFileVO);
			}else {
				fileUtil.deleteCommonFile(deleteFileVO);
			}
		}else {
			//첨부파일이 한건인 경우 첨부파일 마스터테이블, 상세테이블 정보 삭제
			if(EgovProperties.getProperty("nas.img.filePath").equals(fileList.get(0).getFileStreCours())) {
				fileUtil.deleteThumbFile(deleteFileVO);
			}else {
				fileUtil.deleteCommonFiles(fileList);
			}
		}

		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put(name, true);
		List<Map<String, Boolean>> files = new ArrayList<Map<String, Boolean>>();
		model.addAttribute("files", files);
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
	}

	/**
	  * @Method Name : addFileLog
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	파일 로그
	  *  </p>
	  * @param : fileId - 파일ID
	  * 		downFolder - 파일다운로드 위치
	  * 		fileName - 파일명
	  *         baseUrl - url
	  * @return :
	  */
	private void addFileLog(String fileId, String downFolder,String fileName, String baseUrl, HttpServletRequest request) {
		//파일 로그
		/* Authenticated  */
		String userId = "";
		String ip = "";

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

    	if(isAuthenticated.booleanValue()) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			userId = (user == null || user.getId() == null) ? "" : user.getId();
		    ip = (user == null || user.getIp() == null) ? "" : user.getIp();
    	}else {
    		ip = commonUtils.getIPFromRequest(request);
    	}

    	//String uri = request.get;
    	String url= request.getRequestURI().replace(request.getContextPath(),"");
    	CommonFileVO fileVO = new CommonFileVO();
    	fileVO.setAtchFileId(fileId);
    	fileVO.setFileStreCours(downFolder);
    	fileVO.setOrignlFileNm(fileName);
    	fileVO.setIp(ip);
    	fileVO.setUserId(userId);
    	fileVO.setMenuUrl(url);
    	fileVO.setBaseUrl(baseUrl);
    	commonFileService.addFileLog(fileVO);
	}

	/**
	  * @Method Name : downLoadFile
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	파일 다운로드
	  *  </p>
	  * @param : downFolder 다운로드 폴더
	  * 		fileName - 파일명
	  * 		nasFileName - nas저장 파일명
	  * @return :
	  */
	private void downLoadFile(String downFolder, String fileName, String nasFileName,HttpServletResponse response)throws Exception {
		SendFtpUtil ftp = new SendFtpUtil();
		OutputStream outputStream = null;
		InputStream inputStream = null;

    	try {
    		ftp.connect();

    		//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
    		downFolder = ftp.chkFolderPath(downFolder, "N");
    		try {

        		outputStream = new BufferedOutputStream(response.getOutputStream());
        		inputStream = ftp.downFile(downFolder, nasFileName);

    			byte[] bytesArray = new byte[4096];
                int bytesRead = -1;

        		response.setContentType("application/octet-stream");
        	    response.setHeader("Content-Disposition", "attachment; filename=" +  URLEncoder.encode(fileName, "utf-8") + ";");

                while ((bytesRead = inputStream.read(bytesArray)) != -1) {
                    outputStream.write(bytesArray, 0, bytesRead);
                }
    		} catch (Exception e) {
    			e.printStackTrace();
    			new Exception(e);
			} finally {
	            outputStream.close();
	            inputStream.close();
			}

    		ftp.disconnect();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}

	}
}
