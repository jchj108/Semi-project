<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.*, java.util.ArrayList"%>
<% 
	Review r = (Review)request.getAttribute("r"); 
	ArrayList<ReviewAttachment> list = (ArrayList)request.getAttribute("list");
	
	int total = r.getR_total();
	int gym = r.getR_gym();
	int teacher = r.getR_teacher();
	int service = r.getR_service();
	int price = r.getR_price();
	
	String keyword = r.getR_keyword();
	String review = r.getR_body();
	
	
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
	
	#category-title{
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
		display: inline-block;
		margin: 5px 0px 8px 5px;
	}
	
	.div-keyword{
		text-align: center;
		margin: 5px 10px 10px 10px;
	}
	
	.div-keyword>input[type=checkbox]{
		margin: 0px 10px 0px 10px;
	}
	
	#button-keyword{
		margin-left: 8px;
	}
	
	.button-register{
		text-align: center;
		margin: 30px 30px 30px 30px;
	}
	
	#button-keyword, #button-photo{
		background-color: #00B1D2;
		color: white;
		border-radius: 5px;
	}
	
	#enroll{
		padding: 5px 20px 5px 20px;
		margin-left: 5px;
		background-color: #00B1D2;
		color: white;
		border-radius: 10px;
		background-color: #00B1D2;
	}
	
	#cancle{
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
 	
 	.reviewImgDiv{
 		display:inline-block;
 		margin-left: 1px;
 	}
 	
 	.reviewImg{
 		width: 105px; height: 105px;
 	}
	
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	

			<div class="col-lg-6">
				<form class="review-box" id="reviewForm" action="<%= request.getContextPath() %>/reviewWrite.re" method="post" encType="multipart/form-data">
					<div class="section">
						<div class="title">
							<strong>전체 평점</strong>
						</div>
						<div class="score-box">
							<div class="rating-box">
								<div class="rating-box-name">평점</div>
								<input type="hidden" name="totalStar" id="totalStar">
								<div class="score_star" id="totalStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>항목별 평점</strong>
						</div>

						<div class="score-box">
							<div class="rating-box">
								<div class="rating-box-name">시설</div>
								<input type="hidden" name="facilityStar" id="facilityStar">
								<div class="score_star" id="facilityStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<div class="rating-box">
								<div class="rating-box-name">강사</div>
								<input type="hidden" name="instructorStar" id="instructorStar">
								<div class="score_star" id="instructorStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<div class="rating-box">
								<div class="rating-box-name">서비스</div>
								<input type="hidden" name="serviceStar" id="serviceStar">
								<div class="score_star" id="serviceStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<div class="rating-box">
								<div class="rating-box-name">가격</div>
								<input type="hidden" name="priceStar" id="priceStar">
								<div class="score_star" id="priceStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>시설 키워드</strong>
						</div>
						<div class="description">이 운동시설은 어떤 운동시설에 적합하나요? (복수선택가능)</div>
						<div class="div-keyword" id="div-keyword">
							<div id="div-addKeyword" class="form-check">
								<input type="checkbox" name="keyword" id="keyword1" value="체지방 감소">
								<label for="keyword1">체지방 감소</label>&nbsp;
								<input type="checkbox" name="keyword" id="keyword2" value="근력 증가">
								<label for="keyword2">근력 증가</label>&nbsp;
								<input type="checkbox" name="keyword" id="keyword3" value="재활">
								<label for="keyword3">재활</label>&nbsp;
								<input type="checkbox" name="keyword" id="keyword4" value="체형교정">
								<label for="keyword4">체형교정</label>&nbsp;
							</div>
						</div>
						<div class="div-keyword">
							<input type="text" id="addKeyword" placeholder="키워드 직접입력">
							<button type="button" id="button-keyword">키워드 추가</button>
						</div>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>이용 후기</strong>
						</div>
						<textarea name="reviewText" id="reviewText" style="width: 95%; height: 150px; margin-top: 10px;"><%= review %></textarea>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>사진 올리기</strong>
						</div>
						<br>
						<div class="div-photo">
							<span class="description">시설 사진이나 운동 사진을 올려주세요. (최대 10개)</span>
						</div>
						<div class="image_top">
							<% for(ReviewAttachment ra : list){ %>
								<div class="reviewImgDiv">
									<img class="reviewImg" src="<%= request.getContextPath() %>/review_uploadFiles/<%= ra.getR_change_name() %>">								
								</div>
							<% } %>
						</div>
					</div>
				</form>
					<% if(r.getReviewerNo() == loginUser.getM_no()){ %>
					<div class="button-register">
						<button class="submit" type="button" id="reviewEditBtn">수정하기</button>
						<button class="submit" type="button" id="reviewDelBtn">삭제하기</button>
					</div>
					<% } %>
			</div>
	
	<%@ include file="../common/footer.jsp" %>
	<script>
		/* 별점  */
		$('.fa-star').css({'color': 'lightgray'});
		
		$('#totalStarDiv').find(':nth-child(-n+<%= total %>)').css({color:'#ffd700'});
		$('#facilityStarDiv').find(':nth-child(-n+<%= gym %>)').css({color:'#ffd700'});
		$('#instructorStarDiv').find(':nth-child(-n+<%= teacher %>)').css({color:'#ffd700'});
		$('#serviceStarDiv').find(':nth-child(-n+<%= service %>)').css({color:'#ffd700'});
		$('#priceStarDiv').find(':nth-child(-n+<%= price %>)').css({color:'#ffd700'});
		
		$('#reviewEditBtn').on('click', function(){
			location.href="<%= request.getContextPath() %>/reviewUpdateForm.re";
		});
		
		
    </script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>