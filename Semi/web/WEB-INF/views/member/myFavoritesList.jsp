<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, gym.model.vo.*, board.model.vo.PageInfo"%>
    
<%
	ArrayList<Gym> list = (ArrayList)request.getAttribute("list");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int currentPage = pageInfo.getCurrentPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>마이페이지 - 즐겨찾기</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<!-- <link href="css/styles.css" rel="stylesheet" /> -->
<style>
	*{font-family: 'Noto Sans KR';}
	.side:hover, .reviewBody:hover{cursor: pointer; color: #00B1D2;}	

	 .page {margin-bottom: 50px; margin-top: 50px;}
		 		
	.pagination {
	list-style-type: none;
	display: block;
	text-align: center;
	margin-left: 50%;
	}
			 	
	.page-item {
	display: inline-block;
	padding: 0.2rem;
	}		 	 
	
	.title {margin-top: 50px; margin-bottom: 20px;}
			 	
	.list-group{width: 230px; padding-top: 40px;}
	.list-group-item{color: black;}
			 	
	th {
	background: lightgrey;
	border-top: 1px solid grey;
	}
			 	 
	td, th {border-bottom: 1px solid grey;
			height: 50px;}
	
	td {overflow: hidden; white-space:nowrap; text-overflow: ellipsis;}
			 	 
	table {
	width: 100%;	
	text-align: center;
	table-layout: fixed;
	}
			 	 
	.correctButton, #delete {
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
	
	.correctButton:hover, #delete:hover {cursor: pointer;} 
				
	#delete{
	margin: 20px;
	float: right;
	}
 		
</style>
</head>
<body>

	<%@include file="../common/header.jsp" %>	
	
	
	<div class="container" >
		<div class="row">
			<div class="col-lg-3">                   
				<div class="list-group">
                  	<div class="list-group-item" style="font-weight:bold;">마이페이지</div>
                        <div class="list-group-item side" id="memberUpdateForm">회원정보 수정</div>
                        <div class="list-group-item side" id="myFavorites">즐겨찾기</div>
                        <div class="list-group-item side" id="myReview">리뷰 관리</div>
                        <div class="list-group-item side" id="myBoard">게시물 관리</div>
                        <div class="list-group-item side" id="myComment">댓글 관리</div>
                    </div>
                </div>
          <div class="col-lg-9" style="height: 650px;">
           <div class="title"><h4>즐겨찾기</h4></div>
	           <div class="row">
	         <% if(!list.isEmpty()) {%>
		        <% for(Gym g : list) {%>	           
	            <div class="col-lg-4 col-md-6 mb-4">
	              <div class="card h-100">
	                <a href="#!"
	                  ><img
	                    class="card-img-top"
	                    src="<%=request.getContextPath()%>/gym_uploadFiles/<%= g.getG_FILE() %>"
	                    alt="..."
	                    height="170"
	                /></a>
	                <div class="card-body">
	                  <h4 class="card-title">
	                    <a href="#!" style="color: #00b1d2"><%= g.getG_NAME() %></a>
	                  </h4>
	
	                  <p class="card-text"><%=g.getG_ADDRESS() %></p>
	                </div>
	                <div class="card-footer">
	                  <small class="text-muted">
	                  <% for(int i = 0; i < 5 - g.getG_COVID(); i++) { %>
	                  	★ 
	                  <% } %>
	                  <% for(int i = 0; i < g.getG_COVID(); i++) { %>
	                  	☆
	                  <% } %>
	                  </small>
	                </div>
	              </div>
	            </div>
		        <% } %>                   
	         <% } %>                   
				</div>
			</div>	
		</div>
	</div>
            
	<div class="page">
		<ul class="pagination">
			<li class="page-item">
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/myFavoritesList.me?currentPage=1'">&laquo;</div>
			</li>
			
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/myFavoritesList.me?currentPage=<%= currentPage - 1 %>'" id="beforeBtn"> &lt; </button>
				<script>
					if(<%= currentPage %> <= 1) {
						$('#beforeBtn').attr('disabled', 'true');
					}
				</script>
			</li>
			
			<% for(int p = startPage; p <= endPage; p++) { %>
				<% if(p == currentPage) { %>
				<li class="page-item">
					<button class="page-link" disabled><%= p %></button>
				</li>
				<% } else { %>
				<li class="page-item">
					<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/myFavoritesList.me?currentPage=<%= p %>'"><%= p %></div>
				</li>						
				<% } %>
			<% } %>
			
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/myFavoritesList.me?currentPage=<%= currentPage + 1 %>'" id="afterBtn"> &gt; </button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>) {
						$('#afterBtn').prop('disabled', true);
					}
				</script>
			</li>
			
			<li class="page-item">
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/myFavoritesList.me?currentPage=<%= maxPage %>'">&raquo;</div>
			</li>			    
		</ul>
	</div>
   
	<%@include file="../common/footer.jsp" %>
	
	<script>
		// 사이드바
		$(document).ready(function(){
			$('#memberUpdateForm').click(function(){
				location.href="myPage.me";
			});
			
			$('#myBoard').click(function(){
				location.href="myBoardList.me";
			});
									
			$('#myReview').click(function(){
				location.href="myReviewList.me";
			});
			
			$('#myComment').click(function(){
				location.href="myCommentList.me";
			});
			
			$('#myFavorites').click(function(){
				location.href="myFavoritesList.me";
			});
			
		});
	</script>