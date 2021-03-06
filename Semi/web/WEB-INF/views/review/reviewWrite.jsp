<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gym.model.vo.*, java.util.*"%>
<%
	Gym g = (Gym)request.getAttribute("g");
	ArrayList<GFile> fList= (ArrayList)request.getAttribute("fList");
	int gNo = g.getG_NO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"
	  rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	* {font-family: 'Noto Sans KR';}
	
	.category-title{
		font-size: 20px;
		font-weight: bold;
	}
	
	.list-group{
		width: 230px;
		padding-top: 40px;
	}
	
	.list-group img{
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.review-box{
		width: 90%;
		margin: 20px 0px 20px 20px;
		padding: 15px;
	}
	
	.section{
		margin: 20px 5px 15px 5px;
	}
	
	.title{
		width: 130px;
		margin-left: 5px;
		display: inline-block;
		vertical-align: top;
		padding-top: 2px;
	}
	
	.score-box{
		display: inline-block;
	}
	
	.rating-box{
		width: 320px;
		padding: 3px;
		margin-bottom: 5px;
		border: 1px solid lightgray;
		border-radius: 5px;
	}
	
	.rating-box-name{
		display: inline-block;
		margin: 0px 0px 0px 5px;
		width: 20%;
	}
		
	.score_star{
		cursor: pointer;
		display: inline-block;
		width: 70%;
		text-align: right;
	}
	
	.description{
/* 		display: inline-block; */
		margin: 5px 0px 8px 5px;
	}
	
	.div-keyword{
		text-align: center;
		margin: 5px 10px 10px 10px;
	}
	
	.div-keyword>input[type=checkbox]{
		margin: 0px 10px 0px 10px;
	}

	.button-register{
		text-align: center;
		margin: 30px 30px 30px 30px;
	}
	
	.button-keyword{
		margin-left: 8px;
		background-color: #00B1D2;
		color: white;
		border-radius: 5px;
	}
	
	.enrollBtn{
		padding: 5px 20px 5px 20px;
		margin-left: 5px;
		background-color: #00B1D2;
		color: white;
		border-radius: 10px;
		background-color: #00B1D2;
	}
	
	.writeCancleBtn{
		padding: 5px 20px 5px 20px;
		margin-right: 5px;
		background-color: white;
		color: #00B1D2;
		border-radius: 10px;
	}
	
	.image_swiper div{
	  display: inline-block;
	  width: 105px;
	  height: 105px;
 	  z-index: 1;
	}
	
	.image_swiper div input[type=file]{
	  display: none;
	}
	
	.image_swiper div label{
	  display: inline-block;
	  margin-left: 5px;
	  width: 105px;
	  height: 105px;
	  background: url("<%= request.getContextPath() %>/image/add.png") no-repeat center;
	  background-size: 30px;
	  border: 1px dashed lightgray; 
 	  z-index: 0;
	}
	
	.image_swiper div label:hover{
	  cursor: pointer;
 	}
	
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="list-group list-group-flush text-center ml-5">
					<div class="list-group-item category-title"><%= g.getG_NAME() %><br>????????????</div>
					<div class="list-group-item">
						<img src="<%= request.getContextPath() %>/gym_uploadFiles/<%= fList.get(0).getgChangeName() %>">
					</div>
					<div class="list-group-item">
						<%= g.getG_ADDRESS() %><br>
						<% if(g.getG_TEL() != null) {%>
						<%= g.getG_TEL() %>
						<% } %>
					</div>
				</div>
			</div>
	
			<div class="col-lg-7" style="margin-left: 20px;">
				<form class="review-box" id="reviewForm" action="<%= request.getContextPath() %>/reviewWrite.re" method="post" encType="multipart/form-data">
					<input type="hidden" name="gNo" value="<%= gNo %>">
					<div class="section">
						<div class="title">
							<strong>?????? ??????</strong>
						</div>
						<div class="score-box">
							<div class="rating-box">
								<div class="rating-box-name">??????</div>
								<input type="hidden" name="totalStar" id="totalStar">
								<div class="score_star" id="totalStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>????????? ??????</strong>
						</div>
	
						<div class="score-box">
							<div class="rating-box">
								<div class="rating-box-name">??????</div>
								<input type="hidden" name="facilityStar">
								<div class="score_star" id="facilityStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</div>
							<div class="rating-box">
								<div class="rating-box-name">??????</div>
								<input type="hidden" name="instructorStar">
								<div class="score_star" id="instructorStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</div>
							<div class="rating-box">
								<div class="rating-box-name">?????????</div>
								<input type="hidden" name="serviceStar">
								<div class="score_star" id="serviceStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</div>
							<div class="rating-box">
								<div class="rating-box-name">??????</div>
								<input type="hidden" name="priceStar">
								<div class="score_star" id="priceStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i> <i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>?????? ?????????</strong>
						</div>
						<div class="description">??? ??????????????? ?????? ??????????????? ???????????????? (??????????????????)</div>
						<div>
							<div class="text-center div-addKeyword">
								<input type="checkbox" name="keyword" id="keyword1" value="????????? ??????">
								<label for="keyword1">????????? ??????</label>&nbsp;
								<input type="checkbox" name="keyword" id="keyword2" value="?????? ??????">
								<label for="keyword2">?????? ??????</label>&nbsp;
								<input type="checkbox" name="keyword" id="keyword3" value="??????">
								<label for="keyword3">??????</label>&nbsp;
								<input type="checkbox" name="keyword" id="keyword4" value="????????????">
								<label for="keyword4">????????????</label>&nbsp;
							</div>
						</div>
						<div class="div-keyword">
							<input type="text" class="addKeyword" placeholder="????????? ????????????">
							<button type="button" class="button-keyword">????????? ??????</button>
						</div>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>?????? ??????</strong>
						</div>
						<textarea name="reviewText" id="reviewText" style="width: 95%; height: 150px; margin-top: 10px;" placeholder="300??? ????????? ??????????????????."></textarea>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>?????? ?????????</strong>
						</div>
						<br>
						<div class="div-photo">
							<span class="description">?????? ???????????? ?????? ????????? ???????????????. (?????? 10???)</span>
						</div>
						<div class="image_top" style="margin-top: 10px;">
						    <div class="image_swiper">
						        <div class="image_div_0">
						            <label for ="image_plus_0"></label>
						            <input type="file" name="image_plus_0" id="image_plus_0">
						        </div>
						    </div>
						</div>
					</div>
					<div class="button-register">
						<button type="button" class="writeCancleBtn" onclick="location.href='<%= request.getContextPath()%>/detail.do?gNo=<%=gNo%>'">????????????</button>
						<button type="submit" class="enrollBtn" onclick="location.href='<%= request.getContextPath()%>/reviewWrite.re?gNo=<%=gNo%>'">????????????</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	<script>
		/* ??????  */
		$('.fa-star').css({'color': 'lightgray'});
		
		var check = false;
	    $('#totalStarDiv .fa-star, #facilityStarDiv .fa-star, #instructorStarDiv .fa-star, #serviceStarDiv .fa-star, #priceStarDiv .fa-star').on('click',function(){
	    	if(!check){
				$(this).parent().find('.fa-star').css({'color': 'lightgray'});
				var targetNum = $(this).index()+1;
				$(this).parent().find(':nth-child(-n+' + targetNum + ')').css({color:'#ffd700'});
				
				$(this).parent().prev('input').val(targetNum);
				
				check = true;
	    	} else {
	    		$(this).parent().find('.fa-star').css({'color': 'lightgray'});
				var targetNum = $(this).index()+1;
				$(this).parent().find(':nth-child(-n+' + targetNum + ')').css({color:'#ffd700'});
				
				$(this).parent().prev('input').val(targetNum);			
	    		
				check = false;
	    	}	
		});
	    
	    /* ????????? ?????? */
	    $('.button-keyword').on('click', function(){
	    	var addKeyword = $('.addKeyword').val();
	    	$('.div-addKeyword').append("&nbsp;").append('<input type="checkbox" checked name="keyword" id="keyword5" value=' + addKeyword + '>')
	    	.append('<label for="keyword5">' + addKeyword + '</lable>'); 
	    });
	    
	    /* ???????????? */
	    var index = 0;
 
	    //????????? ?????? ?????? ?????????
	    $(document).on("change", '.image_top input[type=file]', function(event) {
	 		
	    	if(index > 9){
	    		alert("????????? ?????? 10????????? ????????? ??? ??? ????????????.");
	    		
	    		return;
	    	}
	    	
	        var target = $(this)[0];
	        if(target != null){
	            //------------------????????? ????????? ?????? ??????--------------------------------//
	            var fileNM = $(this).val();
	            var ext = fileNM.slice(fileNM.lastIndexOf(".") + 1).toLowerCase();
	 
	            if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
	                alert("??????????????? (.jpg, .png, .gif ) ??? ????????? ???????????????.");
	                return false;
	            }
	            //------------------????????? ????????? ?????? ??????--------------------------------//
	            // ?????? ??????
	            var img_div = $(this).parent();
	            var fileList = target.files;
	        
	            // ??????????????? ??????
	            var reader = new FileReader();
	            // ?????? ?????? ??????
	            reader.readAsDataURL(fileList[0]);
	            //?????? ??? ??? ????????? ?????? ??????(?????????,url)
	            reader.onload = function(e) {
	                // ????????? ????????????
	                img_div.children('label').css('background','url('+ e.target.result +') center no-repeat').css('background-size','105px 105px').css('margin-left', '5px');
	            };
	 
	            // ????????? ?????? ?????? ?????? ?????? ??????
	            var div = document.createElement('div');
	 
	            index++;
	 
	            // ????????? div??? className ??????
	            div.className = 'image_div_'+index+'';
	            div.innerHTML = '<label for ="image_plus_'+index+'"></label>\<input type="file" name="image_plus_'+index+'" id="image_plus_'+index+'">';
	            
	            // ??????
	            $('.image_swiper').append(div);
	 
	        } else {
	            alert("????????? ??????");
	        }
	    });
		
	    $('#reviewText').on('keyup', function(){
	    	if($(this).val().length > 300) {
	    		alert('?????? ????????? 300????????? ???????????????.');
	    	}
	    });
    </script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>