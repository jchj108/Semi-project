<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
	*{
		font-family: 'Noto Sans KR';
	}
	
	.logo{
		margin-bottom: 20px;
		text-align: center;
	}
	
	.login-form{
		max-width: 680px;
		margin-top: 80px;
		padding: 32px;
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
	
	.dim{position: fixed; left: 0; top: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: -1;}
	

</style>
</head>
<body>
<%-- 	<%@ include file="../common/menubar.jsp" %> --%>
	<div class="login-form-background row">
		<div class="login-form mx-auto">
			<form action="<%= request.getContextPath() %>/logIn.me" method="post">
				<div class="logo">
					<img src="image/logo.PNG" class="img-fluid" style="height: 100px;">
				</div>
				<div class="form-group mb-3">
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
					<button type="submit" class="btn btn-lg btn-block"
						style="background-color: #00B1D2; color: white; width: 405px;">로그인</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-lg btn-block"
						style="background-color: #FEE500">
						<img src="image/kakao_symbol.PNG" style="height: 20px;"> 카카오
						로그인
					</button>
				</div>
				<p class="text-center my-5">
					<a href="#" style="font-size: 18px; text-decoration: underline;">회원가입하기</a>
				</p>
			</form>
			<div class="dim"></div>
		</div>
	</div>


</body>
</html>