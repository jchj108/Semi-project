<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gym.model.vo.Gym, java.util.ArrayList, gym.model.vo.GFile, review.model.vo.*"%>
<%
	Gym g = (Gym)request.getAttribute("g");
	ArrayList<GFile> fList = (ArrayList)request.getAttribute("fileList");
	ArrayList<Review> rList = (ArrayList)request.getAttribute("rList");
	ArrayList<ReviewAttachment> raList = (ArrayList)request.getAttribute("raList");
	
	int gNo = g.getG_NO();
	int total = 0;
	for(Review r : rList){
		total += r.getR_total();
	}
	int avg = (int)Math.round((double)total / rList.size());
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
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51a2be588394023dffe06fdafc5726ca&libraries=services"></script>

</head>
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

/* sns공유 */
#review-bookmark-btn img{
	width: 30px;
}

#review-bookmark-btn{
	margin-top: 15px;	
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
	 					<script>
		 					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		 					
		 				    mapOption = {
		 				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		 				        level: 4 // 지도의 확대 레벨
		 				    };  
			 				var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			 				var geocoder = new kakao.maps.services.Geocoder();
			 				
							if(<%=g.getG_XCODE() %> != 0 && <%= g.getG_YCODE() %> != 0) { // 데이터베이스의 값을 우선적으로 고려함, 값이 없다면 주소->좌표 검색 실행
								console.log("xycode true");
								var coords = new kakao.maps.LatLng(<%=g.getG_YCODE() %>, <%=g.getG_XCODE() %>)
								var marker = new kakao.maps.Marker({
									map:map,
									position: coords
								});
	 				            var infowindow = new kakao.maps.InfoWindow({
		 				            content: '<div style="width:170px;text-align:center;padding:6px 0; font-size:13px;"><%= g.getG_NAME() %></div>'
		 				        });
		 				        infowindow.open(map, marker);
		 				        
		 				        map.setCenter(coords);
								
		 				        var markerOn = true;
		 				        kakao.maps.event.addListener(marker, 'click', function() {
		 				        	if(markerOn) {
		 				        		infowindow.close(map, marker);
		 				        		markerOn = false;
		 				        	} else {
		 				        		infowindow.open(map, marker);
		 				        		markerOn = true;
		 				        	}
		 				        });
							} else {
			 					console.log("xycode false");
				 				geocoder.addressSearch('<%=g.getG_ADDRESS()%>', function(result, status) {
				
				 				    if (status === kakao.maps.services.Status.OK) {
			
				 				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				 				        var marker = new kakao.maps.Marker({
				 				            map: map,
				 				            position: coords
				 				        });
				 				            var infowindow = new kakao.maps.InfoWindow({
				 				            content: '<div style="width:170px;text-align:center;padding:6px 0; font-size:13px;"><%= g.getG_NAME() %></div>'
				 				        });
				 				        infowindow.open(map, marker);
			
			 				    	    // 지도의 중심을 결과값으로 받은 위치로 이동
			 				 	 	    map.setCenter(coords);
				 				    	var markerOn = true; // marker onoff
					 				    kakao.maps.event.addListener(marker, 'click', function() {
					 				    	if(markerOn) {
						 						infowindow.close(map, marker);  
						 						markerOn = false;
					 				    	} else {
					 				    		infowindow.open(map, marker);
					 				    		markerOn = true;
						 					}
						 				});
							 		} 
								});    
							}
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
				<!-- image -->
				<div class="carousel slide my-4" id="carouselExampleIndicators"
					data-ride="carousel" style="width: 700px;">
	                <% if(fList.isEmpty()){ %>
	                <div class="carousel-inner" role="listbox" style="width: 700px;">
	                		<div class="carousel-item active"><img class="image" src="<%= request.getContextPath() %>/image/no_image.jpg" alt="..." width='900' height='400'/></div>
	                </div>
	                <% } else {%>
	                <div class="carousel-inner" role="listbox" style="width: 700px;">
	                <%		for(int i = 0; i < fList.size(); i++){ %>
	                <%			if(i == 0) {%>
				                <div class="carousel-item active"><img class="image" src="<%= request.getContextPath()%>/gym_uploadFiles/<%= fList.get(i).getgChangeName() %>" alt="..." width='900' height='400'/></div>
				    <%			} else {%>
				                <div class="carousel-item"><img class="image" src="<%= request.getContextPath()%>/gym_uploadFiles/<%= fList.get(i).getgChangeName() %>" alt="..." width='900' height='400'/></div>
				    <%		 	}%>
	                <%		} %>
	                </div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
					<% } %>
				</div>
				<!-- 시설 정보 -->
				<div style="width: 700px;">
					<div class="main-title">
						<label id="facilityName"><%=g.getG_NAME() %></label><br> <label
							id="guName"><%=g.getG_GU_NM() %> | </label> <label id="gymType">
							<%=g.getG_TYPE_NM() %>
						</label>
						<br>
						<div id="review-bookmark-btn">
							<span id="share" style="float: left"> <a
								href="javascript:shareKakao()"><img
									src="<%= request.getContextPath() %>/image/icon-kakao.png"></a>
								<a href="javascript:shareTwitter()"><img
									src="<%= request.getContextPath() %>/image/icon-twitter.png"></a>
								<a href="javascript:shareFacebook()"><img
									src="<%= request.getContextPath() %>/image/icon-facebook.png"></a>
							</span>
							<% if( loginUser != null){ %>
							<input type="button" class="main-button" id="reviewBtn"
								value="리뷰작성"
								onclick="location.href='<%= request.getContextPath()%>/reviewWriteForm.re?gNo=<%=g.getG_NO()%>'">
							<% } else { %>
							<input type="button" class="main-button" id="reviewBtn"
								value="리뷰작성" onclick="alert('로그인 후 이용하실 수 있습니다.');">
							<% } %>
							<% if( loginUser != null){ %>
							<input type="button" id="bookmarkBtn" class="main-button"
								value="즐겨찾기">
							<% } else {%>
							<input type="button" id="bookmarkBtn" class="main-button"
								value="즐겨찾기 " onclick="alert('로그인 후 이용하실 수 있습니다.');">
							<% } %>
						</div>
					</div>
					<hr>
				</div>

				<div class="info" style="width: 700px; font-size: 19px;">
					<div class="info-content">
						<table>
							<tr>
								<td>상세주소 : <%=g.getG_ADDRESS() %></td>
							</tr>
							<tr>
								<td>연락처 : <%=g.getG_TEL() %></td>
							</tr>
							<% if(g.getG_EDU_YN().charAt(0) == '유'){ %>
							<tr>
								<td>강습 : 가능</td>
							</tr>
							<% } else { %>
							<tr>
								<td>강습 : 불가능</td>
							</tr>
							<% } %>
							<tr>
								<td>주차장 : <%=g.getG_PARKING_LOT() %></td>
							</tr>
							<% if(g.getG_BIGO() != null){ %>
							<tr>
								<td>시설 규모 : <%=g.getG_BIGO() %></td>
							</tr>
							<% } else {%>
							<tr>
								<td>시설 규모 : -</td>
							</tr>
							<% }%>
						</table>
					</div>
					<hr>
				</div>
                <div class="reviewTotal" style="width: 700px;">
             		<div style="font-size: 19px;">
                		<h3><%=rList.size() %>건의 방문자 평가</h3><br>
                		<% double totalAvg = 0; %>
                		<% double sSum = 0; %>
                		<% double tSum = 0; %>
                		<% double gSum = 0; %>
                		<% for(int i = 0; i < rList.size(); i++){ %>
                		<%		sSum += rList.get(i).getR_service(); %>
                		<%		tSum += rList.get(i).getR_teacher(); %>
                		<%		gSum += rList.get(i).getR_gym(); %>
                		<% } %>
                		<% totalAvg = (sSum + tSum + gSum)/ 3 / rList.size(); %>
                		<label><%=(double)Math.round(totalAvg * 10)/10 %>점</label>&nbsp
                		<% if(!rList.isEmpty()){ %>
                		<% 	  for(int i = 0; i < rList.size(); i++){ %>
                		<% 	  } %>
		                		<div id="reviewAvgStar" id="reviewAvg"
									style="display: inline-block;">
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span>
								</div>
                		<% } else { %>
                				<div class="score_star" id="reviewAvg"
									style="display: inline-block;">
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span>
								</div>
                		<% } %>
                		<br>
                		<div class="reviewTotalStar">
                		<label>시설</label> 
                		<span class="fas fa-star rev"></span>
                		<label><%=(double)Math.round(gSum/rList.size()*10)/10 %></label>
                		&nbsp;&nbsp;&nbsp;
                		<label>서비스</label> 
                		<span class="fas fa-star rev"></span>
                		<label><%=(double)Math.round(sSum/rList.size()*10)/10 %></label>
                		&nbsp;&nbsp;&nbsp;<label>강사</label> 
                		<span class="fas fa-star rev"></span>
                		<label><%=(double)Math.round(tSum/rList.size()*10)/10 %></label>
                		</div>
                		<br>
                		<br>
                		<label>방문목적</label>
                		&nbsp;
                		&nbsp;
                		<span class="keyword" style="font-size: 16px;" id="fatloss"></span>
                		&nbsp;
                		<span class="keyword" style="font-size: 16px;" id="strength"></span>
                		&nbsp;
                		<span class="keyword" style="font-size: 16px;" id="remedial"></span>
                		&nbsp;
                		<span class="keyword" style="font-size: 16px;" id="bodyShape"></span>
                		&nbsp;
                		<span class="keyword" style="font-size: 16px;" id="etc"></span>
                	</div>
                	<hr>
                </div>
				<!-- 리뷰 목록 출력  -->
				<% if(!rList.isEmpty()){ %>
				<% for(int i = 0; i < rList.size(); i++){ %>
				<div class="review-card"
					style="width: 700px; border: 1px solid lightgray;">
					<table class="review-info" style="width: 97%;">
						<tr>
							<td style="width: 12%;"><img
								src="<%=request.getContextPath()%>/profile_uploadFiles/<%=rList.get(i).getM_profile()%>"
								style="height: 70px;">
							</td>
							<td colspan="2"><b style="font-size: 20px;"><%= rList.get(i).getReviewerName() %></b><br>
								<div class="score_star totalStarDiv<%=i%>">
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span>
								</div> &nbsp;
								<span><%= rList.get(i).getR_date() %></span>
							</td>
						</tr>
						<tr style="height: 40px;">
							<td colspan="3" id="starTd">
								<span>시설</span>
								<div class="score_star facilityStarDiv<%=i%>">
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span>
								</div> &nbsp;
								<span>강사</span>
								<div class="score_star instructorStarDiv<%=i%>">
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span>
								</div> &nbsp;
								<span>서비스</span>
								<div class="score_star serviceStarDiv<%=i%>">
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span>
								</div> &nbsp;
								<span>가격</span>
								<div class="score_star priceStarDiv<%=i%>">
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
									<span class="fas fa-star"></span> <span class="fas fa-star"></span>
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
											<img class="reviewImg"
												src="<%= request.getContextPath() %>/review_uploadFiles/<%= raList.get(j).getR_change_name() %>">
										</div>
										<% } %>
									<% } %>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3" style="padding-bottom: 20px;">
									<% String[] keywordArr = rList.get(i).getR_keyword().split(",");
										for(int j = 0; j < keywordArr.length; j++){ %>
										<span class="keywords keyword<%=i%>"><%= keywordArr[j] %></span>
									<% } %>

							</td>
						</tr>
						<tr>
							<td colspan="2"><span class="fa fa-heart likeBtn<%=i%>"></span>
								<span class="likeCount<%=i%>">0</span>
							</td>
							<% if(loginUser != null && (rList.get(i).getReviewerNo() == loginUser.getM_no())) {%>
							<td style="text-align: right;">
								<input type="button" class="editBtn<%=i%>" value="수정"> &nbsp;
								<input type="button" class="delBtn<%=i%>" value="삭제">
							</td>
							<% } %>
							<% if(loginUser != null && (loginUser.getM_auth() == 0)) {%>
							<td style="text-align: right;">
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
					<p style="font-size: 22px; padding-top: 60px; color: gray; text-align: center;">
						아직 작성된 리뷰가 없어요<br>첫 번째 후기를 남겨주세요!
					</p>
				</div>
				<% } %>
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
		
		
		$('#reviewAvgStar').find(':nth-child(-n+<%= avg %>)').css({color:'#00b1d2', 'font-size':'20px'});
		
		$('#bookmarkBtn').on('click', function(){
	  		$.ajax({
	  			url: 'favorite.do',
	  			data : {gNo: <%= g.getG_NO()%>},
	  			success: function(data){
	  				$('#bookmarkBtn').val(data);
	  			}
	  		});
	  	});
		
	  function shareKakao() {
		  if(!Kakao.isInitialized()){
			  Kakao.init('07a99d78f7b743ace5cbf5de3b116c13');
		  }
		  
		  Kakao.Link.sendDefault({
			  	objectType: 'feed',
		        content: {
					title: '내일은 운동가야지',
					description: '시설 상세페이지 공유하기',
					imageUrl: 'http://localhost:7580/goGym/image/logo2.png',
		            link: {
		            	mobileWebUrl: window.location.href,
		                webUrl: window.location.href,
		            },
		        },
		        buttons: [
		            {
		                title: '자세히보기',
		                link: {
		                	mobileWebUrl: window.location.href,
		                    webUrl: window.location.href,
		                },
		            }
		        ],
			})
		}
	  
		function shareTwitter(){
			var content = "내일은 운동가야지\n 시설 상세 페이지 공유하기\n";
			var link = window.location.href;
			var popOption = "width=600, height=360, resizable=no, scrollbars=no, status=no;";
			var wp = window.open("http://twitter.com/share?url=" + encodeURIComponent(link) + "&text=" + encodeURIComponent(content), 'twitter', popOption);
			if (wp) {
			  wp.focus();
			}    
		}
		
		function shareFacebook(){
			var gNo = <%=g.getG_NO()%>
			var content = "시설 상세 페이지 공유하기";
			var link = "221.150.23.71/goGym/detail.do?gNo="+gNo;
			var popOption = "width=600, height=360, resizable=no, scrollbars=no, status=no;";
			var wp = window.open("https://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(link) + "&text=" + encodeURIComponent(content), 'facebooksharedialog', popOption);
			if (wp) {
			  wp.focus();
			} 
		}
		
		$('.rev').css({'color':'#00B1D2'});
		
		$(window).ready(function(){
			$.ajax({
				url: 'keyword.do',
				data: {gNo: <%= g.getG_NO()%>},
				success: function(data){
					
					var fatloss = data[0];
					var strength = data[1];
					var remedial = data[2];
					var bodyShape = data[3];
					var etc = data[4];
					
					if(fatloss != 0){
						$('#fatloss').text('체지방 감소(' + fatloss + ')');
					}
					
					if(strength != 0){
						$('#strength').text('근력 증가(' + strength + ')');
					}
					
					if(remedial != 0){
						$('#remedial').text('재활(' + remedial + ')');
					}
					
					if(bodyShape != 0){
						$('#bodyShape').text('체형교정(' + bodyShape + ')');
					}
					
					if(etc != 0){
						$('#etc').text('기타(' + etc + ')');
					}
					
				}
			});
		});
		
	</script>
</body>
</html>