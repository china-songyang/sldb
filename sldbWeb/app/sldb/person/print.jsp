<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.saturn.sldb.Person" %>
<%
	String id=request.getParameter("id");
	Person person=new Person();
	if(id!=null&&!id.trim().equals("")){
		person=Person.get(id);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>双辽市临时应急救助申请审批表</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "宋体";
	font-size: 18px;
}
.STYLE4 {font-family: "宋体"; font-size: 12px; }
-->
</style>
<script> 
var hkey_root,hkey_path,hkey_key 
hkey_root="HKEY_CURRENT_USER" 
hkey_path="file://software//Microsoft//Internet Explorer\\PageSetup\\" 
//设置网页打印的页眉页脚为空 
function pagesetup_null(){ 
try{ 
var RegWsh = new ActiveXObject("WScript.Shell"); 
hkey_key="header";
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,""); 
hkey_key="footer";
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,""); 
}catch(e){} 
} 
//设置网页打印的页眉页脚为默认值 
function pagesetup_default(){ 
try{ 
var RegWsh = new ActiveXObject("WScript.Shell");
hkey_key="header" ;
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&w&b页码，&p/&P"); 
hkey_key="footer" ;
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&u&b&d"); 
}catch(e){} 
} 
function setdivhidden(id){//把指定id以外的层统统隐藏 
document.getElementById("div0").style.display="none"; 
}
function setdivvisible(id){//把指定id以外的层统统显示 
document.getElementsByTagName("div0").display="block"; 
} 
function printpr() //预览函数 
{ 
pagesetup_null();//预览之前去掉页眉，页脚 
setdivhidden("div1");//打印之前先隐藏不想打印输出的元素 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>'; 
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);//在body标签内加入html（WebBrowser activeX控件） 
WebBrowser1.ExecWB(7, 1);//打印预览 
WebBrowser1.outerHTML = "";//从代码中清除插入的html代码 
pagesetup_default();//预览结束后页眉页脚恢复默认值 
setdivvisible("div1");//预览结束后显示按钮 
} 
function print() //打印函数 
{ 
pagesetup_null();//打印之前去掉页眉，页脚 
setdivhidden("div1"); //打印之前先隐藏不想打印输出的元素 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>'; 
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);//在body标签内加入html（WebBrowser activeX控件） 
WebBrowser1.ExecWB(6, 1);//打印 
WebBrowser1.outerHTML = "";//从代码中清除插入的html代码 
pagesetup_default();//打印结束后页眉页脚恢复默认值 
setdivvisible("div1");//打印结束后显示按钮 
} 
</script> 
</head>

<body>
<div id="div1"> 
<table border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <col width="93" />
  <col width="72" span="3" />
  <col width="93" />
  <col width="72" span="2" />
  <col width="95" />
  <tr height="63">
    <td colspan="8" height="63" width="641"><div align="center" class="STYLE1">双辽市临时应急救助申请审批表</div></td>
  </tr>
  <tr height="46">
    <td height="46"><div align="center"><span class="STYLE4">申请人姓名</span></div></td>
    <td><div align="center"><span class="STYLE4"><%=person.getName() %></span></div></td>
    <td><div align="center"><span class="STYLE4">性别</span></div></td>
    <td><div align="center"><span class="STYLE4"><%=person.getGender() %></span></div></td>
    <td><div align="center"><span class="STYLE4">身份证号码</span></div></td>
    <td colspan="2"><div align="center"><span class="STYLE4"><%=person.getIdentify()%></span></div></td>
    <td rowspan="3"><div align="center"><span class="STYLE4">照片</span></div></td>
  </tr>
  <tr height="46">
    <td height="46"><div align="center"><span class="STYLE4">户籍地址</span></div></td>
    <td colspan="3"><div align="center"><span class="STYLE4"><%=person.getAddress() %></span></div></td>
    <td><div align="center"><span class="STYLE4">户口类别</span></div></td>
    <td colspan="2"><div align="center"><span class="STYLE4"><%=person.getHukou()!=null?person.getHukou():"" %></span></div></td>
  </tr>
  <tr height="46">
    <td height="46"><div align="center"><span class="STYLE4">居住地址</span></div></td>
    <td colspan="6"><div align="center"><span class="STYLE4"></span></div></td>
  </tr>
  <tr height="46">
    <td height="46"><div align="center"><span class="STYLE4">家庭人口</span></div></td>
    <td><div align="center"><span class="STYLE4"><%=person.getHomeSum()!=null?person.getHomeSum():"" %></span></div></td>
    <td><div align="center"><span class="STYLE4">联系方式</span></div></td>
    <td colspan="2"><div align="center"><span class="STYLE4"><%=person.getContact()!=null?person.getContact():"" %></span></div></td>
    <td><div align="center"><span class="STYLE4">保障类别</span></div></td>
    <td colspan="2"><div align="center"><span class="STYLE4"></span></div></td>
  </tr>
  <tr height="45">
    <td colspan="8" height="45"><div align="center"><span class="STYLE4">家庭基本情况及申请理由</span></div></td>
  </tr>
  <tr height="311">
    <td colspan="8" height="311"><div align="center"><span class="STYLE4">　</span></div></td>
  </tr>
  <tr height="37">
    <td colspan="8" height="37"><div align="center"><span class="STYLE4">审批金额及审批意见</span></div></td>
  </tr>
  <tr height="235">
    <td colspan="8" height="235" width="641"><div align="center"><span class="STYLE4">审批意见：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审批金额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（元）<br />
        <br />
      审批人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
      <br />
      （公章）：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp; 日</span></div></td>
  </tr>
</table>
</div>
<div id="div0"> 
<input type="button" onclick="printpr();"  value="打印预览"> 
<input type="button" onClick="print();" value="打印"> 
</div> 
</body>
</html>
