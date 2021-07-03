<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp2 = request.getContextPath(); %>

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

.modal-body {
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

.modal-body label {
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

</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.4/css/bootstrap2/bootstrap-switch.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.4/js/bootstrap-switch.min.js"></script>
</head>
<body>
	<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
		<div class="modal-content" id="gymInsertModal">
			<div class="modal-header">
				<div style="margin-left: 329.516px">
					<h3 class="my-3 text-center" style="font-size: 26px;">시설 수정</h3>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form class="contents-inside" action="<%=request.getContextPath()%>/gymUpdate.do" method="post" encType="multipart/form-data">
				<div class="modal-body">
					<label for="gymType">시설 번호</label>
					<input type="text" class="form-control" name="gymUpdateNo" id="gymUpdateNo" readonly>
					<label for="gymName">이름</label>
					<input type="text" class="form-control" name="gymUpdateName" id="gymUpdateName" placeholder="이름을 입력하세요" required>
					<label for="gymType">타입</label>
					<input type="text" class="form-control" name="gymUpdateType" id="gymUpdateType" placeholder="타입을 입력하세요" required>
					<label for="gymAddr">주소</label><br>
					<input type="text" class="form-control" name="gymUpdateAddr" id="gymUpdateAddr" placeholder="주소를 입력하세요" required>
<!-- 				<button type="button" class="btn btn-primary" style="float: right">주소 검색</button>  -->	
					<label for="gymTel">전화번호</label><br>
					<input type="text" class="form-control" name="gymUpdateTel" id="gymUpdateTel" placeholder="전화번호를 입력하세요">
					<label for="gymHomepage">홈페이지</label><br>
					<input type="text" class="form-control" name="gymUpdateHomepage" id="gymUpdateHomepage" placeholder="홈페이지를 입력하세요">
					<label for="gymParking">주차 정보</label><br>
					<input type="text" class="form-control" name="gymUpdateParking" id="gymUpdateParking" placeholder="주차 정보를 입력하세요">
					<label for="gymBigo">비고</label><br>
					<input type="text" class="form-control" name="gymUpdateBigo" id="gymUpdateBigo" placeholder="비고를 입력하세요">
					<label for="signUpProfile" style="margin-bottom: 10px;">대표 사진</label><br>
					<div class="imgArea">
						<img class="gymImage" id="updateImg1">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymUpdateImg1" name="gymUpdateImg1" onchange="LoadUpdateImg(this, 1)">
						<label class="custom-file-label" for="gymUpdateImg1">파일선택</label>
					</div>
					<button type="button" class="btn btn-default cancelbtn" onclick="deleteUpdateImg(1)">취소</button>
					<button type="button" id="deleteFile1" class="btn btn-danger cancelbtn" >파일 삭제</button>  	
					<label style="display: block; margin-bottom: 10px;">일반 사진</label>
					<div class="imgArea">
						<img class="gymImage" id="updateImg2">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymUpdateImg2" name="gymUpdateImg2" onchange="LoadUpdateImg(this, 2)">
						<label class="custom-file-label" for="gymUpdateImg2">파일선택</label>
					</div>
					<button type="button" class="btn btn-default cancelbtn" onclick="deleteUpdateImg(2)">취소</button>
					<button type="button" id="deleteFile2" class="btn btn-danger cancelbtn" >파일 삭제</button>
					<div class="imgArea">
						<img class="gymImage" id="updateImg3">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymUpdateImg3" name="gymUpdateImg3" onchange="LoadUpdateImg(this, 3)">
						<label class="custom-file-label" for="gymUpdateImg3">파일선택</label>
					</div>
					<button type="button" class="btn btn-default cancelbtn" onclick="deleteUpdateImg(3)">취소</button>
					<button type="button" id="deleteFile3" class="btn btn-danger cancelbtn" >파일 삭제</button>
					<br>
					<div class="imgArea">
						<img class="gymImage" id="updateImg4">
					</div>
					<div class="custom-file d-inline-block align-bottom" style="width: 200px;">
						<input type="file" class="custom-file-input" id="gymUpdateImg4" name="gymUpdateImg4" onchange="LoadUpdateImg(this, 4)">
						<label class="custom-file-label" for="gymUpdateImg4">파일선택</label>
					</div>
					<button type="button" class="btn btn-default cancelbtn" onclick="deleteUpdateImg(4)">취소</button>
					<button type="button" id="deleteFile4" class="btn btn-danger cancelbtn" >파일 삭제</button>
					
					<br> <label for="inlineRadio1">강습</label><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="edu_yn" id="eduY" value="유">
						<label class="form-check-label" for="eduY">유</label>
					</div>
					<div class="form-check form-check-inline" style="margin-left: 14px;">
						<input class="form-check-input" type="radio" name="edu_yn" id="eduN" value="무">
						<label class="form-check-label" for="eduN">무</label>
					</div>
					<br> <label for="inlineRadio3">장소</label><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="in_out" id="in_outIn" value="실내">
						<label class="form-check-label" for="in_outIn">실내</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="in_out" id="in_outOut" value="실외">
						<label class="form-check-label" for="in_outOut">실외</label>
					</div>
					<br> <label for="inlineRadio5">방역도</label><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="covid1" value="1">
						<label class="form-check-label" for="covid1">1</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="covid2" value="2">
						<label class="form-check-label" for="covid2">2</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="covid3" value="3">
						<label class="form-check-label" for="covid3">3</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="covid4" value="4">
						<label class="form-check-label" for="covid4">4</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="covid" id="covid5" value="5">
						<label class="form-check-label" for="covid5">5</label>
					</div>
					<input type="hidden" id="hiddenImg1" name="hiddenImgs" value="0">
					<input type="hidden" id="hiddenImg2" name="hiddenImgs" value="0">
					<input type="hidden" id="hiddenImg3" name="hiddenImgs" value="0">
					<input type="hidden" id="hiddenImg4" name="hiddenImgs" value="0"> <!-- 초기값을 0을 주고 변경될 때만 1로 바꿈 -->
					<input type="hidden" id="checkUpload1" name="checkUpload">
					<input type="hidden" id="checkUpload2" name="checkUpload">
					<input type="hidden" id="checkUpload3" name="checkUpload">
					<input type="hidden" id="checkUpload4" name="checkUpload">
					
					
					<br>
				</div>
				<div class="modal-footer">
					<button class="btn btn-lg btn-inline-block" type="submit" style="background-color: #00B1D2; color: white; width: 250px; margin-top: 0px">등록 완료</button>
					<button class="btn btn-lg btn-block btn-secondary" onclick="deleteAllImg();" data-dismiss="modal" aria-label="Close" type="reset" style= "width: 250px; margin-top: 0px;">취소</button>
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
	function LoadUpdateImg(value, num) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				switch (num) {
					case 1 :
						console.log(e.target.result);
						$("#updateImg1").attr("src", e.target.result);
						$("#updateImg1").show();
						break;
					case 2 :
						$("#updateImg2").attr("src", e.target.result);
						$("#updateImg2").show();
						break;
					case 3 :
						$("#updateImg3").attr("src", e.target.result);
						$("#updateImg3").show();
						break;
					case 4 :
						$("#updateImg4").attr("src", e.target.result);
						$("#updateImg4").show();
						break;
				}
			}
			reader.readAsDataURL(value.files[0]); // 입력 중 0번째에 있는 것을 들어가게 하겠다. (첨부 파일로 여러 개가 들어가도 1개만 들어가기 처리)
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

	function deleteUpdateImg(num) {
		$('#gymUpdateImg' + num).val('');
		$('#updateImg'+num).hide();
	}
	
	
	$(function() {
		var deleteGNo;
		
		$('#listTable td:not(.checkBoxes, .detail)').click(function() { 
			
			var gNo = $(this).parent().children().eq(1).text();
			deleteGNo = $(this).parent().children().eq(1).text();
			
			var changeName = [];
			
			$.ajax({
				url: 'gymUpdateForm.do',
				type: 'get',
				async: false,
				data: {gNo : gNo},
				success: function(data) {
					console.log(data);
					for(var i in data) {
						if(i == 0) {
							for (var key in data[i]) {
								var updateGNo = data[i][key].G_NO;	
								var gymName = data[i][key].G_NAME;
								var gymType = data[i][key].G_TYPE_NM;
								var gymAddr = data[i][key].G_ADDRESS;
								var gymTel = data[i][key].G_TEL;
								var gymHomepage = data[i][key].G_HOMEPAGE;
								var gymParking = data[i][key].G_PARKING_LOT;
								var gymBigo = data[i][key].G_BIGO;
								var gymEduYN = data[i][key].G_EDU_YN;
								var gymInOut = data[i][key].G_IN_OUT;
								var gymCovid = data[i][key].G_COVID;
								
							}
						} else {
							for (var key in data[i]) {
								if(key == 0) {
									var thumbnail = data[i][key].gChangeName;
									var originNo1 = data[i][key].gFileNo;
								} else if (key != null && key == 1) {
									var image1 = data[i][key].gChangeName;
									var originNo2 = data[i][key].gFileNo;
								} else if (key != null && key == 2) {
									var image2 = data[i][key].gChangeName;
									var originNo3 = data[i][key].gFileNo;
								} else if (key != null && key == 3) {
									var image3 = data[i][key].gChangeName;
									var originNo4 = data[i][key].gFileNo;
								}
							}	
						}
					}
					$('#gymUpdateModal').modal("show");
					$('#gymUpdateNo').val(updateGNo)
					$('#gymUpdateName').val(gymName);
					$('#gymUpdateType').val(gymType);
					$('#gymUpdateAddr').val(gymAddr);
					$('#gymUpdateTel').val(gymTel);
					$('#gymUpdateHomepage').val(gymHomepage);
					$('#gymUpdateParking').val(gymParking);
					$('#gymUpdateBigo').val(gymBigo);
					
/*					if(originNo1) {
						console.log(originNo1);
						$('#deleteFile1').show();
						$('#deleteFile1').unbind('click').bind('click', function() { // unbind를 해줘야 중복 실행 방지된다
							if(window.confirm("정말 삭제하시겠습니까?")) { // yes일 때만 ajax
								$.ajax({
									url : 'FileDelete.Gym',
									data : {fileNo : originNo1},
									async : false,
									success : function(data) {
										if(data != '0') {
											deleteUpdateImg(1);
											console.log("파일삭제 result : " + data);
											window.alert('파일 삭제가 완료되었습니다');
										} else {
											window.alert('파일 삭제에 실패하였습니다');	
										}
									},
									error : function(data) {
										window.alert('서버 접속 실패');
									}
								});
							} 
						});
					} else {
						$('#deleteFile1').hide();
					} */
					
					$('#deleteFile1').unbind('click').bind('click', function() { // unbind를 해줘야 중복 실행 방지된다
						window.alert("대표 사진은 삭제가 불가능합니다.");
					});
					
					if(originNo2) {
						console.log(originNo2);
						$('#deleteFile2').show();
						$('#deleteFile2').unbind('click').bind('click', function() { // unbind를 해줘야 중복 실행 방지된다
							if(window.confirm("정말 삭제하시겠습니까?")) { // yes일 때만 ajax
								$.ajax({
									url : 'FileDelete.Gym',
									data : {fileNo : originNo2},
									async : false,
									success : function(data) {
										if(data != '0') {
											deleteUpdateImg(2);
											console.log("파일삭제 result : " + data);
											window.alert('파일 삭제가 완료되었습니다');
										} else {
											window.alert('파일 삭제에 실패하였습니다');	
										}
									},
									error : function(data) {
										window.alert('서버 접속 실패');
									}
								});
							} 
						});
					} else {
						$('#deleteFile2').hide();
					}
					
					if(originNo3) {
						console.log(originNo3);
						$('#deleteFile3').show();
						$('#deleteFile3').unbind('click').bind('click', function() { // unbind를 해줘야 중복 실행 방지된다
							if(window.confirm("정말 삭제하시겠습니까?")) { // yes일 때만 ajax
								$.ajax({
									url : 'FileDelete.Gym',
									data : {fileNo : originNo3},
									async : false,
									success : function(data) {
										if(data != '0') {
											deleteUpdateImg(3);
											console.log("파일삭제 result : " + data);
											window.alert('파일 삭제가 완료되었습니다');
										} else {
											window.alert('파일 삭제에 실패하였습니다');	
										}
									},
									error : function(data) {
										window.alert('서버 접속 실패');
									}
								});
							} 
						});
					} else {
						$('#deleteFile3').hide();
					}
					
					if(originNo4) {
						console.log(originNo4);
						$('#deleteFile4').show();
						$('#deleteFile4').unbind('click').bind('click', function() { // unbind를 해줘야 중복 실행 방지된다
							if(window.confirm("정말 삭제하시겠습니까?")) { // yes일 때만 ajax
								$.ajax({
									url : 'FileDelete.Gym',
									data : {fileNo : originNo4},
									async : false,
									success : function(data) {
										if(data != '0') {
											deleteUpdateImg(4);
											console.log("파일삭제 result : " + data);
											window.alert('파일 삭제가 완료되었습니다');
										} else {
											window.alert('파일 삭제에 실패하였습니다');	
										}
									},
									error : function(data) {
										window.alert('서버 접속 실패');
									}
								});
							} 
						});
					} else {
						$('#deleteFile4').hide();
					}
					
					
					if(thumbnail != null) { // thumbnail엔 gchange네임을 담음
						$('#updateImg1').attr("src", "<%=cp2%>/gym_uploadFiles/" + thumbnail);
						$('#updateImg1').show();
						
						$('#gymUpdateImg1').on("change", function() {
							$('#hiddenImg1').val(originNo1); // 전달받은 파일넘버를 input type hidden에 담는다
						});
					} else {
						$('#hiddenImg1').val('-1');
						$('#updateImg1').hide();
					}
					
					if(image1 != null) {
						$('#updateImg2').attr("src", "<%=cp2%>/gym_uploadFiles/" + image1);
						$('#updateImg2').show();
						
						$('#gymUpdateImg2').on("change", function() {
							$('#hiddenImg2').val(originNo2); 
						});
					} else {
						$('#gymUpdateImg2').on("change", function() {
							$('#hiddenImg2').val('-1');
						});
						$('#updateImg2').hide();
					} 
					
					if (image2 != null) {
						$('#updateImg3').attr("src", "<%=cp2%>/gym_uploadFiles/" + image2);
						$('#updateImg3').show();
						$('#gymUpdateImg3').on("change", function() {
							$('#hiddenImg3').val(originNo3); 
						});
					} else {
						$('#gymUpdateImg3').on("change", function() {
							$('#hiddenImg3').val('-1');
						});
						$('#updateImg3').hide();
					} 
					
					if (image3 != null) {
						$('#updateImg4').attr("src", "<%=cp2%>/gym_uploadFiles/" + image3);
						$('#updateImg4').show();
						$('#gymUpdateImg4').on("change", function() {
							$('#hiddenImg4').val(originNo4); 
						});
					} else {
						$('#gymUpdateImg4').on("change", function() {
							$('#hiddenImg4').val('-1');
						});
						$('#updateImg4').hide();
					}
					
					
					if(gymEduYN == "유") {
						$('#eduY').attr("checked", true);
					} else {
						$('#eduN').attr("checked", true);
					}
					
					if(gymInOut == "실내") {
						$("#in_outIn").attr("checked", true);
					} else {
						$("#in_outOut").attr("checked", true);
					}
					
					switch(gymCovid) {
						case 1 : $('#covid1').attr("checked", true); break;
						case 2 : $('#covid2').attr("checked", true); break;
						case 3 : $('#covid3').attr("checked", true); break;
						case 4 : $('#covid4').attr("checked", true); break;
						case 5 : $('#covid5').attr("checked", true); break;
					}
				},
			});
		});
	});
	
		$('#gymUpdateImg1').on("change", function() {
			$('#checkUpload1').val('1');
		});
		$('#gymUpdateImg2').on("change", function() {
			$('#checkUpload2').val('2');
		});
		$('#gymUpdateImg3').on("change", function() {
			$('#checkUpload3').val('3');
		});
		$('#gymUpdateImg4').on("change", function() {
			$('#checkUpload4').val('4');
		});
	
</script>
</html>