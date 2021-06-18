<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="modal-dialog" role="document">
			<div class="modal-content" id="loginForm">
				<div class="modal-header">
					<div class="modal-title text-center" id="exampleModalLabel" >
						<img src="<%= request.getContextPath() %>/image/logo.png" style="height: 100px; margin-left: 150px;">
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="login-form-background mx-auto row">
					<form action="<%= request.getContextPath() %>/login.me" method="post">
						<div class="form-group mt-4 mb-3">
							<label for="userEmail">이메일</label> <input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="you@example.com" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>
		
						<div class="form-group mb-2">
							<label for="userPwd">비밀번호</label> <input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요." required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
		
						<div class="clearfix mb-4">
							<span class="float-right" id="findPwd">비밀번호 찾기</span>
						</div>
		
						<div class="form-group">
							<button type="submit" class="btn btn-lg btn-block" style="background-color: #00B1D2; color: white; width: 405px;">로그인</button>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-lg btn-block" style="background-color: #FEE500">
								<img src="<%= request.getContextPath() %>/image/kakao_symbol.png" style="height: 20px;"> 카카오로그인
							</button>
						</div>
						<p class="text-center my-5">
							<span style="font-size: 18px;" id="signUpLogin">회원가입하기</span>
						</p>
					</form>
				</div>
			</div>
		</div>
		
	<script>
		$('#signUpLogin').on('click', function(){
			$('#loginModal').modal("hide");
			$('#signUpModal').modal("show");
		});
		
		// 07a99d78f7b743ace5cbf5de3b116c13
		
	</script>
</body>
</html>