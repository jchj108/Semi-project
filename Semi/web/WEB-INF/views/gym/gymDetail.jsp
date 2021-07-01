<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gym.model.vo.Gym, java.util.ArrayList, gym.model.vo.GFile, review.model.vo.*"%>
<%
	Gym g = (Gym)request.getAttribute("g");
	ArrayList<GFile> fList = (ArrayList)request.getAttribute("fileList");
	ArrayList<Review> rList = (ArrayList)request.getAttribute("rList");
	ArrayList<ReviewAttachment> raList = (ArrayList)request.getAttribute("raList");
%>
<!DOCTYPE html>
<html lang="kor">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"
	  rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>시설 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#facilityName {
	font-size: 40px;
}

#guName {
	font-size: 30px;
	color: gray;
}

#gymType {
	font-size: 28px;
}

.sortPack {
	text-align: right;
	margin-bottom: 10px;
}

.sort {
	display: inline-block;
	text-decoration: none;
	color: white;
	background: #00b1d2;
	padding: 0.5rem;
	width: 150px;
	text-align: center;
	margin: 10px;
	border-radius: 10px;
}

.page {
	margin-bottom: 50px;
	margin-top: 50px;
}

.pagination {
	list-style-type: none;
	display: block;
	text-align: center;
	margin-left: 40%;
}

.page-item {
	display: inline-block;
	padding: 0.2rem;
}

.title {
	margin-top: 50px;
	margin-bottom: 20px;
}

.list-group {
	width: 230px;
	padding-top: 40px;
}

.list-group-item {
	color: black;
}

.side:hover {
	color: #00b1d2;
}

.main-title, .info, .review-card, .reviewTotal, .review-info {
	margin: 10px;
}

.point {
	font-size: 20px;
}

input {
	color: #fff;
	background-color: #00b1d2;
	border-color: #00b1d2;
	margin-top: 10px;
	border-radius: 0.375rem;
}

#review-bookmark-btn {
	text-align: right;
}

.main-button {
	width: 120px;
	height: 40px;
	margin-left: 10px;
}

.keyword {
	background: #E6E6E6;
	border-radius: 1rem;
}

.star {
	color: #00b1d2;
}

.userImage {
	width: 100px;
	height: 100px;
}

#idPointTime {
	padding: 10px;
	font-size: 17px;
}

.card-text {
	background: none;
	resize: none;
	border: none;
	height: auto;
	overflow-y: hidden;
}

.review-card {
	height: auto;
}

/* 리뷰 가져오기  */
#starTd .score_star{
	display: inline-block;
	font-size: 13px;
}

.score_star{
	display: inline-block;
}

.reviewImgDiv{
	display:inline-block;
	margin-right: 1px;
}
 	
.reviewImg{
	width: 105px;
	height: 105px;
}
 
