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
	height: 710px;
	padding-bottom: 40px;
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

.modal-footer {
	margin-top: 0px !important;
	padding-top: 0px !important;
	padding-bottom: 0px !important;
}

label {
	margin-bottom: 0px;
}

.gymTime {
	display: flex;
	align-items: center;
	justify-content: space-between;
	color: dimgray;
	font-size: 15px;
}

.form-check-label {
	color: dimgray;
	font-size: 15px;
}

.imgArea {
	border: 1px solid gray;
	width: 250px;
	height: 200px;
	display: inline-block;
	padding-top: 0px !important;
}

.gymImage {
	object-fit: cover;
	width: 100%;
	height: 100%;
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
			<form class="contents-inside" action="<%=request.getContextPath()%>/insert.fc" method="post" encType="multipart/form-data">
				<div class="modal-body">
					<label for="gymName">이름</label>
					<input type="text" class="form-control" name="gymName" id="gymName" placeholder="이름을 입력하세요" required>
					<label for="gymAddr">주소</label><br>
					<input type="text" class="form-control" name="gymAddr" id="gymAddr" placeholder="주소를 입력하세요" style="width: 580px; display: inline-block" required>
					<button type="button" class="btn btn-primary" style="float: right">주소 검색</button>
					<label for="gymTel">전화번호</label><br>
					<input type="text" class="form-control" name="gymTel" id="gymTel" placeholder="전화번호를 입력하세요">
					<label for="gymHomepage">홈페이지</label><br>
					<input type="text" class="form-control" name="gymHomepage" id="gymHomepage" placeholder="홈페이지를 입력하세요">
					<label for="gymParking">주차 정보</label><br>
					<input type="text" class="form-control" name="gymParking" id="gymParking" placeholder="주차 정보를 입력하세요">
					<label for="gymBigo">비고</label><br>
					<input type="text" class="form-control" name="gymBigo" id="gymBigo" placeholder="비고를 입력하세요">
					<label for="signUpProfile" style="margin-bottom: 10px;">대표 사진</label><br>
					<div class="imgArea">
						<img class="gymImage" id="img1">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymImg1" name="gymImg1" onchange="LoadImg(this, 1)">
						<label class="custom-file-label" for="signUpProfile">파일선택</label>
					</div>
					<br> <label for="signUpProfile" style="display: block; margin-bottom: 10px;">일반 사진</label>
					<div class="imgArea">
						<img class="gymImage" id="img2">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymImg2" name="gymImg2" onchange="LoadImg(this, 2)">
						<label class="custom-file-label" for="signUpProfile">파일선택</label>
					</div>
					<br>
					<div class="imgArea">
						<img class="gymImage" id="img3">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymImg3" name="gymImg3" onchange="LoadImg(this, 3)">
						<label class="custom-file-label" for="signUpProfile">파일선택</label>
					</div>
					<br>
					<div class="imgArea">
						<img class="gymImage" id="img4">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymImg4" name="gymImg4" onchange="LoadImg(this, 4)">
						<label class="custom-file-label" for="signUpProfile">파일선택</label>
					</div>
					<br> <br> <label for="weekdayOpen">운영 시간</label><br>
					<div class="gymTime">
						<label for="weekdayOpen">평일 open</label>
						<input type="time" style="display: inline-block; width: 250px;" class="form-control" name="weekdayOpen" id="weekdayOpen"
							placeholder="주차 정보를 입력하세요"
						>
						<label for="weekdayClose">평일 close</label>
						<input type="time" style="display: inline-block; width: 250px;" class="form-control" name="weekdayClose" id="weekdayClose"
							placeholder="주차 정보를 입력하세요"
						>
					</div>
					<div class="gymTime">
						<label for="weekendOpen">주말 open</label>
						<input type="time" style="display: inline-block; width: 250px;" class="form-control" name="weekendOpen" id="weekendOpen"
							placeholder="주차 정보를 입력하세요"
						>
						<label for="weekendClose">주말 close</label>
						<input type="time" style="display: inline-block; width: 250px;" class="form-control" name="weekendClose" id="weekendClose"
							placeholder="주차 정보를 입력하세요"
						>
					</div>
					<label for="inlineRadio1">강습</label><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
						<label class="form-check-label" for="inlineRadio1">Y </label>
					</div>
					<div class="form-check form-check-inline" style="margin-left: 20px;">
						<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
						<label class="form-check-label" for="inlineRadio2">N</label>
					</div>
					<br> <label for="inlineRadio3">장소</label><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option1">
						<label class="form-check-label" for="inlineRadio3">실내</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option2">
						<label class="form-check-label" for="inlineRadio4">실외</label>
					</div>
					<br>
				</div>
				<div class="modal-footer">
					<button class="btn btn-lg btn-block" type="submit" style="background-color: #00B1D2; color: white; width: 250px; margin-top: 0px">등록 완료</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
	$('form').children().css({
		'margin-top' : '5px',
		'padding-top' : '4px'
	});
	function LoadImg(value, num) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				switch (num) {
					case 1 :
						$("#img1").attr("src", e.target.result);
						console.log(e.target.result);
						break;
					case 2 :
						$("#img2").attr("src", e.target.result);
						break;
					case 3 :
						$("#img3").attr("src", e.target.result);
						break;
					case 4 :
						$("#img4").attr("src", e.target.result);
						break;
				}
			}
			reader.readAsDataURL(value.files[0]); // 입력 중 0번째에 있는 것을 들어가게 하겠다.
		}
	}
</script>
</html>