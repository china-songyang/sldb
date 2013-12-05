<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>报表统计</title>
	<%@ include file="/app/includes/header.jsp"%>
	<!-- 报表 -->
	<script type="text/javascript">
		
	var chart;
	$(document).ready(function() {
		//chart = new Highcharts.Chart(
		var options = {
			chart: {
				renderTo: 'container',
				defaultSeriesType: 'column',
				/*郭云鹏  去掉背景颜色设置*/
//				 backgroundColor:{
//					linearGradient:[0,0,500,500],
//					stops:[
//					    [0,'#FEFEFF'],
//					       [1,'#007CBA']
//					       ]
//				},  //背景特效 
				//inverted:true, //旋转
				//margin:[20,20,20,20], //表框整体位置
				/* plotBackgroundColor:{
					linearGradient:[0,0,500,500],
					stops:[
					       [0,'rgb(255,255,255)'],
					       [0,'rgb(200,200,255)']
					       ]
				},  *///char区域内背景效果
				//plotBackgroundImage:'image/12.png',
				//plotBorderColor:'gray',// 边框绘图颜色
				//plotBorderWidth:2 //边框绘图宽度
				plotShadow:true, //投影效果是否显示
				//spacingBottom:120,
				//borderWidth:1,
				//plotBorderWidth:1
				style:{
					fontFamily:'宋体'
				},
				zoomType:'xy' //扩大选区  x,y,xy都可以
			},
			title: {
				text: '粮食直补信息数量年份对比情况',
				style:{
					fontWeight:'bold',
					color:'red'
				}
			
			},
			subtitle:{
				//text:'*subtitle*',
				align:'left',
				x:100,
				y:60,
				floating:true, //自由显示位置
				verticalAlign:'top',
				//text: 'This text has <b>bold</b>, <i>italic</i>, <span style="color: red">coloured</span>, <a href="http://example.com">linked</a> and <br/>line-broken text.',
				style:{
					color:'black',
					fontWeight:'bold'
				}
			},
			xAxis: {
				gridLineColor:"green", //x轴横线颜色
		        lineColor:"black", //x轴颜色
		        //offset:100,
		         /* endOnTick:true,
		        showFirstLabel:false,
		        showLastLabel:true, 
		        startOnTick:true, */  //是否显示横轴刻度值的第一/最后的值
		        tickColor:'black', //横轴记号颜色
		        tickLength:2, //横轴记号长度
		        tickPosition:'inside',//横轴记号位置 inside/outside
		        tickWidth:2,//记号宽度
		        //categories:["1月", "2月", "3月", "4月", "5月","6月", "7月", "8月", "9月", "10月", "11月", "12月"],
				labels:{
		        	//rotation: 45, //倾斜角度
		        	style:{
		        		color:'black'
		        	},
		        	y:20
		        }
			},
			yAxis:[{
				//gridLineColor:"green", //y轴横线颜色
				gridLineWidth:1,// y轴横线宽度
		        lineWidth: 1,
		        //lineColor:"green", //y轴颜色
		       	gridLineDashStyle: 'long', //y轴横线样式为：长虚线
		       	endOnTick:false, //y轴最大值是否显示
		       	//maxPadding:0.5,//y轴显示密度
		        //minorGridLineColor: 'red',
	            //minorTickInterval: 'auto', //较小的刻度区间值
	            minorTickLength:0,//y轴刻度长度
	            //minorTickInterval: 2,
	            tickPixelInterval: 40,// y轴刻度密度显示
	            //offset:10,//偏离y轴距离
		         title: {
		            text: '信息数量'
		        },
		        labels:{
		        	enabled:true
		        	//rotation: 45 //倾斜角度
		        }
		    }, {
		        //lineWidth: 1,
		        //lineColor:"green",
		        gridLineWidth:0,
		        //opposite: true, //对称显示Y轴
		        title: {
		            text: ' '
		        },
		        stackLabels: {
					enabled: true,
					style: {
						fontWeight: 'bold',
						color:'red'
					}
				},
		        labels:{
		        	enabled:false,
		        	rotation: 45 //倾斜角度
		        }
		    }],
			legend: {
				align: 'right',
				x: 0,
				verticalAlign: 'top',
				y: 50,
				floating: false,
				backgroundColor: 'white',
				borderColor: '#CCC',
				borderWidth: 1,
				shadow: false,
				borderRadius:8, //圆角的弧度
				itemHoverStyle:{
					color:'red'
				}, //鼠标经过的时候描述为红色
				itemStyle:{
					paddingBottom:'10px'
				}, //默认描述样式
				layout:'vertical', //垂直对齐  默认水平对齐(horizontal)
				reversed:true //换位置
				//symbolPadding:20, //图标的位置
				//symbolWidth:50 //图标的宽度
			},
			tooltip: {
				  formatter: function() {
					return '<b>'+ this.x +'</b><br/>'+
						 this.series.name +': '+ this.y +'<br/>';
				},  
				backgroundColor:{
					linearGradient:[0,0,0,60],
					stops: [
					        [0,'white'],
					        [1,'white']
					        ]
				},
				borderWidth: 1, //边框宽度
				borderColor:'#AAA', //边框颜色
				borderRadius:8, //圆角的幅度
				/*crosshairs:[{width:2,
					color:'green'},{
						width:2,
					color:'green',
					dashStyle:'shortdot' //虚线样式
					}],*/ //显示直角线
				shadow:false, //是否显示阴影
				//shard:true,
				style:{
					padding:10,
					fontWeight:'bold'
				}
			},
			plotOptions: {
				column: {
					//stacking: 'normal',//是否重叠数据表格
					dataLabels: {
						enabled: true,
						color: 'black',
						formatter: function() {
							if (this.y == 0) {
								return '';
							}
							return this.y + '';
						}
					}
				},
				series: {
					enabled:true,
					pointWidth:23 //调整柱状图显示宽度
				}
			},
		    series:[]
		};
		
		$.post("<%=request.getContextPath()%>/app/sldb/report/foodReport.action",
			null,
			function(json){
			var qname = [];
			var qdata = [];
			qname = eval("("+json.name+")");
			qdata = eval("("+json.data+")");
			options.xAxis.categories = qname;
			options.series = qdata;
			chart = new Highcharts.Chart(options);
		},"json");
		
	});
				
		</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="数据信息统计"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">
		<div id="container" style="width: 900px; height: 400px; margin: 0 auto"></div>
	</div>	
</body>
</html>




