<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="container">
		<div class="row justify-content-md-center">
			<form action="<%=request.getContextPath()%>/findPwd.me" method="post" id="findPwdForm">
				<div class="form-group mt-5 mb-4 text-center">
					<h4>비밀번호 찾기</h4>
				</div>
				<div class="form-group mb-3">
					<label for="findPwdEmail">이메일</label>
					<input type="email" class="form-control" name="findPwdEmail" id="findPwdEmail" placeholder="회원가입시 사용한 이메일을 입력해주세요." required>
					<div id="result"></div>
				</div>
				
				<div class="form-group mb-4">
					<label for="findPwdName">이름</label>
					<input type="text" class="form-control" name="findPwdName" id="findPwdName" placeholder="이름을 입력해주세요." required>
					<div class="invalid-feedback">이름을 입력해주세요.</div>
				</div>
	
				<div class="form-group mb-5">
					<button type="submit" class="btn" style="background-color: #00B1D2; color: white; width: 405px;">찾기</button>
				</div>
			</form>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$('#findPwdEmail').change(function(){
			var email = $('#findPwdEmail').val();
			var name = $('#findPwdName').val();
			
			$.ajax({
				url: 'checkEmail.me',
				type: 'get',
				data: {inputEmail: email},
				success: function(data){
					if(data <= 0){
						$("#result").text('입력하신 이메일 정보가 존재하지 않습니다').css("color","#dc3545");
					} else {
						$("#result").text('');
					}
				},
				error: function(data){
					console.log("실패");
				}
			})
		});
	</script>
</body>
</html>