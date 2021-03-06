<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.btn-block+.btn-block {
	margin-top: 0px;
}

.modal-footer .btn-block {
	margin: 0px;
	margin-top: 15px;
}

.modal .modal-content {
	overflow: hidden;
}

.gymModal {
	overflow-y: scroll; /* to get scrollbar only for y axis */
	height: 660px;
	padding-bottom: 40px;
	font-weight: 400;
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
	height: 150px;
	align-items: center;
	justify-content: space-evenly;
	flex-direction: column;
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

.gymModal label {
	margin-top: 15px;
	font-weight: bold;
}

.custom-file-label {
	margin-top: 0px !important;
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
	width: 250px;
}

.gymImage {
	object-fit: cover;
	width: 100%;
	height: 100%;
	vertical-align: inherit;
}

.cancelbtn {
	vertical-align: bottom;
}

.cancelbtn {
	margin-bottom: 4px;
}

.custom-file {
	margin-bottom: 4px !important;
}

.custom-file-input {
	cursor: pointer;
}

img src {
	border: none;
}

.custom-file-label {
	width: 200px;
}

.modal-footer>:not(:last-child) {
	margin-right: 0px;
}

.xyCode {
	display: inline-block;
	width: 640px;
	float: right;
	margin-top: 5px;
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
					<h3 class="my-3 text-center" style="font-size: 26px;">?????? ??????</h3>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form class="contents-inside" action="<%=request.getContextPath()%>/insert.fc" method="post" encType="multipart/form-data">
				<div class="modal-body gymModal">
					<label for="gymType">??????</label>
					<input type="text" class="form-control" name="gymType" id="gymType" placeholder="????????? ???????????????" required>
					<label for="gymName">??????</label>
					<input type="text" class="form-control" name="gymName" id="gymName" placeholder="????????? ???????????????" required>
					<label for="gymAddr">??????</label><br>
					<input type="text" class="form-control" name="gymAddr" id="gymAddr" placeholder="????????? ???????????????" required>
<!-- 					<button type="button" class="btn btn-primary" style="float: right">?????? ??????</button>  -->
					<label for="gymTel">????????????</label><br>
					<input type="text" class="form-control" name="gymTel" id="gymTel" placeholder="??????????????? ???????????????">
					<label for="gymHomepage">????????????</label><br>
					<input type="text" class="form-control" name="gymHomepage" id="gymHomepage" placeholder="??????????????? ???????????????">
					<label for="gymParking">?????? ??????</label><br>
					<input type="text" class="form-control" name="gymParking" id="gymParking" placeholder="?????? ????????? ???????????????">
					<label for="gymBigo">??????</label><br>
					<input type="text" class="form-control" name="gymBigo" id="gymBigo" placeholder="????????? ???????????????">
					<label for="signUpProfile" style="margin-bottom: 10px;">?????? ??????</label><br>
					<div class="imgArea">
						<img class="gymImage" id="img1">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymImg1" name="gymImg1" onchange="LoadImg(this, 1)" required>
						<label class="custom-file-label" for="gymImg1">????????????</label>
					</div>
					<button type="button" class="btn btn-default cancelbtn" onclick="deleteImg(1)">??????</button>
					<label style="display: block; margin-bottom: 10px;">?????? ??????</label>
					<div class="imgArea">
						<img class="gymImage" id="img2">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymImg2" name="gymImg2" onchange="LoadImg(this, 2)">
						<label class="custom-file-label" for="gymImg2">????????????</label>
					</div>
					<button type="button" class="btn btn-default cancelbtn" onclick="deleteImg(2)">??????</button>
					<div class="imgArea">
						<img class="gymImage" id="img3">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymImg3" name="gymImg3" onchange="LoadImg(this, 3)">
						<label class="custom-file-label" for="gymImg3">????????????</label>
					</div>
					<button type="button" class="btn btn-default cancelbtn" onclick="deleteImg(3)">??????</button>
					<br>
					<div class="imgArea">
						<img class="gymImage" id="img4">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymImg4" name="gymImg4" onchange="LoadImg(this, 4)">
						<label class="custom-file-label" for="gymImg4">????????????</label>
					</div>
					<button type="button" class="btn btn-default cancelbtn" onclick="deleteImg(4)">??????</button>
					<br> <label for="inlineRadio1">??????</label><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="edu_yn" id="inlineRadio1" value="???">
						<label class="form-check-label" for="inlineRadio1">???</label>
					</div>
					<div class="form-check form-check-inline" style="margin-left: 14px;">
						<input class="form-check-input" type="radio" name="edu_yn" id="inlineRadio2" value="???" checked>
						<label class="form-check-label" for="inlineRadio2">???</label>
					</div>
					<br> <label for="inlineRadio3">??????</label><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="in_out" id="inlineRadio3" value="??????">
						<label class="form-check-label" for="inlineRadio3">??????</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="in_out" id="inlineRadio4" value="??????" checked>
						<label class="form-check-label" for="inlineRadio4">??????</label>
					</div>
					<br> <label for="inlineRadio5">?????????</label><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="inlineRadio5" value="1">
						<label class="form-check-label" for="inlineRadio5">1</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="inlineRadio6" value="2">
						<label class="form-check-label" for="inlineRadio6">2</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="inlineRadio7" value="3">
						<label class="form-check-label" for="inlineRadio7">3</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="inlineRadio8" value="4">
						<label class="form-check-label" for="inlineRadio8">4</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="inlineRadio9" value="5" checked>
						<label class="form-check-label" for="inlineRadio9">5</label>
					</div>
					<br>
				</div>
				<div class="modal-footer">
					<button class="btn btn-lg btn-inline-block" type="submit" style="background-color: #00B1D2; color: white; width: 250px; margin-top: 0px">?????? ??????</button>
					<button class="btn btn-lg btn-block btn-secondary" data-dismiss="modal" aria-label="Close" type="reset" onclick="deleteAllImg();" style= "width: 250px; margin-top: 0px;">??????</button>
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
						$("#img1").show();
						break;
					case 2 :
						$("#img2").attr("src", e.target.result);
						$("#img2").show();
						break;
					case 3 :
						$("#img3").attr("src", e.target.result);
						$("#img3").show();
						break;
					case 4 :
						$("#img4").attr("src", e.target.result);
						$("#img4").show();
						break;
				}
			}
			reader.readAsDataURL(value.files[0]); // ?????? ??? 0????????? ?????? ?????? ???????????? ?????????. (?????? ????????? ?????? ?????? ???????????? 1?????? ???????????? ??????)
		}
	}

	function deleteAllImg() {
		console.log("delete")
		$('#gymImg1').val("");
		$('#img1').hide();
		$('#gymImg2').val("");
		$('#img2').hide();
		$('#gymImg3').val("");
		$('#img3').hide();
		$('#gymImg4').val("");
		$('#img4').hide();
	}
	
	function deleteImg(num) {
		$('#gymImg' + num).val("");
		$('#img'+num).hide();
	}
</script>
</html>