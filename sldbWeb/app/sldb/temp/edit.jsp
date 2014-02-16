<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改临时救助信息</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		$('#editForm').submit();
	}
	
	function confirm() {
		$.messager.confirm('确认申报项', '确认申报该选项', function(result){
			if (result){
				window.location.href='<%=request.getContextPath()%>/app/sldb/person/confirm.action?ids=${person.id}';
			}
		});
		return false;
	}
	
	$(function() {
		$('#name').focus();
		
		$('#type').combobox({
			value : '${temp.type}',
			onHidePanel : function() {
				$("#combo_type").focus();
			},
			width : 256
		});
		
		$('#sex').combobox({
			value : '${temp.sex}',
			onHidePanel : function() {
				$("#combo_sex").focus();
			},
			width : 256
		});
		
		$('#nodeType').combobox({
			value : '${temp.nodeType}',
			onHidePanel : function() {
				$("#nodeType").focus();
			},
			width : 256
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改临时救助信息"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/sldb/temp/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>保障类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.tmp.type" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_typeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>申请人姓名:</td>
					<td><input id="name" name="name" type="text" value="${temp.name }"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>性别:</td>
					<td><select id="sex" class="easyui-combobox"
								name="sex" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=gender" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_sexTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>身份证号:</td>
					<td><input id="identify" name="identify" type="text" value="${temp.identify }"></input></td>
					<td><div id="identifyTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>户籍地址:</td>
					<td><input id="permanent" name="permanent" type="text" value="${temp.permanent }"></input></td>
					<td><div id="permanentTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>户口类型:</td>
					<td><select id="nodeType" class="easyui-combobox"
								name="nodeType" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.hukou" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_nodeTypeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>家庭人口:</td>
					<td><input id="home" name="home" type="text" value="${temp.home }"></input></td>
					<td><div id="homeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>联系方式:</td>
					<td><input id="contact" name="contact" type="text" value="${temp.contact }"></input></td>
					<td><div id="contactTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>居住地址:</td>
					<td><input id="address" name="address" type="text" value="${temp.address }"></input></td>
					<td><div id="addressTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>家庭基本情况及申请理由:</td>
					<td><textarea id="cause" name="cause" style="width:250px;height:50px;">${temp.cause }</textarea></td>
					<td><div id="causeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>审批人:</td>
					<td><input id="audit" name="audit" type="text" value="${temp.audit }"></input></td>
					<td><div id="auditTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>审批金额:</td>
					<td><input id="money" name="money" type="text" value="${temp.money }"></input></td>
					<td><div id="moneyTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>创建者:</td>
					<td><input id="createrName" name="createrName" type="text" readonly="readonly" value="${temp.createrName }"></input></td>
					<td><div id="createrNameTip"></div></td>
				</tr>	
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>创建部门:</td>
					<td><input id="createrDepartment" name="createrDepartment" type="text" readonly="readonly" value="${temp.createrDepartment }"></input></td>
					<td><div id="createrDepartmentTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" class="easyui-linkbutton" iconCls="icon-edit"
								onclick="edit()">确定</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a> 
						</div>
					</td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden" value="${temp.id}"></input>
			<input id="files" name="files" type="hidden" value="${temp.files}"></input>
			<input id="createTime" name="createTime" type="hidden" value="${temp.createTime}"></input>
			<input id="createrDepartment" name="createrDepartment"  type="hidden" value="${temp.createrDepartment}"></input>
			<input id="creater" name="creater" type="hidden" value="${temp.creater}"></input>
			<input id="state" name="state" type="hidden" value="${temp.state}"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});

		$("#name").formValidator({
			onfocus : "户主姓名不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#race").formValidator({
			onfocus : "名称不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#comany").formValidator({
			onfocus : "不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#contact").formValidator({
			onfocus : "不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#street").formValidator({
			onfocus : "不能为空,不超过100个字符！"
		}).inputValidator({
			min : 1,
			max : 100,
			onerror : "不超过100字符"
		});
		
		$("#company").formValidator({
			onfocus : "不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#homeSum").formValidator({
			onfocus : "不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#address").formValidator({
			onfocus : "不能为空,不超过300个字符！"
		}).inputValidator({
			min : 1,
			max : 300,
			onerror : "不超过300字符"
		});
		
		$("#desc").formValidator({
			onfocus : "不能为空,不超过400个字符！"
		}).inputValidator({
			min : 0,
			max : 400,
			onerror : "不超过400字符"
		});
		
		$("#identify").formValidator({
			onfocus : "身份证不能为空,不超过18个字符！"
		}).regexValidator({
			regexp : "idcard"
		}).inputValidator({
			min : 1,
			max : 18,
			onerror : "宽度不超过18字符"
		});
		
		$.data($("#gender")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_gender');
		$("#combo_gender").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#hukou")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_hukou');
		$("#combo_hukou").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#home")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_home');
		$("#combo_home").formValidator({
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#marry")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_marry');
		$("#combo_marry").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#workable")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_workable');
		$("#combo_workable").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#idType")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_idType');
		$("#combo_idType").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#first")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_first');
		$("#combo_first").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#ill")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_ill');
		$("#combo_ill").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#deformity")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_deformity');
		$("#combo_deformity").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#deformityLevel")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_deformityLevel');
		$("#combo_deformityLevel").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#companyType")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_companyType');
		$("#combo_companyType").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#trade")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_trade');
		$("#combo_trade").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#insurance")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_insurance');
		$("#combo_insurance").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
	});
</script>
</html>