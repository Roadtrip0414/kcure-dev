package kcure.portal.cmn.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import egovframework.com.cmm.service.EgovProperties;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.util
 * @FileName : SendFtpUtil.java
 * @since : 2023. 02. 01.
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	ftp 파일 전송
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
public class SendFtpUtil {
/* SFTP 처리 로직 S */
//	private JSch jsch;
//
//	public Session session = null;
//	public Channel channel = null;
//	public ChannelSftp channelSftp = null;
//
//	public SendFtpUtil() {
//		this.jsch = new JSch();
//	}
//
//	/**
//	 * @Method Name : connect
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	FTP  연결
//	 * @param :
//	 * @return :
//	 */
//	public void connect() throws Exception{
//		String url = EgovProperties.getProperty("nas.ftp.url").trim();	//FTP IP
//		int port = Integer.parseInt(EgovProperties.getProperty("nas.ftp.port").trim());	//FTP port
//		String id = EgovProperties.getProperty("nas.ftp.id").trim();	//FTP login Id
//		String keyFile = EgovProperties.getProperty("nas.ftp.keyFile.path").trim();	//FTP 인증 Key
//
//		try {
//			//key 인증방식일경우
//			jsch.addIdentity(keyFile);
//
//			//세션객체 생성
//            session = jsch.getSession(id, url, port);
//
//            //비밀번호 인증방식일경우
//            //session.setPassword(pwd); //password 설정
//
//            //세션관련 설정정보 설정
//            java.util.Properties config = new java.util.Properties();
//
//            //호스트 정보 검사하지 않는다.
//            config.put("StrictHostKeyChecking", "no");
//            session.setConfig(config);
//            session.setTimeout(20000 * 10); //타임아웃 설정
//
//            session.connect();	//접속
//
//            channel = session.openChannel("sftp");	//sftp 채널 접속
//            channel.connect();
//
//    		channelSftp = (ChannelSftp) channel;
//		} catch (Exception e) {
//			if(e.getMessage().indexOf("refused") != -1) {
//				throw new Exception("FTP서버 연결실패");
//			}
//            throw e;
//		}
//	}
//
//	/**
//	 * @Method Name : disconnect
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	FTP  연결해제
//	 * @param :
//	 * @return :
//	 */
//	public void disconnect(){
//		try {
//			if(channelSftp != null) {
//				channelSftp.quit();
//			}
//			if(channel != null) {
//				channel.disconnect();
//			}
//			if(session != null) {
//				session.disconnect();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * @Method Name : chkFolderPath
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	파일 업로드 경로 설정
//	 * @param : String dir 업로드폴더경로, String makeFolderYn 업로드폴더생성여부
//	 * @return : String
//	 */
//	public String chkFolderPath(String dir, String makeFolderYn) throws Exception{
//		boolean result = false;
//		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder
//		String chkFolderPath = "";
//
//		String[] directory = dir.split("/");
//
//		for(int i=0; i < directory.length; i++) {
//			if (directory[i] != null && !"".equals(directory[i])) {
//				//Y일 경우 폴더를 생성한다.
//				if (makeFolderYn.equals("Y")) {
//					try {
//						String makeFolder = baseFolder + conversionStrKo(chkFolderPath);
//
//						result = existsChk(makeFolder + "/" + conversionStrKo(directory[i]));	//저장파일경로
//
//						if(!result){	// result = False 는 저장파일경로가 존재하지 않음
//							channelSftp.cd(makeFolder);	//저장파일경로 이동
//							channelSftp.mkdir(conversionStrKo(directory[i]));	//저장파일경로 생성
//						}
//					} catch (Exception e) {
//						if(e.getMessage().indexOf("not open") != -1) {
//							throw new Exception("FTP서버 연결실패");
//						}
//			            throw e;
//					}
//
//				}
//
//				chkFolderPath = chkFolderPath + "/" + directory[i];
//			}
//		}
//
//		return chkFolderPath;
//	}
//
//	/**
//	 * @Method Name : storeFile
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	FTP  파일 업로드
//	 * @param : String dir 업로드폴더경로, String saveFileNm 업로드파일명, InputStream inputStream 업로드파일
//	 * @return :
//	 */
//	public void storeFile(String dir, String saveFileNm, InputStream inputStream) throws Exception{
//		boolean result = false;
//		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder
//
//		try {
//			//폴더 존재 여부 확인 및 이동
//			dir = baseFolder + conversionStrKo(dir);
//			result = existsChk(dir);	//저장파일경로
//
//			if(result){	// result = False 는 저장파일경로가 존재하지 않음
//				channelSftp.cd(dir);	//저장파일경로 이동
//
//				//파일 존재 여부 확인 후 존재하면 파일명 변경
//				int loopChk = 0;
//				int fileNmAddCnt = 0;
//
//				do {
//					channelSftp.cd(dir);	//저장파일경로 이동
//
//					Vector<ChannelSftp.LsEntry> flist = channelSftp.ls(dir);
//
//					for(ChannelSftp.LsEntry entry : flist){
//						if(!entry.getFilename().equals(".") && !entry.getFilename().equals("..") && entry.getFilename().indexOf(".") != 0 && entry.getFilename().equals(saveFileNm)){
//							loopChk = 1;
//							fileNmAddCnt = fileNmAddCnt + 1;
//							break;
//						} else {
//							loopChk = 0;
//						}
//					}
//
//					if (loopChk > 0) {
//						saveFileNm = FilenameUtils.getBaseName(saveFileNm) + "_" + fileNmAddCnt + "." + FilenameUtils.getExtension(saveFileNm);
//					}
//				} while(loopChk > 0);
//
//				channelSftp.put(inputStream, conversionStrKo(saveFileNm));
//
//				if(!existsChk(dir + "/" + conversionStrKo(saveFileNm))) {
//					throw new Exception("FTP서버 업로드실패");
//				}
//			} else {
//				throw new Exception("FTP서버 폴더 미 존재");
//			}
//		} catch (Exception e) {
//			if(e.getMessage().indexOf("not open") != -1) {
//				throw new Exception("FTP서버 연결실패");
//			}
//            throw e;
//		}
//	}
//
//	/**
//	 * @Method Name : readFileList
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	FTP  파일목록조회
//	 * @param : String dir 업로드폴더경로
//	 * @return : List
//	 */
//	public List<Map<String, String>> readFileList(String dir) throws Exception{
//		boolean result = false;
//		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder
//		List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();
//
//		try {
//			dir = baseFolder + conversionStrKo(dir);
//			result = existsChk(dir);	//저장파일경로
//
//			if(result){	// result = False 는 저장파일경로가 존재하지 않음
//				channelSftp.cd(dir);	//저장파일경로 이동
//
//				Vector<ChannelSftp.LsEntry> flist = channelSftp.ls(dir);
//
//				for(ChannelSftp.LsEntry entry : flist){
//					if(!entry.getFilename().equals(".") && !entry.getFilename().equals("..") && entry.getFilename().indexOf(".") != 0){
//						//System.out.println(entry.getFilename());
//						Map<String, String> fileMap = new HashMap<String, String>();
//						fileMap.put("fileName", entry.getFilename());
//						fileList.add(fileMap);
//					}
//				}
//			} else {
//				throw new Exception("FTP서버 폴더 미 존재");
//			}
//		} catch (Exception e) {
//			if(e.getMessage().indexOf("not open") != -1) {
//				throw new Exception("FTP서버 연결실패");
//			}
//            throw e;
//		}
//
//		return fileList;
//	}
//
//	/**
//	 * @Method Name : downFile
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	FTP  파일다운로드
//	 * @param : String dir 업로드폴더경로, String fileName 파일명
//	 * @return :
//	 */
//	public InputStream downFile(String dir, String fileName) throws Exception{
//		boolean result = false;
//		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder
//
//		InputStream inputStream = null;
//
//		try {
//			dir = baseFolder + conversionStrKo(dir);
//			fileName = conversionStrKo(fileName);
//
//			result = existsChk(dir);	//저장파일경로
//
//			if(result){	// result = False 는 저장파일경로가 존재하지 않음
//				channelSftp.cd(dir);	//저장파일경로 이동
//
//	            inputStream = channelSftp.get(fileName);
//			} else {
//				throw new Exception("FTP서버 폴더 미 존재");
//			}
//		} catch (Exception e) {
//			if(e.getMessage().indexOf("not open") != -1) {
//				throw new Exception("FTP서버 연결실패");
//			}
//            throw e;
//		}
//
//		return inputStream;
//	}
//
//	/**
//	 * @Method Name : allDownFile
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	FTP  파일일괄다운로드
//	 * @param : String dir 업로드폴더경로
//	 * @return :
//	 */
//	public void allDownFile(String dir) throws Exception{
//		boolean result = false;
//		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder
//
//		File file = null;
//		FileOutputStream fos = null;
//		InputStream inputStream = null;
//
//		try {
//			dir = baseFolder + conversionStrKo(dir);
//
//			result = existsChk(dir);	//저장파일경로
//
//			if(result){	// result = False 는 저장파일경로가 존재하지 않음
//				channelSftp.cd(dir);	//저장파일경로 이동
//
//				Vector<ChannelSftp.LsEntry> flist = channelSftp.ls(dir);
//
//				for(ChannelSftp.LsEntry entry : flist){
//					if(!entry.getFilename().equals(".") && !entry.getFilename().equals("..") && entry.getFilename().indexOf(".") != 0){
//						inputStream = channelSftp.get(conversionStrKo(entry.getFilename()));
//
//						try {
//							file = new File("C:\\kcure_dev\\", entry.getFilename());//로컬에 다운받아 설정할 이름
//
//							fos = new FileOutputStream(file);
//
//				            int i;
//
//				            while ((i = inputStream.read()) != -1) {
//				            	fos.write(i);
//				            }
//						} catch (Exception e) {
//							throw e;
//						} finally {
//							if(inputStream != null) inputStream.close();
//							if(fos != null) fos.close();
//						}
//					}
//				}
//			} else {
//				throw new Exception("FTP서버 폴더 미 존재");
//			}
//		} catch (Exception e) {
//			if(e.getMessage().indexOf("not open") != -1) {
//				throw new Exception("FTP서버 연결실패");
//			}
//            throw e;
//		}
//	}
//
//	/**
//	 * @Method Name : delFile
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	FTP  파일 삭제
//	 * @param : String dir 업로드폴더경로, String fileName 파일명
//	 * @return :
//	 */
//	public void delFile(String dir, String fileName) throws Exception{
//		boolean result = false;
//		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder
//
//		try {
//			dir = baseFolder + conversionStrKo(dir);
//			fileName = conversionStrKo(fileName);
//
//			result = existsChk(dir);	//저장파일경로
//
//			if(result){	// result = False 는 저장파일경로가 존재하지 않음
//				channelSftp.cd(dir);	//저장파일경로 이동
//
//				channelSftp.rm(fileName);
//			} else {
//				throw new Exception("FTP서버 폴더 미 존재");
//			}
//		} catch (Exception e) {
//			if(e.getMessage().indexOf("not open") != -1) {
//				throw new Exception("FTP서버 연결실패");
//			}
//            throw e;
//		}
//	}
//
//	/**
//	 * @Method Name : allDelFile
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	FTP  파일 일괄삭제
//	 * @param : String dir 업로드폴더경로
//	 * @return :
//	 */
//	public void allDelFile(String dir) throws Exception{
//		boolean result = false;
//		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder
//
//		try {
//			dir = baseFolder + conversionStrKo(dir);
//
//			result = existsChk(dir);	//저장파일경로
//
//			if(result){	// result = False 는 저장파일경로가 존재하지 않음
//				channelSftp.cd(dir);	//저장파일경로 이동
//
//				Vector<ChannelSftp.LsEntry> flist = channelSftp.ls(dir);
//
//				for(ChannelSftp.LsEntry entry : flist){
//					if(!entry.getFilename().equals(".") && !entry.getFilename().equals("..") && entry.getFilename().indexOf(".") != 0){
//						channelSftp.rm(conversionStrKo(entry.getFilename()));
//					}
//				}
//			} else {
//				throw new Exception("FTP서버 폴더 미 존재");
//			}
//		} catch (Exception e) {
//			if(e.getMessage().indexOf("not open") != -1) {
//				throw new Exception("FTP서버 연결실패");
//			}
//            throw e;
//		}
//	}
//
//	/**
//	 * @Method Name : conversionStrKo
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 :  	FTP 한글명 처리
//	 * @param : String dir 업로드폴더경로
//	 * @return :
//	 */
//	public String conversionStrKo(String convStr){
//		try {
//			//WAS와 NAS의 캐릭터셋이 동일하지 않을 경우 변환로직을 사용한다.
//			//convStr = new String(convStr.getBytes("euc-kr"),"iso_8859_1");
//			convStr = convStr;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return convStr;
//	}
//
//   /**
//	 * @Method Name : existsChk
//	 * @작성일 : 2023. 02. 01.
//	 * @작성자 : kyh
//	 * @Method 설명 : 디렉토리( or 파일) 존재 여부
//	 * @param : path 디렉토리 (or 파일)
//	 * @return :
//	 */
//	public boolean existsChk(String path) {
//        Vector res = null;
//        try {
//            res = channelSftp.ls(path);
//        } catch (Exception e) {
//        	return false;
//        }
//        return res != null && !res.isEmpty();
//    }
/* SFTP 처리 로직 E */

/* FTP 처리 로직 S */
	private FTPClient ftpClient;

