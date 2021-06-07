<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		<div class="modal-dialog" role="document">
			<div class="modal-content" id="signUpForm">
				<div class="modal-header">
					<div class="modal-title text-center" id="exampleModalLabel" >
						<img src="<%= request.getContextPath() %>/image/logo.png" style="height: 100px;">
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<h3 class="my-3 text-center">회원가입</h3>
				<div class="login-form-background mx-auto row">
					<form class="validation-form" name="signUpForm" action="<%= request.getContextPath() %>/login.me" method="post">
						<div class="mb-1 row align-items-end">
							<div class="col-md-9">
								<label for="email">이메일</label> 
								<input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
							</div>
							<div class="col-md-3">
								<button type="button" class="btn" id="checkEmailBtn" style="background-color: #00B1D2; color: white;">중복확인</button>
							</div>
						</div>
						<div class="mb-3" id="emailResult"></div>
		
						<div class="mb-1">
							<label for="password">비밀번호</label>
							<input type="password" class="form-control" id="pwd" name="pwd" placeholder="영문+숫자 조합 8자리 이상 입력해주세요." required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="mb-3" id="pwdResult"></div>
		
						<div class="mb-1">
							<label for="password2">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwd2" name="pwd2" required>
							<div class="invalid-feedback">비밀번호 확인을 입력해주세요.</div>
						</div>
						<div class="mb-3" id="pwd2Result"></div>
		
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="name">이름</label>
								<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요." required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
							<div class="col-md-6">
								<label for="gender">성별</label>
								<div class="radio">
									<label style="margin-right: 50px;">
									<input type="radio" name="gender" value="man" checked>남
									&nbsp; &nbsp;
									<input type="radio" name="gender" value="woman">여
									</label>
								</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="gender">대표사진 설정</label><br>
								<img src="<%= request.getContextPath() %>/image/default_profile.png" class="img-fluid" style="height: 100px;"> &nbsp;
							<div class="custom-file d-inline-block align-bottom" style="width:200px;">
								<input type="file" class="custom-file-input" id="customFile">
								<label class="custom-file-label" for="customFile">파일선택</label>
							</div>
						</div>
		
						<div class="mb-3">
							<label for="address">주소</label>
							<input type="text" class="form-control" id="address" name="address" placeholder="서울특별시 강남구 역삼동 (동까지 기재)" required>
							<div class="invalid-feedback">주소를 입력해주세요.</div>
						</div>
		
						<div class="row mb-3">
							<div class="col-md-4">
								<label for="excersice">운동 경력(선택)</label>
								<select class="custom-select d-block w-100" id="excersice">
									<option value=""></option>
									<option selected>경력없음</option>
									<option>3개월 이상</option>
									<option>6개월 이상</option>
									<option>1년 이상</option>
								</select>
							</div>
							<div class="col-md-8">
								<label for="favorite">선호하는 운동(선택)</label>
								<input type="text" class="form-control" id="favorite">
							</div>
						</div>
		
						<hr class="mb-4">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="aggrement" required>
							<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
						</div>
						<div class="mb-4"></div>
						<button class="btn btn-lg btn-block" type="submit" style="background-color: #00B1D2; color: white;">가입 완료</button>
					</form>
				</div>
			</div>
		</div>
		
		
	<script>
		$('#checkEmailBtn').on('click', function(){
			var popupX = (window.screen.width/2) - (450/2) - 15;
			var popupY = (window.screen.height/2) - (350/2);
						
			window.open('checkEmailForm.me', 'checkEmail', 'width=450, height=350, left=' + popupX + ', top='+ popupY);
		});
		
		$(function(){
			var isEmail, isId, isPw, isPw2 = false;
			
			$('#email').change(function(){
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
				if(!regExp.test($(this).val())){
					$("#emailResult").text("올바른 이메일 형식이 아니에요").css("color","#dc3545");
					$(this).focus();
					isEmail = false;
				}
				
				isEmail = true;
			});
			
			$('#pwd').change(function(){
				
				
			});
			
		});
		
	</script>

</body>
</html>