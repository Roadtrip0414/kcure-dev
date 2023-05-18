package kcure.portal.cmn.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import egovframework.com.cmm.service.EgovProperties;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.util
 * @FileName : SendMailUtil.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	시스템 메일 발송
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
public class SendMailUtil {
	
	/**
	 * @Method Name : getEmailContents
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	메일 템플릿 추출
	 * @param : File file 메일 템플릿
	 * @return : String
	 */
	public static String getEmailContents(File file) throws Exception {
		String emailContents = "";	//메일내용
    	
    	FileReader filereader = new FileReader(file);
    	
    	BufferedReader bufReader = new BufferedReader(filereader);
    	
    	String line = "";
    	try{
        	while((line = bufReader.readLine()) != null){
        		//System.out.println(line);
        		emailContents = emailContents + line;
        	}
    	} catch(Exception e) {
    		e.printStackTrace();
    	} finally {
    		bufReader.close();
        	filereader.close();
        }
		
		return emailContents;
	}
	
	/**
	 * @Method Name : sendMail
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	시스템 메일 발송
	 * @param : String emailTitle 메일제목, String emailContents 메일내용(html), List<String> rcvEmailAddrArr 수신자메일주소목록, List<File> emailAtchfiles 첨부파일목록
	 * @return :
	 */
    public static void sendMail(String emailTitle, String emailContents, List<String> rcvEmailAddrArr, List<File> emailAtchfiles) {
        String user = EgovProperties.getProperty("email.send.id").trim(); // 계정
        String userNm = EgovProperties.getProperty("email.send.nm").trim(); // 보내는사람 이름
        String password = EgovProperties.getProperty("email.send.pwd").trim();   // 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", EgovProperties.getProperty("email.send.host").trim()); //smtp 주소
        prop.put("mail.smtp.port", EgovProperties.getProperty("email.send.port").trim()); //smtp 포트
        prop.put("mail.smtp.auth", "true");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user, userNm, "UTF-8"));

            //수신자메일주소
            InternetAddress[] rcvEmailAddr = null;
            if (rcvEmailAddrArr.size() > 0) {
            	rcvEmailAddr = new InternetAddress[rcvEmailAddrArr.size()];
            			
            	for (int i = 0; i < rcvEmailAddrArr.size(); i++) {
            		rcvEmailAddr[i] = new InternetAddress((String)rcvEmailAddrArr.get(i));
            	}
            }
            message.addRecipients(Message.RecipientType.TO, rcvEmailAddr);

            // Subject
            message.setSubject(emailTitle, "UTF-8");

            // Contents
            //message.setContent(emailContents, "text/html; charset=UTF-8");
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            messageBodyPart.setContent(emailContents, "text/html; charset=UTF-8");
            multipart.addBodyPart(messageBodyPart);
            
            if (emailAtchfiles != null && emailAtchfiles.size() > 0) {
            	for (int i = 0; i < emailAtchfiles.size(); i++) {
            		File file = (File)emailAtchfiles.get(i);
            		
            		if (file.exists()) {
            			MimeBodyPart messageAtchPart = new MimeBodyPart();
            			
            			DataSource fileSource = new FileDataSource(file);
            			
            			messageAtchPart.setDataHandler(new DataHandler(fileSource));
            			
            			try {
            				messageAtchPart.setFileName(MimeUtility.encodeText(file.getName().toString()));
            			} catch (Exception e) {
            				e.printStackTrace();
						}
            			
            			multipart.addBodyPart(messageAtchPart);
            		}
            	}
            }
            
            message.setContent(multipart);

            // send the message
            Transport.send(message); ////전송
            //System.out.println("message sent successfully...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
