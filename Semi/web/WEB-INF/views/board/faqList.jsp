<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>FAQ</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
        
        *{font-family: 'Noto Sans KR';}
		
		hover{text-decoration: none; color: #00B1D2;}
		
		.wrap {
			width: 100%
		}
		
		.page-div{ 
         	width: 100%;
         	padding-top: 50px;
         	margin-left: 40%;
         }
         
        th {
	 	 	background: lightgrey;
	 	 	border-top: 1px solid grey;
	 	 }
	 	 
	 	td, th {
	 	 	border-bottom: 1px solid grey; 	 	
	 	 	height: 50px;
	 	 }
	 	 
	 	table {
	 	 	width: 100%;
	 	 	text-align: center; 	 		
	 	 }
	 	 
	 	.choice {
	 	 	display:inline-block;
	 	 	background: lightgrey;
	 	 	font-weight: bold;
	 	 	padding: 0.75rem;
	 	 	margin: 15px;
	 	 	width: 300px;
	 	 	border-radius: 10px;
	 	 	text-align: center;
	 	 }
	 	 
	 	.choicePack {
			margin: 20px;
			margin-top: 5%;
		}
	 	 
	 	#faq {
	 	 	margin-left: 20%;
	 	 }
	 	 
	 	.write{
	 	 	width: 100px;
	 	 	background: #00b1d2; 	 	
	 	 	font-weight: bold;
	 	 	text-align: center;
	 	 	padding: 0.5rem;
	 	 	margin: 30px;
	 	 	border-radius: 10px;
	 	 	float: right; 	 		 	
	 	 } 	
	 	 
	 	.search {
	 	 	width: 100%;
	 	 	text-align: center;
	 	 	clear: both;
	 	 }
	 	 
	 	select, input {
	 		margin: 5px;
	 		padding: 0.3rem;
	 	}
	 	
	 	#searchKeyword {
	 		display: inline-block;
	 		width: 30%;
	 	}      
		
        </style>
    </head>
    <body>
       <%@include file="../common/header.jsp" %>	
        
        <!-- Page Content-->
        <div class="container" style="height: 750px;">
        	<div class="wrap">
	        	<div class="choicePack">
					<span class="choice" id="faq">FAQ</span>
					<span class="choice" id="qna">QNA</span>
				</div>
			
				<div class="content">
					<table class="boardList">
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
						
						<tr>
							<td>7</td>
							<td id="boardTitle">하... (1)</td>
							<td>user01</td>
							<td>2021.05.22</td>
						</tr>					
						
					</table>
					
					<div class="write"><a href="boardWrite.html" style="color:white" class="boardWrite">작성하기</a></div>
				</div>
			
				<div class="search">
					<form>
						<select name="searchList">
							<option value="제목">제목</option>
							<option value="작성자">작성자</option>					
						</select>
						<input type="text" name="searchKeyword" maxlength="20" id='searchKeyword'>
						<input type="submit" name="searchSubmit" value="검색">
					</form>
				</div>
			</div>
			<!-- 페이지 넘기기 -->
			<div class="page-div">
				<ul class="pagination">
					<li class="page-item">
						<div class="page-link">&laquo;</div>
					</li>
					<li class="page-item">
						<div class="page-link">1</div>
					</li>						
					<li class="page-item">
						<div class="page-link">&raquo;</div>
					</li>			    
				</ul>
			</div>        	
        </div>
        
        <%@include file="../common/footer.jsp" %>
        
        <script>
	        $('.choice').mouseenter(function(){
				$(this).css('cursor', 'pointer');
			}).click(function(){
				$(this).css({'color':'white', 'background':'#00b1d2'});
				$('content')
			});        
        </script>
    </body>
</html>
