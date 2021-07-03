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
</body>
</html>