<%@page import="com.saturn.sldb.IdCheck"%>
<%@page import="com.saturn.sldb.ImportInfo"%>
<%@page import="com.saturn.sldb.ImportItem"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="java.io.OutputStream"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.io.PrintWriter"%>
<%
	String idSource = request.getParameter("idSource");

	String way = request.getParameter("way");

	List itemSources = ImportItem.getList(idSource);
	String date = request.getParameter(idSource + "_importDateSource");
	String[] idChecks = request.getParameterValues("idCheck");
	String[] importDates = new String[idChecks.length];

	ImportInfo sourceInfo = ImportInfo.get(idSource);

	String filename = sourceInfo.getName() + "(" + date + ")";
	filename = new String(filename.getBytes(), "iso8859-1");
	response.setHeader("Content-Disposition", "attachment;Filename="
			+ filename + ".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();

	for (int i = 0; i < idChecks.length; ++i) {
		importDates[i] = request.getParameter(idChecks[i]
				+ "_importDate");
	}

	HSSFCellStyle cs = wb.createCellStyle();
	cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
	cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
	cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);
//jyb ---start----变量定
	List<Map<String, String>> resulte = new ArrayList<Map<String, String>>();//
	Map<String, String> mapz = new LinkedHashMap<String, String>();
	mapz.put("name","姓名");
	mapz.put("identify","身份证号");
	for (int i = 0; i < idChecks.length; ++i) {
		String id = idChecks[i];
		ImportInfo info = ImportInfo.get(id);
		mapz.put(""+id,info.getName());
	}
	resulte.add(mapz);
	int col = -1;//身份证列临时变量
	int ncol = -1;//姓名列临时变量
	String t_name="";//姓名临时变量
//jyb ---end----变量定义
	for (int i = 0; i < idChecks.length; ++i) {
		String id = idChecks[i];
		ImportInfo info = ImportInfo.get(id);
		String tableName = info.getTableName();
		String importDate = importDates[i];
		List items = ImportItem.getList(id);

		Map valueResult = null;
		if (way != null && way.equals("identify")) {
			valueResult = IdCheck.batchCheck(idSource, date, id,
					importDate);
		}
		if (way != null && way.equals("name")) {
			valueResult = IdCheck.batchCheckByName(idSource, date, id,
					importDate);
		}

		List results = (List) valueResult.get("result");
		List source = (List) valueResult.get("source");
		HSSFSheet sheet = wb.createSheet(info.getName() + "("
				+ importDate + ")");
		if (results != null && !results.isEmpty()) {
			HSSFRow row = sheet.createRow(0);
//jyb ---start---
			col = -1;//jyb初始化
			ncol = -1;//jyb初始化
			t_name="";//jyb初始化
//jyb  --end---
			int colume = 0;
			for (int j = 0; j < items.size(); ++j) {
				colume = j;
				ImportItem item = (ImportItem) items.get(j);
				HSSFCell cell = row.createCell(j);
//jyb ---start---
				//获得身份证列号
				String cz = item.getColume();
				if(cz!=null&&cz.endsWith("dentify")&&(col==-1)){
					col=j;
				}
				//获得姓名列号
				if(cz!=null&&cz.endsWith("ame")&&(ncol==-1)){
					ncol=j;
				}
//jyb  --end---
				cell.setCellValue(item.getName());
				cell.setCellStyle(cs);
			}
			for (int j = 0; j < itemSources.size(); ++j) {
				ImportItem item = (ImportItem) itemSources.get(j);
				HSSFCell cell = row.createCell(j + colume + 3);
				cell.setCellValue(item.getName());
				cell.setCellStyle(cs);
			}

			for (int j = 0; j < results.size(); ++j) {
				colume = j;
				HashMap result = (HashMap) results.get(j);
				HashMap resultSource = (HashMap) source.get(j);
				row = sheet.createRow(j + 1);

				colume = 0;
				for (int k = 0; k < items.size(); ++k) {
					colume = k;
					ImportItem item = (ImportItem) items.get(k);
					HSSFCell cell = row.createCell(k);
					String value = (String) result
							.get(item.getColume());
					if (value == null) {
						value = "";
					}
					//jyb ---start---
					//获得姓名数据
					if(k==ncol){
						t_name=value;
					}
					//获得身份证数据
					if(k==col){
						boolean b = false;
						for(Map<String, String> map : resulte){
							String ide = map.get("identify");
							if(value.equals(ide)){
								map.put(id,"有");//修改数据
								b=true;
								break;
							}
						}
						if(!b){
							Map<String, String> t_mapz = new LinkedHashMap<String, String>();
							t_mapz.put("name",t_name);
							t_mapz.put("identify",value);
							for (int t = 0; t < idChecks.length; ++t) {
								String t_id = idChecks[t];
								if(t_id.equals(id))
									t_mapz.put(""+t_id,"有");
								else
									t_mapz.put(""+t_id,"无");
							}
							resulte.add(t_mapz);
						}
					}
					//jyb  --end---
					cell.setCellValue(value);
					cell.setCellStyle(cs);
				}

				for (int k = 0; k < itemSources.size(); ++k) {
					ImportItem item = (ImportItem) itemSources.get(k);
					HSSFCell cell = row.createCell(k + colume + 3);
					String value = (String) resultSource.get(item
							.getColume());
					if (value == null) {
						value = "";
					}
					cell.setCellValue(value);
					cell.setCellStyle(cs);
				}
			}
		}
	}
//jyb  -----start----\

HSSFSheet sheetfoot = wb.createSheet("统计("
		+ date + ")");
int r=0;
for(Map<String, String> map : resulte){
	HSSFRow row = sheetfoot.createRow(r);
	int c=0;
	for (Map.Entry<String, String> entry : map.entrySet()) {
		HSSFCell cell = row.createCell(c);
		cell.setCellValue(entry.getValue());
		cell.setCellStyle(cs);
		c++;
	}
	r++;
}
//jyb   ------end ------
	OutputStream os = null;
	try {
		os = response.getOutputStream();
		wb.write(os);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		os.close();
		out.clear();
		out = pageContext.pushBody();
	}
%>
