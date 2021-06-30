<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gym.model.vo.Gym, java.util.ArrayList, gym.model.vo.GFile"%>
<%
	Gym g = (Gym)request.getAttribute("g");
	ArrayList<GFile> fList = (ArrayList)request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>시설 조회</title>
   
    <!-- Core theme CSS (includes Bootstrap)-->
<!--     <link href="css/styles.css" rel="stylesheet" /> -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      * {font-family: 'Noto Sans KR';}
      
      a {
 		text-decoration: none;
        color: black;
      }
      
      a:hover {
        text-decoration: none;
        color: #00b1d2;
      }

    
      /* a태그 설정 */
      .nav a, .f2 a {
        text-decoration: none;
        color: black;
      }

      .nav a:hover, .f2 a:hover {
        text-decoration: none;
        color: #00b1d2;
        
      }
      
      #facilityName{font-size: 40px;}
      #guName{font-size: 30px; color: gray;}
	  #gymType{font-size: 28px;}
	
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

     .page {margin-bottom: 50px; margin-top: 50px;}
		 		
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
      
      .side:hover {color:#00b1d2;}
      
      .main-title, .info, .review-card, .reviewTotal, .review-info{margin: 10px;}
      
      .point{font-size: 20px;}
      
      input{color: #fff; background-color: #00b1d2; border-color: #00b1d2; margin-top: 10px; border-radius: 0.375rem;}
      #bookmark{text-align: right;}
      #btn{margin-top: 10px;}
      #grBtn{text-align: left;}
      .main-button{width: 100px; height: 40px; margin-left: 10px;}
      .gongBtn, .adminBtn{width:100px; height: 35px;}
	  .keyword{background: #E6E6E6; border-radius: 1rem;}
	  
	  .star{color: #00b1d2;}
	  
	  .userImage{width: 100px; height: 100px;}
	  #idPointTime{padding: 10px; font-size: 17px;}
	  .card-text{background: none; resize: none; border: none; height: auto; overflow-y: hidden;}
	  .review-card{height: auto;}
    </style>
  </head>
  <body>
    <!-- Header-->
    <%@include file="../common/header.jsp" %>	
    
    <!-- Page Content-->
    <div class="container" style="height: auto;">
      <div class="row">
        <div class="col-lg-3">
          <div class="list-group">
          	<!-- 지도 -->
			<div id="map" style="width: 230px;height: 230px;"></div>
			<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=51a2be588394023dffe06fdafc5726ca"></script>
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
            <div class="list-group-item" style="font-weight: bold;">운동 카테고리</div>
            <a class="list-group-item side" href="gymCategory.do?category=all">전체보기</a>
            <a class="list-group-item side" href="gymCategory.do?category=swimming">수영</a>
            <a class="list-group-item side" href="gymCategory.do?category=soccer">축구</a>
            <a class="list-group-item side" href="gymCategory.do?category=tennis">테니스</a>
            <a class="list-group-item side" href="gymCategory.do?category=golf">골프</a>
            <a class="list-group-item side" href="gymCategory.do?category=footVolley">족구</a>
            <a class="list-group-item side" href="gymCategory.do?category=badminton">배드민턴</a>
            <a class="list-group-item side" href="gymCategory.do?category=basketball">농구</a>
          </div>
        </div>
        <div class="col-lg-9">   
        <div class="row">
            <div class="col-lg-9">
            	<!-- image -->
            	<div class="carousel slide my-4" id="carouselExampleIndicators" data-ride="carousel" style="width: 700px;">

	                <% int count = 0; %>
	                <% if(fList.isEmpty()){ %>
	                <div class="carousel-inner" role="listbox" style="width: 700px;"> <!-- 사진 없을때 기본 이미지 출력 -->
	                		<div class="carousel-item active"><img class="image" src="<%= request.getContextPath() %>/gym_uploadFiles/202106260943378920.jpg" alt="..." width='900' height='400'/></div>
	                </div>
	                <% } else {%> <!-- 사진 수에 따라 출력 -->
	                <div class="carousel-inner" role="listbox" style="width: 700px;">
		                <ol class="carousel-indicators">
	                <%		for(int i = 0; i < fList.size(); i++){%>
	                <%			if(i == 0){ %>
		                    	<li class="active" data-target="#carouselExampleIndicators" data-slide-to="<%=i+1%>"></li>
	                <%			} else {%>
		                        <li data-target="#carouselExampleIndicators" data-slide-to="<%=i+1%>"></li>
	                <%			}%>
	                    </ol>
	                <%		for(int j = 0; j < fList.size(); j++){ %>
	                <% 			if(j == 0){ %>
				                <div class="carousel-item active"><img class="image" src="<%= fList.get(i).getgFilePath() %>" alt="First slide" width='900' height='400'/></div>
	                
	                
	               	<% 			} %>
	                <!-- 사진 모르겠따~~~~~~~~~~~~~ -->
	                
	                <%		} %>
		                	<div class="carousel-item"><img class="image" src="image/f&g.jpg" alt="Second slide" width='900' height='400'/></div>
		                	<div class="carousel-item"><img class="image" src="image/f&g.jpg" alt="Third slide" width='900' height='400'/></div>
	                </div>
	                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	                	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                	<span class="sr-only">Previous</span>
	                </a>
	                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	                	<span class="carousel-control-next-icon" aria-hidden="true"></span>
	                	<span class="sr-only">Next</span>
	                </a>
	                <% 		} %>													
	                <% } %>
                </div>
                <!-- 시설 정보 -->
                <div style="width: 700px;">
                	<div class="main-title">
	                    <label id="facilityName"><%=g.getG_NAME() %></label><br>
	                    <label id="guName"><%=g.getG_GU_NM() %> | </label> <label id="gymType"> <%=g.getG_TYPE_NM() %> </label><br>
	                    <label class="point">3명의 평가</label>│<label class="point">4.0점 </label><label class="point" style="color: #00b1d2;">★ ★ ★ ★ ☆</label>
                        <table id="btn">
                        	<tr>
                        		<td id="grBtn" width="400px;">
                        			<input type="button" class="main-button" value="좋아요 0" onclick="location.href='<%= request.getContextPath()%>'">
                        			<% if( loginUser != null){ %>
                        			<input type="button" class="main-button" id="reviewBtn" value="리뷰작성" onclick="location.href='<%= request.getContextPath()%>/reviewWriteForm.re?gNo=<%=g.getG_NO()%>'">
                        			<% } else { %>
                        			<input type="button" class="main-button" id="reviewBtn" value="리뷰작성" onclick="alert('로그인 후 이용하실 수 있습니다.');">
                        			<% } %>
                        			
                        		</td>
                        		<td id="bookmark" width="400px;">
                        		<% if( loginUser != null){ %>
                        		<input type="button" id="bookmarkBtn" class="main-button" value="즐겨찾기" onclick="bookmark();">
                        		<% } else {%>
                        		<input type="button" id="bookmarkBtn" class="main-button" value="즐겨찾기" onclick="bookmark();">
                        		<% } %>
                        		</td>
                        	</tr>
                        </table>
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
                <div class="reviewTotal" style="width: 700px;">
             		<div style="font-size: 19px;">
                		<h3>0건의 방문자 평가</h3><br>
                		<label>0.0점</label>&nbsp<label class='star'>☆☆☆☆☆</label><br>
                		<label>시설</label> <label class="star">★</label><label>0.0</label>&nbsp&nbsp&nbsp<label>서비스</label> <label class="star">★</label><label>0.0</label>&nbsp&nbsp&nbsp<label>강사</label> <label class="star">★</label><label>0.0</label><br><br>
                		<label>방문목적</label>&nbsp&nbsp<span class="keyword" style="font-size: 16px;"> 체지방 감소(2) </span>&nbsp<span class="keyword" style="font-size: 16px;"> 체지방 감소(2) </span>
                	</div>
                	<hr>
                </div>
                <div class="review-card" style="width: 700px; border: 1px solid lightgray;" >
                    <table class="review-info">
                    	<tr>
                    		<td><img class="userImage" src="profile_uploadFiles/default_profileFile.png" /></td>
                    		<td id="idPointTime">
                    			<span>아이디</span><br>
                    			<span class="star">★★★★☆</span>
                    			<span>4월 1일</span><br><br>
                    		</td>
                    	</tr>
                    </table>
                    <div class="card-body">
                    	<label>시설</label> <label class="star">★</label><label>0</label>
                    	<label>서비스</label> <label class="star">★</label><label>0</label>
                    	<label>강사</label> <label class="star">★</label><label>0</label>
                    	<textarea class="card-text" rows="" cols="90" disabled="disabled"></textarea>
                    	<span class="keyword" style="font-size: 16px;"> 체지방 감소(2) </span>&nbsp<span class="keyword" style="font-size: 16px;"> 체지방 감소(2) </span>&nbsp
                    </div>
                    <table id="buttons" style="margin: 10px;">
                        <tr>
                        	<td id="gongBtn" width="400px;">
                        		<input type="button" class="gongBtn" value="공감 4" onclick="location.href='<%= request.getContextPath()%>'">
                        	</td>
                        	<td width="400px;" style="text-align: right;">
                        		<input type="button" class="adminBtn" value="수정">
                        		<input type="button" class="adminBtn" value="삭제">
                        	</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
      </div>
    </div>
    </div>

    <!-- Footer-->
   	 <%@include file="../common/footer.jsp" %>

  </body>
</html>