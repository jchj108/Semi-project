<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% Member loginUser = (Member)session.getAttribute("loginUser");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>헤더/푸터</title>
<style>
	*{font-family: 'Noto Sans KR';}
	
	/* Header */
	.navbar-light{
		background-color: white;
		border-bottom: 1px solid lightgray;
		height: 89px;
	}
		
	.dropdown p:hover, #signUp:hover, #login:hover{
		cursor: pointer;
		text-decoration: none;
		color: #00B1D2;
	}
	
	.dropdown-menu button:hover{
		cursor: pointer;
		background-color: #F8F9FA;
		color: #00B1D2;
	}
	
	.homeLogo:hover{
		cursor: pointer;
	}
	
	/* login */
	#signUpLogin:hover, #findPwd:hover{
		cursor: pointer;
		text-decoration: none;
		color: #00B1D2;
	}
	
	#loginDiv, #signUpDiv{
		max-width: 680px;
		margin-top: 80px;
		padding: 20px;
		background: #fff;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	}
	
	#kakao_button{
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
</style>
</head>
<body>
	<!-- Header-->
	<% if(loginUser == null) { %>
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">

				<a href="<%= request.getContextPath() %>/home.do"><img src="<%= request.getContextPath() %>/image/logo.png" style="height: 72px;"></a>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="nav nav-pills ml-auto">
							<li class="nav-item active" id="signUp">회원가입</li>
							<li>&nbsp; &nbsp;</li>
							<li class="nav-item active" id="login">로그인</li>
					</ul>
				</div>
			</div>
		</nav>
	<% } else if(loginUser.getM_auth() == 0){ %>
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<img src="<%= request.getContextPath() %>/image/logo.png" class="homeLogo" style="height: 72px;">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse">
					<ul class="nav ml-auto">
						<li class="nav-item dropdown">
							<p class="nav-link dropdown-toggle m-auto" id="navbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
								style="font-size: 15px;">
								<img src="<%= request.getContextPath() %>/profile_uploadFiles/<%= loginUser.getM_profile() %>" style="height: 30px;">
								&nbsp;<%= loginUser.getM_name() %>&nbsp;관리자
							</p>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">								
								<button class="dropdown-item" type="button" onclick="location.href='userList.li'">회원정보관리</button>
								<button class="dropdown-item" type="button" onclick="location.href='gymManage.do'">시설관리</button>
								<button class="dropdown-item" type="button" onclick="location.href='qnaBoardList.li'">게시글관리</button>
								<button class="dropdown-item" type="button">통계조회</button>
								<div class="dropdown-divider"></div>
								<button class="dropdown-item text-right" type="button" id="logout">로그아웃</button>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	<% } else { %>
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<img src="<%= request.getContextPath() %>/image/logo.png" class="homeLogo" style="height: 72px;">

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse">
					<ul class="nav ml-auto">
						<li class="nav-item dropdown">
							<p class="nav-link dropdown-toggle m-auto" id="navbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
								style="font-size: 15px;">
								<% if(!loginUser.getM_pwd().equals("kakao123")){%>
								<img src="<%= request.getContextPath() %>/profile_uploadFiles/<%= loginUser.getM_profile() %>" style="height: 30px;">
								<% } else { %>
								<img src="<%= loginUser.getM_profile() %>" style="height: 30px;">								
								<% } %>
								&nbsp;<%= loginUser.getM_name() %>&nbsp;고객님
							</p>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<button class="dropdown-item" style="font-weight: bold; color: black; pointer-events: none;">
									반갑습니다, <%= loginUser.getM_name() %>님
								</button>
								<button class="dropdown-item" type="button" onclick="location.href='myPage.me'">마이페이지</button>
								<div class="dropdown-divider"></div>
								<button class="dropdown-item text-right" type="button" id="logout">로그아웃</button>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	<% } %>
	
	<!-- login -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<%@include file="../member/login.jsp" %>
	</div>
	
	<!-- signUp -->
	<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<%@include file="../member/signUp.jsp" %>
	</div>
	
	<script>
		$('#login').on('click', function(){
			$('#loginModal').modal("show");
		});
		
		$('#logout').on('click', function(){
			if(<%= loginUser != null && loginUser.getM_pwd().equals("kakao123")%>){
				if (!Kakao.Auth.getAccessToken()) {
					console.log('Not logged in.');
					return;
				}
				Kakao.Auth.logout(function() {
					console.log(Kakao.Auth.getAccessToken());
				});
			}
			
			location.href = "<%= request.getContextPath() %>/logout.me";
		});		
		
		$('#signUp').on('click', function() {
			$('#signUpModal').modal("show");		
		});
		
		$('.homeLogo').on('click', function(){
			location.href = "<%= request.getContextPath() %>/home.do";
		});
		
	</script>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->

</body>
</html>