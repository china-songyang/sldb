package com.saturn.action.sldb.report;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.Import;

public class InsuranceReportAction implements IAction{
	
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		List columnDataX = new ArrayList();
		List columnDataY = new ArrayList();
		JSONArray jb = new JSONArray();
		JSONArray name = new JSONArray();
		
		String[] str = {"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"};
		//2011
		Import imp = new Import();
		imp.setImportDate("2011");
		imp.setType("10");
		List<Import> list = Import.findByType(imp.getImportDate(),imp.getType());

		int[] it = {0,0,0,0,0,0,0,0,0,0,0,0};
 		for(Import im : list) {
			int dt = Integer.parseInt(im.getImportDate().substring(5,7));
			int sum = Integer.parseInt(im.getSum());
			it[dt-1] = it[dt-1] + sum;
		}
 		
 		int length = it.length;
 		StringBuffer buf = new StringBuffer();
 		List listz = new ArrayList();
 		for(int i=0; i<length; i++) {
 			listz.add(it[i]);
 		}
 		
 		columnDataX=Arrays.asList(str); 
 		
		//2012
		imp.setImportDate("2012");
		imp.setType("10");
		List<Import> list2012 = Import.findByType(imp.getImportDate(),imp.getType());
		
		int[] it2012 = {0,0,0,0,0,0,0,0,0,0,0,0};
 		for(Import im : list2012) {
			int dt = Integer.parseInt(im.getImportDate().substring(5,7));
			int sum = Integer.parseInt(im.getSum());
			it2012[dt-1] = it2012[dt-1] + sum;
		}
 		
 		int length2012 = it2012.length;
 		StringBuffer buf2012 = new StringBuffer();
 		List listit2012 = new ArrayList();
 		for(int i=0; i<length; i++) {
 			listit2012.add(it2012[i]);
 		}
 		
 		columnDataX=Arrays.asList(str); 
 		
 		//2013
 		imp.setImportDate("2013");
 		imp.setType("10");
 		List<Import> list2013 = Import.findByType(imp.getImportDate(),imp.getType());
 		
 		int[] it2013 = {0,0,0,0,0,0,0,0,0,0,0,0};
 		for(Import im : list2013) {
 			int dt = Integer.parseInt(im.getImportDate().substring(5,7));
 			int sum = Integer.parseInt(im.getSum());
 			it2013[dt-1] = it2013[dt-1] + sum;
 		}
 		
 		int length2013 = it2013.length;
 		StringBuffer buf2013 = new StringBuffer();
 		List listit2013 = new ArrayList();
 		for(int i=0; i<length; i++) {
 			listit2013.add(it2013[i]);
 		}
 		
 		columnDataX=Arrays.asList(str); 
		 
 		
 		//2011
 		Map map = new HashMap();
 		map.put("name", "2011");
 		map.put("data", new JSONArray(listz));
 		
 		JSONObject job = new JSONObject(map);
 		
 		//2012
 		Map map1 = new HashMap();
 		map1.put("name", "2012");
 		map1.put("data", new JSONArray(listit2012));
 		
 		JSONObject job1 = new JSONObject(map1);
 		
 		//2013
 		Map map2 = new HashMap();
 		map2.put("name", "2013");
 		map2.put("data", new JSONArray(listit2013));
 		
 		JSONObject job2 = new JSONObject(map2);
 		
 		//2011
 		columnDataY.add(job);
 		//2012
 		columnDataY.add(job1);
 		//2013
 		columnDataY.add(job2);
 		
 		
 		jb = new JSONArray(columnDataX);
 		name = new JSONArray( columnDataY);
 		
 		Map mapz = new HashMap();
 		mapz.put("data", name.toString());
 		mapz.put("name", jb.toString());
 		JSONObject jsob = new JSONObject(mapz);
		return new JsonView(jsob.toString());
	}
	@Override
	public String requestMapping() {
		return "/app/sldb/report/insuranceReport.action";
	}
}
