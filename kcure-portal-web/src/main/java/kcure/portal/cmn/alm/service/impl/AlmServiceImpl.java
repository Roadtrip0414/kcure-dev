package kcure.portal.cmn.alm.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import kcure.portal.cmn.CommonEnum.NtceUserInfo;
import kcure.portal.cmn.alm.service.AlmService;
import kcure.portal.cmn.util.SendMailUtil;


/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.alm.service.impl
 * @FileName : DszServiceImpl.java
 * @since : 2023. 3. 23.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	사용자 알림 serviceImpl
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용S
 *  ----------   --------   ---------------------------
 *  2023.05.01		PSJ			데이터 신청 완료 폼 추가
 *  </pre>
 */
@Service("almService")
public class AlmServiceImpl implements AlmService{
	
	@Resource(name="almDAO")
    private AlmDAO almDAO;

	@Override
	public int insertSvcNtce(AlmVO almVO) throws Exception {
		return almDAO.insertSvcNtce(almVO);
	}

	@Override
	public void registAlrm(String param1, String param2, String param3) throws Exception {
		//회원가입 승인시
		if(NtceUserInfo.NTCE_SIGNUP_01.getSpDtlcd().equals(param1)) 
		{
			//추가정보 조회
			//AlmVO authData = almDAO.selectAuthNm(param3);
			AlmVO userData = almDAO.selectUserInfo(param2);
			
			AlmVO almVo = new AlmVO();
			almVo.setNtceSpcd(NtceUserInfo.NTCE_SIGNUP_01.getSpcd());
			almVo.setNtceDetlSpcd(NtceUserInfo.NTCE_SIGNUP_01.getSpDtlcd()); 
		
			MsgVO msgVo = almDAO.selectNtceMessage(almVo);
			
			almVo.setPrtiId(userData.getPrtiId());
			almVo.setNtceTrgtUserId(userData.getUserId());
			almVo.setNtceMsgCont(msgVo.getNtceMsgCont());
			almVo.setCnfrYn(NtceUserInfo.NTCE_SIGNUP_01.getCnfrYn());
			almVo.setMvmnUriAddr(NtceUserInfo.NTCE_SIGNUP_01.getMvmnUrl());
			almVo.setMvmnBtnClckYn(NtceUserInfo.NTCE_SIGNUP_01.getBtnClckYn());
			almVo.setMvmnBtnCrtnYn(NtceUserInfo.NTCE_SIGNUP_01.getBtnCrtnYn());	
			
			almDAO.insertSvcNtce(almVo);
			
			//TODO : Template 생성
			sendAlamEmail(almVo, msgVo);
		}
		//회원가입 반려시
		else if(NtceUserInfo.NTCE_SIGNUP_02.getSpDtlcd().equals(param1)) 
		{
			//추가정보 조회
			//AlmVO authData = almDAO.selectAuthNm(param3);
			AlmVO userData = almDAO.selectUserInfo(param2);
			
			AlmVO almVo = new AlmVO();
			almVo.setNtceSpcd(NtceUserInfo.NTCE_SIGNUP_02.getSpcd());
			almVo.setNtceDetlSpcd(NtceUserInfo.NTCE_SIGNUP_02.getSpDtlcd()); 
			
			MsgVO msgVo = almDAO.selectNtceMessage(almVo);
			
			//반려 사유 수정
			msgVo.setNtceMsgCont(msgVo.getNtceMsgCont().replace("$1", userData.getStatChanRsnCont())); 
			msgVo.setEmailMsgCont(msgVo.getEmailMsgCont().replace("$1", userData.getStatChanRsnCont())); 
			
			almVo.setPrtiId(userData.getPrtiId());
			almVo.setNtceTrgtUserId(userData.getUserId());
			almVo.setNtceMsgCont(msgVo.getNtceMsgCont());
			almVo.setCnfrYn(NtceUserInfo.NTCE_SIGNUP_02.getCnfrYn());
			almVo.setMvmnUriAddr(NtceUserInfo.NTCE_SIGNUP_02.getMvmnUrl());
			almVo.setMvmnBtnClckYn(NtceUserInfo.NTCE_SIGNUP_02.getBtnClckYn());
			almVo.setMvmnBtnCrtnYn(NtceUserInfo.NTCE_SIGNUP_02.getBtnCrtnYn());	
			
			almDAO.insertSvcNtce(almVo);

			//TODO : Template 생성
			sendAlamEmail(almVo, msgVo);
		}
		//데이터신청 승인시
		else if(NtceUserInfo.NTCE_DATA_01.getSpDtlcd().equals(param1)) 
		{
			//추가정보 조회
			AlmVO aplcData = almDAO.selectDataAplcInfo(param2);
			
			AlmVO almVo = new AlmVO();
			almVo.setNtceSpcd(NtceUserInfo.NTCE_DATA_01.getSpcd());
			almVo.setNtceDetlSpcd(NtceUserInfo.NTCE_DATA_01.getSpDtlcd()); 
			
			MsgVO msgVo = almDAO.selectNtceMessage(almVo);
			MsgVO msgVoSub = almDAO.selectDataAplc(param2);
			
			almVo.setPrtiId(aplcData.getPrtiId());
			almVo.setNtceTrgtUserId(aplcData.getDataAplpId());
			almVo.setNtceMsgCont(msgVo.getNtceMsgCont());
			almVo.setCnfrYn(NtceUserInfo.NTCE_DATA_01.getCnfrYn());
			almVo.setMvmnUriAddr(NtceUserInfo.NTCE_DATA_01.getMvmnUrl());
			almVo.setMvmnBtnClckYn(NtceUserInfo.NTCE_DATA_01.getBtnClckYn());
			almVo.setMvmnBtnCrtnYn(NtceUserInfo.NTCE_DATA_01.getBtnCrtnYn());	
			
			//폼 추가
			msgVo.setUserNm(msgVoSub.getUserNm());
			msgVo.setDataAplpId(msgVoSub.getDataAplpId()); 
			msgVo.setRsrSbjNm(msgVoSub.getRsrSbjNm());
			msgVo.setRsrDt(msgVoSub.getRsrDt());
			msgVo.setDataTpcdNm(msgVoSub.getDataTpcdNm());
		
			//알림 메일 내용 수정
			almVo.setNtceMsgCont(almVo.getNtceMsgCont().replace("$1", msgVoSub.getRsrSbjNm()));//알림 연구명 수정
			
			almDAO.insertSvcNtce(almVo);
			
			//TODO : Template 생성
			sendAlamEmail(almVo, msgVo);
		}
		//데이터신청 반려시
		else if(NtceUserInfo.NTCE_DATA_02.getSpDtlcd().equals(param1)) 
		{
			//추가정보 조회
			AlmVO aplcData = almDAO.selectDataAplcInfo(param2);
			
			AlmVO almVo = new AlmVO();
			almVo.setNtceSpcd(NtceUserInfo.NTCE_DATA_02.getSpcd());
			almVo.setNtceDetlSpcd(NtceUserInfo.NTCE_DATA_02.getSpDtlcd()); 
			
			MsgVO msgVo = almDAO.selectNtceMessage(almVo);
			MsgVO msgVoSub = almDAO.selectDataAplc(param2);
			
			almVo.setPrtiId(aplcData.getPrtiId());
			almVo.setNtceTrgtUserId(aplcData.getDataAplpId());
			almVo.setNtceMsgCont(msgVo.getNtceMsgCont());
			almVo.setCnfrYn(NtceUserInfo.NTCE_DATA_02.getCnfrYn());
			almVo.setMvmnUriAddr(NtceUserInfo.NTCE_DATA_02.getMvmnUrl());
			almVo.setMvmnBtnClckYn(NtceUserInfo.NTCE_DATA_02.getBtnClckYn());
			almVo.setMvmnBtnCrtnYn(NtceUserInfo.NTCE_DATA_02.getBtnCrtnYn());

			
			//폼 추가
			msgVo.setUserNm(msgVoSub.getUserNm());
			msgVo.setDataAplpId(msgVoSub.getDataAplpId()); 
			msgVo.setRsrSbjNm(msgVoSub.getRsrSbjNm());
			msgVo.setRsrDt(msgVoSub.getRsrDt());
			msgVo.setDataTpcdNm(msgVoSub.getDataTpcdNm());
			
			//알림 메일 내용 수정
			almVo.setNtceMsgCont(almVo.getNtceMsgCont().replace("$1", msgVoSub.getRjcRsnCont()));//알림 반려 사유 수정
			msgVo.setEmailMsgCont(msgVo.getEmailMsgCont().replace("$1", msgVoSub.getRjcRsnCont())); //메일 반려 사유 수정

			almDAO.insertSvcNtce(almVo);
			
			//TODO : Template 생성
			sendAlamEmail(almVo, msgVo);
		}
		//데이터신청 완료 시
		else if(NtceUserInfo.NTCE_DATA_03.getSpDtlcd().equals(param1)) 
		{
			//추가정보 조회
			AlmVO aplcData = almDAO.selectDataAplcInfo(param2);
			
			AlmVO almVo = new AlmVO();
			almVo.setNtceSpcd(NtceUserInfo.NTCE_DATA_03.getSpcd());
			almVo.setNtceDetlSpcd(NtceUserInfo.NTCE_DATA_03.getSpDtlcd()); 
			
			MsgVO msgVo = almDAO.selectNtceMessage(almVo);
			
			almVo.setPrtiId(aplcData.getPrtiId());
			almVo.setNtceTrgtUserId(aplcData.getDataAplpId());
			almVo.setNtceMsgCont(msgVo.getNtceMsgCont());
			almVo.setCnfrYn(NtceUserInfo.NTCE_DATA_03.getCnfrYn());
			almVo.setMvmnUriAddr(NtceUserInfo.NTCE_DATA_03.getMvmnUrl());
			almVo.setMvmnBtnClckYn(NtceUserInfo.NTCE_DATA_03.getBtnClckYn());
			almVo.setMvmnBtnCrtnYn(NtceUserInfo.NTCE_DATA_03.getBtnCrtnYn());	
			
			//2023.05.02 psj 추가
			//신청 완료 폼 데이터 조회
			MsgVO msgVoSub = almDAO.selectDataAplc(param2);
			msgVo.setUserNm(msgVoSub.getUserNm());
			msgVo.setDataAplpId(msgVoSub.getDataAplpId());
			msgVo.setRsrSbjNm(msgVoSub.getRsrSbjNm());
			msgVo.setRsrDt(msgVoSub.getRsrDt());
			msgVo.setDataTpcdNm(msgVoSub.getDataTpcdNm());
 
			//알림 내용 수정
			almVo.setNtceMsgCont(almVo.getNtceMsgCont().replace("$1", msgVoSub.getRsrSbjNm()));

			almDAO.insertSvcNtce(almVo);

			//TODO : Template 생성
			sendAlamEmail(almVo, msgVo);
		}
		//데이터신청 보완시
		else if(NtceUserInfo.NTCE_DATA_04.getSpDtlcd().equals(param1)) 
		{
			//추가정보 조회
			AlmVO aplcData = almDAO.selectDataAplcInfo(param2);
			
			AlmVO almVo = new AlmVO();
			almVo.setNtceSpcd(NtceUserInfo.NTCE_DATA_04.getSpcd());
			almVo.setNtceDetlSpcd(NtceUserInfo.NTCE_DATA_04.getSpDtlcd()); 
			
			MsgVO msgVo = almDAO.selectNtceMessage(almVo);
			MsgVO msgVoSub = almDAO.selectDataAplc(param2);
			
			almVo.setPrtiId(aplcData.getPrtiId());
			almVo.setNtceTrgtUserId(aplcData.getDataAplpId());
			almVo.setNtceMsgCont(msgVo.getNtceMsgCont());
			almVo.setCnfrYn(NtceUserInfo.NTCE_DATA_04.getCnfrYn());
			almVo.setMvmnUriAddr(NtceUserInfo.NTCE_DATA_04.getMvmnUrl());
			almVo.setMvmnBtnClckYn(NtceUserInfo.NTCE_DATA_04.getBtnClckYn());
			almVo.setMvmnBtnCrtnYn(NtceUserInfo.NTCE_DATA_04.getBtnCrtnYn());
			
			//폼 추가
			msgVo.setUserNm(msgVoSub.getUserNm());
			msgVo.setDataAplpId(msgVoSub.getDataAplpId());
			msgVo.setRsrSbjNm(msgVoSub.getRsrSbjNm());
			msgVo.setRsrDt(msgVoSub.getRsrDt());
			msgVo.setDataTpcdNm(msgVoSub.getDataTpcdNm());

			almDAO.insertSvcNtce(almVo);
			
			//TODO : Template 생성
			sendAlamEmail(almVo, msgVo);
		}		
		//심의초청시
		else if(NtceUserInfo.NTCE_REVW_01.getSpDtlcd().equals(param1)) 
		{
			//추가정보 조회
			//AlmVO aplcData = almDAO.selectDataAplcInfo(param2);
			
			AlmVO almVo = new AlmVO();
			almVo.setNtceSpcd(NtceUserInfo.NTCE_REVW_01.getSpcd());
			almVo.setNtceDetlSpcd(NtceUserInfo.NTCE_REVW_01.getSpDtlcd()); 
			
			MsgVO msgVo = almDAO.selectNtceMessage(almVo);

			almVo.setPrtiId(param3);
			almVo.setNtceTrgtUserId(param2);
			almVo.setNtceMsgCont(msgVo.getNtceMsgCont());
			almVo.setCnfrYn(NtceUserInfo.NTCE_REVW_01.getCnfrYn());
			almVo.setMvmnUriAddr(NtceUserInfo.NTCE_REVW_01.getMvmnUrl());
			almVo.setMvmnBtnClckYn(NtceUserInfo.NTCE_REVW_01.getBtnClckYn());
			almVo.setMvmnBtnCrtnYn(NtceUserInfo.NTCE_REVW_01.getBtnCrtnYn());	
			
			almDAO.insertSvcNtce(almVo);
			
			//TODO : Template 생성
			sendAlamEmail(almVo, msgVo);
		}
		//심의요청 마감시
		else if(NtceUserInfo.NTCE_REVW_02.getSpDtlcd().equals(param1)) 
		{
			//추가정보 조회
			AlmVO aplcData = almDAO.selectDataAplcInfo(param2);
			List<EgovMap> selectRvwPrncList = almDAO.selectRvwPrncList(param2);
			
			AlmVO almVo = new AlmVO();
			almVo.setNtceSpcd(NtceUserInfo.NTCE_REVW_02.getSpcd());
			almVo.setNtceDetlSpcd(NtceUserInfo.NTCE_REVW_02.getSpDtlcd()); 
			
			MsgVO msgVo = almDAO.selectNtceMessage(almVo);
			MsgVO msgVoSub = almDAO.selectDataAplc(param2);
			
			almVo.setPrtiId(aplcData.getPrtiId());
			almVo.setNtceTrgtUserId(aplcData.getDataAplpId());
			almVo.setNtceMsgCont(msgVo.getNtceMsgCont());
			almVo.setCnfrYn(NtceUserInfo.NTCE_REVW_02.getCnfrYn());
			almVo.setMvmnUriAddr(NtceUserInfo.NTCE_REVW_02.getMvmnUrl());
			almVo.setMvmnBtnClckYn(NtceUserInfo.NTCE_REVW_02.getBtnClckYn());
			almVo.setMvmnBtnCrtnYn(NtceUserInfo.NTCE_REVW_02.getBtnCrtnYn());	
			
			//폼 추가
			msgVo.setUserNm(msgVoSub.getUserNm());
			msgVo.setDataAplpId(msgVoSub.getDataAplpId()); 
			msgVo.setRsrSbjNm(msgVoSub.getRsrSbjNm());
			msgVo.setRsrDt(msgVoSub.getRsrDt());
			msgVo.setDataTpcdNm(msgVoSub.getDataTpcdNm());
		
			//알림 메일 내용 수정
			almVo.setNtceMsgCont(almVo.getNtceMsgCont().replace("$1", msgVoSub.getRsrSbjNm()));//알림 연구명 수정
			msgVo.setEmailMsgCont(msgVo.getEmailMsgCont().replace("$1", msgVoSub.getRsrSbjNm())); //메일 연구명 수정

			//데이터 제공기관 별 심의자들에게 알림 및 메일 발송
			if(selectRvwPrncList.size()>0) {
				for(int i = 0; i<selectRvwPrncList.size(); i++) {
					almVo.setNtceTrgtUserId((String)selectRvwPrncList.get(i).get("userId"));

					this.insertSvcNtce(almVo);
					
					//TODO : Template 생성
					sendAlamEmail(almVo, msgVo);
				}
			}
			almVo.setNtceTrgtUserId(aplcData.getDataAplpId());

		}
	}
	