	public SendFtpUtil() {
		this.ftpClient = new FTPClient();
	}

	/**
	 * @Method Name : connect
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	FTP  연결
	 * @param :
	 * @return :
	 */
	public void connect() throws Exception{
		String url = EgovProperties.getProperty("nas.ftp.url").trim();	//FTP IP
		int port = Integer.parseInt(EgovProperties.getProperty("nas.ftp.port").trim());	//FTP port
		String id = EgovProperties.getProperty("nas.ftp.id").trim();	//FTP login Id
		String pwd = EgovProperties.getProperty("nas.ftp.pwd").trim();	//FTP login pwd

		try {
			ftpClient.connect(url, port);			//FTP 연결
			ftpClient.setControlEncoding("euc-kr");	//FTP 인코딩 설정
			int reply = ftpClient.getReplyCode();	//응답코드 받기

			if (!FTPReply.isPositiveCompletion(reply)) {	//응답 False인 경우 연결 해제
				ftpClient.disconnect();
				throw new Exception("FTP서버 연결실패");
			}
			if(!ftpClient.login(id, pwd)) {
				ftpClient.logout();
				throw new Exception("FTP서버 로그인실패");
			}

			ftpClient.setSoTimeout(20000 * 10);		//Timeout 설정
			ftpClient.login(id, pwd);				//FTP 로그인
			ftpClient.setFileType(FTP.BINARY_FILE_TYPE);	//파일타입설정
			ftpClient.enterLocalPassiveMode();			//Active 모드 설정
		} catch (Exception e) {
			if(e.getMessage().indexOf("refused") != -1) {
				throw new Exception("FTP서버 연결실패");
			}
            throw e;
		}
	}

