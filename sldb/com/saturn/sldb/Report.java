package com.saturn.sldb;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.LogManager;

public class Report {
	
	private String id;
	private String name;
	private String type;
	private String sum;
	private String importDate;
	
	private static Logger Logger = LogManager.getLogger(LogManager.LOG_KEY_APP);
	
	private static ORMapping<Report> mapping = new ResultORMapping<Report>();
	private static ORMapping<HashMap> mmapping = new ResultORMapping<HashMap>(){

		@SuppressWarnings("unchecked")//hashmap的类型检查
		@Override
		public void mappingResult(ResultSet rs, HashMap t) throws SQLException {
			try {
				ResultSetMetaData metaData = rs.getMetaData();
				
				if (metaData != null) {
					int size = metaData.getColumnCount();
					for (int i = 1; i <= size; ++i) {
						String name = metaData.getColumnName(i);
						
						try {
							String value = rs.getString(name);
							t.put(name, value);
						} catch (Exception e) {
							Logger.debug(e);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			Logger.debug("Result Mapping Object[" + t.getClass().getSimpleName() + "]:" + t);
		}
	};

	public static ListData getAll(Report vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		/*return SimpleDaoTemplate.query("select a.id,b.name,a.type,a.importDate,a.sum from sldb_import a,sldb_import_info b where a.type=b.id order by a.type,a.id",
				new DymaticCondition(),
				mapping, Report.class, start, offset);*/
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		List<HashMap> list = SimpleDaoTemplate.query("select a.id,b.name,a.type,a.importDate,a.sum from sldb_import a,sldb_import_info b where a.type=b.id order by a.type+0,a.id",
				null,
				mmapping, HashMap.class);
		Iterator it = null;
		for(it = list.iterator();it.hasNext();){
			HashMap rp = (HashMap)it.next();
			String newType = ""+rp.get("type");
			String newName = ""+rp.get("name");
			String newImportDate = ""+rp.get("importDate");
			String sum = ""+rp.get("sum");
			
			boolean b = false;
			for(Map<String, String> map : result){
				String type = map.get("type");
				if(type.equals(newType)){
					//对比导入时间
					String importDate = map.get("importDate");
					if(getOneBeforeTwo(importDate,newImportDate)){
						map.put("importDate",newImportDate);
						map.put("sum",sum);
					}
					//累加
					map.put("totalSum",""+(Long.parseLong(map.get("totalSum"))+Long.parseLong(sum)));//修改数据
					map.put("totalCount",""+(Long.parseLong(map.get("totalCount"))+1));//修改数据
					b=true;
					break;
				}
			}
			if(!b){
				Map<String, String> t_mapz = new HashMap<String, String>();
				t_mapz.put("type",newType);
				t_mapz.put("name",newName);
				t_mapz.put("importDate",newImportDate);
				t_mapz.put("sum",sum);
				t_mapz.put("totalSum",sum);
				t_mapz.put("totalCount","1");
				result.add(t_mapz);
			}
		}
		
		//编辑json(分页后当前数据)
		List<String> resultList = new ArrayList<String>();
		int i = 0;
		System.out.println(start);
		int startz = Integer.parseInt(start);
		int offsetz = Integer.parseInt(offset);
		for(Map mz : result){
			if(i>=startz&&i<(startz+offsetz)){
				String jo = new JSONObject(mz).toString();
				resultList.add(jo);
			}
			i++;
		}
		
		return new ListData(result.size(), resultList);
	}
	/*
	public static List<Map<String, String>> getAll() {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		List<HashMap> list = SimpleDaoTemplate.query("select a.id,b.name,a.type,a.importDate,a.sum from sldb_import a,sldb_import_info b where a.type=b.id order by a.type,a.id",
				null,
				mmapping, HashMap.class);
	
		//转成list
		List<Map<String, String>> returnList = new ArrayList<Map<String, String>>();
        for (Map<String, String> map : list) {
            Map<String, String> tempMap = new HashMap<String, String>();
            tempMap.put("id", ""+map.get("id"));
            tempMap.put("name", ""+map.get("name"));
            tempMap.put("type", ""+map.get("type"));
            returnList.add(tempMap);
        }
		return returnList;
	}*/
	
	private static boolean getOneBeforeTwo(String oneDate, String twoDate) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
			Date oneD = null;
			Date twoD = null;
			try {
				oneD = format.parse(oneDate);
				twoD = format.parse(twoDate);
				return oneD.before(twoD);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		return false;
	}
	
	public Report() {
		super();
	}


	public Report(String id, String name, String type, String sum,
			String importDate) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.sum = sum;
		this.importDate = importDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public String getImportDate() {
		return importDate;
	}

	public void setImportDate(String importDate) {
		this.importDate = importDate;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
	
	//以下为测试
	//比较复杂的一种遍历在这里，呵呵~~他很暴力哦，它的灵活性太强了，想得到什么就能得到什么~~
	/*public static void workByEntry(Map<String, String> map) {
		Set<Map.Entry<String, String>> set = map.entrySet();
        for (Iterator<Map.Entry<String, String>> it = set.iterator(); it.hasNext();) {
            Map.Entry<String, String> entry = (Map.Entry<String, String>) it.next();
            System.out.println(entry.getKey() + "--->" + entry.getValue());
        }
    }*/

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println(Balance.getReserveByVin("LVHRD584045008987"));
		//List<Map<String, String>> list = Report.getAll();
		//for(Map<String, String> map : list)
		//Report.workByEntry(map);
		//System.out.println(Double.parseDouble("550")*(-1)+50);
	}
}
