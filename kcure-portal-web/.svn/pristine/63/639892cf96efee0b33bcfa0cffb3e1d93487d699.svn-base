package kcure.portal.cmn;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import egovframework.com.cmm.service.EgovProperties;

/**
 * @Project : kcure-portal-web
 * @package_name : kcure.portal.cmn
 * @FileName : CommonEnum.java
 * @since : 2023. 3. 2.
 * @version 1.0
 * @author : shpark
 * @프로그램 설명 : 공통 enum 관리
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023. 3. 2.       shpark        최초 생성
 *      </pre>
 */
public class CommonEnum {
	// 데이터 신청 단계정보
	public enum DataServiceStep {
		STEP01("/portal/dac/clc/inf/viewClcInfReserchSummary.do", "01"),
		STEP02("/portal/dac/clc/inf/viewClcInfReserch.do", "02"), 
		STEP03("/portal/dac/clc/inf/viewClcInfRsp.do", "03"),
		STEP04("/portal/dac/clc/inf/viewClcInfReqData.do", "04"),
		STEP05("/portal/dac/clc/inf/viewClcInfViewReqInfo.do", "05"),
		STEP06("/portal/dac/clc/inf/viewClcInfComplete.do", "06");

		private final String stepUrl;
		private final String stepCd;

		DataServiceStep(String stepUrl, String stepCd) {
			this.stepUrl = stepUrl;
			this.stepCd = stepCd;
		}

		public String stepUrl() {
			return stepUrl;
		}

		public String stepCd() {
			return stepCd;
		}

		public static HashMap<String, String> getUrlsByStepCd() {
			HashMap<String, String> urlsByStepCd = new HashMap<String, String>();
			for (DataServiceStep e : DataServiceStep.values()) {
				urlsByStepCd.put(e.stepCd(), e.stepUrl());
			}
			return urlsByStepCd;
		}
	}

	

	//
	/**
	 * @Project : kcure-portal-web
	 * @package_name : kcure.portal.cmn
	 * @FileName : CommonEnum.java
	 * @since : 2023. 3. 3.
	 * @version 1.0
	 * @author : shpark
	 * @프로그램 설명 : 데이터 신청 첨부파일 구분코드별 정보 그룹코드 : ATTF_SPCD 그룹코드명 : 첨부파일구분코드 예시)
	 *       01.대이터신청자제출파일 02.심의자의견제출파일 03.승인후참여기관제공파일 04.신청자반입파일 05.신청자반출파일
	 * @see
	 *
	 *      <pre>
	 * << 개정이력(Modification Information) >>
	 *
	 *  수정일               수정자            수정내용
	 *  ----------   --------   ---------------------------
	 *  2023. 3. 3.       shpark        최초 생성
	 *      </pre>
	 */

	public enum DataAttfSpcd {
		ATTFSPCD01("01", "대이터신청자제출파일", EgovProperties.getProperty("nas.apc.filePath")),
		ATTFSPCD02("02", "심의자의견제출파일", EgovProperties.getProperty("nas.rvw.filePath")),
		ATTFSPCD03("03", "승인후참여기관제공파일", EgovProperties.getProperty("nas.apv.filePath")),
		ATTFSPCD04("04", "신청자반입파일", EgovProperties.getProperty("nas.brn.filePath")),
		ATTFSPCD05("05", "신청자반출파일", EgovProperties.getProperty("nas.cro.filePath")),
		ATTFSPCD06("06", "데이터신청파일", EgovProperties.getProperty("nas.drq.filePath")),
		ATTFSPCD07("07", "Meta 파일", EgovProperties.getProperty("nas.mfl.filePath"))

		;

		private final String attfSpcd;
		private final String attfSpNm;
		private final String filePath;

		DataAttfSpcd(String attfSpcd, String attfSpNm, String filePath) {
			this.attfSpcd = attfSpcd;
			this.attfSpNm = attfSpNm;
			this.filePath = filePath;
		}

		public String attfSpcd() {
			return attfSpcd;
		}

		public String attfSpNm() {
			return attfSpNm;
		}

		public String filePath() {
			return filePath;
		}

