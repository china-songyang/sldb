<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>核对单位信息的统计</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '核对单位信息的统计',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/report/listReport.action',
				idField : 'type',//唯一标识列
				sortName : 'type',
				sortOrder : 'asc',
				remoteSort : true,
				frozenColumns : [ [ {
					field : 'type',
					title : '标识',
					width : 40,
					sortable : false
				} ] ],
				columns : [ [ {
					field : 'name',
					title : '核对信息名称',
					width : 120,
					sortable : false
				}, {
					field : 'importDate',
					title : '最新导入时间',
					width : 120,
					sortable : false
				},{
					field : 'sum',
					title : '最新导入信息数量',
					width : 120,
					sortable : false
				}, {
					field : 'totalCount',
					title : '导入次数',
					width : 100,
					sortable : false
				}, {
					field : 'totalSum',
					title : '目前总信息量',
					width : 100,
					sortable : false
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span>&nbsp&nbsp<a href="#" onclick="showVO(\'' + rec.type + '\');">详细</a></span>';}
						
				}] ],
				pagination : true,
				rownumbers : true
			});
			
		});
		function showVO(type) {
			window.location.href='<%=request.getContextPath()%>/app/sldb/report/totalDesc.jsp?type='+ type;
			return false;	
		}
	</script>
</head>
<body>
	<table id="queryTable"></table>
</body>
</html>




