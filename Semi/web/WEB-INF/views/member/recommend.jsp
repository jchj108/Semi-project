<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

#form {
    text-align: center;
    position: relative;
}
  
#form fieldset {
    background: white;
    border: 0 none;
    border-radius: 0.5rem;
    box-sizing: border-box;
    width: 100%;
    margin: 0;
    padding-bottom: 20px;
    position: relative
}
  
.finish {
    text-align: center
}
  
#form fieldset:not(:first-of-type) {
     display: none
}
  
#form .previous-step, .next-step {
    width: 100px;
    font-weight: bold;
    color: white;
    border: 0 none;
	border-radius: 10px;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 5px 10px 0px;
    float: right;
}
  
.form, .previous-step {
     background: #C0C0C0;
}
  
.form, .next-step {
	background-color: #00B1D2;
}
  
#form .previous-step:hover,
#form .previous-step:focus {
/*     background-color: #000000 */
}
  
#form .next-step:hover,
#form .next-step:focus {
/*     background-color: lightgray; */
}
  
.text {
    color: #2F8D46;
    font-weight: normal
}
  
#progressbar {
    margin-bottom: 30px;
    overflow: hidden;
    color: lightgrey
}
  
#progressbar .active {
    color: #2F8D46
}
  
#progressbar li {
    list-style-type: none;
    font-size: 15px;
    width: 25%;
    float: left;
    position: relative;
    font-weight: 400
}
  
#progressbar #step1:before {
    content: "1"
}
  
#progressbar #step2:before {
    content: "2"
}
  
#progressbar #step3:before {
    content: "3"
}
  
#progressbar #step4:before {
    content: "4"
}

#progressbar #step5:before {
    content: "5"
}

#progressbar #step6:before {
    content: "6"
}
  
#progressbar li:before {
    width: 50px;
    height: 50px;
    line-height: 45px;
    display: block;
    font-size: 20px;
    color: #ffffff;
    background: lightgray;
    border-radius: 50%;
    margin: 0 auto 10px auto;
    padding: 2px
}
  
#progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    background: lightgray;
    position: absolute;
    left: 0;
    top: 25px;
    z-index: -1;
}
  
#progressbar li.active:before,
#progressbar li.active:after {
    background: #2F8D46;
}
  
.progress {
    height: 20px
}
  
.progress-bar {
     background-color: #00B1D2
}

#locationTable{
    margin: 30px 20px 20px 20px;
}

#locationTable td {
	width: 100px;
	text-align: left;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
<!-- 				<h4 class="modal-title" id="myModalLabel">Modal title 1</h4> -->
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row justify-content-center">
					<div class="col-11 text-center p-0 mb-2">
						<div class="px-0 pt-4">
							<form id="form">