		private static final Map<String, DataAttfSpcd> BY_FILEPATH = Stream.of(values())
				.collect(Collectors.toMap(DataAttfSpcd::attfSpcd, Function.identity()));

		public static String valueOfFilePath(String attfSpcd) {
			/* 분류별 */
			// DataAttfSpcd target = BY_FILEPATH.get(attfSpcd);
			return BY_FILEPATH.get(attfSpcd).filePath();
		}
	}

	// 첨부서류명구분코드
	/**
	 * String attdNmSpcd 파일서류명구분코드 01.신청서 02.연구요약서 03.연구요약서(별지) 04.연구계획서 05.IRB승인문서
	 * 06.기타(연구원증빙서류) 07.개인정보수집이용동의서 08.보안각서 09.위원보안서약서 10.회피신청서 11.심의결과관련문서
	 * 80.승인후참여기관제공파일 81.신청자반입파일 82.신청자반출파일 99.기타
	 */
	public enum attNmSpcdInfo {
		ATTNMSPCD01("01", "신청서"), ATTNMSPCD02("02", "연구요약서"), ATTNMSPCD03("03", "연구요약서(별지)"),
		ATTNMSPCD04("04", "연구계획서"), ATTNMSPCD05("05", "IRB승인문서"), ATTNMSPCD06("06", "기타(연구원증빙서류)"),
		ATTNMSPCD07("07", "개인정보수집이용동의서"), ATTNMSPCD08("08", "보안각서"), ATTNMSPCD09("09", "위원보안서약서"),
		ATTNMSPCD10("10", "회피신청서"), ATTNMSPCD11("11", "심의결과관련문서"), ATTNMSPCD12("12", "결과통지서"),
		ATTNMSPCD13("13", "감면율첨부파일"), ATTNMSPCD80("80", "승인후참여기관제공파일"), ATTNMSPCD81("81", "신청자반입파일"),
		ATTNMSPCD82("82", "신청자반출파일"), ATTNMSPCD99("99", "기타");

		private final String attNmSpcd;
		private final String attNmSpcdNm;

		attNmSpcdInfo(String attNmSpcd, String attNmSpcdNm) {
			this.attNmSpcd = attNmSpcd;
			this.attNmSpcdNm = attNmSpcdNm;
		}

		public String attNmSpcd() {
			return attNmSpcd;
		}

		public String attNmSpcdNm() {
			return attNmSpcdNm;
		}
	}

	/**
	 * String attdNmSpcd 파일서류명구분코드 01.신청서 02.연구요약서 03.연구요약서(별지) 04.연구계획서 05.IRB승인문서
	 * 06.기타(연구원증빙서류) 07.개인정보수집이용동의서 08.보안각서 09.위원보안서약서 10.회피신청서 11.심의결과관련문서
	 * 80.승인후참여기관제공파일 81.신청자반입파일 82.신청자반출파일 99.기타
	 */

	public enum fileTemplInfo {
		FILEINF1("01", EgovProperties.getProperty("nas.frm.filePath"), "1. 신청서.hwp"),
		FILEINF2("02", EgovProperties.getProperty("nas.frm.filePath"), "2. 연구요약서.hwp"),
		FILEINF3("03", EgovProperties.getProperty("nas.frm.filePath"), "3. 연구요약서-별지.hwp"),
		FILEINF4("04", EgovProperties.getProperty("nas.frm.filePath"), "4. 연구계획서- 별지.hwp"),
		FILEINF5("05", "None", "None"), FILEINF6("06", "None", "None"),
		FILEINF7("07", EgovProperties.getProperty("nas.frm.filePath"), "5. 개인정보 수집·이용 및 제3자 제공 동의서.hwp"),
		FILEINF8("08", EgovProperties.getProperty("nas.frm.filePath"), "6. 보안각서(보안유지 및 준수사항 서약서).hwp"),;

		private final String fileAttNmSpcd;
		private final String filePath;
		private final String fileNm;

		fileTemplInfo(String fileAttNmSpcd, String filePath, String fileNm) {
			this.fileAttNmSpcd = fileAttNmSpcd;
			this.filePath = filePath;
			this.fileNm = fileNm;
		}