.keywords{
	color: #545454;
	font-size: 13px;
	padding-right: 5px;
	padding-left: 5px;
 	background: #E6E6E6;
	border-radius: 10px;
}
</style>
</head>
<body>
	<!-- Header-->
	<%@include file="../common/header.jsp"%>

	<!-- Page Content-->
	<div class="container" style="height: auto;">
		<div class="row">
			<div class="col-lg-3">
				<div class="list-group">
					<!-- 지도 -->
					<div id="map" style="width: 230px; height: 230px;"></div>
					<script
						src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=51a2be588394023dffe06fdafc5726ca"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
									center: new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
									level: 3, // 지도의 확대 레벨
								    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
						}; 
						
						// 지도를 생성한다 
						var map = new kakao.maps.Map(mapContainer, mapOption); 
					</script>
					<br>
					<div class="list-group-item" style="font-weight: bold;">운동
						카테고리</div>
					<a class="list-group-item side" href="gymCategory.do?category=all">전체보기</a>
					<a class="list-group-item side"
						href="gymCategory.do?category=swimming">수영</a> <a
						class="list-group-item side" href="gymCategory.do?category=soccer">축구</a>
					<a class="list-group-item side"
						href="gymCategory.do?category=tennis">테니스</a> <a
						class="list-group-item side" href="gymCategory.do?category=golf">골프</a>
					<a class="list-group-item side"
						href="gymCategory.do?category=footVolley">족구</a> <a
						class="list-group-item side"
						href="gymCategory.do?category=badminton">배드민턴</a> <a
						class="list-group-item side"
						href="gymCategory.do?category=basketball">농구</a>
				</div>
			</div>
			<div class="col-lg-9">
				<div>
					<div>
						<!-- image -->
            	<div class="carousel slide my-4" id="carouselExampleIndicators" data-ride="carousel" style="width: 700px;">

	                <% if(fList.isEmpty()){ %>
	                <div class="carousel-inner" role="listbox" style="width: 700px;">
	                		<div class="carousel-item active"><img class="image" src="<%= request.getContextPath() %>/gym_uploadFiles/202106260943378920.jpg" alt="..." width='900' height='400'/></div>
	                </div>
	                <% } else {%>
	                <div class="carousel-inner" role="listbox" style="width: 700px;">
	                <%		for(int i = 0; i < fList.size(); i++){ %>
				                <div class="carousel-item active"><img class="image" src="<%= request.getContextPath()%>/gym_uploadFiles/<%= fList.get(i).getgChangeName() %>" alt="..." width='900' height='400'/></div>
	                <%		} %>
	                </div>
	                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	                	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                	<span class="sr-only">Previous</span>
	                </a>
	                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	                	<span class="carousel-control-next-icon" aria-hidden="true"></span>
	                	<span class="sr-only">Next</span>
	                </a>												
	                <% } %>
                </div>
                <!-- 시설 정보 -->
                <div style="width: 700px;">
                	<div class="main-title">
	                    <label id="facilityName"><%=g.getG_NAME() %></label><br>
	                    <label id="guName"><%=g.getG_GU_NM() %> | </label> <label id="gymType"> <%=g.getG_TYPE_NM() %> </label><br>
	                    <label class="point">3명의 평가</label>│<label class="point">4.0점 </label><label class="point" style="color: #00b1d2;">★ ★ ★ ★ ☆</label>
                        <div id="review-bookmark-btn">
                        <% if( loginUser != null){ %>
                        			<input type="button" class="main-button" id="reviewBtn" value="리뷰작성" onclick="location.href='<%= request.getContextPath()%>/reviewWriteForm.re?gNo=<%=g.getG_NO()%>'">
                        			<% } else { %>
                        			<input type="button" class="main-button" id="reviewBtn" value="리뷰작성" onclick="alert('로그인 후 이용하실 수 있습니다.');">
                        			<% } %>	
	                        		<% if( loginUser != null){ %>
	                        		<input type="button" id="bookmarkBtn" class="main-button" value="즐겨찾기">
	                        		<% } else {%>
	                        		<input type="button" id="bookmarkBtn" class="main-button" value="즐겨찾기 " onclick="alert('로그인 후 이용하실 수 있습니다.');">
	                        		<% } %>
	                    </div>
                    </div>
                    <hr>
                </div>
                    
                <div class="info" style="width: 700px; font-size: 19px;">
                	<div class="info-content">
                    	<table>
                    		<tr><td>상세주소  : <%=g.getG_ADDRESS() %></td></tr>
                    		<tr><td>연락처 : <%=g.getG_TEL() %></td></tr>
                    		<% if(g.getG_EDU_YN().charAt(0) == '유'){ %>
                    				<tr><td>강습 : 가능</td></tr>
                    		<% } else { %>
                    				<tr><td>강습 : 불가능</td></tr>
                    		<% } %>
                    		<tr><td>주차장 : <%=g.getG_PARKING_LOT() %></td></tr>
                    		<% if(g.getG_BIGO() != null){ %>
	                    			<tr><td>시설 규모 : <%=g.getG_BIGO() %></td></tr>
                    		<% } else {%>
	                    			<tr><td>시설 규모 : -</td></tr>
                    		<% }%>
                    	</table>
                    </div>
                    <hr>
                </div>
						<!-- 리뷰 목록 출력  -->
				
						<div class="reviewTotal" style="width: 700px;">
							<div style="font-size: 19px;">
								<h3>0건의 방문자 평가</h3>
								<br> <label>0.0점</label>&nbsp;<label class='star'>☆☆☆☆☆</label><br>
								<label>시설</label> <label class="star">★</label><label>0.0</label>&nbsp;&nbsp;&nbsp;<label>서비스</label>
								<label class="star">★</label><label>0.0</label>&nbsp;&nbsp;&nbsp;<label>강사</label>
								<label class="star">★</label><label>0.0</label><br> <br>
								<label>방문목적</label>&nbsp;&nbsp;<span class="keyword"
									style="font-size: 16px;"> 체지방 감소(2) </span>&nbsp;<span
									class="keyword" style="font-size: 16px;"> 체지방 감소(2) </span>
							</div>
							<hr>
						</div>
				<% if(!rList.isEmpty()){ %>
						<% for(int i = 0; i < rList.size(); i++){ %>
						<div class="review-card" style="width: 700px; border: 1px solid lightgray;">
							<table class="review-info" style="width: 97%;">
								<tr>
									<td style="width: 12%;">
										<img src="<%=request.getContextPath()%>/profile_uploadFiles/<%=rList.get(i).getM_profile()%>" style="height: 70px;">
									</td>
									<td colspan="2">
										<b style="font-size: 20px;"><%= rList.get(i).getReviewerName() %></b><br>
										<div class="score_star totalStarDiv<%=i%>">
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
										</div>
										&nbsp;
										<span><%= rList.get(i).getR_date() %></span>
									</td>
								</tr>
								<tr style="height: 40px;">
									<td colspan="3" id="starTd">
										<span>시설</span>
										<div class="score_star facilityStarDiv<%=i%>">
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
										</div>
										&nbsp;
										<span>강사</span>
										<div class="score_star instructorStarDiv<%=i%>">
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
										</div>
										&nbsp;
										<span>서비스</span>
										<div class="score_star serviceStarDiv<%=i%>">
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
										</div>
										&nbsp;
										<span>가격</span>
										<div class="score_star priceStarDiv<%=i%>">
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
											<span class="fas fa-star"></span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3" style="padding-top: 20px; padding-bottom: 20px;">
										<%= rList.get(i).getR_body() %>
									</td>
								</tr>
								<tr>
									<td colspan="3" style="padding-top: 20px; padding-bottom: 20px;">
										<div class="image_top">
											<% for(int j=0; j < raList.size(); j++){ %>
												<% if(rList.get(i).getR_no() == raList.get(j).getR_no()){ %>
													<div class="reviewImgDiv">
														<img class="reviewImg" src="<%= request.getContextPath() %>/review_uploadFiles/<%= raList.get(j).getR_change_name() %>">
	 												</div>
												<% } %>
											<% } %>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3" style="padding-bottom: 20px;">
										<% String[] keywordArr = rList.get(i).getR_keyword().split(",");
												for(int j = 0; j < keywordArr.length; j++){
										%>
											<span class="keywords keyword<%=i%>"><%= keywordArr[j] %></span>
										<% } %>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										 <span class="fa fa-heart likeBtn<%=i%>"></span>
										 <span class="likeCount<%=i%>">0</span>
									</td>
									<% if(loginUser != null && (rList.get(i).getReviewerNo() == loginUser.getM_no())) {%>
									<td style="text-align: right;">
										<input type="button" class="editBtn<%=i%>" value="수정">
										&nbsp;
										<input type="button" class="delBtn<%=i%>" value="삭제">
									</td>
									<% } %>
								</tr>
							</table>
						</div>
						<% } %>
				<% } else { %>
						<div style="width: 700px; height: 300px; margin: 10px;">
						<h3>리뷰</h3>
							<p style="font-size: 22px; padding-top: 60px; color: gray; text-align: center;">아직 작성된 리뷰가 없어요<br>첫 번째 후기를 남겨주세요!</p>
						</div>
				<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer-->
	<%@include file="../common/footer.jsp"%>
	
	<script>
	<!-- 리뷰 목록 출력  -->
		$('.fa-star').css({'color': 'lightgray'});
		$('.fa-heart').css({'color':'#EE0000', 'font-size':'20px'});
		
		<% for(int i = 0; i < rList.size(); i++){ %>
			$('.totalStarDiv<%=i%>').find(':nth-child(-n+<%= rList.get(i).getR_total() %>)').css({color:'#ffd700'});
			$('.facilityStarDiv<%=i%>').find(':nth-child(-n+<%= rList.get(i).getR_gym() %>)').css({color:'#ffd700'});
			$('.instructorStarDiv<%=i%>').find(':nth-child(-n+<%= rList.get(i).getR_teacher() %>)').css({color:'#ffd700'});
			$('.serviceStarDiv<%=i%>').find(':nth-child(-n+<%= rList.get(i).getR_service() %>)').css({color:'#ffd700'});
			$('.priceStarDiv<%=i%>').find(':nth-child(-n+<%= rList.get(i).getR_price() %>)').css({color:'#ffd700'});
		<% } %>
		
		<% for(int i = 0; i < rList.size(); i++) { %>
		<%	int likeCount = rList.get(i).getR_like(); %>
		
			$('.editBtn<%=i%>').on('click', function(){
				location.href="<%= request.getContextPath() %>/reviewUpdateForm.re?rNo=<%= rList.get(i).getR_no() %>&gNo=<%= g.getG_NO() %>";
			});
			
			$('.delBtn<%=i%>').on('click', function(){
				location.href="<%= request.getContextPath() %>/reviewDelete.re?rNo=<%= rList.get(i).getR_no() %>&gNo=<%= g.getG_NO() %>";
			});
			
			$('.likeCount<%=i%>').text(<%=likeCount%>);
			$('.likeBtn<%=i%>').css('cursor', 'pointer');
			
			$('.likeBtn<%=i%>').on('click', function(){
				var rNo = <%= rList.get(i).getR_no() %>;
				$.ajax({
					url: 'updateLikeCount.re',
					data: {rNo: rNo},
					success: function(data){
						$('.likeCount<%=i%>').text(<%=likeCount+1%>);
					},
					error: function(data){
						console.log('실패');
					}
				});
			});
		<% } %>
		
		$('#bookmarkBtn').on('click', function(){
	  		$.ajax({
	  			url: 'favorite.do',
	  			data : {gNo: <%= g.getG_NO()%>},
	  			success: function(data){
	  				$('#bookmarkBtn').val(data);
	  			}
	  		});
	  	});
		
	</script>
</body>
</html>