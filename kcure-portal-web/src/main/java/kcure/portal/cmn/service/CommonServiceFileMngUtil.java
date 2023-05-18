package kcure.portal.cmn.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import kcure.portal.cmn.service.impl.CommonFileVO;
import kcure.portal.cmn.util.SendFtpUtil;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.service
  * @FileName : CommonServiceFileMngUtil.java
  * @since : 2023. 3. 15.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Component("CommonServiceFileMngUtil")
public class CommonServiceFileMngUtil {

	public static final int BUFF_SIZE = 2048;
	public static final String THUMB_FILE_PATH = EgovProperties.getProperty("thumb.img.path");
	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());
	@Resource(name = "commonFileService")
	private CommonFileService comonFileService;


	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */

	public List<CommonFileVO> parseFileInf(Map<String, MultipartFile> files) throws Exception {
		//		파일 업로드
		List<CommonFileVO> result = new ArrayList<CommonFileVO>();

		List<CommonFileVO> comResult = new ArrayList<CommonFileVO>();
		CommonFileVO thumbResult = new CommonFileVO();
		Map<String, MultipartFile> comFile = new HashMap<String, MultipartFile>();
		MultipartFile thumbFile = null;

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;

		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			CommonFileVO fvo = parseFile(file);

			if(entry.getKey().startsWith("THUMB_")) {
				thumbFile = file;

				fvo.setTmbnlYn("Y");
				fvo.setFileStreCours(EgovProperties.getProperty("nas.img.filePath"));
				thumbResult = fvo;
			}else {
				comFile.put(fvo.getOrignlFileNm(), file);
				comResult.add(fvo);
			}
			result.add(fvo);
		}

		sendFileMethod(comResult, comFile);

		if("Y".equals(thumbResult.getTmbnlYn())) {
			sendFileMethodThumb(thumbResult, thumbFile);
		}

		return result;
	}

	/**
	  * @Method Name : sendFileMethod
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  </p>
	  * @param :
	  * @return :
	  */
	private void sendFileMethod(List<CommonFileVO> result, Map<String, MultipartFile> fileList) throws Exception {
		SendFtpUtil ftp = new SendFtpUtil();
    	InputStream fis = null;
		try {
    		ftp.connect();
    		String sendFolder = "";
    		//파일업로드 경로 추출. 저장로직이기 때문에 폴더까지 미리 생성한다.
    		for(CommonFileVO fvo : result) {
    			if(!sendFolder.equals(fvo.getFileStreCours())) {
    				sendFolder = ftp.chkFolderPath(fvo.getFileStreCours() , "Y");
    			}
    		}

    		for (int i=0; i < fileList.size() ; i++) {


				//String filename = fileList.get(i).getOriginalFilename();
    			String filename = result.get(i).getStreFileNm();
	    		try {
	    			String oriFileName = result.get(i).getOrignlFileNm();

	    			if("Y".equals(result.get(i).getTmbnlYn())) {
	    				oriFileName = "THUMB_"+oriFileName;
	    			}

	    			fis = (InputStream)fileList.get(oriFileName).getInputStream();
	    			ftp.storeFile(result.get(i).getFileStreCours(), filename, fis);
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		} finally {
	    			if(fis != null) {
	    				fis.close();
	    			}
	    		}
    		}

    		ftp.disconnect();
    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new Exception(e);
    	}

	}

	private void sendFileMethodThumb(CommonFileVO result, MultipartFile file) throws Exception {
		InputStream stream = null;
		OutputStream bos = null;

		try {
			String stordFilePath = result.getFileStreCours();
			stream = file.getInputStream();
			File cFile = new File(EgovWebUtil.filePathBlackList(stordFilePath));

			if (!cFile.isDirectory()){

				if (cFile.mkdirs()){
					LOGGER.debug("[file.mkdirs] saveFolder : Creation Success ");
				}else{
					LOGGER.error("[file.mkdirs] saveFolder : Creation Fail ");
				}
			}

			bos = new FileOutputStream(EgovWebUtil.filePathBlackList(THUMB_FILE_PATH + stordFilePath + File.separator + result.getStreFileNm()));

			int bytesRead = 0;
			byte[] buffer = new byte[BUFF_SIZE];

			while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) {
				bos.write(buffer, 0, bytesRead);
			}

		}catch(Exception e) {
    		e.printStackTrace();
    		throw new Exception(e);
    	} finally {
    		EgovResourceCloseHelper.close(bos, stream);
		}
	}

	/**
	  * @Method Name : parseFile
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  </p>
	  * @param :
	  * @return :
	  */
	private CommonFileVO parseFile(MultipartFile file) throws Exception {

		String storePathString = EgovProperties.getProperty("nas.bbs.filePath");

		CommonFileVO result = new CommonFileVO();
		String orginFileName = file.getOriginalFilename();

		//--------------------------------------
		// 원 파일명이 없는 경우 처리
		// (첨부가 되지 않은 input file type)
		//--------------------------------------
		if (!"".equals(orginFileName)) {
			//result.setAtchFileId(idgenService.getNextStringId());	//파일ID
			result.setFileStreCours(storePathString);				//파일 저장 경로

			int index = orginFileName.lastIndexOf(".");
			String fileExt = orginFileName.substring(index + 1);
			String filename = getTimeStamp()+"_"+orginFileName;
			result.setStreFileNm(filename);				//저장파일명
			result.setOrignlFileNm(orginFileName);		//원파일명
			result.setFileExtsn(fileExt);				//파일확장자
			result.setFileSize(file.getSize());			//파일 크기
		}
		////------------------------------------
		return result;
	}

	/**
	  * @Method Name : deleteCommonFile
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  </p>
	  * @param :
	  * @return :
	  */
	public int deleteCommonFile(CommonFileVO result) throws Exception {
		//폴더 파일 삭제.
    	SendFtpUtil ftp = new SendFtpUtil();
    	int fileSeq = 0;
    	try {
    		ftp.connect();
    		//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
    		String sendFolder = ftp.chkFolderPath(result.getFileStreCours(), "N");

    		ftp.delFile(sendFolder, result.getStreFileNm());

    		ftp.disconnect();
			//파일 정보 삭제
			fileSeq = comonFileService.deleteCommonDetailFileInfo(result);

    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new Exception(e);
    	}

		return fileSeq;
	}

	/**
	  * @Method Name : deleteCommonFiles
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  </p>
	  * @param :
	  * @return :
	  */
	public int deleteCommonFiles(List<CommonFileVO> result) throws Exception {
		//폴더 파일 삭제.
		SendFtpUtil ftp = new SendFtpUtil();
		int fileSeq = 0;
		try {
			ftp.connect();
			//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
			String sendFolder = ftp.chkFolderPath(result.get(0).getFileStreCours(), "N");

			for(int i=0; i<result.size(); i++) {
				ftp.delFile(sendFolder, result.get(i).getStreFileNm());
			}

			ftp.disconnect();
			//파일 정보 삭제
			fileSeq = comonFileService.deleteCommonFileInfo(result.get(0));

		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}

		return fileSeq;
	}

	/**
	 * @Method Name : deleteThumbFile
	 * @작성일 : 2023. 3. 21.
	 * @작성자 : hjjeon
	 * @Method 설명 :
	 *  <p>
	 *  	썸네일 파일 삭제
	 *  </p>
	 * @param : CommonFileVO 파일 정보
	 * @return : int
	 */
	public int deleteThumbFiles(CommonFileVO result) throws Exception {
		int fileSeq = 0;

		try {

			File file = new File(THUMB_FILE_PATH+result.getFileStreCours()+result.getStreFileNm());

			if(file.exists()) {
				file.delete();
			}else {
				LOGGER.error("파일이 존재하지 않습니다.");
			}

			//파일 정보 삭제
			fileSeq = comonFileService.deleteCommonFileInfo(result);

		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}

		return fileSeq;
	}

	/**
	  * @Method Name : deleteThumbFile
	  * @작성일 : 2023. 3. 21.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	썸네일 파일 삭제
	  *  </p>
	  * @param : CommonFileVO 파일 정보
	  * @return : int
	  */
	public int deleteThumbFile(CommonFileVO result) throws Exception {
    	int fileSeq = 0;

    	try {

    		File file = new File(THUMB_FILE_PATH+result.getFileStreCours()+result.getStreFileNm());

    		if(file.exists()) {
    			file.delete();
    		}else {
    			LOGGER.error("파일이 존재하지 않습니다.");
    		}

			//파일 정보 삭제
    		fileSeq = comonFileService.deleteCommonDetailFileInfo(result);

    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new Exception(e);
    	}

		return fileSeq;
	}

	/**
	 * 공통 컴포넌트 utl.fcc 패키지와 Dependency제거를 위해 내부 메서드로 추가 정의함
	 * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
	 *
	 * @param
	 * @return Timestamp 값
	 * @see
	 */
	private static String getTimeStamp() {
		String rtnStr = null;
		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";
		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		rtnStr = sdfCurrent.format(ts.getTime());

		return rtnStr;
	}

}
