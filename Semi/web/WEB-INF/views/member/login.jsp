<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>

		<div class="modal-dialog" role="document">
			<div class="modal-content" id="loginDiv">
				<div class="modal-header">
					<div class="modal-title text-center" id="exampleModalLabel" >
						<img src="<%= request.getContextPath() %>/image/logo.png" style="height: 100px; margin-left: 150px;">
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="login-form-background mx-auto row">
					<form action="<%= request.getContextPath() %>/login.me" method="post" id="loginForm">
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
							<button type="button" class="btn btn-lg btn-block" id="kakaoLogin" style="background-color: #FEE500">
							<a href="javascript:kakaoLogin();">
								<img src="<%= request.getContextPath() %>/image/kakao_symbol.png" style="height: 20px;"> <span style="color: black;">카카오로그인</span>
							</a>
							</button>
						</div>
						<p class="text-center my-5">
							<span style="font-size: 18px;" id="signUpLogin">회원가입하기</span>
						</p>
					</form>
				</div>
			</div>
		</div>

<!-- 		<div class="modal fade" id="exampleModal" tabindex="-1" -->
<!-- 			aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 			<div class="modal-dialog"> -->
<!-- 				<div class="modal-content"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
<!-- 						<button type="button" class="btn-close" data-bs-dismiss="modal" -->
<!-- 							aria-label="Close"></button> -->
<!-- 					</div> -->
<!-- 					<div class="modal-body">...</div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<button type="button" class="btn btn-secondary" -->
<!-- 							data-bs-dismiss="modal">Close</button> -->
<!-- 						<button type="button" class="btn btn-primary">Save changes</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

	<script>
		$('#signUpLogin').on('click', function(){
			$('#loginModal').modal("hide");
			$('#signUpModal').modal("show");
		});
		
		window.Kakao.init("07a99d78f7b743ace5cbf5de3b116c13");
// 		console.log(Kakao.isInitialized());
		
		function kakaoLogin(){
			$('#loginModal').modal("hide");
			
			window.Kakao.Auth.login({
				scope: 'profile, account_email, gender',
				success: function(authObj){
					console.log(authObj);
					
					window.Kakao.API.request({
						url: '/v2/user/me',
						success: function(res){
							console.log(res.kakao_account);
							
							var email = res.kakao_account.email
							var gender = res.kakao_account.gender
							var name = res.kakao_account.profile.nickname
							var profile = res.kakao_account.profile.profile_image_url
				                		
	                		$.ajax({
	                			url: '<%=request.getContextPath()%>/kakaoLogin.me',
	                			type: 'post',
				                data : {email:email, pwd : "kakao123", name: name, gender: gender, profile: profile},
				                success: function(login){
				                	location.href=" <%=request.getContextPath()%>/";
				                }
	                		});
	                	}
	                })		
				}
			});
		}
		
		$('#findPwd').on('click', function(){
			$('#loginModal').modal("hide");
//  			$('#exampleModal').modal("show");
			
			location.href = "<%=request.getContextPath() %>/findPwdForm.me";
		});
		
	</script>
</body>
</html>