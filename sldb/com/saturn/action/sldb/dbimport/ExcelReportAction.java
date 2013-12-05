package com.saturn.action.sldb.dbimport;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.sldb.Import;

public class ExcelReportAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		DataGridInfo dataGridInfo = new DataGridInfo(request);

		Import vo = BeanUtils.getBean(request, Import.class);

		List<Import> data = Import.getAll(vo);
		List<Import> data1 = Import.getAllFooter(vo);

		response.setHeader("Content-Disposition", "attachment;Filename=Report.xls");
		response.setContentType("application/ms-excel");
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");
		/*
		sheet.addMergedRegion(new CellRangeAddress(
	                0, //first row (0-based)
	                1, //last row  (0-based)
	                0, //first column (0-based)
	                0  //last column  (0-based)
	        ));//设置合并的区域
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 1, 1));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 2, 2));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 3, 3));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 4, 4));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 5, 5));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 6, 6));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 7, 7));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 8, 8));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 9, 11));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 12, 14));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 15, 15));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 16, 16));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 17, 17));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 18, 18));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 19, 19));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 20, 20));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 21, 21));
		
		//跨第1行第1个到第2个单元格的操作为 
		//sheet.addMergedRegion(new Region(0,(short)0,0,(short)1)); 

		//跨第1行第1个到第2行第1个单元格的操作为 
		//sheet.addMergedRegion(new Region(0,(short)0,1,(short)0)); 
		sheet.setColumnWidth(1, 4000);
		sheet.setColumnWidth(2, 4000);
		sheet.setColumnWidth(3, 7000);
		

		
		HSSFCellStyle cs=wb.createCellStyle();
		cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		cs.setWrapText(true);
		
		//头样式
		HSSFCellStyle cs =wb.createCellStyle();
		cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		cs.setFillForegroundColor(HSSFColor.WHITE.index);
		cs.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		cs.setWrapText(true);
		
		//保险样式
		HSSFCellStyle csIns =wb.createCellStyle();
		csIns.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		csIns.setBorderTop(HSSFCellStyle.BORDER_THIN);
		csIns.setBorderRight(HSSFCellStyle.BORDER_THIN);
		csIns.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		csIns.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		csIns.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		csIns.setFillForegroundColor(HSSFColor.WHITE.index);
		//csIns.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		csIns.setWrapText(true);

		//进项资金样式
		HSSFCellStyle csMoney =wb.createCellStyle();
		
		csMoney.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		csMoney.setBorderTop(HSSFCellStyle.BORDER_THIN);
		csMoney.setBorderRight(HSSFCellStyle.BORDER_THIN);
		csMoney.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		csMoney.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		csMoney.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		csMoney.setFillForegroundColor(HSSFColor.WHITE.index);
		csMoney.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		//csMoney.setDataFormat(HSSFDataFormat.getBuiltinFormat("0.00"));
		
        HSSFDataFormat format= wb.createDataFormat();
        csMoney.setDataFormat(format.getFormat("#,##0.00"));
		csMoney.setWrapText(true);*/
		
		HSSFCellStyle cs = wb.createCellStyle();
		cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		cs.setWrapText(true);
		
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = row.createCell(0);
		cell.setCellValue("序号");
		cell.setCellStyle(cs);
		cell = row.createCell(1);
		cell.setCellValue("标识");
		cell.setCellStyle(cs);
		cell = row.createCell(2);
		cell.setCellValue("导入文件名");
		cell.setCellStyle(cs);
		cell = row.createCell(3);
		cell.setCellValue("类型");
		cell.setCellStyle(cs);
		cell = row.createCell(4);
		cell.setCellValue("导入单位");
		cell.setCellStyle(cs);
		cell = row.createCell(5);
		cell.setCellValue("导入总数");
		cell.setCellStyle(cs);
		cell = row.createCell(6);
		cell.setCellValue("导入月份");
		cell.setCellStyle(cs);
		cell = row.createCell(7);
		cell.setCellValue("导入时间");
		cell.setCellStyle(cs);
		
		int i = 1;
		for (Import importz : data) {
			//warez.getId();
			HSSFRow rowi = sheet.createRow(i);
			HSSFCell cellj = rowi.createCell(0);
			cellj.setCellValue(i-1);
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(1);
			cellj.setCellValue(importz.getId());
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(2);
			cellj.setCellValue(importz.getName());
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(3);
			cellj.setCellValue(importz.getTypeName());
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(4);
			cellj.setCellValue(importz.getCreaterName());
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(5);
			cellj.setCellValue(importz.getSum());
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(6);
			cellj.setCellValue(importz.getImportDate());
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(7);
			cellj.setCellValue(importz.getCreateTime());
			cellj.setCellStyle(cs);
			
			i++;
		}
		for (Import importz : data1) {
			HSSFRow rowi = sheet.createRow(i);
			HSSFCell cellj = rowi.createCell(0);
			cellj.setCellValue("合计");
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(1);
			cellj.setCellValue("");
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(2);
			cellj.setCellValue("");
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(3);
			cellj.setCellValue("");
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(4);
			cellj.setCellValue("");
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(5);
			cellj.setCellValue(importz.getSum());
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(6);
			cellj.setCellValue("");
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(7);
			cellj.setCellValue("");
			cellj.setCellStyle(cs);

		}
		try{
			OutputStream os = response.getOutputStream();
			wb.write(os);
			os.flush();
			os.close();
		}catch(Exception e){
		
		}
		//out.clear();
	    //out=pageContext.pushBody();
	
		return null;
		//return new JsonView(JSONUtils.getDataGridJSON(data.size(),
		//		data,data1));
	}

	public String requestMapping() {
		return "/app/sldb/report/excelReport.action";
	}
	
	public Double formateD(String a){
		try {
			return a!=null&&!"".equals(a)?Double.parseDouble(a):null;
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		return null;
	}

}
