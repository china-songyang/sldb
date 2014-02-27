<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.auth.User"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.auth.Organization"%>
<%@page import="java.util.List"%>
<%
User user = (User)session.getAttribute("authUser");
String userId = user.getId();

Organization organizationUser = Organization.getOneOrganizationByUser(userId);
String name = organizationUser.getName();
List organizations = Organization.getOrganizationByUser(user.getId());
String department = "";
if (organizations != null && !organizations.isEmpty()) {
	department = ((Organization)organizations.get(0)).getName();
}
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加申报低保信息</title>
</head>
<body>
	<form id="form1" runat="server" action="<%=request.getContextPath()%>/app/sldb/person/add.action" method="post">
		<input type="hidden" name="type" value="auto" />
		<input id="createTime" name="createTime" type="hidden" value="<%=DateUtils.getSystemTime()%>"></input>
			<input id="creater" name="creater" type="hidden" value="<%=user.getId()%>"></input>
			<input id="createrName" name="createrName" type="hidden" value="<%=user.getName()%>"></input>
			<input id="createrDepartment" name="createrDepartment"  type="hidden" value="<%=department%>"></input>
			<input id="state" name="state" type="hidden" value="创建"></input>
		<OBJECT classid="clsid:10946843-7507-44FE-ACE8-2B3483D179B7"
			id="CVR_IDCard" name="CVR_IDCard" width="0" height="0"> </OBJECT>

		<script language="javascript" type="text/javascript">
				function ClearForm() {
                      document.all['name'].value = ""; 
                      document.all['gender'].value = ""; 
                      document.all['race'].value = ""; 
                     // document.all['Born'].value = ""; 
                      document.all['address'].value = ""; 
                      document.all['identify'].value = ""; 
                      /* document.all['IssuedAt'].value = ""; 
                      document.all['EffectedDate'].value = ""; 
                      document.all['ExpiredDate'].value = ""; 
                      document.all['SAMID'].value = ""; 
                      document.all['pic'].src = ""; 
                      document.all['Picture'].value = "";  
                      document.all['PictureLen'].value = "";     */ 
                      return true;
				}
				function Button1_onclick() {
                   	var CVR_IDCard = document.getElementById("CVR_IDCard");					
					var strReadResult = CVR_IDCard.ReadCard();
					if(strReadResult == "0")
					{
						ClearForm();
					    document.all['name'].value = CVR_IDCard.Name;  
                        document.all['gender'].value = CVR_IDCard.Sex;    
                        document.all['race'].value = CVR_IDCard.Nation; 
                        //document.all['Born'].value = CVR_IDCard.Born;     
                        document.all['address'].value = CVR_IDCard.Address; 
                        document.all['identify'].value = CVR_IDCard.CardNo; 
                      /*   document.all['IssuedAt'].value = CVR_IDCard.IssuedAt;  
                        document.all['EffectedDate'].value = CVR_IDCard.EffectedDate;  
                        document.all['ExpiredDate'].value = CVR_IDCard.ExpiredDate;
                        document.all['SAMID'].value = CVR_IDCard.SAMID;
                        //document.all['pic'].src = CVR_IDCard.Pic;
                        document.all['pic'].src = "data:image/jpg;base64,"+CVR_IDCard.Picture;
                        document.all['Picture'].value = CVR_IDCard.Picture;  
                        document.all['PictureLen'].value = CVR_IDCard.PictureLen; */
                   }else{
                        ClearForm();
                        alert(strReadResult);
                   }
				}

		</script>
		<table
			style="width: 638px; height: 273px; border-top-style: groove; border-right-style: groove; border-left-style: groove; background-color: transparent; border-bottom-style: groove;">
			<tr>
				<td style="width: 98px">姓名：</td>
				<td style="text-align: left" colspan="3"><input id="Text1"
					type="text" style="width: 155px" name="name" />
				</td>
				<!-- <td style="width: 138px; text-align: left;" rowspan="3"><img
					src="" style="width: 91px; height: 108px" name="pic" />
				</td> -->
			</tr>
			<tr>
				<td style="width: 98px">性别：</td>
				<td style="width: 80px"><input id="Text2" type="text"
					name="gender" style="width: 154px" />
				</td>
				<td style="width: 58px">民族：</td>
				<td style="width: 59px"><input id="Text3" type="text"
					name="race" style="width: 94px" />
				</td>
			</tr>
			<!-- <tr>
				<td style="width: 98px">出生日期：</td>
				<td style="text-align: left;" colspan="3"><input id="Text4"
					type="text" style="width: 151px" name="Born" />
				</td>
			</tr> -->
			<tr>
				<td style="width: 98px">地址：</td>
				<td colspan="4" style="text-align: left"><input id="Text5"
					style="width: 505px" type="text" name="address" />
				</td>
			</tr>
			<tr>
				<td style="width: 98px">身份号码：</td>
				<td colspan="4" style="text-align: left"><input id="Text6"
					style="width: 506px" type="text" name="identify" />
				</td>
			</tr>
			<!-- <tr>
				<td style="width: 98px">签发机关：</td>
				<td colspan="4" style="text-align: left"><input id="Text7"
					style="width: 505px" type="text" name="IssuedAt" />
				</td>
			</tr>
			<tr>
				<td style="width: 98px">有效期限：</td>
				<td colspan="4" style="text-align: left"><input id="Text8"
					style="width: 163px" type="text" name="EffectedDate" />至<input
					id="Text10" style="width: 163px" type="text" name="ExpiredDate" />
				</td>
			</tr>
			<tr>
				<td style="width: 98px; text-align: left;">模块号码：</td>
				<td colspan="4" style="text-align: left"><input id="Text9"
					style="width: 506px" type="text" name="SAMID" />
				</td>
			</tr>
			<tr>
				<td style="width: 98px; text-align: left; height: 136px;">
					照片编码：</td>
				<td colspan="4" style="text-align: left; height: 136px;"><textarea
						id="TextArea1" name="Picture" style="width: 509px; height: 115px"></textarea>
				</td>
			</tr>
			<tr>
				<td style="width: 98px; text-align: left">编码长度：</td>
				<td colspan="4" style="text-align: left"><input id="Text11"
					style="width: 508px" type="text" name="PictureLen" />
				</td>
			</tr> -->
		</table>
		<!-- <img src="data:image/jpg;base64,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" >
		 -->
		<input id="Button1" type="button" value="读   卡"
			onclick="Button1_onclick()" />
		<input type="submit" value="提交"/>
		<input id="Button2" type="button" value="清空"
			onclick="ClearForm()" />
	</form>
	
</body>
</html>