	private void sendAlamEmail(AlmVO almVo, MsgVO msgVo) throws Exception {
		String emailTmpltNm = "";
		
		if(NtceUserInfo.NTCE_SIGNUP_01.getSpDtlcd().equals(almVo.getNtceDetlSpcd())) {
			emailTmpltNm ="회원가입_완료.html";
		}else if(NtceUserInfo.NTCE_SIGNUP_02.getSpDtlcd().equals(almVo.getNtceDetlSpcd())) {
			emailTmpltNm ="회원가입_반려.html";
		}else if(NtceUserInfo.NTCE_DATA_01.getSpDtlcd().equals(almVo.getNtceDetlSpcd())) {
			emailTmpltNm ="데이터_신청_심의결과.html";
		}else if(NtceUserInfo.NTCE_DATA_02.getSpDtlcd().equals(almVo.getNtceDetlSpcd())) {
			emailTmpltNm ="데이터_신청_심의결과.html";
		}else if(NtceUserInfo.NTCE_DATA_03.getSpDtlcd().equals(almVo.getNtceDetlSpcd())) {
			emailTmpltNm ="데이터_신청.html";
		}else if(NtceUserInfo.NTCE_DATA_04.getSpDtlcd().equals(almVo.getNtceDetlSpcd())) {
			emailTmpltNm ="데이터_신청_심의결과.html";
		}else if(NtceUserInfo.NTCE_REVW_01.getSpDtlcd().equals(almVo.getNtceDetlSpcd())) {
			emailTmpltNm ="공통_알림메일.html"; 
		}else if(NtceUserInfo.NTCE_REVW_02.getSpDtlcd().equals(almVo.getNtceDetlSpcd())) {
			emailTmpltNm ="데이터_신청_심의요청.html";
		}

    	File emailTmpltFile = new File(EgovProperties.getProperty("email.send.template.filePath").trim() + emailTmpltNm);
    	
    	String emailContents = SendMailUtil.getEmailContents(emailTmpltFile);	//메일내용

    	emailContents = emailContents.replaceAll("\\{contents\\}", msgVo.getEmailMsgCont().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
    	emailContents = emailContents.replaceAll("\\{serverUrl\\}", EgovProperties.getProperty("email.send.template.url").trim());
    	emailContents = emailContents.replaceAll("\\{contentsUrl\\}", almVo.getMvmnUriAddr());
  
    	//데이터 신청 완료 및 보완 폼  
    	if( msgVo.getRsrSbjNm() != null && !msgVo.getRsrSbjNm().equals("")) {
        	emailContents = emailContents.replaceAll("\\{userNm\\}", msgVo.getUserNm());
        	emailContents = emailContents.replaceAll("\\{dataAplpId\\}", msgVo.getDataAplpId());
        	emailContents = emailContents.replaceAll("\\{rsrSbjNm\\}", msgVo.getRsrSbjNm());
        	emailContents = emailContents.replaceAll("\\{rsrDt\\}", msgVo.getRsrDt());
        	emailContents = emailContents.replaceAll("\\{dataTpcdNm\\}", msgVo.getDataTpcdNm());
    	}

    	List<String> rcvEmailAddrArr = new ArrayList<String>();	//메일수신자 목록
    	rcvEmailAddrArr.add(almVo.getNtceTrgtUserId());

    	List<File> emailAtchfiles = null;	//첨부파일 목록

    	SendMailUtil.sendMail(msgVo.getEmailMsgTtlNm(), emailContents, rcvEmailAddrArr, emailAtchfiles);
	}

	@Override
	public MsgVO selectNtceMessage(AlmVO almVO) throws Exception {
		return almDAO.selectNtceMessage(almVO);
	}

}
