package kcure.portal.dac.clc.inf.web;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFDataValidation;
import org.apache.poi.xssf.usermodel.XSSFDataValidationConstraint;
import org.apache.poi.xssf.usermodel.XSSFDataValidationHelper;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.DataServiceStep;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.cmn.service.KcureDadaServiceFileMngUtil;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.dac.clc.inf.service.ClcInfReserchService;
import kcure.portal.dac.clc.inf.service.Clcinf2Service;
import kcure.portal.dac.clc.inf.service.impl.ClcInfRspVo;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/dac/clc/inf")
public class ClcInfTmplteController {
	
	@Resource(name = "clcinf2Service")
	private Clcinf2Service clcinf2Service;

	@Resource(name = "ClcInfReserchService")
    private ClcInfReserchService clcInfReserchService;
	
	@Resource(name = "KcureDadaServiceFileMngUtil")
    private KcureDadaServiceFileMngUtil fileMngUtil;

	/**
	  * @Method Name : filedownTemplte01
	  * @작성일 : 2023. 4. 17.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	임상라이브러리 신청 템플릿 다운로드
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/filedownTemplte01.do")
	public void filedownTemplte01(HttpServletResponse response, @RequestParam HashMap<String, Object> commandMap, Model model) throws Exception {
	
		try {
			//데이터 가져오기			
			String dtsIdStr = String.valueOf(commandMap.get("dtsArray")).replace("|", ",");
			String [] dstsIdArray = dtsIdStr.split(",");

			commandMap.put("dstsIdArray", dstsIdArray);
			
			List<HashMap<String, Object>> dataList1 = clcinf2Service.selectTmplte1List(commandMap);
			List<HashMap<String, Object>> dataList2 = clcinf2Service.selectTmplte2List(commandMap);
			List<HashMap<String, Object>> dataList3 = clcinf2Service.selectTmplte3List(commandMap);
			List<HashMap<String, Object>> dataList4 = clcinf2Service.selectTmplte4List(commandMap);
			List<HashMap<String, Object>> dataList5 = clcinf2Service.selectTmplte5List(commandMap);
			
			//참여기관명
			String prtiNmStr = String.valueOf(commandMap.get("prtiNm"));

			//객체 및 시트 생성
			XSSFWorkbook wb = new XSSFWorkbook();
			XSSFSheet sheet1 = wb.createSheet("데이터셋(목록)정보");
			XSSFSheet sheet2 = wb.createSheet("데이터셋변수(항목)정보");
			XSSFSheet sheet3 = wb.createSheet("코드값_코드명정보");
			XSSFSheet sheet4 = wb.createSheet("BaseLine_데이터셋(목록)정보");
			XSSFSheet sheet5 = wb.createSheet("BaseLine_데이터셋변수(항목)정보");
			XSSFSheet sheet6 = wb.createSheet("추가데이터");
			
			Row row1 = null;
			Row row2 = null;
			Row row3 = null;
			Row row4 = null;
			Row row5 = null;
			Row row6 = null;
			
			Cell cell1 = null;
			Cell cell2 = null;
			Cell cell3 = null;
			Cell cell4 = null;
			Cell cell5 = null;
			Cell cell6 = null;
			
			int rowNum1 = 0;
			int rowNum2 = 0;
			int rowNum3 = 0;
			int rowNum4 = 0;
			int rowNum5 = 0;
			int rowNum6 = 0;

			//// Header ////
			final String[] colNames1 = {"연번", "데이터셋명(테이블명)", "데이터셋 한글명(테이블 한글명)", "변수(항목)개수", "선택변수(항목)개수"};
			final String[] colNames2 = {"연번", "데이터셋명(테이블 한글명)", "데이터셋명(테이블명)", " SUB NO", "변수\n(컬럼한글명)", "변수명\n(컬럼명)", "데이터\n이용 신청", "설명", "값", "형식\n(Data Type)"};
			final String[] colNames3 = {"코드ID", "코드명", "코드유효값", "코드유효값명"};
			final String[] colNames4 = {"연번", "주제분류", "데이터셋명(테이블명)", "변수(항목)개수", "선택변수(항목)개수"};
			final String[] colNames5 = {"연번", "주제분류", "데이터셋명(테이블명)", "SUB NO", "변수\n(컬럼한글명)", "변수명\n(컬럼명)", "데이터\n이용 신청", "형식\n(Data Type)"};
			final String[] colNames6 = {"추가데이터"};
			
			// Header size
			final int[] colWidths1 = {1500, 5000, 7000, 4000, 4000};
			final int[] colWidths2 = {1500, 7000, 5000, 2500, 8000, 8000, 2500, 6000, 6000, 3000};
			final int[] colWidths3 = {1500, 8000, 2500, 25000};
			final int[] colWidths4 = {2000, 6000, 6000, 3500, 4000};
			final int[] colWidths5 = {2000, 7000, 7000, 2500, 8000, 8000, 2500, 4000};
			final int[] colWidths6 = {2500};
			
			// Subject1 font
			Font fontSubject1 = wb.createFont();
			fontSubject1.setBoldweight(Font.BOLDWEIGHT_BOLD);
			fontSubject1.setFontHeightInPoints((short) 16);
			fontSubject1.setFontName("맑은 고딕");
			
			// Subject2 font
			Font fontSubject2 = wb.createFont();
			fontSubject2.setBoldweight(Font.BOLDWEIGHT_BOLD);
			fontSubject2.setFontHeightInPoints((short) 10);
			fontSubject2.setFontName("맑은 고딕");
			
			// body font
			Font fontBody = wb.createFont();
			fontBody.setFontHeightInPoints((short) 10);
			fontBody.setFontName("맑은 고딕");
			
			// Header font
			Font fontHeader = wb.createFont();
			fontHeader.setBoldweight(Font.BOLDWEIGHT_BOLD);
			fontHeader.setFontHeightInPoints((short) 10);
			fontHeader.setFontName("맑은 고딕");
			
			XSSFCellStyle styleSubject1 = wb.createCellStyle();
			styleSubject1.setAlignment(CellStyle.ALIGN_LEFT);
			styleSubject1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleSubject1.setFont(fontSubject1);
			
			XSSFCellStyle styleSubject2 = wb.createCellStyle();
			styleSubject2.setAlignment(CellStyle.ALIGN_LEFT);
			styleSubject2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleSubject2.setFont(fontSubject2);
			
			XSSFCellStyle styleBody1 = wb.createCellStyle();
			styleBody1.setAlignment(CellStyle.ALIGN_LEFT);
			styleBody1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleBody1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleBody1.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleBody1.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleBody1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleBody1.setFont(fontBody);
			
			XSSFCellStyle styleBody2 = wb.createCellStyle();
			styleBody2.setAlignment(CellStyle.ALIGN_CENTER);
			styleBody2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleBody2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleBody2.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleBody2.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleBody2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleBody2.setFont(fontBody);
			
			XSSFCellStyle styleBody3 = wb.createCellStyle();
			styleBody3.setAlignment(CellStyle.ALIGN_RIGHT);
			styleBody3.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleBody3.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleBody3.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleBody3.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleBody3.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleBody3.setFont(fontBody);
			
			XSSFCellStyle styleBody4 = wb.createCellStyle();
			styleBody4.setAlignment(CellStyle.ALIGN_CENTER);
			styleBody4.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleBody4.setFillForegroundColor(HSSFColor.YELLOW.index);
			styleBody4.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			styleBody4.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleBody4.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleBody4.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleBody4.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleBody4.setFont(fontBody);
			
			XSSFColor headerColor = new XSSFColor(new java.awt.Color(255,187,0));
			
			// Header style
			XSSFCellStyle styleHeader = wb.createCellStyle();
			styleHeader.setAlignment(CellStyle.ALIGN_CENTER);
			styleHeader.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleHeader.setFillForegroundColor(headerColor);
			styleHeader.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			styleHeader.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleHeader.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleHeader.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleHeader.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleHeader.setWrapText(true);
			styleHeader.setFont(fontHeader);	

			//-----sheet1 생성---s
			row1 = sheet1.createRow(rowNum1++);
			row1.setHeight((short) 500);  // 행 높이
			cell1 = row1.createCell(0);
			cell1.setCellStyle(styleSubject1);		
			cell1.setCellValue("K-CURE 암임상 데이터 카탈로그 레이아웃");
			cell1 = row1.createCell(1);
			cell1.setCellStyle(styleSubject1);
			cell1 = row1.createCell(2);
			cell1.setCellStyle(styleSubject1);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 2));
			
			row1 = sheet1.createRow(rowNum1++);
			cell1 = row1.createCell(0);
			cell1.setCellStyle(styleSubject2);		
			cell1.setCellValue("제공기관 : " + prtiNmStr);
			cell1 = row1.createCell(1);
			cell1.setCellStyle(styleSubject2);
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더1추가
			row1 = sheet1.createRow(rowNum1++);
		
			for (int i = 0; i < colNames1.length; i++) {
				cell1 = row1.createCell(i);
				cell1.setCellValue(colNames1[i]);
				cell1.setCellStyle(styleHeader);
				sheet1.setColumnWidth(i, colWidths1[i]);
			}
			
			//헤더2추가
			row1 = sheet1.createRow(rowNum1++);
			
			for (int i = 0; i < colNames1.length; i++) {
				cell1 = row1.createCell(i);
				cell1.setCellValue(colNames1[i]);
				cell1.setCellStyle(styleHeader);
				sheet1.setColumnWidth(i, colWidths1[i]);
			}
			
			//Header row병합
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 0, (short )0 ));
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 1, (short )1 ));
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 2, (short )2 ));
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 3, (short )3 )); 
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 4, (short )4 ));	
			
			//선택 count 수식변수
			int formCellNo = 5;

			//// Body ////
			if(dataList1.size() > 0) {
				for (int i = 0; i < dataList1.size(); i++) {
					row1 = sheet1.createRow(rowNum1++);
					
					cell1 = row1.createCell(0);
					cell1.setCellStyle(styleBody2);
					cell1.setCellValue(i + 1);
					
					cell1 = row1.createCell(1);
					cell1.setCellStyle(styleBody1);
					cell1.setCellValue(dataList1.get(i).get("dtsknm") + "");
					
					cell1 = row1.createCell(2);
					cell1.setCellStyle(styleBody1);
					cell1.setCellValue(dataList1.get(i).get("dtsid") + "");
					
					cell1 = row1.createCell(3);
					cell1.setCellStyle(styleBody3);
					cell1.setCellValue(dataList1.get(i).get("colcnt") + "");
					
					cell1 = row1.createCell(4);
					cell1.setCellStyle(styleBody3);
					cell1.setCellType(HSSFCell.CELL_TYPE_FORMULA);
					cell1.setCellFormula("COUNTIFS('데이터셋변수(항목)정보'!C:C,C"+ (formCellNo++) +", '데이터셋변수(항목)정보'!G:G,\"=Y\")");
					cell1.setCellValue("0");
				}
			}
			//-----sheet1 생성---e
			
			
			//-----sheet2 생성---s
			row2 = sheet2.createRow(rowNum2++);
			row2.setHeight((short) 500);  // 행 높이
			cell2 = row2.createCell(0);
			cell2.setCellStyle(styleSubject1);		
			cell2.setCellValue("K-CURE 암임상 데이터 카탈로그 레이아웃");
			cell2 = row2.createCell(1);
			cell2.setCellStyle(styleSubject1);
			cell2 = row2.createCell(2);
			cell2.setCellStyle(styleSubject1);
			sheet2.addMergedRegion(new CellRangeAddress(0, 0, 0, 2));
			
			row2 = sheet2.createRow(rowNum2++);
			cell2 = row2.createCell(0);
			cell2.setCellStyle(styleSubject2);		
			cell2.setCellValue("제공기관 : " + prtiNmStr);
			cell2 = row2.createCell(1);
			cell2.setCellStyle(styleSubject2);
			sheet2.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더1추가
			row2 = sheet2.createRow(rowNum2++);
			
			for (int i = 0; i < colNames2.length; i++) {
				cell2 = row2.createCell(i);
				cell2.setCellValue(colNames2[i]);
				cell2.setCellStyle(styleHeader);
				sheet2.setColumnWidth(i, colWidths2[i]);
			}
			
			//헤더2추가
			row2 = sheet2.createRow(rowNum2++);
			
			for (int i = 0; i < colNames2.length; i++) {
				cell2 = row2.createCell(i);
				cell2.setCellValue(colNames2[i]);
				cell2.setCellStyle(styleHeader);
				sheet2.setColumnWidth(i, colWidths2[i]);
			}
			
			//Header row병합
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 0, (short )0 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 1, (short )1 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 2, (short )2 ));
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 3, (short )3 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 4, (short )4 ));
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 5, (short )5 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 6, (short )6 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 7, (short )7 ));
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 8, (short )8 ));
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 9, (short )9 ));

			//// Body ////
			if(dataList2.size() > 0) {
				int serialNo1 = 0; //연번
				int serialNo2 = 0; //sub no
				
				String compTmp1 = "";
				String compTmp2 = "";
				
				for (int i = 0; i < dataList2.size(); i++) {
					compTmp2 = String.valueOf(dataList2.get(i).get("dtsid")) ;
					
					if(! compTmp1.equals(compTmp2)) {
						compTmp1 = compTmp2;
						serialNo1++;
						serialNo2 = 1;
					}else {
						serialNo2++;
					}

					row2 = sheet2.createRow(rowNum2++);
					
					cell2 = row2.createCell(0);
					cell2.setCellStyle(styleBody2);
					cell2.setCellValue(serialNo1 + "");
					
					cell2 = row2.createCell(1);
					cell2.setCellStyle(styleBody3);
					cell2.setCellValue(dataList2.get(i).get("dtsknm") + "");
					
					cell2 = row2.createCell(2);
					cell2.setCellStyle(styleBody2);
					cell2.setCellValue(dataList2.get(i).get("dtsid") + "");
					
					cell2 = row2.createCell(3);
					cell2.setCellStyle(styleBody3);
					cell2.setCellValue(serialNo2 + "");
					
					cell2 = row2.createCell(4);
					cell2.setCellStyle(styleBody3);
					cell2.setCellValue(dataList2.get(i).get("colknm") + "");
					
					cell2 = row2.createCell(5);
					cell2.setCellStyle(styleBody3);
					cell2.setCellValue(dataList2.get(i).get("colenm") + "");
					
					cell2 = row2.createCell(6);
					cell2.setCellStyle(styleBody4);
					cell2.setCellValue("N");
					
					cell2 = row2.createCell(7);
					cell2.setCellStyle(styleBody1);
					cell2.setCellValue(dataList2.get(i).get("colexplcont") + "");
					
					cell2 = row2.createCell(8);
					cell2.setCellStyle(styleBody1);
					cell2.setCellValue(dataList2.get(i).get("cdvalue") + "");
					
					cell2 = row2.createCell(9);
					cell2.setCellStyle(styleBody2);
					cell2.setCellValue(dataList2.get(i).get("datatpcont") + "");
				}
				
				//선택콤보생성
				XSSFDataValidationHelper dvHelper = new XSSFDataValidationHelper((XSSFSheet) row2.getSheet());
				XSSFDataValidationConstraint dvConstraint = (XSSFDataValidationConstraint) dvHelper.createExplicitListConstraint(new String[]{"Y", "N"});

				CellRangeAddressList addressList = new CellRangeAddressList(4, rowNum2-1, 6, 6);

				XSSFDataValidation validation = (XSSFDataValidation)dvHelper.createValidation(dvConstraint, addressList);
				validation.setShowErrorBox(true);
				validation. createErrorBox("ERROR MEESAGE:Invalid Data", "Please provide valid data in the dropdown list.");

				sheet2.addValidationData(validation);
			}
			//-----sheet2 생성---e
			
			//-----sheet3 생성---s
			row3 = sheet3.createRow(rowNum3++);
			row3.setHeight((short) 500);  // 행 높이
			cell3 = row3.createCell(0);
			cell3.setCellStyle(styleSubject1);		
			cell3.setCellValue("K-CURE 암임상 데이터 카탈로그 레이아웃");
			cell3 = row3.createCell(1);
			cell3.setCellStyle(styleSubject1);
			cell3 = row3.createCell(2);
			cell3.setCellStyle(styleSubject1);
			sheet3.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));
			
			row3 = sheet3.createRow(rowNum3++);
			cell3 = row3.createCell(0);
			cell3.setCellStyle(styleSubject2);		
			cell3.setCellValue("제공기관 : " + prtiNmStr);
			cell3 = row3.createCell(1);
			cell3.setCellStyle(styleSubject2);
			sheet3.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더추가
			row3 = sheet3.createRow(rowNum3++);
		
			for (int i = 0; i < colNames3.length; i++) {
				cell3 = row3.createCell(i);
				cell3.setCellValue(colNames3[i]);
				cell3.setCellStyle(styleHeader);
				sheet3.setColumnWidth(i, colWidths3[i]);
			}

			//// Body ////
			if(dataList3.size() > 0) {
				for (int i = 0; i < dataList3.size(); i++) {
					row3 = sheet3.createRow(rowNum3++);
					
					cell3 = row3.createCell(0);
					cell3.setCellStyle(styleBody2);
					cell3.setCellValue(dataList3.get(i).get("codeid") + "");
					
					cell3 = row3.createCell(1);
					cell3.setCellStyle(styleBody1);
					cell3.setCellValue(dataList3.get(i).get("codenm") + "");
					
					cell3 = row3.createCell(2);
					cell3.setCellStyle(styleBody1);
					cell3.setCellValue(dataList3.get(i).get("codeval") + "");
					
					cell3 = row3.createCell(3);
					cell3.setCellStyle(styleBody1);
					cell3.setCellValue(dataList3.get(i).get("codevalnm") + "");
				}
			}
			
			//-----sheet3 생성---e
			
			//-----sheet4 생성---s
			row4 = sheet4.createRow(rowNum4++);
			row4.setHeight((short) 500);  // 행 높이
			cell4 = row4.createCell(0);
			cell4.setCellStyle(styleSubject1);		
			cell4.setCellValue("K-CURE 암임상 데이터 카탈로그 레이아웃");
			cell4 = row4.createCell(1);
			cell4.setCellStyle(styleSubject1);
			cell4 = row4.createCell(2);
			cell4.setCellStyle(styleSubject1);
			sheet4.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));
			
			row4 = sheet4.createRow(rowNum4++);
			cell4 = row4.createCell(0);
			cell4.setCellStyle(styleSubject2);		
			cell4.setCellValue("제공기관 : " + prtiNmStr);
			cell4 = row4.createCell(1);
			cell4.setCellStyle(styleSubject2);
			sheet4.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더1추가
			row4 = sheet4.createRow(rowNum4++);
		
			for (int i = 0; i < colNames4.length; i++) {
				cell4 = row4.createCell(i);
				cell4.setCellValue(colNames4[i]);
				cell4.setCellStyle(styleHeader);
				sheet4.setColumnWidth(i, colWidths4[i]);
			}
			
			//헤더2추가
			row4 = sheet4.createRow(rowNum4++);
			
			for (int i = 0; i < colNames4.length; i++) {
				cell4 = row4.createCell(i);
				cell4.setCellValue(colNames4[i]);
				cell4.setCellStyle(styleHeader);
				sheet4.setColumnWidth(i, colWidths4[i]);
			}
			
			//Header row병합
			sheet4.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 0, (short )0 ));
			sheet4.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 1, (short )1 ));
			sheet4.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 2, (short )2 ));
			sheet4.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 3, (short )3 )); 
			sheet4.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 4, (short )4 ));	
			
			//선택 count 수식변수
			int formCellNo2 = 5;

			//// Body ////
			if(dataList4.size() > 0) {
				for (int i = 0; i < dataList4.size(); i++) {
					row4 = sheet4.createRow(rowNum4++);
					
					cell4 = row4.createCell(0);
					cell4.setCellStyle(styleBody2);
					cell4.setCellValue(i + 1);
					
					cell4 = row4.createCell(1);
					cell4.setCellStyle(styleBody1);
					cell4.setCellValue(dataList4.get(i).get("category") + "");
					
					cell4 = row4.createCell(2);
					cell4.setCellStyle(styleBody1);
					cell4.setCellValue(dataList4.get(i).get("dtsid") + "");
					
					cell4 = row4.createCell(3);
					cell4.setCellStyle(styleBody3);
					cell4.setCellValue(dataList4.get(i).get("colcnt") + "");
					
					cell4 = row4.createCell(4);
					cell4.setCellStyle(styleBody3);
					cell4.setCellType(HSSFCell.CELL_TYPE_FORMULA);
					cell4.setCellFormula("COUNTIFS('BaseLine_데이터셋변수(항목)정보'!C:C,C"+ (formCellNo2++) +", 'BaseLine_데이터셋변수(항목)정보'!G:G,\"=Y\")");
					cell4.setCellValue("0");
				}
			}
			
			//-----sheet4 생성---e
			
			//-----sheet5 생성---s
			row5 = sheet5.createRow(rowNum5++);
			row5.setHeight((short) 500);  // 행 높이
			cell5 = row5.createCell(0);
			cell5.setCellStyle(styleSubject1);		
			cell5.setCellValue("K-CURE 암임상 데이터 카탈로그 레이아웃");
			cell5 = row5.createCell(1);
			cell5.setCellStyle(styleSubject1);
			cell5 = row5.createCell(2);
			cell5.setCellStyle(styleSubject1);
			sheet5.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));
			
			row5 = sheet5.createRow(rowNum5++);
			cell5 = row5.createCell(0);
			cell5.setCellStyle(styleSubject2);		
			cell5.setCellValue("제공기관 : " + prtiNmStr);
			cell5 = row5.createCell(1);
			cell5.setCellStyle(styleSubject2);
			sheet5.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더1추가
			row5 = sheet5.createRow(rowNum5++);
			
			for (int i = 0; i < colNames5.length; i++) {
				cell5 = row5.createCell(i);
				cell5.setCellValue(colNames5[i]);
				cell5.setCellStyle(styleHeader);
				sheet5.setColumnWidth(i, colWidths5[i]);
			}
			
			//헤더2추가
			row5 = sheet5.createRow(rowNum5++);
			
			for (int i = 0; i < colNames5.length; i++) {
				cell5 = row5.createCell(i);
				cell5.setCellValue(colNames5[i]);
				cell5.setCellStyle(styleHeader);
				sheet5.setColumnWidth(i, colWidths5[i]);
			}
			
			//Header row병합
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 0, (short )0 )); 
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 1, (short )1 )); 
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 2, (short )2 ));
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 3, (short )3 )); 
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 4, (short )4 ));
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 5, (short )5 )); 
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 6, (short )6 )); 
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 7, (short )7 ));
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 8, (short )8 ));
			sheet5.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 9, (short )9 ));

			//// Body ////
			if(dataList5.size() > 0) {
				int serialNo3 = 0; //연번
				int serialNo4 = 0; //sub no
				
				String compTmp3 = "";
				String compTmp4 = "";
				
				for (int i = 0; i < dataList5.size(); i++) {
					compTmp4 = String.valueOf(dataList5.get(i).get("dtsId")) ;
					
					if(! compTmp3.equals(compTmp4)) {
						compTmp3 = compTmp4;
						serialNo3++;
						serialNo4 = 1;
					}else {
						serialNo4++;
					}
					
					row5 = sheet5.createRow(rowNum5++);
					
					cell5 = row5.createCell(0);
					cell5.setCellStyle(styleBody2);
					cell5.setCellValue(serialNo3 + "");
					
					cell5 = row5.createCell(1);
					cell5.setCellStyle(styleBody1);
					cell5.setCellValue(dataList5.get(i).get("category") + "");
					
					cell5 = row5.createCell(2);
					cell5.setCellStyle(styleBody2);
					cell5.setCellValue(dataList5.get(i).get("dtsid") + "");
					
					cell5 = row5.createCell(3);
					cell5.setCellStyle(styleBody3);
					cell5.setCellValue(serialNo4 + "");
					
					cell5 = row5.createCell(4);
					cell5.setCellStyle(styleBody1);
					cell5.setCellValue(dataList5.get(i).get("colknm") + "");
					
					cell5 = row5.createCell(5);
					cell5.setCellStyle(styleBody1);
					cell5.setCellValue(dataList5.get(i).get("colenm") + "");
					
					cell5 = row5.createCell(6);
					cell5.setCellStyle(styleBody4);
					cell5.setCellValue("N");
					
					cell5 = row5.createCell(7);
					cell5.setCellStyle(styleBody2);
					cell5.setCellValue(dataList5.get(i).get("datatpcont") + "");
				}
				
				//선택콤보생성
				XSSFDataValidationHelper dvHelper2 = new XSSFDataValidationHelper((XSSFSheet) row5.getSheet());
				XSSFDataValidationConstraint dvConstraint2 = (XSSFDataValidationConstraint) dvHelper2.createExplicitListConstraint(new String[]{"Y", "N"});

				CellRangeAddressList addressList2 = new CellRangeAddressList(4, rowNum5-1, 6, 6);

				XSSFDataValidation validation2 = (XSSFDataValidation)dvHelper2.createValidation(dvConstraint2, addressList2);
				validation2.setShowErrorBox(true);
				validation2.createErrorBox("ERROR MEESAGE:Invalid Data", "Please provide valid data in the dropdown list.");

				sheet5.addValidationData(validation2);
			}
			
			
			//-----sheet5 생성---e
			
			//-----sheet6 생성---s
			row6 = sheet6.createRow(rowNum6++);
			row6.setHeight((short) 500);  // 행 높이
			cell6 = row6.createCell(0);
			cell6.setCellStyle(styleSubject1);		
			cell6.setCellValue("K-CURE 암임상 데이터 카탈로그 레이아웃");
			cell6 = row6.createCell(1);
			cell6.setCellStyle(styleSubject1);
			cell6 = row6.createCell(2);
			cell6.setCellStyle(styleSubject1);
			sheet6.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));
			
			row6 = sheet6.createRow(rowNum6++);
			cell6 = row6.createCell(0);
			cell6.setCellStyle(styleSubject2);		
			cell6.setCellValue("제공기관 : " + prtiNmStr);
			cell6 = row6.createCell(1);
			cell6.setCellStyle(styleSubject2);
			sheet6.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더추가
			row6 = sheet6.createRow(rowNum6++);
		
			cell6 = row6.createCell(0);
			cell6.setCellValue(colNames6[0]);
			cell6.setCellStyle(styleHeader);
			sheet6.setColumnWidth(0, colWidths6[0]);
			
			cell6 = row6.createCell(1);
			cell6.setCellStyle(styleBody1);
			sheet6.setColumnWidth(1, 20000);
			
			row6 = sheet6.createRow(rowNum6++);
			
			cell6 = row6.createCell(0);
			cell6.setCellValue(colNames6[0]);
			cell6.setCellStyle(styleHeader);
			sheet6.setColumnWidth(0, colWidths6[0]);
			
			cell6 = row6.createCell(1);
			cell6.setCellStyle(styleBody1);
			sheet6.setColumnWidth(1, 20000);
			
			row6 = sheet6.createRow(rowNum6++);
			
			cell6 = row6.createCell(0);
			cell6.setCellValue(colNames6[0]);
			cell6.setCellStyle(styleHeader);
			sheet6.setColumnWidth(0, colWidths6[0]);
			
			cell6 = row6.createCell(1);
			cell6.setCellStyle(styleBody1);
			sheet6.setColumnWidth(1, 20000);
			
			row6 = sheet6.createRow(rowNum6++);
			
			cell6 = row6.createCell(0);
			cell6.setCellValue(colNames6[0]);
			cell6.setCellStyle(styleHeader);
			sheet6.setColumnWidth(0, colWidths6[0]);
			
			cell6 = row6.createCell(1);
			cell6.setCellStyle(styleBody1);
			sheet6.setColumnWidth(1, 20000);
			
			sheet6.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )5 , ( int) 0, (short )0 )); 
			sheet6.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )5 , ( int) 1, (short )1 )); 
			
			//-----sheet6 생성---e
			

			// Date
			SimpleDateFormat fmt = new SimpleDateFormat("yyMMddHHmmss");
			Date date = new Date();
			
			// File name
			String fileNm = "KCURE_암임상_연구과제신청_" + fmt.format(date) + ".xlsx";
			
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attatchment;filename=" + URLEncoder.encode(fileNm, "UTF-8"));
			
			wb.write(response.getOutputStream());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	  * @Method Name : filedownTemplte02
	  * @작성일 : 2023. 4. 17.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	공공라이브러리 신청 템플릿 다운로드
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value = "/filedownTemplte02.do")
	public void filedownTemplte02(HttpServletResponse response, @RequestParam HashMap<String, Object> commandMap, Model model) throws Exception {
		
		try {
			//데이터 가져오기		
			String dtsLclsCdStr = String.valueOf(commandMap.get("dtsArray"));
			commandMap.put("dtsLclsCd", dtsLclsCdStr);
				
			List<HashMap<String, Object>> dataList1 = clcinf2Service.selectPubTmplte1List(commandMap); //데이터셋(목록)정보
			List<HashMap<String, Object>> dataList2 = clcinf2Service.selectPubTmplte2List(commandMap); //데이터셋변수(항목)정보
			List<HashMap<String, Object>> dataList3 = clcinf2Service.selectTmplte3List(commandMap); //코드값 코드명정보
			
			//참여기관명
			String prtiNmStr = String.valueOf(commandMap.get("prtiNm"));
			
			//파일제목
			String fileNmStr = null;
			
			//시트제목
			String titleNmStr = null;
			String titleSheet1NmStr = null;
			String titleSheet2NmStr = null;
			
			String titleSheet3NmStr = "코드값_코드명정보";
			String titleSheet4NmStr = "추가데이터";
			
			switch (dtsLclsCdStr) {
			  case "05":
				  fileNmStr = "KCURE_암공공(맞춤)_연구과제신청_";
				  titleNmStr = "K-CURE 암공공(맞춤) 데이터 카탈로그 레이아웃";
				  titleSheet1NmStr = "암공공(맞춤)_데이터셋(목록)정보";
				  titleSheet2NmStr = "암공공(맞춤)_데이터셋변수(항목)정보";
			    break;
			  case "06":
				  fileNmStr = "KCURE_암공공(표본_전체)_연구과제신청_";
				  titleNmStr = "K-CURE 암공공(표본_전체) 데이터 카탈로그 레이아웃";
				  titleSheet1NmStr = "암공공(표본_전체)_데이터셋(목록)정보";
				  titleSheet2NmStr = "암공공(표본_전체)_데이터셋변수(항목)정보";
			    break;
			  case "07":
				  fileNmStr = "KCURE_암공공(표본_위암)_연구과제신청_";
				  titleNmStr = "K-CURE 암공공(표본_위암) 데이터 카탈로그 레이아웃";
				  titleSheet1NmStr = "암공공(표본_위암)_데이터셋(목록)정보";
				  titleSheet2NmStr = "암공공(표본_위암)_데이터셋변수(항목)정보";
			    break;
			  case "08":
				  fileNmStr = "KCURE_암공공(표본_유방암)_연구과제신청_";
				  titleNmStr = "K-CURE 암공공(표본_유방암) 데이터 카탈로그 레이아웃";
				  titleSheet1NmStr = "암공공(표본_유방암)_데이터셋(목록)정보";
				  titleSheet2NmStr = "암공공(표본_유방암)_데이터셋변수(항목)정보";
				break;
			  case "09":
				  fileNmStr = "KCURE_암공공(표본_병기_위암)_연구과제신청_";
				  titleNmStr = "K-CURE 암공공(표본_병기_위암) 데이터 카탈로그 레이아웃";
				  titleSheet1NmStr = "암공공(표본_병기_위암)_데이터셋(목록)정보";
				  titleSheet2NmStr = "암공공(표본_병기_위암)_데이터셋변수(항목)정보";
				break;
			  case "10":
				  fileNmStr = "KCURE_암공공(표본_병기_유방암)_연구과제신청_";
				  titleNmStr = "K-CURE 암공공(표본_병기_유방암) 데이터 카탈로그 레이아웃";
				  titleSheet1NmStr = "암공공(표본_병기_유방암)_데이터셋(목록)정보";
				  titleSheet2NmStr = "암공공(표본_병기_유방암)_데이터셋변수(항목)정보";
				break;
			  case "11":
				  fileNmStr = "KCURE_암공공(표본_병기_대장암)_연구과제신청_";
				  titleNmStr = "K-CURE 암공공(표본_병기_대장암) 데이터 카탈로그 레이아웃";
				  titleSheet1NmStr = "암공공(표본_병기_대장암)_데이터셋(목록)정보";
				  titleSheet2NmStr = "암공공(표본_병기_대장암)_데이터셋변수(항목)정보";
			    break;
	
			  default:
			}

			//객체 및 시트 생성
			XSSFWorkbook wb = new XSSFWorkbook();
			XSSFSheet sheet1 = wb.createSheet(titleSheet1NmStr);
			XSSFSheet sheet2 = wb.createSheet(titleSheet2NmStr);
			XSSFSheet sheet3 = wb.createSheet(titleSheet3NmStr);
			XSSFSheet sheet4 = wb.createSheet(titleSheet4NmStr);
			
			Row row1 = null;
			Row row2 = null;
			Row row3 = null;
			Row row4 = null;
			
			Cell cell1 = null;
			Cell cell2 = null;
			Cell cell3 = null;
			Cell cell4 = null;
			
			int rowNum1 = 0;
			int rowNum2 = 0;
			int rowNum3 = 0;
			int rowNum4 = 0;

			//// Header ////
			final String[] colNames1 = {"연번", "데이터셋 한글명(테이블 한글명)", "데이터셋명(테이블명)", "변수(항목)개수", "선택변수(항목)개수"};
			final String[] colNames2 = {"연번", "데이터셋명(테이블 한글명)", "데이터셋명(테이블명)", " SUB NO", "변수\n(컬럼한글명)", "변수명\n(컬럼명)", "데이터\n이용 신청", "설명", "값", "형식\n(Data Type)"};
			final String[] colNames3 = {"코드ID", "코드명", "코드유효값", "코드유효값명"};
			final String[] colNames4 = {"추가데이터"};
			
			// Header size
			final int[] colWidths1 = {1500, 7000, 7000, 4000, 4000};
			final int[] colWidths2 = {1500, 7000, 5000, 2500, 8000, 8000, 2500, 6000, 6000, 3000};
			final int[] colWidths3 = {1500, 8000, 2500, 25000};
			final int[] colWidths4 = {2500};
			
			// Subject1 font
			Font fontSubject1 = wb.createFont();
			fontSubject1.setBoldweight(Font.BOLDWEIGHT_BOLD);
			fontSubject1.setFontHeightInPoints((short) 16);
			fontSubject1.setFontName("맑은 고딕");
			
			// Subject2 font
			Font fontSubject2 = wb.createFont();
			fontSubject2.setBoldweight(Font.BOLDWEIGHT_BOLD);
			fontSubject2.setFontHeightInPoints((short) 10);
			fontSubject2.setFontName("맑은 고딕");
			
			// body font
			Font fontBody = wb.createFont();
			fontBody.setFontHeightInPoints((short) 10);
			fontBody.setFontName("맑은 고딕");
			
			// Header font
			Font fontHeader = wb.createFont();
			fontHeader.setBoldweight(Font.BOLDWEIGHT_BOLD);
			fontHeader.setFontHeightInPoints((short) 10);
			fontHeader.setFontName("맑은 고딕");
			
			XSSFCellStyle styleSubject1 = wb.createCellStyle();
			styleSubject1.setAlignment(CellStyle.ALIGN_LEFT);
			styleSubject1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleSubject1.setFont(fontSubject1);
			
			XSSFCellStyle styleSubject2 = wb.createCellStyle();
			styleSubject2.setAlignment(CellStyle.ALIGN_LEFT);
			styleSubject2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleSubject2.setFont(fontSubject2);
			
			XSSFCellStyle styleBody1 = wb.createCellStyle();
			styleBody1.setAlignment(CellStyle.ALIGN_LEFT);
			styleBody1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleBody1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleBody1.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleBody1.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleBody1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleBody1.setFont(fontBody);
			
			XSSFCellStyle styleBody2 = wb.createCellStyle();
			styleBody2.setAlignment(CellStyle.ALIGN_CENTER);
			styleBody2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleBody2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleBody2.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleBody2.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleBody2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleBody2.setFont(fontBody);
			
			XSSFCellStyle styleBody3 = wb.createCellStyle();
			styleBody3.setAlignment(CellStyle.ALIGN_RIGHT);
			styleBody3.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleBody3.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleBody3.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleBody3.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleBody3.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleBody3.setFont(fontBody);
			
			XSSFCellStyle styleBody4 = wb.createCellStyle();
			styleBody4.setAlignment(CellStyle.ALIGN_CENTER);
			styleBody4.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleBody4.setFillForegroundColor(HSSFColor.YELLOW.index);
			styleBody4.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			styleBody4.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleBody4.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleBody4.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleBody4.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleBody4.setFont(fontBody);
			
			XSSFColor headerColor = new XSSFColor(new java.awt.Color(255,187,0));
			
			// Header style
			XSSFCellStyle styleHeader = wb.createCellStyle();
			styleHeader.setAlignment(CellStyle.ALIGN_CENTER);
			styleHeader.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			styleHeader.setFillForegroundColor(headerColor);
			styleHeader.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			styleHeader.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			styleHeader.setBorderTop(HSSFCellStyle.BORDER_THIN);
			styleHeader.setBorderRight(HSSFCellStyle.BORDER_THIN);
			styleHeader.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			styleHeader.setWrapText(true);
			styleHeader.setFont(fontHeader);	

			//-----sheet1 생성---s
			row1 = sheet1.createRow(rowNum1++);
			row1.setHeight((short) 500);  // 행 높이
			cell1 = row1.createCell(0);
			cell1.setCellStyle(styleSubject1);		
			cell1.setCellValue(titleNmStr);
			cell1 = row1.createCell(1);
			cell1.setCellStyle(styleSubject1);
			cell1 = row1.createCell(2);
			cell1.setCellStyle(styleSubject1);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 2));
			
			row1 = sheet1.createRow(rowNum1++);
			cell1 = row1.createCell(0);
			cell1.setCellStyle(styleSubject2);		
			cell1.setCellValue("제공기관 : " + prtiNmStr);
			cell1 = row1.createCell(1);
			cell1.setCellStyle(styleSubject2);
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더1추가
			row1 = sheet1.createRow(rowNum1++);
		
			for (int i = 0; i < colNames1.length; i++) {
				cell1 = row1.createCell(i);
				cell1.setCellValue(colNames1[i]);
				cell1.setCellStyle(styleHeader);
				sheet1.setColumnWidth(i, colWidths1[i]);
			}
			
			//헤더2추가
			row1 = sheet1.createRow(rowNum1++);
			
			for (int i = 0; i < colNames1.length; i++) {
				cell1 = row1.createCell(i);
				cell1.setCellValue(colNames1[i]);
				cell1.setCellStyle(styleHeader);
				sheet1.setColumnWidth(i, colWidths1[i]);
			}
			
			//Header row병합
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 0, (short )0 ));
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 1, (short )1 ));
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 2, (short )2 ));
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 3, (short )3 )); 
			sheet1.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 4, (short )4 ));	
			
			//선택 count 수식변수
			int formCellNo = 5;

			//// Body ////
			if(dataList1.size() > 0) {
				for (int i = 0; i < dataList1.size(); i++) {
					row1 = sheet1.createRow(rowNum1++);
					
					cell1 = row1.createCell(0);
					cell1.setCellStyle(styleBody2);
					cell1.setCellValue(i + 1);
					
					cell1 = row1.createCell(1);
					cell1.setCellStyle(styleBody1);
					cell1.setCellValue(dataList1.get(i).get("dtsknm") + "");
					
					cell1 = row1.createCell(2);
					cell1.setCellStyle(styleBody1);
					cell1.setCellValue(dataList1.get(i).get("dtsid") + "");
					
					cell1 = row1.createCell(3);
					cell1.setCellStyle(styleBody3);
					cell1.setCellValue(dataList1.get(i).get("colcnt") + "");
					
					cell1 = row1.createCell(4);
					cell1.setCellStyle(styleBody3);
					cell1.setCellType(HSSFCell.CELL_TYPE_FORMULA);
					cell1.setCellFormula("COUNTIFS('" + titleSheet2NmStr +"'!C:C,C"+ (formCellNo++) +", '" + titleSheet2NmStr + "'!G:G,\"=Y\")");
					cell1.setCellValue("0");
				}
			}
			//-----sheet1 생성---e
			
			
			//-----sheet2 생성---s
			row2 = sheet2.createRow(rowNum2++);
			row2.setHeight((short) 500);  // 행 높이
			cell2 = row2.createCell(0);
			cell2.setCellStyle(styleSubject1);		
			cell2.setCellValue(titleNmStr);
			cell2 = row2.createCell(1);
			cell2.setCellStyle(styleSubject1);
			cell2 = row2.createCell(2);
			cell2.setCellStyle(styleSubject1);
			sheet2.addMergedRegion(new CellRangeAddress(0, 0, 0, 2));
			
			row2 = sheet2.createRow(rowNum2++);
			cell2 = row2.createCell(0);
			cell2.setCellStyle(styleSubject2);		
			cell2.setCellValue("제공기관 : " + prtiNmStr);
			cell2 = row2.createCell(1);
			cell2.setCellStyle(styleSubject2);
			sheet2.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더1추가
			row2 = sheet2.createRow(rowNum2++);
			
			for (int i = 0; i < colNames2.length; i++) {
				cell2 = row2.createCell(i);
				cell2.setCellValue(colNames2[i]);
				cell2.setCellStyle(styleHeader);
				sheet2.setColumnWidth(i, colWidths2[i]);
			}
			
			//헤더2추가
			row2 = sheet2.createRow(rowNum2++);
			
			for (int i = 0; i < colNames2.length; i++) {
				cell2 = row2.createCell(i);
				cell2.setCellValue(colNames2[i]);
				cell2.setCellStyle(styleHeader);
				sheet2.setColumnWidth(i, colWidths2[i]);
			}
			
			//Header row병합
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 0, (short )0 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 1, (short )1 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 2, (short )2 ));
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 3, (short )3 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 4, (short )4 ));
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 5, (short )5 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 6, (short )6 )); 
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 7, (short )7 ));
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 8, (short )8 ));
			sheet2.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )3 , ( int) 9, (short )9 ));

			//// Body ////
			if(dataList2.size() > 0) {
				int serialNo1 = 0; //연번
				int serialNo2 = 0; //sub no
				
				String compTmp1 = "";
				String compTmp2 = "";
				
				for (int i = 0; i < dataList2.size(); i++) {
					compTmp2 = String.valueOf(dataList2.get(i).get("dtsid")) ;
					
					if(! compTmp1.equals(compTmp2)) {
						compTmp1 = compTmp2;
						serialNo1++;
						serialNo2 = 1;
					}else {
						serialNo2++;
					}

					row2 = sheet2.createRow(rowNum2++);
					
					cell2 = row2.createCell(0);
					cell2.setCellStyle(styleBody2);
					cell2.setCellValue(serialNo1 + "");
					
					cell2 = row2.createCell(1);
					cell2.setCellStyle(styleBody3);
					cell2.setCellValue(dataList2.get(i).get("dtsknm") + "");
					
					cell2 = row2.createCell(2);
					cell2.setCellStyle(styleBody2);
					cell2.setCellValue(dataList2.get(i).get("dtsid") + "");
					
					cell2 = row2.createCell(3);
					cell2.setCellStyle(styleBody3);
					cell2.setCellValue(serialNo2 + "");
					
					cell2 = row2.createCell(4);
					cell2.setCellStyle(styleBody3);
					cell2.setCellValue(dataList2.get(i).get("colknm") + "");
					
					cell2 = row2.createCell(5);
					cell2.setCellStyle(styleBody3);
					cell2.setCellValue(dataList2.get(i).get("colenm") + "");
					
					cell2 = row2.createCell(6);
					cell2.setCellStyle(styleBody4);
					cell2.setCellValue("N");
					
					cell2 = row2.createCell(7);
					cell2.setCellStyle(styleBody1);
					cell2.setCellValue(dataList2.get(i).get("colexplcont") + "");
					
					cell2 = row2.createCell(8);
					cell2.setCellStyle(styleBody1);
					cell2.setCellValue(dataList2.get(i).get("cdvalue") + "");
					
					cell2 = row2.createCell(9);
					cell2.setCellStyle(styleBody2);
					cell2.setCellValue(dataList2.get(i).get("datatpcont") + "");
				}
				
				//선택콤보생성
				XSSFDataValidationHelper dvHelper = new XSSFDataValidationHelper((XSSFSheet) row2.getSheet());
				XSSFDataValidationConstraint dvConstraint = (XSSFDataValidationConstraint) dvHelper.createExplicitListConstraint(new String[]{"Y", "N"});

				CellRangeAddressList addressList = new CellRangeAddressList(4, rowNum2-1, 6, 6);

				XSSFDataValidation validation = (XSSFDataValidation)dvHelper.createValidation(dvConstraint, addressList);
				validation.setShowErrorBox(true);
				validation. createErrorBox("ERROR MEESAGE:Invalid Data", "Please provide valid data in the dropdown list.");

				sheet2.addValidationData(validation);
			}
			//-----sheet2 생성---e
			
			//-----sheet3 생성---s
			row3 = sheet3.createRow(rowNum3++);
			row3.setHeight((short) 500);  // 행 높이
			cell3 = row3.createCell(0);
			cell3.setCellStyle(styleSubject1);		
			cell3.setCellValue(titleNmStr);
			cell3 = row3.createCell(1);
			cell3.setCellStyle(styleSubject1);
			cell3 = row3.createCell(2);
			cell3.setCellStyle(styleSubject1);
			sheet3.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));
			
			row3 = sheet3.createRow(rowNum3++);
			cell3 = row3.createCell(0);
			cell3.setCellStyle(styleSubject2);		
			cell3.setCellValue("제공기관 : " + prtiNmStr);
			cell3 = row3.createCell(1);
			cell3.setCellStyle(styleSubject2);
			sheet3.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더추가
			row3 = sheet3.createRow(rowNum3++);
		
			for (int i = 0; i < colNames3.length; i++) {
				cell3 = row3.createCell(i);
				cell3.setCellValue(colNames3[i]);
				cell3.setCellStyle(styleHeader);
				sheet3.setColumnWidth(i, colWidths3[i]);
			}

			//// Body ////
			if(dataList3.size() > 0) {
				for (int i = 0; i < dataList3.size(); i++) {
					row3 = sheet3.createRow(rowNum3++);
					
					cell3 = row3.createCell(0);
					cell3.setCellStyle(styleBody2);
					cell3.setCellValue(dataList3.get(i).get("codeid") + "");
					
					cell3 = row3.createCell(1);
					cell3.setCellStyle(styleBody1);
					cell3.setCellValue(dataList3.get(i).get("codenm") + "");
					
					cell3 = row3.createCell(2);
					cell3.setCellStyle(styleBody1);
					cell3.setCellValue(dataList3.get(i).get("codeval") + "");
					
					cell3 = row3.createCell(3);
					cell3.setCellStyle(styleBody1);
					cell3.setCellValue(dataList3.get(i).get("codevalnm") + "");
				}
			}
			//-----sheet3 생성---e
			
			//-----sheet4 생성---s
			row4 = sheet4.createRow(rowNum4++);
			row4.setHeight((short) 500);  // 행 높이
			cell4 = row4.createCell(0);
			cell4.setCellStyle(styleSubject1);		
			cell4.setCellValue(titleNmStr);
			cell4 = row4.createCell(1);
			cell4.setCellStyle(styleSubject1);
			cell4 = row4.createCell(2);
			cell4.setCellStyle(styleSubject1);
			sheet4.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));
			
			row4 = sheet4.createRow(rowNum4++);
			cell4 = row4.createCell(0);
			cell4.setCellStyle(styleSubject2);		
			cell4.setCellValue("제공기관 : " + prtiNmStr);
			cell4 = row4.createCell(1);
			cell4.setCellStyle(styleSubject2);
			sheet4.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
			
			//헤더추가
			row4 = sheet4.createRow(rowNum4++);
		
			cell4 = row4.createCell(0);
			cell4.setCellValue(colNames4[0]);
			cell4.setCellStyle(styleHeader);
			sheet4.setColumnWidth(0, colWidths4[0]);
			
			cell4 = row4.createCell(1);
			cell4.setCellStyle(styleBody1);
			sheet4.setColumnWidth(1, 20000);
			
			row4 = sheet4.createRow(rowNum4++);
			
			cell4 = row4.createCell(0);
			cell4.setCellValue(colNames4[0]);
			cell4.setCellStyle(styleHeader);
			sheet4.setColumnWidth(0, colWidths4[0]);
			
			cell4 = row4.createCell(1);
			cell4.setCellStyle(styleBody1);
			sheet4.setColumnWidth(1, 20000);
			
			row4 = sheet4.createRow(rowNum4++);
			
			cell4 = row4.createCell(0);
			cell4.setCellValue(colNames4[0]);
			cell4.setCellStyle(styleHeader);
			sheet4.setColumnWidth(0, colWidths4[0]);
			
			cell4 = row4.createCell(1);
			cell4.setCellStyle(styleBody1);
			sheet4.setColumnWidth(1, 20000);
			
			row4 = sheet4.createRow(rowNum4++);
			
			cell4 = row4.createCell(0);
			cell4.setCellValue(colNames4[0]);
			cell4.setCellStyle(styleHeader);
			sheet4.setColumnWidth(0, colWidths4[0]);
			
			cell4 = row4.createCell(1);
			cell4.setCellStyle(styleBody1);
			sheet4.setColumnWidth(1, 20000);
			
			sheet4.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )5 , ( int) 0, (short )0 )); 
			sheet4.addMergedRegion (new CellRangeAddress(( int) 2 , ( short )5 , ( int) 1, (short )1 )); 
			
			//-----sheet4 생성---e
			

			// Date
			SimpleDateFormat fmt = new SimpleDateFormat("yyMMddHHmmss");
			Date date = new Date();
			
			// File name
			String fileNm = fileNmStr + fmt.format(date) + ".xlsx";
			
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attatchment;filename=" + URLEncoder.encode(fileNm, "UTF-8"));
			
			wb.write(response.getOutputStream());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/uploadTemplte01.do", method = RequestMethod.POST)
    public ModelAndView excelUpload01(MultipartHttpServletRequest request, @RequestParam HashMap<String, Object> commandMap) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsonView");
        
        LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

        MultipartFile file = null;
        String fileNm = "";
        
        Iterator<String> iterator = request.getFileNames();
    	if (iterator.hasNext()) {
    		file = request.getFile(iterator.next());
    	}
     
    	//데이터신청번호 
    	String dataAplcNo = commandMap.get("excelDataAplcNo") + "";
    	//데이터신청타입
    	String dataTpcd = commandMap.get("excelDataTpcd") + "";
    	//신청기관 ID
    	String prtiIdStr = commandMap.get("excelPrtiId") + "";
    	//대분류코드
    	String dsLclsCdStr = commandMap.get("excelDtsLclsCdVal") + "";
    	
    	
    	 //파일등록 및 파일순번 리턴
        DataServiceFileVO result = fileMngUtil.parseFileInf(file, dataAplcNo, CommonEnum.DataAttfSpcd.ATTFSPCD06.attfSpcd(),"06", "TEST", prtiIdStr);
		int attfSeq = insertDataFileInfo(result);

        try {
            Workbook wb = WorkbookFactory.create(file.getInputStream());
            Sheet sheet1 = wb.getSheetAt(1); //데이터셋변수(항목)정보
            Sheet sheet2 = wb.getSheetAt(4); //BaseLine_데이터셋변수(항목)정보
            Sheet sheet3 = wb.getSheetAt(5); //추가데이터 정보       
            
            int resultCnt1 = 0;
            int resultCnt2 = 0;
            
            List<HashMap<String, Object>> list1 = new ArrayList<HashMap<String, Object>>();
            List<HashMap<String, Object>> list2 = new ArrayList<HashMap<String, Object>>();
            
            HashMap<String, Object> dataMap1 = new HashMap<String, Object>();
            HashMap<String, Object> dataMap2 = new HashMap<String, Object>();
            HashMap<String, Object> dataMap3 = new HashMap<String, Object>();
            
            String tableNm = null;
            String colNm = null;
            
            boolean testYn = false;

            for (int i = 1; i <= sheet1.getLastRowNum(); i++) {
                Row row = sheet1.getRow(i);              

                if(getValue(row.getCell(6)).trim().equals("Y")) {  
                	dataMap1 = new HashMap<String, Object>();
                	dataMap1.put("dataAplcNo", dataAplcNo);
                	        
                	//위암 데이터셋인 경우 대분류코드 설정
                	if(getValue(row.getCell(2)).trim().contains("GSCN_")) {
                		dataMap1.put("dtsLclsCd", "01");
                	}
                	//유방암 데이터셋인 경우 대분류코드 설정
                	else if(getValue(row.getCell(2)).trim().contains("BRCN_")) {
                		dataMap1.put("dtsLclsCd", "02");
                	}
                	
                	dataMap1.put("attfSeq", attfSeq);
                	dataMap1.put("userId", sessionVo.getId());
                	dataMap1.put("prtiId", prtiIdStr);
                    dataMap1.put("dtsId", getValue(row.getCell(2)).trim());
                    dataMap1.put("colEnm", getValue(row.getCell(5)).trim());
                    list1.add(dataMap1);
                }
            }

            for (int i = 1; i <= sheet2.getLastRowNum(); i++) {
                Row row = sheet2.getRow(i);

                if(getValue(row.getCell(6)).trim().equals("Y")) {  
                	dataMap2 = new HashMap<String, Object>();
                	dataMap2.put("dataAplcNo", dataAplcNo);
                	dataMap2.put("dtsLclsCd", "03");
                	dataMap2.put("attfSeq", attfSeq);
                	dataMap2.put("userId", sessionVo.getId());
                	dataMap2.put("prtiId", prtiIdStr);
                    dataMap2.put("dtsId", getValue(row.getCell(2)).trim());
                    dataMap2.put("colEnm", getValue(row.getCell(5)).trim());
                    list2.add(dataMap2);
                }
            }
            
            //데이터1 저장
            if(list1.size() > 0) {
            	resultCnt1 = clcinf2Service.insertAplcTempDts(list1);
            }
            
            //데이터2 저장
            if(list2.size() > 0) {
            	resultCnt2 = clcinf2Service.insertAplcTempDts(list2);
            }
            
            //추가데이터 저장
            for (int i = 1; i <= sheet3.getLastRowNum(); i++) {
                Row row = sheet3.getRow(i);
                if(i == 2) {
                	String addDtsId = getValue(row.getCell(1)).trim();
                	if(!"".equals(addDtsId)) {
                		dataMap3.put("dataAplcNo", dataAplcNo);
                		dataMap3.put("dtsLclsCd", dsLclsCdStr);
                		dataMap3.put("dataTpcd", dataTpcd);
                		dataMap3.put("userId", sessionVo.getId());
                		dataMap3.put("prtiId", prtiIdStr);
                		dataMap3.put("addDataCont", addDtsId);
                		
                		if(clcinf2Service.selectTmpAplcAddTmpDtsCnt(dataMap3) > 0) {
                			clcinf2Service.updateAplcAddTmpDts(dataMap3);
                		}else {
                			clcinf2Service.insertAplcAddTmpDts(dataMap3);
                		}
                	}
                }
            }

            if (resultCnt1 > 0 || resultCnt2 > 0) {
            	modelAndView.addObject("fileNm", fileNm);
            	modelAndView.addObject("attfSeq", attfSeq);
            	modelAndView.addObject("resultCode", "Y");
                modelAndView.addObject("message", "Success");
            }else {
                modelAndView.addObject("resultCode", "N");
                modelAndView.addObject("message", "선택된 데이터 정보가 없습니다.");
            }
        } catch(NullPointerException e) {    
        	modelAndView.addObject("resultCode", "N");
            modelAndView.addObject("message","업로드에 실패하였습니다.\n관리자에게 문의바랍니다.");
            
            //1.업로드 파일 제거 
            DataServiceFileVO fileVo = new DataServiceFileVO();
            fileVo.setDataAplcNo(dataAplcNo);
            fileVo.setAttfSeq(attfSeq);
            fileVo.setAttfSpcd("06");
            fileVo.setAttdNmSpcd("06");
    	 
            deleteDataFileInfo(fileVo);     
            
            //2.임시저장 데이터셋 삭제
	         HashMap<String,Object> parmMap = new HashMap<String, Object>();
	         parmMap.put("dataAplcNo", dataAplcNo);
	         parmMap.put("prtiId", prtiIdStr);
	         
	         clcinf2Service.deleteTmpDataAplcDtsOne(parmMap);
	         clcinf2Service.deleteTmpAddDataAplcDtsOne(parmMap);
        } catch (Exception e) {
            modelAndView.addObject("resultCode", "N");
            modelAndView.addObject("message","잘못된 엑셀양식 입니다.");
            
            //1.업로드 파일 제거 
            DataServiceFileVO fileVo = new DataServiceFileVO();
            fileVo.setDataAplcNo(dataAplcNo);
            fileVo.setAttfSeq(attfSeq);
            fileVo.setAttfSpcd("06");
            fileVo.setAttdNmSpcd("06");
    	 
            deleteDataFileInfo(fileVo);     
            
            //2.임시저장 데이터셋 삭제
	         HashMap<String,Object> parmMap = new HashMap<String, Object>();
	         parmMap.put("dataAplcNo", dataAplcNo);
	         parmMap.put("prtiId", prtiIdStr);
	         
	         clcinf2Service.deleteTmpDataAplcDtsOne(parmMap);
	         clcinf2Service.deleteTmpAddDataAplcDtsOne(parmMap);
        }

        return modelAndView;
    }
	
	@ResponseBody
	@RequestMapping(value = "/uploadTemplte02.do", method = RequestMethod.POST)
    public ModelAndView excelUpload02(MultipartHttpServletRequest request, @RequestParam HashMap<String, Object> commandMap) throws Exception {
		   ModelAndView modelAndView = new ModelAndView();
	        modelAndView.setViewName("jsonView");
	        
	        LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

	        MultipartFile file = null;
	        String fileNm = "";
	        
	        Iterator<String> iterator = request.getFileNames();
	    	if (iterator.hasNext()) {
	    		file = request.getFile(iterator.next());
	    	}
	    
	    	//데이터신청번호
	    	String dataAplcNo = commandMap.get("excelDataAplcNo") + "";
	    	//데이터신청타입
	    	String dataTpcd = commandMap.get("excelDataTpcd") + "";
	    	//신청기관 ID
	    	String prtiIdStr = commandMap.get("excelPrtiId") + "";
	    	//대분류코드
	    	String dsLclsCdStr = commandMap.get("excelDtsLclsCdVal") + "";
	    	
	    	 //파일등록 및 파일순번 리턴
	        DataServiceFileVO result = fileMngUtil.parseFileInf(file, dataAplcNo, CommonEnum.DataAttfSpcd.ATTFSPCD06.attfSpcd(),"06", "TEST", prtiIdStr);
			int attfSeq = insertDataFileInfo(result);

	        try {
	            Workbook wb = WorkbookFactory.create(file.getInputStream());
	            Sheet sheet1 = wb.getSheetAt(1); //데이터셋변수(항목)정보
	            Sheet sheet2 = wb.getSheetAt(3); //추가데이터 정보       
	            
	            int resultCnt1 = 0;
	            int resultCnt2 = 0;
	            
	            List<HashMap<String, Object>> list1 = new ArrayList<HashMap<String, Object>>();
	            
	            HashMap<String, Object> dataMap1 = new HashMap<String, Object>();
	            HashMap<String, Object> dataMap2 = new HashMap<String, Object>();

	            for (int i = 1; i <= sheet1.getLastRowNum(); i++) {
	                Row row = sheet1.getRow(i);              

	                if(getValue(row.getCell(6)).trim().equals("Y")) {  
	                	dataMap1 = new HashMap<String, Object>();
	                	dataMap1.put("dataAplcNo", dataAplcNo);
	                	dataMap1.put("dtsLclsCd", dsLclsCdStr);
	                	dataMap1.put("attfSeq", attfSeq);
	                	dataMap1.put("userId", sessionVo.getId());
	                	dataMap1.put("prtiId", prtiIdStr);
	                    dataMap1.put("dtsId", getValue(row.getCell(2)).trim());
	                    dataMap1.put("colEnm", getValue(row.getCell(5)).trim());
	                    list1.add(dataMap1);
	                }
	            }
	            
	            //데이터셋 저장
	            if(list1.size() > 0) {
	            	resultCnt1 = clcinf2Service.insertAplcTempDts(list1);
	            }
	            
	            //추가데이터 저장
	            for (int i = 1; i <= sheet2.getLastRowNum(); i++) {
	                Row row = sheet2.getRow(i);
	                if(i == 2) {
	                	String addDtsId = getValue(row.getCell(1)).trim();
	                	if(!"".equals(addDtsId)) {
	                		dataMap2.put("dataAplcNo", dataAplcNo);
	                		dataMap2.put("dtsLclsCd", dsLclsCdStr);
	                		dataMap2.put("dataTpcd", dataTpcd);
	                		dataMap2.put("userId", sessionVo.getId());
	                		dataMap2.put("prtiId", prtiIdStr);
	                		dataMap2.put("addDataCont", addDtsId);
	                		
	                		if(clcinf2Service.selectTmpAplcAddTmpDtsCnt(dataMap2) > 0) {
	                			clcinf2Service.updateAplcAddTmpDts(dataMap2);
	                		}else {
	                			clcinf2Service.insertAplcAddTmpDts(dataMap2);
	                		}
	                	}
	                }
	            }

	            if (resultCnt1 > 0 || resultCnt2 > 0) {
	            	modelAndView.addObject("fileNm", fileNm);
	            	modelAndView.addObject("attfSeq", attfSeq);
	            	modelAndView.addObject("resultCode", "Y");
	                modelAndView.addObject("message", "Success");
	            }else {
	                modelAndView.addObject("resultCode", "N");
	                modelAndView.addObject("message", "선택된 데이터 정보가 없습니다.");
	            }
	        } catch(NullPointerException e) {    
	        	modelAndView.addObject("resultCode", "N");
	            modelAndView.addObject("message","업로드에 실패하였습니다.\n관리자에게 문의바랍니다.");
	            
	            //1.업로드 파일 제거 
	            DataServiceFileVO fileVo = new DataServiceFileVO();
	            fileVo.setDataAplcNo(dataAplcNo);
	            fileVo.setAttfSeq(attfSeq);
	            fileVo.setAttfSpcd("06");
	            fileVo.setAttdNmSpcd("06");
	    	 
	            deleteDataFileInfo(fileVo);     
	            
	            //2.임시저장 데이터셋 삭제
		         HashMap<String,Object> parmMap = new HashMap<String, Object>();
		         parmMap.put("dataAplcNo", dataAplcNo);
		         parmMap.put("prtiId", prtiIdStr);
		         
		         clcinf2Service.deleteTmpDataAplcDtsOne(parmMap);
		         clcinf2Service.deleteTmpAddDataAplcDtsOne(parmMap);
	        } catch (Exception e) {
	        	e.printStackTrace();
	            modelAndView.addObject("resultCode", "N");
	            modelAndView.addObject("message","잘못된 엑셀양식 입니다.");
	            
	            //1.업로드 파일 제거 
	            DataServiceFileVO fileVo = new DataServiceFileVO();
	            fileVo.setDataAplcNo(dataAplcNo);
	            fileVo.setAttfSeq(attfSeq);
	            fileVo.setAttfSpcd("06");
	            fileVo.setAttdNmSpcd("06");
	    	 
	            deleteDataFileInfo(fileVo);     
	            
	            //2.임시저장 데이터셋 삭제
		         HashMap<String,Object> parmMap = new HashMap<String, Object>();
		         parmMap.put("dataAplcNo", dataAplcNo);
		         parmMap.put("prtiId", prtiIdStr);
		         
		         clcinf2Service.deleteTmpDataAplcDtsOne(parmMap);
		         clcinf2Service.deleteTmpAddDataAplcDtsOne(parmMap);
	        }

	        return modelAndView;
    }
	
	@ResponseBody
	@RequestMapping(value = "/deleteAplcTmpDts.do", method = RequestMethod.POST)
    public ModelAndView excelDelete(@RequestParam HashMap<String, Object> commandMap, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView");
	    
	     try {
	         String dataAplcNo = commandMap.get("dataAplcNo") + "";
	         String prtiIdStr = commandMap.get("prtiId") + "";
	         String histDataStr = commandMap.get("histDataYn") + "";
	         String attfSeqStr = commandMap.get("attfSeq") + "";
	         String currentSpcdStr = commandMap.get("currentSpcd") + "";
	         String dtsLclsCdStr =  commandMap.get("dtsLclsCd") + "";
	         String gubunStr = commandMap.get("gubun") + "";
	         
	         ClcInfRspVo clcInfRspVo = new ClcInfRspVo();
	         clcInfRspVo.setDataAplcNo(dataAplcNo);
	         clcInfRspVo.setPrtiId(prtiIdStr);
	         clcInfRspVo.setDtsLclsCd(dtsLclsCdStr);
	         clcInfRspVo.setGubun(gubunStr);
	         clcInfRspVo.setAttfseq(Integer.parseInt(attfSeqStr));
	         
	         //이전단계 데이터가 아닌 경우
	         if("N".equals(histDataStr)) {
	        	//1.업로드 파일 제거 
		        HashMap<String, Object> delData = clcinf2Service.selectTmpDtsOne(clcInfRspVo);
		         
		        DataServiceFileVO fileVo = new DataServiceFileVO();
	        	fileVo.setDataAplcNo(delData.get("dataaplcno") + "");
	        	fileVo.setAttfSeq(Integer.parseInt(delData.get("attfseq") + ""));
	        	fileVo.setAttfSpcd("06");
	        	fileVo.setAttdNmSpcd("06");
	        	 
	        	deleteDataFileInfo(fileVo);
	        	 
	        	//2.임시저장 데이터셋 삭제
		        HashMap<String,Object> parmMap = new HashMap<String, Object>();
		        parmMap.put("dataAplcNo", dataAplcNo);
		        parmMap.put("prtiId", prtiIdStr);
		        parmMap.put("dtsLclsCd", dtsLclsCdStr);
		        parmMap.put("gubun", gubunStr);
		         
		        clcinf2Service.deleteTmpDataAplcDtsOne(parmMap);
		        clcinf2Service.deleteTmpAddDataAplcDtsOne(parmMap);
	         }else {
	        	 //임시저장 테이터셋인 경우
	        	 if(DataServiceStep.STEP04.stepCd().equals(currentSpcdStr)){
	        		//1.업로드 파일 제거 
	 		        HashMap<String, Object> delData = clcinf2Service.selectTmpDtsOne(clcInfRspVo);
	 		        
	 		        if(delData != null) {
	 		        	 DataServiceFileVO fileVo = new DataServiceFileVO();
	 	 	        	fileVo.setDataAplcNo(delData.get("dataaplcno") + "");
	 	 	        	fileVo.setAttfSeq(Integer.parseInt(delData.get("attfseq") + ""));
	 	 	        	fileVo.setAttfSpcd("06");
	 	 	        	fileVo.setAttdNmSpcd("06");
	 	 	        	 
	 	 	        	deleteDataFileInfo(fileVo);
	 	 	        	 
	 	 	        	//2.임시저장 데이터셋 삭제
	 	 		        HashMap<String,Object> parmMap = new HashMap<String, Object>();
	 	 		        parmMap.put("dataAplcNo", dataAplcNo);
	 	 		        parmMap.put("prtiId", prtiIdStr);
	 	 		        parmMap.put("dtsLclsCd", dtsLclsCdStr);
	 			        parmMap.put("gubun", gubunStr);
	 	 		         
	 	 		        clcinf2Service.deleteTmpDataAplcDtsOne(parmMap);
	 	 		        clcinf2Service.deleteTmpAddDataAplcDtsOne(parmMap);
	 		        }
	        	 }
	         }
	         modelAndView.addObject("resultCode", "Y");
             modelAndView.addObject("message", "Success");
             
	     }catch(Exception e) {
	    	 e.printStackTrace();
	    	 modelAndView.addObject("resultCode", "N");
	         modelAndView.addObject("message", e.getMessage()); 
	     }
	
	     return modelAndView;
	}
	
	private String getValue(Cell cell) {
        String value = "";

        if (cell == null) {
            value = "";
        } else {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_FORMULA:
                    value = cell.getCellFormula();
                    break;
                case Cell.CELL_TYPE_NUMERIC:
                    value = String.valueOf((long)cell.getNumericCellValue());
                    break;
                case Cell.CELL_TYPE_STRING:
                    value = cell.getStringCellValue();
                    break;
                case Cell.CELL_TYPE_BOOLEAN:
                    value = cell.getBooleanCellValue() + "";
                    break;
                case Cell.CELL_TYPE_ERROR:
                    value = cell.getErrorCellValue() + "";
                    break;
                case Cell.CELL_TYPE_BLANK:
                    value = "";
                    break;
                default:
                    value = cell.getStringCellValue();
            }
        }
        return value;
    }
	
	private int insertDataFileInfo(DataServiceFileVO result) throws Exception {
		fileMngUtil.insertDataFile(result);
		return result.getAttfSeq();
	}
	
	private void deleteDataFileInfo(DataServiceFileVO result) throws Exception {
		try {
			DataServiceFileVO deleteFile = fileMngUtil.selectFileOne(result);

			if(deleteFile != null && !CommonUtils.empty(deleteFile.getDataAplcNo()) ) {	
				//기존 파일 삭제
				fileMngUtil.deletetDataFile(deleteFile);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
