<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Upload</title>

		<!--装载文件-->
		<link href="jquery/uploadify.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="jquery/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="jquery/swfobject.js"></script>
		<script type="text/javascript" src = "jquery/jquery.uploadify.v2.1.0.js"></script>
		<!--ready事件-->

	<script type="text/javascript">
		　$(document).ready(function() {
			　$("#uploadify").uploadify({
				　'uploader': 'uploadify.swf',  
				　//'script':'upload!doUpload.action?name=yangxiang',
				  'script': '<%=request.getContextPath()%>/app/system/upload/batchupload.do?dir=appCar&name=yangxiang',
				　//'script': 'servlet/Upload?name=yangxiang',  
				　'cancelImg': 'jquery/cancel.png',                  
				　'queueID' : 'fileQueue', //和存放队列的DIV的id一致  
				　//'fileDataName': 'fileupload', //必须，和以下input的name属性一致                   
				　'auto'  : false, //是否自动开始  
				　'multi': true, //是否支持多文件上传  
				  'buttonText': 'BROWSE', //按钮上的文字  
				　'simUploadLimit' : 1, //一次同步上传的文件数目  
				　'sizeLimit': 19871202, //设置单个文件大小限制，单位为byte  
				　'queueSizeLimit' : 10, //队列中同时存在的文件个数限制  
				　'fileDesc': '支持格式:jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的  
				　'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp',//允许的格式
				　'onComplete': function (event, queueID, fileObj, response, data) {
						//alert(event+"--"+queueID+"--"+fileObj+"--"+response+"--"+data);
						var jsonObj = eval("("+response+")");
						if(jsonObj.error==0) {
							alert("文件:" + fileObj.name + "上传成功");
						}else{
							alert("文件:" + fileObj.name + "上传失败!\n原因:" + jsonObj.message);
						}
				　},  
				　'onError': function(event, queueID, fileObj) {  
				　		alert("文件:" + fileObj.name + "上传失败");  
				　},  
				　'onCancel': function(event, queueID, fileObj){  
				　		alert("取消了" + fileObj.name);  
				　} 
			　});
		　});
</script>
	</head>

	<body>
		<input type="file" name="uploadify" id="uploadify" />
		<p>
			<a href="javascript:jQuery('#uploadify').uploadifyUpload()">开始上传</a>&nbsp;
			<a href="javascript:jQuery('#uploadify').uploadifyClearQueue()">取消所有上传</a>
		</p>
		<div id="fileQueue"></div>
	</body>

</html>
