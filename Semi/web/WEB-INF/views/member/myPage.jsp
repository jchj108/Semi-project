<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>마이페이지</title>
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
		<style>
			*{font-family: 'Noto Sans KR';}
			
			.side:hover{cursor: pointer; color: #00B1D2;}			
			
 			.page {margin-bottom: 50px;} 
	 		
 	 		.pagination { 
 		 		list-style-type: none; 
 				display: block; 
 				text-align: center; 
	 		
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
		 	 
		 	 td, th {
		 	 	border-bottom: 1px solid grey; 	 	
		 	 }
		 	 
		 	 table {
		 	 	width: 100%;
		 	 	height: 400px;
		 	 	text-align: center;
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
			
			 #delete{
	         	margin: 20px;
	         	float: right;
	         }
 		
		</style>
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
            	<div class="col-lg-9" id="loadContent"  style="height: 600px; padding-top: 50px;">
            	            	
            	</div>
		</div>
	</div>       

	<%@include file="../common/footer.jsp" %>
	
	<script>
		$(document).ready(function(){
			$('#memberUpdateForm').click(function(){
				$('#loadContent').load("memberUpdateForm.me").css({'height':'1000px'});			
			});
			
		});
	</script>
</body>
</html>