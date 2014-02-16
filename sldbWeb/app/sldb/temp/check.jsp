<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>临时救助信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '临时救助信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/temp/listTemp.action',
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
				columns : [ [ {
					field : 'createrDepartment',
					title : '申报部门',
					width : 100,
					sortable : true
				},{
					field : 'type',
					title : '保障类型',
					width : 100,
					sortable : true
				},{
					field : 'name',
					title : '申请人姓名',
					width : 100,
					sortable : true
				}, {
					field : 'sex',
					title : '性别',
					width : 50,
					sortable : true
				}, {
					field : 'identify',
					title : '身份证',
					width : 130,
					sortable : true
				}, {
					field : 'nodeType',
					title : '户口类型',
					width : 80,
					sortable : true
				}, {
					field : 'audit',
					title : '审批人',
					width : 80,
					sortable : true
				}, {
					field : 'money',
					title : '审批金额',
					width : 70,
					sortable : true
				},{
					field : 'state',
					title : '状态',
					width : 70,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 150,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="confirmVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/ok.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="14" height="14" border="0" /></a>' +
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a>' +
						'</span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btnItem',
					text : '完成',
					iconCls : 'icon-redo',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择修改项','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						confirmVO(rows[0].id);
					}
				},'-', {
					id : 'btnItem',
					text : '驳回',
					iconCls : 'icon-undo',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择修改项','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						refuseVO(rows[0].id);
					}
				},
				{
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
					identify : $('#identify').val(),
					sex : $('#sex').combobox('getValue'),
					name : $('#name').val(),
					createrDepartment:$('#createrDepartment').val(),
					type:$('#type').combobox('getValue'),
					createTime:$('#createTime').combobox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/person/delete.action?ids=' + id;
				}
			});
			return false;
		}
		
		function confirmVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/temp/endTemp.action?id='+id+'&type=3';
			return false;
		}
		function refuseVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/temp/refuse.jsp?id='+id;
			return false;
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<td>申报部门:</td>
					<td><input id="createrDepartment" name="createrDepartment" type="text"></input></td>
					<td>保障类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.tmp.type" valueField="id"
								textField="text" editable="false"></select></td>
					<td>临时救助人姓名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					
				</tr>
				<tr>	
					<td>身份证:</td>
					<td><input id="identify" name="identify" type="text"></input></td>
					<td>性别:</td>
					<td><select id="sex" class="easyui-combobox"
								name="sex" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=gender" valueField="id"
								textField="text" editable="false"></select></td>
					<td>申请时间:</td>
					<td><input id="createTime" name="createTime" class="easyui-datebox" type="text"></input></td>
					
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