<!-- 								<ul id="progressbar"> -->
<!-- 									<li class="active" id="step1"><strong>Step 1</strong></li> -->
<!-- 									<li id="step2"><strong>Step 2</strong></li> -->
<!-- 									<li id="step3"><strong>Step 3</strong></li> -->
<!-- 									<li id="step4"><strong>Step 4</strong></li> -->
<!-- 									<li id="step5"><strong>Step 5</strong></li> -->
<!-- 									<li id="step6"><strong>Step 6</strong></li> -->
<!-- 								</ul> -->
								<div class="progress">
									<div class="progress-bar"></div>
								</div>
								<br>
								<fieldset>
									<h4>지역을 선택해주세요 (최대3개)</h4>
									<table id="locationTable">
										<tr>
											<td>
												<input type="checkbox" name="location" value="종로구" id="l1">
												<label for="l1">종로구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="중구" id="l2">
												<label for="l2">중구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="용산구" id="l3">
												<label for="l3">용산구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="성동구" id="l4">
												<label for="l4">성동구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="광진구" id="l5">
												<label for="l5">광진구</label>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" name="location" value="동대문구" id="l6">
												<label for="l6">동대문구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="중랑구" id="l7">
												<label for="l7">중랑구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="성북구" id="l8">
												<label for="l8">성북구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="강북구" id="l9">
												<label for="l9">강북구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="도봉구" id="l10">
												<label for="l10">도봉구</label>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" name="location" value="노원구" id="l11">
												<label for="l11">노원구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="은평구" id="l12">
												<label for="l12">은평구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="서대문구" id="l13">
												<label for="l13">서대문구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="마포구" id="l14">
												<label for="l14">마포구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="양천구" id="l15">
												<label for="l15">양천구</label>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" name="location" value="강서구" id="l16">
												<label for="l16">강서구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="구로구" id="l17">
												<label for="l17">구로구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="금천구" id="l18">
												<label for="l18">금천구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="영등포구" id="l19">
												<label for="l19">영등포구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="동작구" id="l20">
												<label for="l20">동작구</label>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" name="location" value="관악구" id="l21">
												<label for="l21">관악구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="서초구" id="l22">
												<label for="l22">서초구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="강남구" id="l23">
												<label for="l23">강남구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="송파구" id="l24">
												<label for="l24">송파구</label>
											</td>
											<td>
												<input type="checkbox" name="location" value="강동구" id="l25">
												<label for="l25">강동구</label>
											</td>
										</tr>
									</table>
									<input type="button" name="next-step" class="next-step" value="다음" />
								</fieldset>
								<fieldset>
									<h4>어디에서 운동하기를 원하시나요?</h4>
									<div>
										<input type="radio" name="inout" id="in" value="실내">
										<label for="in">실내</label>
										<input type="radio" name="inout" id="out" value="실외">
										<label for="out">실외</label>
									</div>
									<input type="button" name="next-step" class="next-step" value="다음" />
									<input type="button" name="previous-step" class="previous-step" value="이전" />
								</fieldset>
								<fieldset>
									<h4>혼자하기를 원하시나요 단체로 하기를 원하시나요?</h4>
									<div>
										<input type="radio" name="gymType" id="alone" value="개인">
										<label for="alone">개인</label>
										<input type="radio" name="gymType" id="together" value="단체">
										<label for="together">단체</label>
									</div>
									<input type="button" name="next-step" class="next-step" value="다음" />
									<input type="button" name="previous-step" class="previous-step" value="이전" />
								</fieldset>
								<fieldset>
									<h4>강습을 듣고 싶으시나요?</h4>
									<div>
										<input type="radio" name="lecture" id="lYes" value="유">
										<label for="lYes">강습희망</label>
										<input type="radio" name="lecture" id="lNo" value="무">
										<label for="lNo">강습희망하지않음</label>
									</div>
									<input type="button" name="next-step" class="next-step" value="다음" />
									<input type="button" name="previous-step" class="previous-step" value="이전" />
								</fieldset>
								<fieldset>
									<h4>주차가 필요하시나요?</h4>
									<div>
										<input type="radio" name="parking" id="pYes" value="유">
										<label for="pYes">주차필요</label>
										<input type="radio" name="parking" id="pNo" value="무">
										<label for="pNo">주차필요하지않음</label>
									</div>
									<input type="button" name="next-step" class="next-step" id="finishBtn" value="다음" />
									<input type="button" name="previous-step" class="previous-step" value="이전" />
								</fieldset>
								<fieldset>
									<div class="finish">
										<h2 class="text text-center">
											<strong>FINISHED</strong>
										</h2>
									</div>
									<input type="button" name="previous-step" class="previous-step" value="이전" />
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
<!-- 			<div class="modal-footer"> -->
<!-- 				<button type="button" class="btn btn-default btn-prev">Prev</button> -->
<!-- 				<button type="button" class="btn btn-default btn-next">Next</button> -->
<!-- 				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 			</div> -->
		</div>
	</div>
	<script>
	$(document).ready(function () {
	    var currentGfgStep, nextGfgStep, previousGfgStep;
	    var opacity;
	    var current = 1;
	    var steps = $("fieldset").length;
	  
	    setProgressBar(current);
	  
	    $(".next-step").click(function () {
	  
	        currentGfgStep = $(this).parent();
	        nextGfgStep = $(this).parent().next();
	  
	        $("#progressbar li").eq($("fieldset")
	            .index(nextGfgStep)).addClass("active");
	  
	        nextGfgStep.show();
	        currentGfgStep.animate({ opacity: 0 }, {
	            step: function (now) {
	                opacity = 1 - now;
	  
	                currentGfgStep.css({
	                    'display': 'none',
	                    'position': 'relative'
	                });
	                nextGfgStep.css({ 'opacity': opacity });
	            },
	            duration: 500
	        });
	        setProgressBar(++current);
	    });
	  
	    $(".previous-step").click(function () {
	  
	        currentGfgStep = $(this).parent();
	        previousGfgStep = $(this).parent().prev();
	  
	        $("#progressbar li").eq($("fieldset")
	            .index(currentGfgStep)).removeClass("active");
	  
	        previousGfgStep.show();
	  
	        currentGfgStep.animate({ opacity: 0 }, {
	            step: function (now) {
	                opacity = 1 - now;
	  
	                currentGfgStep.css({
	                    'display': 'none',
	                    'position': 'relative'
	                });
	                previousGfgStep.css({ 'opacity': opacity });
	            },
	            duration: 500
	        });
	        setProgressBar(--current);
	    });
	  
	    function setProgressBar(currentStep) {
	        var percent = parseFloat(100 / steps) * current;
	        percent = percent.toFixed();
	        $(".progress-bar")
	            .css("width", percent + "%")
	    }
	  
	    $(".submit").click(function () {
	        return false;
	    })
	});

	$('#finishBtn').on('click', function(){
		var locationArr = new Array();
	    $("input[name='location']:checked").each(function(e){
	        var value = $(this).val();
	        locationArr.push(value); 
	    });
	    
// 	    console.log(locationArr + " : 위치");
// 	    console.log(typeof locationArr);
	    
	    var location = locationArr.toString();
	    console.log(typeof location);
		
		var inout = $("input[name=inout]:checked").val();
		var gymType = $("input[name=gymType]:checked").val();
		var lecture = $("input[name=lecture]:checked").val();
		var parking = $("input[name=parking]:checked").val();
		
	    var allData = {"location":location, "inout":inout, "gymType":gymType, "lecture":lecture, "parking":parking};
		
		$.ajax({
			url: '<%= request.getContextPath() %>/recommend.me',
// 			type: 'get',
			data: allData,
			success: function(data){
				console.log('성공');
			},
			error: function(data){
				console.log('실패');
			}
		});
		
	});
	
	</script>
</body>
</html>