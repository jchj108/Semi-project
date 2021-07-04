<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#checkEmailContent{
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
</style>
</head>
<body>
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content" id="signUpDiv">
				<div class="modal-header">
					<div class="modal-title text-center" id="exampleModalLongTitle" >
						<img src="<%= request.getContextPath() %>/image/logo.png" style="height: 100px; margin-left: 150px;">
					</div>
					<button type="button" id="singUpClose" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<h3 class="my-4 text-center">회원가입</h3>
				<div class="login-form-background mx-auto row">
					<form class="validation-form" name="signUpForm" id="signUpForm" action="<%= request.getContextPath() %>/signUp.me" encType="multipart/form-data" method="post">
						<div class="modal-body">
							<div class="mb-4">
								<div class="mb-1">
									<label for="signUpEmail">이메일</label> 
									<input type="email" class="form-control" id="signUpEmail" name="signUpEmail" placeholder="you@example.com" required>
								</div>
								<div id="emailResult"></div>
							</div>
							
							<div class="mb-4">
								<div class="mb-1">
									<label for="signUpPwd">비밀번호</label>
									<input type="password" class="form-control" id="signUpPwd" name="signUpPwd" placeholder="영문+숫자 조합 8자리 이상 입력해주세요." required>
								</div>
								<div id="pwdResult"></div>
							</div>
							
							<div class="mb-4">
								<div class="mb-1">
									<label for="signUppwd2">비밀번호 확인</label>
									<input type="password" class="form-control" id="signUpPwd2" name="signUpPwd2" required>
								</div>
								<div id="pwd2Result"></div>
							</div>
			
							<div class="row mb-4">
								<div class="col-md-6">
									<label for="signUpName">이름</label>
									<input type="text" class="form-control" id="signUpName" name="signUpName" placeholder="이름을 입력해주세요." required>
								</div>
								<div class="col-md-6">
									<label for="signUpGender">성별</label>
									<div class="radio">
										<label style="margin-right: 50px;">
										<input type="radio" name="signUpGender" value="male" checked>남
										&nbsp; &nbsp;
										<input type="radio" name="signUpGender" value="female">여
										</label>
									</div>
								</div>
							</div>
	
							<div class="mb-4">
								<label for="signUpProfile">대표사진</label><br>
									<img src="<%= request.getContextPath() %>/profile_uploadFiles/default_profileFile.png" class="img-fluid" id="profile_img" style="height: 100px;"> &nbsp;&nbsp;
								<div class="custom-file d-inline-block align-bottom" style="width:200px;">
									<input type="file" class="custom-file-input" id="signUpProfile" name="signUpProfile" onchange="LoadImg(this)">
									<label class="custom-file-label" for="signUpProfile">파일선택</label>
								</div>
							</div>
			
							<div class="mb-4">
								<label for="signUpAddress">주소</label>
								<input type="text" class="form-control" id="signUpAddress" name="signUpAddress" placeholder="서울특별시 강남구 (구까지 기재)" required>
							</div>
			
							<div class="row mb-4">
								<div class="col-md-4">
									<label for="signUpEtc">운동 경력</label>
									<select class="custom-select d-block w-100" id="signUpEtc" name="signUpEtc">
										<option value="경력 없음"selected>경력없음</option>
										<option value="3개월 이상">3개월 이상</option>
										<option value="6개월 이상">6개월 이상</option>
										<option value="1년 이상">1년 이상</option>
									</select>
								</div>
								<div class="col-md-8">
									<label for="signUpLike">선호하는 운동</label>
									<select class="custom-select d-block w-100" id="signUpLike" name="signUpLike">
										<option value="없음"selected>없음</option>
										<option value="수영">수영</option>
										<option value="축구">축구</option>
										<option value="테니스">테니스</option>
										<option value="골프">골프</option>
										<option value="족구">족구</option>
										<option value="배드민턴">배드민턴</option>
										<option value="농구">농구</option>
										<option value="풋살">풋살</option>
									</select>
								</div>
							</div>
						</div>
						<hr class="mb-4">
						<div class="custom-control custom-checkbox mb-4">
							<input type="checkbox" class="custom-control-input" id="aggrement" required>
							<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
						</div>
						<div class="mb-2">
							<button class="btn btn-lg btn-block" type="submit" style="background-color: #00B1D2; color: white;">가입 완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	<script>
		$(function(){
			var isEmail = false;
			var isUsable = false;
			var isPwd = false;
			var isPwd2 = false;
			
			$('#signUpEmail').change(function(){
					
				var email = $('#signUpEmail').val();
				
				$.ajax({
					url: 'checkEmail.me',
					type: 'get',
					data: {inputEmail: email},
					success: function(data){
						if(data > 0){
							$("#emailResult").text('이미 가입된 이메일 입니다.').css("color","#dc3545");
							
							isUsable = false;
							isEmail = false;
						} else {
							
							var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							
							if(regExp.test($('#signUpEmail').val())){								
								$("#emailResult").text('사용가능한 이메일 입니다.').css('color', '#28a745');	

								isUsable = true;
								isEmail = true;
							} else {
								$("#emailResult").text('올바른 이메일 형식이 아니에요.').css('color', '#dc3545');	
								$('#signUpEmail').focus();
								
								isEmail = false;
							}
						}
					},
					error: function(data){
						console.log("실패");
					}
				
				});
			});
			
			$('#signUpPwd').change(function(){
				var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
				
				if(!regExp.test($(this).val())) {
					$("#pwdResult").text("올바른 비밀번호 형식이 아니에요.").css("color","#dc3545");
					$('#signUpPwd').focus();
					
					isPwd = false;
				} else {
					$("#pwdResult").text("");
					isPwd = true;
				}
			});
			
			$('#signUpPwd2').change(function(){
				var pwd = $('#signUpPwd').val();
				var pwd2 = $('#signUpPwd2').val();
				
				if(pwd != pwd2){
					$('#pwd2Result').text('비밀번호가 일치하지 않아요.').css("color","#dc3545");
					$(this).focus();
					
					isPwd2 = false;
				} else {
					$('#pwd2Result').text('비밀번호가 일치합니다.').css('color','#28a745');
					
					isPwd2 = true;
				}
			});
						
			$('#signUpForm').submit(function(){
				
				if(isEmail && isUsable && isPwd && isPwd2 == true){
				 	alert('반갑습니다');
				 	
					return true;
				} else {
					
					if(!isEmail){
						alert('이메일을 확인해주세요');
						$('#signUpEmail').focus();
					}
					else if(!isPwd){
						$('#signUpPwd').focus();
					}
					else if(!isPwd2){
						$('#signUpPwd2').focus();
					}
					
					return false;
				}
			});
		});
		
		function LoadImg(value){
			
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){								
					$("#profile_img").attr("src", e.target.result);
				}
				
				reader.readAsDataURL(value.files[0]);	
			}
		}
		
		$('#singUpClose').on('click', function(){
			$('body').css("overflow", "scroll");
		});
		
		
	</script>

</body>
</html>