		public String fileAttNmSpcd() {
			return fileAttNmSpcd;
		}

		public String filePath() {
			return filePath;
		}

		public String fileNm() {
			return fileNm;
		}

		private static final Map<String, fileTemplInfo> BY_FILEINFO = Stream.of(values())
				.collect(Collectors.toMap(fileTemplInfo::fileAttNmSpcd, Function.identity()));

		public static fileTemplInfo valueOfFileInfo(String fileAttNmSpcd) {
			/* 분류별 */
			fileTemplInfo target = BY_FILEINFO.get(fileAttNmSpcd);
			return target;
		}
	}

	/**
	 * 심의 단계 구분 정보
	 */
	public enum rvwStpSpcdInfo {
		STP_SPCD00("00", "데이터확용신청", "/portal/sys/dac/rvw/viewDataAplcRvw.do", "", ""),
		STP_SPCD01("R01", "연구접수/사무국 검토", "/portal/sys/dac/rvw/viewRevAplcRsch.do", "RP01", "RP02"),
		STP_SPCD02("R02", "연구선정심의", "", "RP01", "RP02"),
		STP_SPCD03("R03", "제공기관심의", "/portal/sys/dac/rvw/viewRevPrti.do", "RP01", "RP02"),
		STP_SPCD04("R04", "최종선정심의", "", "RP01", "RP02"), 
		STP_SPCD05("R05", "한국보건의료연구원 심의", "", "RP01", "RP02"),
		STP_SPCD06("R06", "가명처리", "", "RP01", "RP02"), 
		STP_SPCD07("R07", "반출적정성 심의", "", "RP01", "RP02"),
		STP_SPCD08("R08", "데이터 제공", "/portal/sys/dac/rvw/viewDataPrvd.do", "RD01", "RD02"),
		STP_SPCD09("R09", "결제정보입력", "/portal/sys/dac/rvw/viewSendPay.do", "RA01", "RA02"),
		STP_SPCD10("R10", "제공기관결합진행", "/portal/sys/dac/rvw/viewDataPrvdCmbn.do", "RD01", "RD02");

		// 심의단계 구분 코드
		private final String stpSpcd;
		// 심의단계 명
		private final String stpSpcdNm;
		// 심의단계 url
		private final String stpUrl;
		// 심의단계 시작 상태 코드
		private final String stpStartCode;
		// 심의단계 종료 상태 코드
		private final String stpEndCode;

		rvwStpSpcdInfo(String stpSpcd, String stpSpcdNm, String stpUrl, String stpStartCode, String stpEndCode) {
			this.stpSpcd = stpSpcd;
			this.stpSpcdNm = stpSpcdNm;
			this.stpUrl = stpUrl;
			this.stpStartCode = stpStartCode;
			this.stpEndCode = stpEndCode;
		}

		public String stpSpcd() {
			return stpSpcd;
		}

		public String stpSpcdNm() {
			return stpSpcdNm;
		}

		public String stpUrl() {
			return stpUrl;
		}

		public String stpStartCode() {
			return stpStartCode;
		}

		public String stpEndCode() {
			return stpEndCode;
		}

		private static final Map<String, rvwStpSpcdInfo> BY_STPSPCDINFO = Stream.of(values())
				.collect(Collectors.toMap(rvwStpSpcdInfo::stpSpcd, Function.identity()));

		public static rvwStpSpcdInfo valueOfStpSpcdInfo(String stpSpcd) {
			rvwStpSpcdInfo target = BY_STPSPCDINFO.get(stpSpcd);
			return target;
		}
	}

