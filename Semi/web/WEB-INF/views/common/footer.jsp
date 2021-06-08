<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style>
	*{font-family: 'Noto Sans KR';}
	
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
	
	.f2 span:hover{
		cursor: pointer;
		text-decoration: none;
		color: #00B1D2;
	}
	
	.f2-col{
		flex: 1;
	}
	
	.copyright{
		color: gray;
		font-size: 13px;
	}
	
</style>
</head>
<body>
		<!-- Footer-->
	<footer class="py-5">
		<div class="container">
			<div class="f1">
				<div class="f1-col">
					이용문의<br> 
					<span style="font-size: 35px; font-weight: 700px; color: #00B1D2;">1588-0215</span><br>
					AM 10:00 - PM 07:00<br> 토 일 공휴일 휴무
				</div>

				<div class="f1-col">
					<b>내일은 운동가야지</b><br> 서울시 강남구 역삼동<br> 대표 : 꽉자바<br>
					사업자번호 : 707-0982-2133<br> contact@kkakjava.co.kr<br>
				</div>
			</div>

			<div class="f2">
				<div class="f2-col">
					<span>이용약관</span>
				</div>
				<div class="f2-col">
					<span>개인정보처리방침</span>
				</div>
				<div class="f2-col">
					<span>위치정보이용약관</span>
				</div>
				<div class="f2-col">
					<span>고객센터</span>
				</div>
			</div>

			<span class="copyright">Copyright ⓒ Kkakjava Co., Ltd. All rights reserved.</span>
		</div>
	</footer>

</body>
</html>