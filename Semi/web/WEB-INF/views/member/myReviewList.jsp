<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, review.model.vo.Review, board.model.vo.PageInfo"%>
<%
	ArrayList<Review> list = (ArrayList)request.getAttribute("list");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int currentPage = pageInfo.getCurrentPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
	
	int gNo = 0;
%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>마이페이지 - 리뷰관리</title>
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
            	<div class="title"><h4>리뷰 관리</h4></div>
                	<form action="#" method="post" id="reviewListForm">
	                	<table class="reviewList" id="reviewList">
							<tr>
								<th width="50px;"><input type="checkbox" id="allSelect"></th>
								<th width="80px;">리뷰 번호</th>
								<th>내용</th>						
								<th width="100px;">작성일</th>
								<th width="100px;"></th>
							</tr>
							
							<% if(list.isEmpty()) { %>
							<tr>
								<td colspan="5">작성한 리뷰가 없습니다.</td>
							</tr>
							<% } else { %>
								<% for(Review r : list) { %>
							<tr>
								<input type="hidden" name="gNo" value="<%= r.getGymNo() %>">
								<input type="hidden" name="rNo" value="<%= r.getR_no() %>">																
								<td><input type="checkbox" class="select" name="select" onclick="selectOne();"></td>
								<td><%= r.getR_no() %></td>
								<td class="reviewBody"><%= r.getR_body() %></td>							
								<td><%= r.getR_date() %></td>
								<td><button type="button" class="correctButton">수정</button></td>
							</tr>
								<% } %>					
							<% } %>					
											
						</table>
					<input type="button" id="delete" value="삭제">
					</form>              
			</div>				
                   
		</div>
	</div>
            
	<div class="page">
		<ul class="pagination">
			<li class="page-item">
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=1'">&laquo;</div>
			</li>
			
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=<%= currentPage - 1 %>'" id="beforeBtn"> &lt; </button>
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
					<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=<%= p %>'"><%= p %></div>
				</li>						
				<% } %>
			<% } %>
			
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=<%= currentPage + 1 %>'" id="afterBtn"> &gt; </button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>) {
						$('#afterBtn').prop('disabled', true);
					}
				</script>
			</li>
			
			<li class="page-item">
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=<%= maxPage %>'">&raquo;</div>
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
		
		// 삭제 
		$('#delete').on('click', function(){
			if($('.select').prop('checked')) {
				var check = window.confirm("정말 삭제하시겠습니까?");
			
				if(check) {
					$('#reviewListForm').attr('action', 'reviewDelete.re');
					$('#reviewListForm').submit();
				}
			} else {
				alert("삭제할 리뷰를 선택해 주세요.");
			}
		});
		
		// 수정
		$('#reviewList button[type=button]').on('click', function(){
			var gNo = $(this).parent().parent().children().eq(0).val();
			var rNo = $(this).parent().parent().children().eq(1).val();
			
			location.href="<%= request.getContextPath() %>/reviewUpdateForm.re?rNo="+rNo+"&gNo="+gNo;
		});
		
		// 전체 선택 및 해제
		$('#allSelect').on('click', function(){
			if($(this).prop('checked')) {
				$('.select').prop('checked', true);
			} else {
				$('.select').prop('checked', false);
			}
		});
		
		function selectOne() {					     
			var select = document.getElementsByName('select');
			var all = document.getElementById('allSelect');
			var count = 0;
			
			for(var i = 0; i < select.length; i++) {
				if(select[i].checked) {
					count++;
				}
			}
			
			if(count == select.length) {
				all.checked = true;
			} else {
				all.checked = false;
			}
			
		};
		
		// 제목 누르면 리뷰 쓴 시설 상세 조회 페이지 이동
		$('.reviewBody').on('click', function(){
			var gNoVal = $(this).parent().children('input').val();
			location.href='<%= request.getContextPath() %>/detail.do?gNo=' + gNoVal;
		});
		
		
	</script>