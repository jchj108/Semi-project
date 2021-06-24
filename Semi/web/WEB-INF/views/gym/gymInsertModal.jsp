<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
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

.modal .modal-content {
	overflow: hidden;
}

.modal-body {
	overflow-y: scroll; /* to get scrollbar only for y axis */
	height: 730px;
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

.modal-footer {
	height: 96px;
	align-items: center;
	justify-content: center;
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

#homepage {
	width: 400px;
}

#parkingLot {
	width: 400px;
}

.contents-inside {
	margin-right: 30px;
	margin-left: 30px;
	margin-top: 10px;
	font-weight: 400;
}

label {
	margin-bottom: 0px;
}

btn btn-light {
	float: right;
}
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.4/css/bootstrap2/bootstrap-switch.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.4/js/bootstrap-switch.min.js"></script>
</head>
<body>
	<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
		<div class="modal-content" id="gymInsertModal">
			<div class="modal-header">
				<div style="margin-left: 329.516px">
					<h3 class="my-3 text-center" style="font-size: 26px;">시설 등록</h3>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form class="contents-inside" action="<%=request.getContextPath()%>/insert.fc" method="post" encType="multipart/form-data">
					<label for="gymName">시설 이름</label>
					<input type="text" class="form-control" name="gymName" id="gymName" placeholder="이름을 입력하세요" required>
					<label for="gymAddr">상세 주소</label><br>
					<input type="text" class="form-control" name="gymAddr" id="gymAddr" placeholder="주소를 입력하세요" style="width: 580px; display: inline-block" required>
					<button type="button" class="btn btn-primary" style="float: right">주소 검색</button>
					<label for="gymTel">전화번호</label><br>
					<input type="text" class="form-control" name="gymTel" id="gymTel" placeholder="전화번호를 입력하세요">
					<label for="gymHomepage">홈페이지</label><br>
					<input type="text" class="form-control" name="gymHomepage" id="gymHomepage" placeholder="홈페이지를 입력하세요">
					<label for="gymParking">주차 정보</label><br>
					<input type="text" class="form-control" name="gymParking" id="gymParking" placeholder="주차 정보를 입력하세요">
					<label for="gymParking">강습 여부</label><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
						<label class="form-check-label" for="inlineRadio1">Y</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
						<label class="form-check-label" for="inlineRadio2">N</label>
					</div>
					<div id="emailResult"></div>
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
					<br> <br>
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
			</div>
			<div class="modal-footer">
				<button class="btn btn-lg btn-block" type="submit" style="background-color: #00B1D2; color: white; width: 250px; margin-top: 0px">가입 완료</button>
			</div>
		</div>
	</div>
</body>
</html>
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