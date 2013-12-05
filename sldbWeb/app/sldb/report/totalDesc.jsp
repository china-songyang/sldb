<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.auth.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=UTF-8">

	<title>详细信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/app/js/kindEditor/css/default.css" />
	<script src="<%=request.getContextPath()%>/app/js/kindEditor/kindeditor.js"></script>
	<script src="<%=request.getContextPath()%>/app/js/kindEditor/lang/zh_CN.js"></script>
	<script src="<%=request.getContextPath()%>/app/js/kindEditor/plugins/filemanager/filemanager.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '详细信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/import/listdesc.action',
				queryParams : {
					type : '<%=request.getParameter("type")%>'
				},
				idField : 'id',//唯一标识列
				sortName : 'createTime',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {
					field : 'id',
					title : '标识',
					width : 140,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'name',
					title : '导入文件名',
					width : 150,
					sortable : true
				}, {
					field : 'typeName',
					title : '类型',
					width : 100,
					sortable : true
				}, {
					field : 'createrName',
					title : '导入单位',
					width : 70,
					sortable : true
				}, {
					field : 'sum',
					title : '导入总数',
					width : 70,
					sortable : true
				}, {
					field : 'importDate',
					title : '导入月份',
					width : 70,
					sortable : true
				}, {
					field : 'createTime',
					title : '导入时间',
					width : 130,
					sortable : true
				} ] ],
				pagination : true,
				rownumbers : true,
				showFooter : true,
				toolbar : [ {
					id : 'btnexcel',
					text : '导出',
					iconCls : 'icon-redo',
					handler : function() {
						excelVO();
						return false;//解决IE6的不跳转的bug
					}
				},'-',{
					id : 'btnback',
					text : '返回',
					iconCls : 'icon-back',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/sldb/report/total.jsp';
						return false;//解决IE6的不跳转的bug
					}
				}]
			});
		});
		
		function excelVO() {
			$('#queryForm').attr('action','<%=request.getContextPath()%>/app/sldb/report/excelReport.action');
			$('#queryForm').submit();
		}
	</script>
</head>
<body>
		<form id="queryForm" method="post">
			<input id="type" name="type" type="hidden" value="<%=request.getParameter("type")%>"></input>
		</form>
	<table id="queryTable"></table>
</body>
</html>