	/**
	 * 사용자 Push알림 속성정보
	 */
	public enum NtceUserInfo {
		NTCE_SIGNUP_01("01", "01", "/", "N", "Y", "N"),
		NTCE_SIGNUP_02("01", "02", "/portal/bbs/qna/viewQna.do", "N", "Y", "N"),
		NTCE_DATA_01("02", "03", "/portal/myp/rsc/inf/viewMypRscInfApl.do", "N", "Y", "N"),
		NTCE_DATA_02("02", "04", "/portal/myp/rsc/inf/viewMypRscInfApl.do", "N", "Y", "N"),
		NTCE_DATA_03("02", "07", "/portal/myp/rsc/inf/viewMypRscInfApl.do", "N", "Y", "N"),
		NTCE_DATA_04("02", "08", "/portal/myp/rsc/inf/viewMypRscInfApl.do", "N", "Y", "N"),
		NTCE_REVW_01("03", "05", "/portal/sys/dac/rvw/viewDataAplcRvw.do", "N", "Y", "N"),
		NTCE_REVW_02("03", "06", "/portal/sys/dac/rvw/viewDataAplcRvw.do", "N", "Y", "N");

		// 알람구분코드: 01 회원가입, 02 데이터신청, 03 심의
		private final String spCd;
		// 알람상세구분코드: 01 연구자승인, 02 연구자반려, 03 데이터신청승인 , 04 데이터신청반려, 05 심의요원초청, 06 심의요청마감, 07 데이터신청 완료, 08 데이터신청 보완
		private final String spDtlCd;
		// 이동URI주소
		private final String mvmnUrl;
		// 이동버튼클릭여부
		private final String btnClckYn;
		// 이동버튼생성여부
		private final String btnCrtnYn;
		// 확인여부
		private final String cnfrYn;

		NtceUserInfo(String spCd, String spDtlCd, String mvmnUrl, String btnClckYn, String btnCrtnYn, String cnfrYn) {
			this.spCd = spCd;
			this.spDtlCd = spDtlCd;
			this.mvmnUrl = mvmnUrl;
			this.btnClckYn = btnClckYn;
			this.btnCrtnYn = btnCrtnYn;
			this.cnfrYn = cnfrYn;
		}

		public String getSpcd() {
			return spCd;
		}

		public String getSpDtlcd() {
			return spDtlCd;
		}

		public String getMvmnUrl() {
			return mvmnUrl;
		}

		public String getBtnClckYn() {
			return btnClckYn;
		}

		public String getBtnCrtnYn() {
			return btnCrtnYn;
		}

		public String getCnfrYn() {
			return cnfrYn;
		}
	}

	/**
	 * 사용자 승인 이력 사용자 권한 정보
	 */
	public enum usertHstAuthIdInfo {
		AUTHID000("AU000", "회원가입승인시 사용되며 권한과 메뉴맵핑은 하지 않으며 사용자에게 권한 부여는 되지 않는다.", "N", "N"),
		AUTHID006("AU006", "심의하기 메뉴 외 가능 승인시 최초 부여되는 권한", "Y", "N"),
		AUTHID999("99999", "반려 권한으로 등록되지 않으며, 반려시 등록되는 코드값", "N", "N");

		private final String authId;
		private final String authDesc;
		private String gmtYn;
		private String delYn;

		usertHstAuthIdInfo(String authId, String authDesc, String gmtYn, String delYn) {
			this.authId = authId;
			this.authDesc = authDesc;
			this.gmtYn = gmtYn;
			this.delYn = delYn;
		}

		public String authId() {
			return authId;
		}

		public String authDesc() {
			return authDesc;
		}

		public String gmtYn() {
			return gmtYn;
		}

		public String delYn() {
			return delYn;
		}

	}

	/**
	 * 사용자 승인 이력 사용자 권한 정보
	 */
	public enum userStcd {
		STCD01("01", "승인대기"), STCD02("02", "승인반려"), STCD03("03", "승인"), STCD04("04", "휴면사용자"), STCD99("99", "탈퇴");

		private final String stcd;

		private final String stcdDesc;

		userStcd(String stcd, String stcdDesc) {
			this.stcd = stcd;
			this.stcdDesc = stcdDesc;
		}

		public String stcd() {
			return stcd;
		}

		public String stcdDesc() {
			return stcdDesc;
		}
	}

	/**
	 * 서비스_데이터신청 연구구분코드
	 */
	public enum RsrpSpcd {
		SPCD01("01", "연구신청자"), SPCD02("02", "연구책임자"), SPCD03("03", "공동연구자"), SPCD04("04", "보조연구자");

		private final String spcd;

		private final String spcdDesc;

