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
	
#loginAlert {
	max-width: 680px;
	margin-top: 200px;
	padding: 20px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.modal-body p {
	font-size: 16px;
	color: #737373;
	margin: 0px;
	font-weight: 400;
	line-height: 21px;
}

.btn-block+.btn-block {
    margin-top: 0px;
}

.modal-footer {
	flex-direction: column;
}

.modal-footer .btn-block {
	margin: 0px;
	margin-top: 15px;
}

</style>
</head>
<body>
		<div class="modal-dialog modal-dialog-scrollable" id="alertModal" role="document">
			<div class="modal-content" id="loginAlert">
				<div class="modal-header">
					<div class="modal-title text-center" id="exampleModalLongTitle" >
						<img src="<%= request.getContextPath() %>/image/logo.png" style="height: 100px; margin-left: 150px;">
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<h3 class="my-4 text-center" style="font-size: 20px">추천 서비스를 이용하기 위해 로그인 해주세요!</h3>
					
                    <div class="modal-body" style="text-align:center">
						<p>로그인 하시면 회원 정보를 기반으로 <br>
						보다 정확한 서비스를 제공해드려요.</p>
					
                    </div>
                    <div class="modal-footer">
       					<button class="btn btn-lg btn-block" type="submit" id="btnLogin" style="background-color: #00B1D2; color: white;">로그인</button>
       					<button class="btn btn-lg btn-block" type="submit" id="btnSignUp" style="background-color: #00B1D2; color: white;">회원가입</button>
                    </div>
			</div>
		</div>
		
	<script>
	$('#btnLogin').on('click', function() {
		$('#alertModal').modal("hide");
		$('#loginModal').modal("show");
	});
	$("#btnSignUp").on('click', function() {
		$('#alertModal').modal("hide");
		$('#signUpModal').modal("show");
	});
	</script>

</body>
</html>