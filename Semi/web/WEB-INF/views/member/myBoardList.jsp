<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.Board"%>
<% ArrayList<Board> list = (ArrayList)request.getAttribute("list");%>
<!DOCTYPE html>
<html lang="kor">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>마이페이지 - 게시물관리</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>       
<!--         <link href="css/styles.css" rel="stylesheet" /> -->
		<style>
			*{font-family: 'Noto Sans KR';}
			
			
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
		 	
		 	th {
		 	 	background: lightgrey;
		 	 	border-top: 1px solid grey;
		 	 	height: 50px;
		 	 }
		 	 
		 	 td, th {
		 	 	border-bottom: 1px solid grey;
		 		 	  	 	
		 	 }
		 	 
		 	 table {
		 	 	width: 100%;		 	 	
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
    </head>
    <body>
     
        
        <!-- Page Content-->
        <div class="wrap" >
                       
                <div class="title"><h3>게시물 관리</h3></div>
                <form>
	                <table class="boardList">
							<tr>
								<th><input type="checkbox" id="allSelect" onclick="allSelect();"></th>
								<th>글 번호</th>
								<th>제목</th>						
								<th>작성일</th>
								<th></th>
							</tr>
							
							<% if(list.isEmpty()) {%>
							<tr>
								<td colspan="5">작성한 게시글이 없습니다.</td>
							</tr>
							<% } else {%>
							<%		for (Board b : list) {%>
							<tr>
								<td><input type="checkbox" class="select"></td>
								<td><%= b.getQ_no() %></td>
								<td><%= b.getQ_title() %></td>							
								<td><%= b.getQ_date() %></td>
								<td><button class="correctButton" id="correctBtn">수정하기</button></td>
							</tr>
							
							<% } %>
							<% } %>													
										
						</table>
					<button id="delete">삭제하기</button>
				</form>                             
		</div>				                 
              
            
<!--           <div class="page"> -->
<!--           <ul class="pagination"> -->
<!-- 			    <li class="page-item"> -->
<!-- 			      <a class="page-link" href="#">&laquo;</a> -->
<!-- 			    </li> -->
<!-- 			    <li class="page-item"> -->
<!-- 			      <a class="page-link" href="#">1</a> -->
<!-- 			    </li> -->
<!-- 			    <li class="page-item"> -->
<!-- 			      <a class="page-link" href="#">2</a> -->
<!-- 			    </li> -->
<!-- 			    <li class="page-item"> -->
<!-- 			      <a class="page-link" href="#">3</a> -->
<!-- 			    </li> -->
<!-- 			    <li class="page-item"> -->
<!-- 			      <a class="page-link" href="#">4</a> -->
<!-- 			    </li> -->
<!-- 			    <li class="page-item"> -->
<!-- 			      <a class="page-link" href="#">5</a> -->
<!-- 			    </li> -->
<!-- 			    <li class="page-item"> -->
<!-- 			      <a class="page-link" href="#">&raquo;</a> -->
<!-- 			    </li>			     -->
<!-- 			</ul> -->
<!--         </div> -->       
       
        
    </body>
    
    <script>
   
    	
    </script>
</html>