<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="visit.*"%>
<%
	int totalCount = (int)session.getAttribute("totalCount");
	int todayCount = (int)session.getAttribute("todayCount");
	
	System.out.println(totalCount + " : 총 방문자수");
	System.out.println(todayCount + " : 오늘 방문자수");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>

<body>
	<%@include file="../common/header.jsp"%>

	<div id="statistics" style="width: 800px; height: 400px; margin: 0 auto"></div>
	
	<%@ include file="../common/footer.jsp"%>
	
	<script>
	$(function () {
	    Highcharts.chart('statistics', {
	        title: {
	            text: '방문자 수 통계',
	            x: -20 //center
	        },
	        subtitle: {
	            text: '총 방문자 수와 오늘 방문자 수 추이',
	            x: -20
	        },
	        xAxis: {
	            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
	                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
	        },
	        yAxis: {
	            title: {
	                text: 'Temperature (°C)'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	        tooltip: {
	            valueSuffix: '°C'
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        series: [{
	            name: 'Tokyo',
	            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
	        }, {
	            name: 'New York',
	            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
	        }, {
	            name: 'Berlin',
	            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
	        }, {
	            name: 'London',
	            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
	        }]
	    });
	});
		
	</script>
</body>
</html>