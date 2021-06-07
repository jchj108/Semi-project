<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
	*{font-family: 'Noto Sans KR';}
	
</style>
</head>
<body onload="inputValue();">

	<div class="login-form-background m-4">
		<h4 style="text-align:center;">이메일 중복확인</h4>
		<hr>
		<p style="text-align: center; font-size: 15px; margin-botton: 40px;">사용하고자 하는 이메일을 입력하신 후, <br> 중복확인 버튼을 클릭하세요.</p>
		
		<form class="mb-3" action="<%=request.getContextPath()%>/checkEmail.me">
			<div class="row justify-content-center">
				<div class="col-8">
					<input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="you@example.com" required>
				</div>
				<div class="col">
					<button type="submit" class="btn" style="background-color: #00B1D2; color: white;">중복확인</button>
				</div>
			</div>
		</form>
		<div>
			<%
				Integer result = (Integer)request.getAttribute("result");
				String checkedEmail = (String)request.getAttribute("checkedEmail");
				if(result != null){
					if(result > 0){	
			%>
				<p>사용 중인 이메일 입니다.</p>
			<%
					} else {
			%>
				<p><%= checkedEmail %>은(는) 사용 가능한 이메일 입니다.</p>
			<%
					}
				}
			%>
		</div>
		<div class="mt-5 text-center">
			<button type="button" id="usedEmail" class="btn btn-sm" style="background-color: #00B1D2; color: white;">사용하기</button> &nbsp;&nbsp;
			<button type="button" id="cancle" class="btn btn-sm" onclick="window.close();" style="background-color: #00B1D2; color: white;">취소하기</button>
		</div>
	</div>
	
	<script>
		function inputValue(){
			if('<%= checkedEmail %>' == "null"){
	 			document.getElementById('inputEmail').value = opener.document.getElementById('email').value
			} else{
				document.getElementById('inputEmail').value = '<%= checkedEmail %>';
			}
		}
		
		document.getElementById('usedEmail').onclick=function(){
			opener.document.getElementById('email').value = document.getElementById('inputEmail').value;
			self.close();
		}
	
	</script>
	
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>