package com.saturn.sldb;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class TempSub {
	private String pid;
	private String id;
	private String identify;
	private String type;
	private String name;
	private String sex;
	private String permanent;
	private String nodeType;
	private String home;
	private String contact;
	private String address;
	
	private String createTime;
	private String creater;
	private String createrName;
	private String createrDepartment;
	private String state;
	private String inputType;
	private String personRelation;
	private String pname;
	
	/*private String userId;*/

	private static ORMapping<TempSub> mapping = new ResultORMapping<TempSub>();
	private static Map<String, String> stateMap = new HashMap<String, String>();

	static {
		stateMap.put("创建", "审核");
		stateMap.put("审核", "核对");
		stateMap.put("核对", "初审");
		stateMap.put("初审", "抽查");
		stateMap.put("抽查", "决议");
		stateMap.put("决议", "通过");
	}

	public static int add(TempSub vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate
				.update("INSERT INTO sldb_tmp_sub("
						+ "pid,identify, type, name, "
						+ "sex, permanent, nodeType, "
						+ "home, contact, address,"
						+ "createTime, creater, "
						+ "createrName, state, createrDepartment, "
						+ "inputType, personRelation, pname) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						vo.pid, vo.identify, vo.type, vo.name, vo.sex,
						vo.permanent, vo.nodeType, vo.home, vo.contact,
						vo.address, vo.createTime, vo.creater, vo.createrName,
						vo.state, vo.createrDepartment, vo.inputType,
						vo.personRelation, vo.pname);
	}

	public static int edit(TempSub vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update("UPDATE sldb_tmp_sub SET "
				+ "pid,identify = ?, type = ?, name = ?, "
				+ "sex = ?, permanent = ?, nodeType = ?, "
				+ "home = ?, contact = ?, address = ?, "
				+ " createTime = ?, creater = ?, "
				+ "createrName = ?, state = ?, createrDepartment = ?, "
				+ "inputType = ?, personRelation = ?, pname = ? "
				+ "WHERE id = ?", vo.pid, vo.identify, vo.type, vo.name,
				vo.sex, vo.permanent, vo.nodeType, vo.home, vo.contact,
				vo.address, vo.createTime, vo.creater, vo.createrName,
				vo.state, vo.createrDepartment, vo.inputType,
				vo.personRelation, vo.pname, vo.id);
	}

	public static TempSub get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_tmp_sub WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, TempSub.class);
	}

	public static TempSub getIdWithTime(String createTime) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT id FROM sldb_TempSub WHERE 1 = 1 and createTime = '"+ createTime +"'",
				null, mapping, TempSub.class);
	}
	
	public static ListData<TempSub> getAll(TempSub vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_tmp_sub WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo,
						"identify", "name", "sex", "type", "createrDepartment",
						"createTime","state", "creater", "inputType")
						.addCondition("ORDER BY {0} {1}", orderBy,
						order), mapping, TempSub.class, start, offset);
	}

	public static ListData<TempSub> getAllWithOutCreater(TempSub vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_tmp_sub WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "state",
						"identify", "name", "sex", "createrName",
						"createTime")
						.addCondition("ORDER BY {0} {1}", orderBy,
						order), mapping, TempSub.class, start, offset);
	}
	
	public static ListData<TempSub> getAllByPid(TempSub vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_tmp_sub WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "state",
						"identify", "name", "sex", "createrName",
						"createTime").addCondition("and pid = '?' ", vo.getPid()).addCondition("ORDER BY {0} {1}", orderBy,
						order), mapping, TempSub.class, start, offset);
	}
	
	public static ListData<TempSub> getAllWithoutCreater(TempSub vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_TempSub WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "state",
						"identify", "name", "gender", "createrName",
						"createTime")
						.addCondition("ORDER BY {0} {1}", orderBy,
						order), mapping, TempSub.class, start, offset);
	}
	/*
	public static int confirm(final String id, final String userId,
			final String note, final String department) {
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				
				User user = User.get(userId);
				TempSub TempSub = TempSub.get(id);

				String nextState = stateMap.get(TempSub.getState());
				
				TempSubState TempSubState = new TempSubState(null, id, userId,
						user.getName(), DateUtils.getSystemTime(), TempSub
								.getName(), TempSub.getIdentify(), nextState,
						note, department);

				state(connection, id, nextState);
				TempSubState.add(connection, TempSubState);

				return 1;
			}
		});
	}
	
	public static int confirm(final String[] ids, final String userId,
			final String note, final String department) {
		for (String id : ids) {
			confirm(id, userId, note, department);
		}

		return 1;
	}*/