		RsrpSpcd(String spcd, String spcdDesc) {
			this.spcd = spcd;
			this.spcdDesc = spcdDesc;
		}

		public String spcd() {
			return spcd;
		}

		public String spcdDesc() {
			return spcdDesc;
		}
	}
	/*
	 * 데이터 유형
	 */
	public enum DataTpcd {
		SPCD01("01", "임상"), SPCD02("02", "공공"), SPCD03("03", "결합");

		private final String spcd;

		private final String spcdDesc;

		DataTpcd(String spcd, String spcdDesc) {
			this.spcd = spcd;
			this.spcdDesc = spcdDesc;
		}

		public String spcd() {
			return spcd;
		}

		public String spcdDesc() {
			return spcdDesc;
		}
	}
	

	// 신청진행상태코드
	public enum AplcProgStcd {
		STCD01("01", "작성중"), 
		STCD02("02", "접수완료"), 
		STCD03("03", "심의중"),
		STCD04("04", "심의반려"),
		STCD05("05", "승인완료"),
		STCD06("06", "보완요청"),
		;

		private final String stcd;

		private final String stcdDesc;

		AplcProgStcd(String stcd, String stcdDesc) {
			this.stcd = stcd;
			this.stcdDesc = stcdDesc;
		}

		public String aplcProgStcd() {
			return stcd;
		}

		public String stcdDesc() {
			return stcdDesc;
		}
	}
	
	
	// 심의단계별상태 코드
	public enum RvwStpStcd {
		STCDRP01("RP01", "심의중"), 
		STCDRP02("RP02", "승인"), 
		STCDRP03("RP03", "반려"),
		STCDRP04("RP04", "보완요청"),
		STCDRD01("RD01", "데이터준비중"),
		STCDRD02("RD02", "데이터 적재완료"),
		STCDRA01("RA01", "결제정보입력"),
		STCDRA02("RA02", "결제완료대기중"),
		STCDRC01("RC01", "결제완료대기중"),
		STCDRC02("RC02", "결제완료")
		;

		private final String stcd;

		private final String stcdDesc;

		RvwStpStcd(String stcd, String stcdDesc) {
			this.stcd = stcd;
			this.stcdDesc = stcdDesc;
		}

		public String getStcd() {
			return stcd;
		}

		public String stcdDesc() {
			return stcdDesc;
		}
	}
	
	// 반입신청상태 코드
	public enum DtuAplcProgStcd {
		STCDU01("U01", "신청"), 
		STCDU02("U02", "승인"), 
		STCDU03("U03", "반려"),
		STCDU04("U04", "부분승인");
		;

		private final String stcd;
		private final String stcdDesc;

		DtuAplcProgStcd(String stcd, String stcdDesc) {
			this.stcd = stcd;
			this.stcdDesc = stcdDesc;
		}

		public String getStcd() {
			return stcd;
		}

		public String stcdDesc() {
			return stcdDesc;
		}
	}
	
	// 결제 종류
	public enum PayType {
		DATA_APLC("DATA_APLC", "데이터신청"), 
		EXTD("EXTD", "보관/연장");

		private final String payType;
		private final String payDesc;

		PayType(String payType, String payDesc) {
			this.payType = payType;
			this.payDesc = payDesc;
		}

		public String getPayType() {
			return payType;
		}

		public String getPayDesc() {
			return payDesc;
		}
	}
	
	//보관 / 연장 코드
		/*
		"01"	"가상화사용연장신청"
		"02"	"보관연장신청"
		"03"	"재사용신청"
		"04"	"연구유효기간연장신청"
		*/
		public enum ExtdStcd { 
			STCD01("01", "가상화사용연장신청"), 
			STCD02("02", "보관연장신청"), 
			STCD03("03", "재사용신청"),
			STCD04("04", "연구유효기간연장신청");
			;

			private final String stcd;
			private final String stcdDesc;

			ExtdStcd(String stcd, String stcdDesc) {
				this.stcd = stcd;
				this.stcdDesc = stcdDesc;
			}

			public String getStcd() {
				return stcd;
			}

			public String stcdDesc() {
				return stcdDesc;
			}
		}
}
