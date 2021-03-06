<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	margin: 20px 15px 30px 15px;
}

#locationTable td{
	width:100px;
 	text-align: left;
}

#locationTable input{
	display: inline-block;
	margin-right: 3px;
	margin-left: 0px;
}

#locationTable label{
	margin: 0px;
}

.fieldsetTable {
	margin: 20px auto 30px auto;
	border-spacing: 30px;
	border-collapse: separate;
}

#resultFieldset span{
	font-size: 18px;
}

</style>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row justify-content-center">
					<div class="col-11 p-0 mb-2">
						<form id="form">
<!-- 								<ul id="progressbar"> -->
<!-- 									<li class="active" id="step1"><strong>Step 1</strong></li> -->
<!-- 									<li id="step2"><strong>Step 2</strong></li> -->
<!-- 									<li id="step3"><strong>Step 3</strong></li> -->
<!-- 									<li id="step4"><strong>Step 4</strong></li> -->
<!-- 									<li id="step5"><strong>Step 5</strong></li> -->
<!-- 									<li id="step6"><strong>Step 6</strong></li> -->
<!-- 								</ul> -->
							<div class="progress mt-3">
								<div class="progress-bar"></div>
							</div>
							<br>
							<fieldset class="fieldset">
								<h4>????????? ?????????????????? (??????3???)</h4>
								<table id="locationTable">
									<tr>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l1">
											<label for="l1">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="??????" id="l2">
											<label for="l2">??????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l3">
											<label for="l3">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l4">
											<label for="l4">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l5">
											<label for="l5">?????????</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" name="location" value="????????????" id="l6">
											<label for="l6">????????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l7">
											<label for="l7">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l8">
											<label for="l8">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l9">
											<label for="l9">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l10">
											<label for="l10">?????????</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l11">
											<label for="l11">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l12">
											<label for="l12">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="????????????" id="l13">
											<label for="l13">????????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l14">
											<label for="l14">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l15">
											<label for="l15">?????????</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l16">
											<label for="l16">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l17">
											<label for="l17">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l18">
											<label for="l18">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="????????????" id="l19">
											<label for="l19">????????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l20">
											<label for="l20">?????????</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l21">
											<label for="l21">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l22">
											<label for="l22">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l23">
											<label for="l23">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l24">
											<label for="l24">?????????</label>
										</td>
										<td>
											<input type="checkbox" name="location" value="?????????" id="l25">
											<label for="l25">?????????</label>
										</td>
									</tr>
								</table>
								<input type="button" name="next-step" class="next-step" value="??????" />
							</fieldset>
							<fieldset class="fieldset">
								<h4>???????????? ??????????????? ????????????????</h4>
								<div>
									<table class="fieldsetTable">
										<tr>
											<td><img src="<%= request.getContextPath() %>/image/rImage/swimming.png" height="60px;"></td>
											<td><img src="<%= request.getContextPath() %>/image/rImage/tennis.png" height="60px;"></td>
										</tr>
										<tr>
											<td>
												<input type="radio" name="inout" id="in" value="??????" />
												<label for="in">??????</label>
											</td>
											<td>
												<input type="radio" name="inout" id="out" value="??????" />
												<label for="out">??????</label>
											</td>
										</tr>
									</table>
								</div>
								<input type="button" name="next-step" class="next-step" value="??????" />
								<input type="button" name="previous-step" class="previous-step" value="??????" />
							</fieldset>
							<fieldset class="fieldset">
								<h4>??????????????? ??????????????? <br>????????? ????????? ????????????????</h4>
								<div>
									<table class="fieldsetTable">
											<tr>
												<td><img src="<%= request.getContextPath() %>/image/rImage/golf.png" height="60px;"></td>
												<td><img src="<%= request.getContextPath() %>/image/rImage/football.png" height="60px;"></td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="gymType" id="alone" value="??????" required>
													<label for="alone">??????</label>
												</td>
												<td>
													<input type="radio" name="gymType" id="together" value="??????">
													<label for="together">??????</label>
												</td>
											</tr>
									</table>
								</div>
								<input type="button" name="next-step" class="next-step" value="??????" />
								<input type="button" name="previous-step" class="previous-step" value="??????" />
							</fieldset>
							<fieldset class="fieldset">
								<h4>????????? ?????? ????????????????</h4>
								<div>
									<table class="fieldsetTable">
											<tr>
												<td><img src="<%= request.getContextPath() %>/image/rImage/coach.png" height="60px;"></td>
												<td><img src="<%= request.getContextPath() %>/image/rImage/nocoach.png" height="60px;"></td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="lecture" id="lYes" value="???">
													<label for="lYes">????????????</label>
												</td>
												<td>
													<input type="radio" name="lecture" id="lNo" value="???">
													<label for="lNo">??????????????????</label>
												</td>
											</tr>
									</table>
								</div>
								<input type="button" name="next-step" class="next-step" value="??????" />
								<input type="button" name="previous-step" class="previous-step" value="??????" />
							</fieldset>
							<fieldset class="fieldset">
								<h4>????????? ???????????????????</h4>
								<div>
									<table class="fieldsetTable">
											<tr>
												<td><img src="<%= request.getContextPath() %>/image/rImage/parking.png" height="60px;"></td>
												<td><img src="<%= request.getContextPath() %>/image/rImage/noparking.png" height="60px;"></td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="parking" id="pYes" value="???">
													<label for="pYes">????????????</label>
												</td>
												<td>
													<input type="radio" name="parking" id="pNo" value="???">
													<label for="pNo">??????????????????</label>
												</td>
											</tr>
									</table>
									
								</div>
								<input type="button" name="next-step" class="next-step" id="finishBtn" value="??????" />
								<input type="button" name="previous-step" class="previous-step" value="??????" />
							</fieldset>
							<fieldset class="fieldset" id="resultFieldset">
								<div id="nameDiv">
									<h4>?????? ?????? ???</h4>
									<span id="userName"></span><span>?????? ???????????????</span>
									<span class="userLike"></span><span>?????? ?????????</span><br>
									<span style="font-size: 15px; color: gray;">???????????? ?????? ?????????????????? ???????????????</span>
									<table id="resultTable" style="margin: 10px auto auto auto"></table>
								</div>
								<div style="margin-top: 40px; margin-bottom: 50px;">
									<h4>?????? ?????? ???</h4>
									<span class="userLike"></span><span>??? ????????? ???????????????</span>
									<table id="otherTable" style="margin: 10px auto auto auto"></table>							
								</div>
								<input type="button" name="previous-step" class="previous-step" value="??????" />
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 			<div class="modal-footer"> -->
<!-- 				<button type="button" class="btn btn-default btn-prev">Prev</button> -->
<!-- 				<button type="button" class="btn btn-default btn-next">Next</button> -->
<!-- 				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 			</div> -->
	
	<script>
	$(document).ready(function() {
	    var currentGfgStep, nextGfgStep, previousGfgStep;
	    var opacity;
	    var current = 1;
	    var steps = $("fieldset").length;
	  
	    setProgressBar(current);
	  	
	    $(".next-step").click(function() {
	        currentGfgStep = $(this).parent();
	        nextGfgStep = $(this).parent().next();
	  
// 	        $("#progressbar li").eq($("fieldset").index(nextGfgStep)).addClass("active");
	  
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
	  
	    $(".previous-step").click(function() {
	  
	        currentGfgStep = $(this).parent();
	        previousGfgStep = $(this).parent().prev();
	  
	        $("#progressbar li").eq($("fieldset").index(currentGfgStep)).removeClass("active");
	  
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
	        $(".progress-bar").css("width", percent + "%")
	    }
	  
	    $(".submit").click(function() {
	        return false;
	    })
	});

	$('#finishBtn').on('click', function(){
		var locationArr = new Array();
	    $("input[name='location']:checked").each(function(e){
	        var value = $(this).val();
	        locationArr.push(value); 
	    });
	    
	    var location = locationArr.toString();
		var inout = $("input[name=inout]:checked").val();
		var gymType = $("input[name=gymType]:checked").val();
		var lecture = $("input[name=lecture]:checked").val();
		var parking = $("input[name=parking]:checked").val();
		
		if(location == null || inout == null || gymType == null || lecture == null || parking == null){
			alert('?????? ????????? ??????????????????');
		} else {
			
		    var allData = {"userLike":userLike, "userName":userName, "location":location, "inout":inout, "gymType":gymType, "lecture":lecture, "parking":parking};
			
			$.ajax({
				url: '<%= request.getContextPath() %>/recommend.me',
				data: allData,
				success: function(data){
					console.log(data);
					
					$('#userName').text(userName);
					$('.userLike').text(userLike).css({'color':'#00B1D2'});
					
					var $resultTable = $('#resultTable');
					$resultTable.html('');
					var $otherTable = $('#otherTable');
					$otherTable.html('');
					var $nameDiv = $('#nameDiv');
					
					var j = 1;
					var k = 1;
					for(var i=0; i<data.length; i++){
						var gymName = data[i].gName;
						var gymType = data[i].gTypeName;
						var gymNo = data[i].gNo;
	
						var $resultTr = $('<tr>').css({'height':'40px', 'border-bottom':'0.5px dashed gray'});
						var $otherTr = $('<tr>').css({'height':'40px', 'border-bottom':'0.5px dashed gray'});
						var check = gymType.includes(userLike);
						
						if(check){
							$num = $('<td>').text(k++).css('width', '30px');
							$name = $('<td>').text(gymName).css({'text-align':'left'});
							$no = $('<input type="hidden" value=' + gymNo + '>');
							
							$resultTr.append($num);
							$resultTr.append($name);
							$resultTr.append($no);
							
							$resultTable.append($resultTr);
						} else {
							$otherNum = $('<td>').text(j++).css('width', '30px');
							$otherName = $('<td>').text(gymName).css('text-align', 'left');
							$otherNo = $('<input type="hidden" value=' + gymNo + '>');
							
							$otherTr.append($otherNum);
							$otherTr.append($otherName);
							$otherTr.append($otherNo);
							
							$otherTable.append($otherTr);
						}
						
						$('#resultTable td, #otherTable td').mouseenter(function(){
				   			$(this).parent().css({'cursor':'pointer', 'color':'#00B1D2'});
				   			
				   			var gNo = $(this).parent().children('input').val();
				   			console.log(gNo + " : ?????? ??????");
				   		}).mouseout(function(){
				   			$(this).parent().css({'color':'black'});
				   		}).click(function(){
							var gNo = $(this).parent().children('input').val();
				   			
				   			window.location.href="<%= request.getContextPath() %>/detail.do?gNo="+gNo; 
				   		})
					}
				},
				error: function(data){
					console.log('??????');
				}
			});
		}
		
	});
	
	</script>
</body>
</html>