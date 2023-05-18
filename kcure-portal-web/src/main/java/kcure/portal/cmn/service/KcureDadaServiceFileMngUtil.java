package kcure.portal.cmn.service;

import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.util.SendFtpUtil;


@Component("KcureDadaServiceFileMngUtil")
public class KcureDadaServiceFileMngUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(KcureDadaServiceFileMngUtil.class);

	public static final int BUFF_SIZE = 2048;

	/*
	 * @Resource(name = "egovFileIdGnrService") private EgovIdGnrService
	 * idgenService;
	 */
	@Resource(name = "DataFileService")
	private DataFileService dataFileService;

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */

	public List<DataServiceFileVO> parseFileInf(List<MultipartFile> files, String dataAplcNo,String attfSpcd,String attdNmSpcd,String attfOwnrid,String prtiId) throws Exception {
		//		파일 업로드
		List<DataServiceFileVO> result = new ArrayList<DataServiceFileVO>();
		for (MultipartFile file : files ) {
			DataServiceFileVO fvo = parseFile( file, dataAplcNo, attfSpcd, attdNmSpcd, attfOwnrid, prtiId);
			result.add(fvo);
		}

		sendFileMethod(result,files);

		return result;
	}

	private void sendFileMethod(List<DataServiceFileVO> result, List<MultipartFile> fileList) throws Exception {
		SendFtpUtil ftp = new SendFtpUtil();
    	InputStream fis = null;
		try {
    		ftp.connect();
    		String sendFolder = "";
    		//파일업로드 경로 추출. 저장로직이기 때문에 폴더까지 미리 생성한다.
    		for(DataServiceFileVO fvo : result) {
    			if(!sendFolder.equals(fvo.getAttfPthNm())) {
    				sendFolder = ftp.chkFolderPath(fvo.getAttfPthNm() , "Y");
    			}
    		}

    		for (int i=0; i < fileList.size() ; i++) {

        		if (!fileList.get(i).getOriginalFilename().equals("")) {
    				//String filename = fileList.get(i).getOriginalFilename();
        			String filename = result.get(i).getAttfStrNm();
    	    		try {
    	    			fis = (InputStream)fileList.get(i).getInputStream();
    	    			ftp.storeFile(result.get(i).getAttfPthNm(), filename, fis);
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
    		throw new Exception(e);
    	}

	}

	/**
	  * @Method Name : parseFileInf
	  * @작성일 : 2023. 3. 3.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  </p>
	  * @param : MultipartFile file 파일
	  * @param : String dataAplcNo 데이터 신청번호
	  * @param : String attfSpcd 파일 구분코드
	  * 		01.대이터신청자제출파일
				02.심의자의견제출파일
				03.승인후참여기관제공파일
				04.신청자반입파일
				05.신청자반출파일
	  * @param : String attdNmSpcd 파일서류명구분코드
  * 			01.신청서
				02.연구요약서
				03.연구요약서(별지)
				04.연구계획서
				05.IRB승인문서
				06.기타(연구원증빙서류)
				07.개인정보수집이용동의서
				08.보안각서
				09.위원보안서약서
				10.회피신청서
				11.심의결과관련문서
				12.IRB결과통지서
				80.승인후참여기관제공파일
				81.신청자반입파일
				82.신청자반출파일
				99.기타
	  * @param : String attfOwnrid 파일소유자 id
	  * @param : String prtiId 참여기관 id
	  * @return :
	  */
	public DataServiceFileVO parseFileInf(MultipartFile file, String dataAplcNo,String attfSpcd,String attdNmSpcd,String attfOwnrid,String prtiId) throws Exception {
		System.out.println(file.getOriginalFilename());
		DataServiceFileVO fileVo = parseFile(file,dataAplcNo,attfSpcd,attdNmSpcd,attfOwnrid,prtiId);
		List<DataServiceFileVO> result = new ArrayList<DataServiceFileVO>();
		result.add(fileVo);
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		files.add(file);
//		파일 업로드
		sendFileMethod(result,files);

		return fileVo;

	}

	/**
	 * @Method Name : parseFileInfDsz
	 * @작성일 : 2023. 03. 17.
	 * @작성자 : kyh
	 * @Method 설명 :  안심활용센터신청용
	 * @param : dtuAplcNo 데이터활용신청번호 추가
	 * @return :
	 */
	public DataServiceFileVO parseFileInfDsz(MultipartFile file, String dataAplcNo,String attfSpcd,String attdNmSpcd,String attfOwnrid,String prtiId,String dtuAplcNo) throws Exception {
		System.out.println(file.getOriginalFilename());
		DataServiceFileVO fileVo = parseFile(file,dataAplcNo,attfSpcd,attdNmSpcd,attfOwnrid,prtiId);

		//dtuAplcNo 데이터활용신청번호
		fileVo.setDtuAplcNo(dtuAplcNo);

		List<DataServiceFileVO> result = new ArrayList<DataServiceFileVO>();
		result.add(fileVo);
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		files.add(file);
		//파일 업로드
		sendFileMethod(result,files);

		return fileVo;

	}

	private DataServiceFileVO parseFile(MultipartFile file, String dataAplcNo,String attfSpcd,String attdNmSpcd,String attfOwnrid,String prtiId) throws Exception {
		System.out.println("-----------------------------2 -1-------------------");
		String storePathString = "";
		if ("".equals(attfSpcd) || attfSpcd == null) {
			storePathString = EgovProperties.getProperty("Globals.fileStorePath");
		} else {
			storePathString = CommonEnum.DataAttfSpcd.valueOfFilePath(attfSpcd);
			switch (attfSpcd) {
//			# 신청관련_신청자의 제출서류 ( NAS 폴더 정의 K-CURE/apc/dsb/신청번호 ) 01
//			# 심의관련파일 심의자가 의견제출하는 파일 ( NAS 폴더 정의 K-CURE/rvw/dsb/신청번호) 02
//			# 반일파일 ( NAS 폴더 정의 K-CURE/brn/신청번호) 04
			case "01" :
			case "02" :
			case "04" :
				storePathString +=   dataAplcNo ;
				break;
//			# 승인관련파일_참여기관에서 전송하는 신청관련 파일 ( NAS 폴더 정의 K-CURE/apv/신청번호/참여기관명 ) 03
			case "03" :
				String prtiNm = dataFileService.selectPrtiNm(prtiId);
				storePathString +=  dataAplcNo + "/"+ prtiNm;
				break;
//			# 반출파일 ( NAS 폴더 정의 K-CURE/cro/신청번호/연구자및신청자ID ) 05
			case "05" :
				storePathString +=   dataAplcNo +"/"+ attfOwnrid;
				break;
//			# 데이터신청파일  ( NAS 폴더 정의 K-CURE/drq/신청번호/연구자및신청자ID/참여기관코드) 06
			case "06" :
				storePathString +=   dataAplcNo + "/" + attfOwnrid + "/" +  prtiId;
				break;
			default:
				break;
			}
		}

		String userId = "";
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (loginVO != null) {
			userId = loginVO.getId();
		}
		DataServiceFileVO result = new DataServiceFileVO();
		String orginFileName = file.getOriginalFilename();
		//--------------------------------------
		// 원 파일명이 없는 경우 처리
		// (첨부가 되지 않은 input file type)
		//--------------------------------------
		if (!"".equals(orginFileName)) {
			result.setDataAplcNo(dataAplcNo);
			result.setAttfSpcd(attfSpcd);
			result.setAttdNmSpcd(attdNmSpcd);
			result.setAttfOwnrId(attfOwnrid);
			result.setAttfNm(orginFileName);
			int index = orginFileName.lastIndexOf(".");
			String fileExt = orginFileName.substring(index + 1);
			String filename = dataAplcNo+"_"+attfSpcd+"_"+attdNmSpcd+"_"+ getTimeStamp()+"."+fileExt;
			result.setAttfStrNm(filename);
			result.setAttfPthNm(storePathString);
			result.setUserId(userId);
		}
		////------------------------------------
		return result;
	}

	public int insertDataFile(DataServiceFileVO result) {
		//파일 정보 등록
		int fileSeq = dataFileService.insertDataFileInfo(result);
		return fileSeq;
	}


	public int deletetDataFile(DataServiceFileVO result) throws Exception {
		//폴더 파일 삭제.
    	SendFtpUtil ftp = new SendFtpUtil();
    	int fileSeq = 0;
    	try {
    		ftp.connect();
    		//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
    		String sendFolder = ftp.chkFolderPath(result.getAttfPthNm(), "N");
    		ftp.delFile(sendFolder, result.getAttfStrNm());
    		ftp.disconnect();
			//파일 정보 삭제
			fileSeq = dataFileService.deletetDataFileInfo(result);

    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new Exception(e);
    	}

		return fileSeq;
	}


	public DataServiceFileVO selectFileOne(DataServiceFileVO result) {
		return dataFileService.selectFileOne(result);
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

	/**
	  * @Method Name : selectFileList
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *   서비스 신청 첨부파일 가져오기
	  *  </p>
	  * @param :
	  * @return :
	  */
	public List<DataServiceFileVO> selectFileList(DataServiceFileVO dataServiceFileVO) {
		return dataFileService.selectFiles(dataServiceFileVO);
	}

	public void deletetDataFiles(List<DataServiceFileVO> resultList) throws Exception {
		//폴더 파일 삭제.
    	SendFtpUtil ftp = new SendFtpUtil();
    	int fileSeq = 0;
    	try {
    		ftp.connect();
    		for(DataServiceFileVO result : resultList) {
    			//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
        		String sendFolder = ftp.chkFolderPath(result.getAttfPthNm(), "N");
        		ftp.delFile(sendFolder, result.getAttfStrNm());
    			//파일 정보 삭제
    			fileSeq = dataFileService.deletetDataFileInfo(result);
    		}
    		ftp.disconnect();
    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new Exception(e);
    	}
	}

	public void deleteSvcDataAllFiles(String dataAplcNo) throws Exception {
		//데이터 신청 첨부파일 조회
		List<DataServiceFileVO> resultList = dataFileService.selectSvcDataAllFile(dataAplcNo);

		//폴더 파일 삭제.
		SendFtpUtil ftp = new SendFtpUtil();
		try {
			ftp.connect();
			for(DataServiceFileVO result : resultList) {
				//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
				String sendFolder = ftp.chkFolderPath(result.getAttfPthNm(), "N");
				ftp.delFile(sendFolder, result.getAttfStrNm());
			}

			//파일 정보 삭제
			dataFileService.deleteSvcDataAllFile(resultList.get(0).getDataAplcNo());

			ftp.disconnect();
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
}
