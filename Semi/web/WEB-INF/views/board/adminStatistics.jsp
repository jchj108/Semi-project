<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="visit.*"%>
<%
	int totalCount = (int)session.getAttribute("totalCount");
	int todayCount = (int)session.getAttribute("todayCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#adminBody{
	margin: 20px auto 20px auto;
}

.imgDiv span:nth-child(1){
	font-size: 30px;
}

.imgDiv span:last-child{
	color: gray;
	font-size: 13px;
}

.imgDiv, .imgDiv1, .imgDiv2 {
	display: inline-block;
	vertical-align: middle;
}

.imgDiv{
	text-align: center;
}

.imgDiv1{
	margin-right: 7px;
}

</style>
<title>Insert title here</title>
</head>

<body>

		<div class="modal-dialog" role="document">
			<div class="modal-content" id="adminDiv">
				<div class="modal-header">
					<div class="modal-title text-center" id="exampleModalLabel" >
						<img src="<%= request.getContextPath() %>/image/logo.png" style="height: 60px; margin-left: 170px;">
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="adminBody">
					<div class="imgDiv" style="margin-right: 60px;">
						<div class="imgDiv1">
							<span><%= totalCount %></span><br>
							<span>TotalCount</span>
						</div>
						<div class="imgDiv2">
							<img src="<%= request.getContextPath() %>/image/rImage/totalicon.png" width="50px">
						</div>
					</div>
					<div class="imgDiv">
						<div class="imgDiv1">
							<span><%= todayCount %></span><br>
							<span>TodayCount</span>
						</div>
						<div class="imgDiv2">
							<img src="<%= request.getContextPath() %>/image/rImage/todayicon.png" width="50px">
						</div>
					</div>
				
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
			
	<script>
// 	$(function () {
// 	    Highcharts.chart('statistics', {
// 	        title: {
// 	            text: '방문자 수 통계',
// 	            x: -20 //center
// 	        },
// 	        subtitle: {
// 	            text: '총 방문자 수와 오늘 방문자 수 추이',
// 	            x: -20
// 	        },
// 	        xAxis: {
// 	            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
// 	                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
// 	        },
// 	        yAxis: {
// 	            title: {
// 	                text: 'Temperature (°C)'
// 	            },
// 	            plotLines: [{
// 	                value: 0,
// 	                width: 1,
// 	                color: '#808080'
// 	            }]
// 	        },
// 	        tooltip: {
// 	            valueSuffix: '°C'
// 	        },
// 	        legend: {
// 	            layout: 'vertical',
// 	            align: 'right',
// 	            verticalAlign: 'middle',
// 	            borderWidth: 0
// 	        },
// 	        series: [{
// 	            name: 'Tokyo',
// 	            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
// 	        }, {
// 	            name: 'New York',
// 	            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
// 	        }, {
// 	            name: 'Berlin',
// 	            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
// 	        }, {
// 	            name: 'London',
// 	            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
// 	        }]
// 	    });
// 	});
		
	</script>
</body>
</html>