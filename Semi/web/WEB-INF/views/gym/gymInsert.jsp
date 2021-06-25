<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-script-type" content="text/javascript" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>GoGym</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="../../tools/css/styles.css" rel="stylesheet" />
<style>
* {
	font-family: 'Noto Sans KR';
}

a:hover {
	text-decoration: none;
}

.main {
	margin-top: 30px;
	display: inline-block;
	width: 700px;
	height: 930px;
	margin-left: 25%;
}

.title {
	font-size: 30px;
	font-weight: bolder;
	text-align: center;
}

.contents-inside {
	margin-left: 15%;
	height: 700px;
}

input {
	margin-left: 10px;
	margin-right: 10px;
}

#roadNameAddress, #detailedAddress {
	width: 350px;
	margin-left: 82px;
}

.phone {
	width: 60px;
	text-align: center;
}

#day-off {
	margin-left: 80px;
}

#intro {
	border: 1px solid black;
	width: 500px;
	height: 300px;
	resize: none;
}

.input-cancel {
	margin-left: 30%;
}

.input-btn {
	width: 100px;
	height: 40px;
	color: white;
	background: #00b1d2;
	border: none;
	border-radius: 10px;
	padding: 0.3rem;
	padding-left: 0.7rem;
	padding-right: 0.7rem;
	font-size: 10pt;
	font-weight: bold;
}



.modal-body label {
	margin-top: 5px;
	font-weight: bold;
	padding-top: 10px;
}

#homepage {
	width: 400px;
}

#parkingLot {
	width: 400px;
}
</style>
</head>
<body>
	<!-- Header-->
	<%@include file="../common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-9">
				<div class="main">
					<p class="title">시설 정보 입력</p>
					<hr>
					<form class="contents-inside" action="<%=request.getContextPath()%>/insert.fc" method="post" encType="multipart/form-data">
						<label>시설 명 :</label>
						<input type="text" placeholder="시설 명을 입력하세요">
						<br> <label>상세주소 :</label>
						<input type="text" placeholder="우편번호">
						<input type="button" value="우편번호찾기" src="#">
						<br>
						<input type="text" placeholder="도로명 주소" id="roadNameAddress">
						<br>
						<input type="text" placeholder="상세주소" id="detailedAddress">
						<br> <label>전화번호 : </label>
						<input type="text" class="phone" id="num1">
						-
						<input type="text" class="phone" id="num2">
						-
						<input type="text" class="phone" id="num3">
						<br> <label>위도 / 경도 :</label>
						<input type="text" id="xCode" name="xCode">
						/
						<input type="text" id="yCode" name="yCode">
						<br> <label>강습 : </label> 유
						<input type="radio" id="lYes" name="learning">
						무
						<input type="radio" id="lNo" name="learning" checked>
						<br> <label>공간 : </label> 실내
						<input type="radio" id="inside" name="place">
						실외
						<input type="radio" id="outside" name="place" checked>
						<br> <label>홈페이지 : </label>
						<input type="text" id="homepage" name="homepage">
						<br> <label>주차장 : </label>
						<input type="text" id="parkingLot" name="parkingLot">
						<br> <label>운영시간</label><br> 평일 open
						<input type="time" id="weekdayOpen" name="weekdayOpen">
						close
						<input type="time" id="weekdayClose" name="weekdayClose">
						<br> 주말 open
						<input type="time" id="weekendOpen" name="weekendOpen">
						close
						<input type="time" id="weekendClose" name="weekendClose">
						<br> 휴관일 :
						<input type="text" id="closed" name="closed">
						<br>
						<br>
						<table>
							<tr>
								<td>메인 사진 :</td>
								<!-- 	            					<td><img src="../no _image.jpg"></td>  -->
							</tr>
							<tr>
								<td>시설 사진 :</td>
								<!-- 	            					<td><img src="#"></td> -->
							</tr>
						</table>
						<!-- 	            			<label>메인 사진 :</label> <input type="file" id="mainImg" name="mainImg"><br> -->
						<!-- 	            			<label>시설 사진 :</label> <input type="file" id="facImg" name="facImg"><br> -->
						<div class="input-cancel">
							<input type="submit" class="input-btn" value="입력">
							<input type="button" class="input-btn" value="취소" onClick="history.go(-1);">
						</div>
					</form>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#parkingLot').keyup(function() {
			var input = $(this).val();
			$(this).val($(this).val().substring(0, 50));
		});

		$('#homepage').keyup(function() {
			var input = $(this).val();
			$(this).val($(this).val().substring(0, 100));
		});

		$('form').children().css({
			'margin-top' : '5px',
			'padding-top' : '4px'
		});
	</script>
	<!-- Footer-->
	<%@include file="../common/footer.jsp"%>
</body>
</html>