<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = (String)request.getAttribute("email");
	String key = (String)request.getSession().getAttribute("AuthenticationKey");
%>
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
			<form>
				<div class="form-group mt-5 mb-4 text-center">
					<h4>비밀번호 변경</h4>
				</div>
				<div class="form-group mb-3">
					<label for="userEmail">인증번호</label>
					<input type="text" class="form-control" name="inputKey" id="inputKey" placeholder="인증번호 입력" required>
					<input type="hidden" name="email" id="email" value="<%= email %>">
				</div>
				
				<div class="mb-3">
					<div class="mb-1">
						<label for="changePwd">새 비밀번호</label>
						<input type="password" class="form-control" id="changePwd" name="changePwd" placeholder="영문+숫자 조합 8자리 이상 입력해주세요." required>
					</div>
					<div id="newPwdResult"></div>
				</div>
				
				<div class="mb-4">
					<div class="mb-1">
						<label for="changePwd2">새 비밀번호 확인</label>
						<input type="password" class="form-control" id="changePwd2" name="changePwd2" required>
					</div>
					<div id="newPwd2Result"></div>
				</div>
	
				<div class="form-group mb-5">
					<button type="button" class="btn btn-block" id="subBtn" style="background-color: #00B1D2; color: white; width: 405px;">비밀번호 변경</button>
				</div>
			</form>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

<script>
	$('#inputKey').change(function(){
		var AuthenticationKey = "<%= key %>";
		var inputKey = $('#inputKey').val();
		
		if(AuthenticationKey != inputKey){
			alert('인증번호가 일치하지 않습니다');
			$('#inputKey').focus();
		}
	});
	
	var isPwd = false;
	var isPwd2 = false;

	$('#changePwd').on('change',function(){
		var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		
		if(!regExp.test($(this).val())) {
			$("#newPwdResult").text("올바른 비밀번호 형식이 아니에요.").css("color","#dc3545");
			$('#changePwd').focus();
			
			isPwd = false;
		} else {
			$("#newPwdResult").text("");
			isPwd = true;
		}
	});
	
	$('#changePwd2').on('change', function(){
		var pwd = $('#changePwd').val();
		var pwd2 = $('#changePwd2').val();
		
		if(pwd != pwd2){
			$('#newPwd2Result').text('비밀번호가 일치하지 않아요.').css("color","#dc3545");
			$(this).focus();
			
			isPwd2 = false;
		} else {
			$('#newPwd2Result').text('비밀번호가 일치합니다.').css('color','#28a745');
			
			isPwd2 = true;
		}
	});
				
	$('#subBtn').on('click', function(){
		
		if(!isPwd){
			$('#changePwd').focus();
			return false;
		}
		else if(!isPwd2){
			$('#changePwd2').focus();
			return false;
		}
		
		var email = $('#email').val();
		var changePwd = $('#changePwd').val();
		
		$.ajax({
			url: '<%=request.getContextPath()%>/changePwd.me',
			type: 'post',
			data: {changePwd:changePwd, email:email},
			success: function(data){
				$('#inputKey').val('');
				$('#changePwd').val('');
				$('#changePwd2').val('');
				$('#newPwdResult').html('');
				$('#newPwd2Result').html('');
				
				
				alert('비밀번호 변경에 성공했습니다. 새로운 비밀번호로 로그인해주세요');
				$('#loginModal').modal("show");
				
			},
			error: function(data){
				console.log('실패');
			}
		});
	});

</script>
</body>
</html>