/*	public static int refuse(final String id, final String userId,
			final String note, final String department) {
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {

				User user = User.get(userId);
				TempSub TempSub = TempSub.get(id);

				String nextState = "驳回";

				TempSubState TempSubState = new TempSubState(null, id, userId,
						user.getName(), DateUtils.getSystemTime(), TempSub
								.getName(), TempSub.getIdentify(), nextState,
						note, department);

				state(connection, id, nextState);
				TempSubState.addRefuse(connection, TempSubState);

				return 1;
			}
		});
	}*/

	/*public static int refuse(final String[] ids, final String userId,
			final String note) {
		
		Organization organization = Organization.getOneOrganizationByUser(userId);
		String department = organization.getName();
		
		for (String id : ids) {
			refuse(id, userId, note, department);
		}

		return 1;
	}*/

	public static int replay(String id, String state) {
		return SimpleDaoTemplate.update(
				"UPDATE sldb_TempSub SET state = ? where id = ?", state,id);
	}
	
	private static int state(Connection connection, String id, String state) {
		return SimpleDaoTemplate.update(connection,
				"UPDATE sldb_TempSub SET state = ? WHERE id = ?", state, id);
	}

	public static  int UpdateState(String id, String state) {
		return SimpleDaoTemplate.update(
				"UPDATE sldb_TempSub SET state = ? WHERE id = ?", state, id);
	}
	
	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM sldb_tmp_sub WHERE id = ?",
				id);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

/*	public static ListData<TempSub> getAllOld(TempSub vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate
				.query("select distinct (s.pid), p.* from  sldb_TempSub p ,sldb_TempSub_state s where 1 = 1 and p.id = s.pid",
						new DymaticCondition().addCondition(
								"and userId = '?' ", vo.getUserId()), mapping,
						TempSub.class, start, offset);
	}
*/
	public static ListData<TempSub> getAllOldWithOutUserId(TempSub vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate
				.query("select distinct (s.pid), p.* from  sldb_TempSub p ,sldb_TempSub_state s where 1 = 1 and p.id = s.pid",
						new DymaticCondition(), mapping,
						TempSub.class, start, offset);
	}

	public TempSub(String id, String pid, String identify, String type,
			String name, String sex, String permanent, String nodeType,
			String home, String contact, String address, String createTime,
			String creater, String createrName, String state,
			String createrDepartment, String inputType, String personRelation, String pname) {
		super();
		this.id = id;
		this.pid = pid;
		this.identify = identify;
		this.type = type;
		this.name = name;
		this.sex = sex;
		this.permanent = permanent;
		this.nodeType = nodeType;
		this.home = home;
		this.contact = contact;
		this.address = address;
		this.createTime = createTime;
		this.creater = creater;
		this.createrName = createrName;
		this.state = state;
		this.createrDepartment = createrDepartment;
		this.inputType = inputType;
		this.personRelation = personRelation;
		this.pname = pname;
	}

	public TempSub() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPermanent() {
		return permanent;
	}

	public void setPermanent(String permanent) {
		this.permanent = permanent;
	}

	public String getNodeType() {
		return nodeType;
	}

	public void setNodeType(String nodeType) {
		this.nodeType = nodeType;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCreaterName() {
		return createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	
	public String getCreaterDepartment() {
		return createrDepartment;
	}

	public void setCreaterDepartment(String createrDepartment) {
		this.createrDepartment = createrDepartment;
	}


/*	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return userId;
	}*/
	
	public String getInputType() {
		return inputType;
	}

	public void setInputType(String inputType) {
		this.inputType = inputType;
	}

	
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	
	public String getPersonRelation() {
		return personRelation;
	}

	public void setPersonRelation(String personRelation) {
		this.personRelation = personRelation;
	}

	
	

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
