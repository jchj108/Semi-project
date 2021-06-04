<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		
	.f2 a:hover, .dropdown p:hover, #signUpForm:hover, #loginForm:hover{
		cursor: pointer;
		text-decoration: none;
		color: #00B1D2;
	}
	
	.dropdown-menu button:hover{
		background-color: #F8F9FA;
		color: #00B1D2;
	}
	
	/* Footer */
	footer{
		background-color: white;
		color: black;
		border-top: 1px solid lightgray;
	}
	
	.f1{
		display: flex;
	}
	
	.f1-col{
		flex: 1;
		font-size: 13px;
	}
	
	.f2{
		display: flex;
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		margin: 50px 0px 50px 0px;
		padding: 15px 0px 15px 0px;
	}
	
	.f2 a{
		text-decoration: none;
		color: black;
	}
	
	.f2-col{
		flex: 1;
	}
	
	.copyright{
		color: gray;
		font-size: 13px;
	}
	
	/* login */
	#modalLogo{
		text-align: center;
	}
	
	.modal-content{
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
				<img src="<%= request.getContextPath() %>/image/logo.png" style="height: 72px;">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="nav nav-pills ml-auto">
							<li class="nav-item active" id="signUpForm">회원가입</li>
							<li>&nbsp; &nbsp;</li>
							<li class="nav-item active" id="loginForm">로그인</li>
					</ul>
				</div>
			</div>
		</nav>
	<% } else { %>
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<img src="<%= request.getContextPath() %>/image/logo.png" style="height: 72px;">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse">
					<ul class="nav ml-auto">
						<li class="nav-item dropdown">
							<p class="nav-link dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<%= loginUser.getM_name() %>&nbsp;고객님
							</p>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<button class="dropdown-item" style="font-weight: bold; color: black; pointer-events: none;">
									반갑습니다, <%= loginUser.getM_name() %>님
								</button>
								<button class="dropdown-item" type="button">마이페이지</button>
								<div class="dropdown-divider"></div>
								<button class="dropdown-item text-right" type="button" id="logout">로그아웃</button>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	<% } %>
	
	<!-- Page Content-->
	<div class="container" style="height: 500px;"></div>


	<!-- login -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title text-center" id="exampleModalLabel" >
						<img src="<%= request.getContextPath() %>/image/logo.png" style="height: 100px;">
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="login-form-background mx-auto row">
					<form action="<%= request.getContextPath() %>/login.me" method="post">
						<div class="form-group mt-4 mb-3">
							<label for="email">이메일</label> <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>
		
						<div class="form-group mb-2">
							<label for="password">비밀번호</label> <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요." required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
		
						<div class="clearfix mb-4">
							<a href="#" class="float-right">비밀번호 찾기</a>
						</div>
		
						<div class="form-group">
							<button type="submit" class="btn btn-lg btn-block" id="login" style="background-color: #00B1D2; color: white; width: 405px;">로그인</button>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-lg btn-block" style="background-color: #FEE500">
								<img src="<%= request.getContextPath() %>/image/kakao_symbol.png" style="height: 20px;"> 카카오로그인
							</button>
						</div>
						<p class="text-center my-5">
							<a href="#" style="font-size: 18px; text-decoration: underline;">회원가입하기</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Footer-->
	<footer class="py-5">
		<div class="container">
			<div class="f1">
				<div class="f1-col">
					이용문의<br> <span
						style="font-size: 35px; font-weight: 700px; color: #00B1D2;">1588-0215</span><br>
					AM 10:00 - PM 07:00<br> 토 일 공휴일 휴무
				</div>

				<div class="f1-col">
					<b>내일도 운동가야지</b><br> 서울시 강남구 역삼동<br> 대표 : 꽉자바<br>
					사업자번호 : 707-0982-2133<br> contact@kkakjava.co.kr<br>
				</div>
			</div>

			<div class="f2">
				<div class="f2-col">
					<a href="#!">이용약관</a>
				</div>
				<div class="f2-col">
					<a href="#!">개인정보처리방침</a>
				</div>
				<div class="f2-col">
					<a href="#!">위치정보이용약관</a>
				</div>
				<div class="f2-col">
					<a href="#!">고객센터</a>
				</div>
			</div>

			<span class="copyright">Copyright ⓒ Kkakjava Co., Ltd. All
				rights reserved.</span>
		</div>
	</footer>
	
	<script>
		$('#signUpForm').on('click', function() {
			location.href = "<%= request.getContextPath() %>/signUpForm.me";			
		});
		
		$('#loginForm').click(function(){
			$('#exampleModal').modal("show");
		});
		
		$('#logout').click(function(){
			location.href = "<%= request.getContextPath() %>/logout.me";						
		});
		
</script>

<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>