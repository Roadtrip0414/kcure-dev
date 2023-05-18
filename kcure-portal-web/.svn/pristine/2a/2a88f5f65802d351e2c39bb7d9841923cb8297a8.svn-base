package kcure.portal.cmn;

import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum.fileTemplInfo;
import kcure.portal.cmn.service.DataFileService;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.cmn.util.SendFtpUtil;

 /**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.cmn
  * @FileName : KcureServiceFileController.java
  * @since : 2023. 3. 14. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 서비스 신청 파일 	
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  2023. 3. 14.       shpark        최초 생성
  *  </pre>
  */
@Controller
public class KcureServiceFileController {

	@Resource(name = "commonUtils")
	private CommonUtils commonUtils;
	
	@Resource(name = "DataFileService") 
	private DataFileService dataFileService;
	
	/**
	  * @Method Name : tempFileDown
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  	서식파일 다운로드
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value = "/portal/dac/clc/inf/tempFileDown.do")
	public void tempFileDown(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {	
		fileTemplInfo target = CommonEnum.fileTemplInfo.valueOfFileInfo(request.getParameter("fileAttNmSpcd")); 
		String downFolder = target.filePath();
		String fileName = target.fileNm();
		downLoadFile(downFolder,fileName,fileName,response);
		//파일 다운로드 로그 남기기
		//addFileLog(downFolder,fileName,request);
		
    	
	}
	
	
	/**
	  * @Method Name : serviceFileDown
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  	첨부파일 다운로드
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value = "/portal/dac/clc/inf/serviceFileDown.do")
	public void serviceFileDown(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {	
		 
		String downFolder = request.getParameter("attfPthNm");
		String fileName = request.getParameter("attfNm");
		String nasFileName = request.getParameter("attfStrNm");
		
		downLoadFile(downFolder,fileName,nasFileName,response);
		//파일 다운로드 로그 남기기
		addFileLog(downFolder,fileName,request);
	}
	
	

	/**
	  * @Method Name : addFileLog
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  	파일다운로드 로그 등록
	  *  </p>
	  * @param : 
	  * @return :
	  */
	private void addFileLog(String downFolder,String fileName, HttpServletRequest request) {
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
    	DataServiceFileVO fileVO = new DataServiceFileVO();
    	fileVO.setAttfPthNm(downFolder);
    	fileVO.setDataAplcNo(request.getParameter("dataAplcNo"));
    	fileVO.setAttfNm(fileName);
    	fileVO.setIp(ip);
    	fileVO.setUserId(userId);
    	fileVO.setMenuUrl(url);
    	dataFileService.addFileLog(fileVO);
	}

	/**
	  * @Method Name : downLoadFile
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	파일 다운로드 공통메소드	
	  *  </p>
	  * @param : 
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
	            //파일 다운로드로그
	            
	            
	            
			}
    		
    		ftp.disconnect();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
		
	}
}