	/**
	 * @Method Name : disconnect
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	FTP  연결해제
	 * @param :
	 * @return :
	 */
	public void disconnect(){
		try {
			if(ftpClient.isConnected()){
				ftpClient.disconnect();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Method Name : chkFolderPath
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	파일 업로드 경로 설정
	 * @param : String dir 업로드폴더경로, String makeFolderYn 업로드폴더생성여부
	 * @return : String
	 */
	public String chkFolderPath(String dir, String makeFolderYn) throws Exception{
		boolean result = false;
		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder
		String chkFolderPath = "";

		String[] directory = dir.split("/");

		for(int i=0; i < directory.length; i++) {
			if (directory[i] != null && !"".equals(directory[i])) {
				chkFolderPath = chkFolderPath + "/" + directory[i];

				//Y일 경우 폴더를 생성한다.
				if (makeFolderYn.equals("Y")) {
					try {
						String makeFolder = baseFolder + conversionStrKo(chkFolderPath);

						result = ftpClient.changeWorkingDirectory(makeFolder);	//저장파일경로

						if(!result){	// result = False 는 저장파일경로가 존재하지 않음
							ftpClient.makeDirectory(makeFolder);	//저장파일경로 생성
						}
					} catch (Exception e) {
						if(e.getMessage().indexOf("not open") != -1) {
							throw new Exception("FTP서버 연결실패");
						}
			            throw e;
					}

				}
			}
		}

		return chkFolderPath;
	}

	/**
	 * @Method Name : storeFile
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	FTP  파일 업로드
	 * @param : String dir 업로드폴더경로, String saveFileNm 업로드파일명, InputStream inputStream 업로드파일
	 * @return :
	 */
	public void storeFile(String dir, String saveFileNm, InputStream inputStream) throws Exception{
		boolean result = false;
		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder

		try {
			//폴더 존재 여부 확인 및 이동
			dir = baseFolder + conversionStrKo(dir);
			result = ftpClient.changeWorkingDirectory(dir);	//저장파일경로

			if(result){	// result = False 는 저장파일경로가 존재하지 않음
				//파일 존재 여부 확인 후 존재하면 파일명 변경
				int loopChk = 0;
				int fileNmAddCnt = 0;

				do {
					for(String fileName :ftpClient.listNames()){
						if (fileName.equals(saveFileNm)) {
							loopChk = 1;
							fileNmAddCnt = fileNmAddCnt + 1;
							break;
						} else {
							loopChk = 0;
						}
					}

					if (loopChk > 0) {
						saveFileNm = FilenameUtils.getBaseName(saveFileNm) + "_" + fileNmAddCnt + "." + FilenameUtils.getExtension(saveFileNm);
					}
				} while(loopChk > 0);

				if(!ftpClient.storeFile(conversionStrKo(saveFileNm), inputStream)) {
					throw new Exception("FTP서버 업로드실패");
				}
			} else {
				throw new Exception("FTP서버 폴더 미 존재");
			}
		} catch (Exception e) {
			if(e.getMessage().indexOf("not open") != -1) {
				throw new Exception("FTP서버 연결실패");
			}
            throw e;
		}
	}

	/**
	 * @Method Name : readFileList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	FTP  파일목록조회
	 * @param : String dir 업로드폴더경로
	 * @return : List
	 */
	public List<Map<String, String>> readFileList(String dir) throws Exception{
		boolean result = false;
		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder
		List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();

		try {
			dir = baseFolder + conversionStrKo(dir);
			result = ftpClient.changeWorkingDirectory(dir);	//저장파일경로

			if(result){	// result = False 는 저장파일경로가 존재하지 않음
				for(String fileName :ftpClient.listNames()){
					//System.out.println(fileName);
					Map<String, String> fileMap = new HashMap<String, String>();
					fileMap.put("fileName", fileName);
					fileList.add(fileMap);
				}
			} else {
				throw new Exception("FTP서버 폴더 미 존재");
			}
		} catch (Exception e) {
			if(e.getMessage().indexOf("not open") != -1) {
				throw new Exception("FTP서버 연결실패");
			}
            throw e;
		}

		return fileList;
	}

	/**
	 * @Method Name : downFile
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	FTP  파일다운로드
	 * @param : String dir 업로드폴더경로, String fileName 파일명
	 * @return :
	 */
	public InputStream downFile(String dir, String fileName) throws Exception{
		boolean result = false;
		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder

		InputStream inputStream = null;

		try {
			dir = baseFolder + conversionStrKo(dir);
			fileName = conversionStrKo(fileName);

			result = ftpClient.changeWorkingDirectory(dir);	//저장파일경로

			if(result){	// result = False 는 저장파일경로가 존재하지 않음
	            inputStream = ftpClient.retrieveFileStream(dir + "/" + fileName);
			} else {
				throw new Exception("FTP서버 폴더 미 존재");
			}
		} catch (Exception e) {
			if(e.getMessage().indexOf("not open") != -1) {
				throw new Exception("FTP서버 연결실패");
			}
            throw e;
		}

		return inputStream;
	}

	/**
	 * @Method Name : allDownFile
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	FTP  파일일괄다운로드
	 * @param : String dir 업로드폴더경로
	 * @return :
	 */
	public void allDownFile(String dir) throws Exception{
		boolean result = false;
		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder

		File file = null;
		FileOutputStream fos = null;

		try {
			dir = baseFolder + conversionStrKo(dir);

			result = ftpClient.changeWorkingDirectory(dir);	//저장파일경로

			if(result){	// result = False 는 저장파일경로가 존재하지 않음
				for(String fileName :ftpClient.listNames()){
					file = new File("C:\\kcure_dev\\", fileName);//로컬에 다운받아 설정할 이름

					fos = new FileOutputStream(file);

					ftpClient.retrieveFile(conversionStrKo(fileName), fos);
				}
			} else {
				throw new Exception("FTP서버 폴더 미 존재");
			}
		} catch (Exception e) {
			if(e.getMessage().indexOf("not open") != -1) {
				throw new Exception("FTP서버 연결실패");
			}
            throw e;
		} finally {
            fos.close();
		}
	}

	/**
	 * @Method Name : delFile
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	FTP  파일 삭제
	 * @param : String dir 업로드폴더경로, String fileName 파일명
	 * @return :
	 */
	public void delFile(String dir, String fileName) throws Exception{
		boolean result = false;
		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder

		try {
			dir = baseFolder + conversionStrKo(dir);
			fileName = conversionStrKo(fileName);

			result = ftpClient.changeWorkingDirectory(dir);	//저장파일경로

			if(result){	// result = False 는 저장파일경로가 존재하지 않음
	            ftpClient.deleteFile(fileName);
			} else {
				throw new Exception("FTP서버 폴더 미 존재");
			}
		} catch (Exception e) {
			if(e.getMessage().indexOf("not open") != -1) {
				throw new Exception("FTP서버 연결실패");
			}
            throw e;
		}
	}

	/**
	 * @Method Name : allDelFile
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	FTP  파일 일괄삭제
	 * @param : String dir 업로드폴더경로
	 * @return :
	 */
	public void allDelFile(String dir) throws Exception{
		boolean result = false;
		String baseFolder = EgovProperties.getProperty("nas.ftp.baseFolder").trim();	//FTP baseFolder

		try {
			dir = baseFolder + conversionStrKo(dir);

			result = ftpClient.changeWorkingDirectory(dir);	//저장파일경로

			if(result){	// result = False 는 저장파일경로가 존재하지 않음
				for(String fileName :ftpClient.listNames()){
					ftpClient.deleteFile(conversionStrKo(fileName));
				}
			} else {
				throw new Exception("FTP서버 폴더 미 존재");
			}
		} catch (Exception e) {
			if(e.getMessage().indexOf("not open") != -1) {
				throw new Exception("FTP서버 연결실패");
			}
            throw e;
		}
	}

	/**
	 * @Method Name : conversionStrKo
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	FTP 한글명 처리
	 * @param : String dir 업로드폴더경로
	 * @return :
	 */
	public String conversionStrKo(String convStr){
		try {
			//사업단 NAS가 euc-kr로 되어 있으나 한글이 깨져 추가함
			convStr = new String(convStr.getBytes("euc-kr"),"iso_8859_1");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return convStr;
	}
/* FTP 처리 로직 E */
}
