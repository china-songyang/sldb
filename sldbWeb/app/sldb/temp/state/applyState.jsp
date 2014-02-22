<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>已申报临时救助信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '已申报临时救助对象信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/temp/listApply.action',
				queryParams : {
					state : '待审核'
				},
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}, {
					field : 'id',
					title : '标识',
					width : 40,
					sortable : true
				} ] ],
				columns : [ [{
					field : 'type',
					title : '保障类型',
					width : 100,
					sortable : true
				},{
					field : 'name',
					title : '申请人姓名',
					width : 80,
					sortable : true
				},{
					field : 'name',
					title : '户主姓名',
					width : 100,
					sortable : true
				}, {
					field : 'identify',
					title : '身份证号',
					width : 130,
					sortable : true
				}, {
					field : 'sex',
					title : '性别',
					width : 50,
					sortable : true
				}, {
					field : 'nodeType',
					title : '类型',
					width : 50,
					sortable : true
				}, {
					field : 'audit',
					title : '审批人',
					width : 70,
					sortable : true
				}, {
					field : 'money',
					title : '审批金额',
					width : 70,
					sortable : true
				}, {
					field : 'createrName',
					title : '申报人',
					width : 70,
					sortable : true
				}, {
					field : 'createrDepartment',
					title : '申报单位',
					width : 120,
					sortable : true
				},  {
					field : 'state',
					title : '状态',
					width : 60,
					sortable : true
				},{
					field : 'createTime',
					title : '创建时间',
					width : 130,
					sortable : true
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [{
					id : 'btnadd',
					text : '家庭成员',
					iconCls : 'icon-author',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择户主','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/queryPerson.action?id='+rows[0].id; 
						//查询户主信息
						return false;//解决IE6的不跳转的bug
					}
				},
				{
					id : 'btnadd',
					text : '查看家庭信息',
					iconCls : 'icon-query-form',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择户主','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/queryPersonTab.action?id='+rows[0].id + '&type=1'; 
						//带参数传入下一个jsp页面
						return false;//解决IE6的不跳转的bug
					}
				}]
			});
			
			$('#gender').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					state : '创建',
					identify : $('#identify').val(),
					gender : $('#gender').combobox('getValue'),
					name : $('#name').val()
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<td>姓名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td>身份证:</td>
					<td><input id="identify" name="identify" type="text"></input></td>
					<td>性别:</td>
					<td><select id="gender" class="easyui-combobox"
								name="gender" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=gender" valueField="id"
								textField="text" editable="false"></select></td>
				</tr>
			</table>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-search">确定</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>