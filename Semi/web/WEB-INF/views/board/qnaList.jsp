<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board, page.model.vo.Page, java.util.ArrayList"%>
<%
	ArrayList<Board> qList = (ArrayList)request.getAttribute("qList");
	Page pi = (Page)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
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
<!--         <link href="css/styles.css" rel="stylesheet" /> -->
        <style>
        
        *{font-family: 'Noto Sans KR';}        		
		
		.boardTitle:hover{cursor: pointer; color: #00B1D2;}	
		
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
         
        th {
	 	 	background: lightgrey;
	 	 	border-top: 1px solid grey;
	 	 }
	 	 
	 	 td {overflow: hidden; white-space:nowrap; text-overflow: ellipsis;}
	 	 
	 	td, th {
	 	 	border-bottom: 1px solid grey; 	 	
	 	 	height: 50px;
	 	 }
	 	 
	 	table {
	 	 	width: 100%;
	 	 	text-align: center;
	 	 	table-layout: fixed;	 		
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
	 	 
	 	.choice:hover{color:white; background:#00b1d2; cursor:pointer;}
	 	
	 	#qna{color:white; background:#00b1d2;}
	 	
	 	.choicePack {
			margin: 20px;
			margin-top: 5%;
		}
	 	 
	 	#faq {
	 	 	margin-left: 20%;
	 	 }
	 	 
	 	 .boardWrite {
	 		width: 100px;
	 	 	background: #00b1d2; 	 	
	 	 	font-weight: bold;
	 	 	text-align: center;
	 	 	padding: 0.5rem;
	 	 	margin: 30px;
	 	 	border-radius: 10px;
	 	 	border-collapse: collapse;
	 	 	border-style: none;
	 	 }
	 	 
	 	.write{
	 	  	float: right; 	 		 	
	 	 } 	
	 	 
	 	.search {
	 	 	width: 100%;
	 	 	text-align: center;
	 	 	clear: both;
	 	 	margin-top: 50px;
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
        <div class="container" style="height: auto;">
        	
	        	<div class="choicePack">
					<span class="choice" id="faq" onclick="location.href='<%=request.getContextPath()%>/faq.do'">FAQ</span>
					<span class="choice" id="qna" onclick="location.href='<%= request.getContextPath() %>/qna.do'">QNA</span>
				</div>
			
				<div class="content">
					<table class="boardList">
						<tr>
							<th width="100px;">글번호</th>
							<th>제목</th>
							<th width="120px;">작성자</th>
							<th width="120px;">작성일</th>
						</tr>
						
						<% if(qList.isEmpty()) { %>
							<tr>
								<td colspan="4">게시물이 없습니다.</td>
							</tr>
							<% } else { %>
								<% for(Board b : qList) { %>
							<tr>								
								<td><%= b.getQ_no()%><input type="hidden" name="qNo" value="<%= b.getQ_no()%>"></td>
								<td class="boardTitle"><%= b.getQ_title() %></td>							
								<td><%= b.getWriterName() %></td>
								<td><%= b.getQ_date() %></td>
							</tr>
								<% } %>					
							<% } %>					
						
					</table>
				<% if(loginUser != null) { %>
					<div class="write"><button onclick="location.href='<%=request.getContextPath()%>/insertQna.do" style="color:white" class="boardWrite">작성하기</button></div>
				<% } %>
				</div>
			
				<div class="search">
					<form>
						<select name="searchList">
							<option value="제목">제목</option>
							<option value="작성자">작성자</option>					
						</select>
						<input type="text" name="searchKeyword" maxlength="20" id='searchKeyword'>
						<input type="submit" name="searchSubmit" value="검색" style="color:white; background:#00b1d2; border:none; border-radius: 5px; cursor:pointer; padding:7px;">
					</form>
				</div>
			
		</div>
					
		<!-- 페이지 넘기기 -->
		<div class="page">
		<ul class="pagination">
			<li class="page-item">
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/qna.do?currentPage=1'">&laquo;</div>
			</li>
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/qna.do?currentPage=<%= currentPage - 1 %>'" id="beforeBtn"> &lt; </button>
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
					<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/qna.do?currentPage=<%= p %>'"><%= p %></div>
				</li>						
				<% } %>
			<% } %>
			
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/qna.do?currentPage=<%= currentPage + 1 %>'" id="afterBtn"> &gt; </button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>) {
						$('#afterBtn').prop('disabled', true);
					}
				</script>
			</li>
			
			<li class="page-item">
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/qna.do?currentPage=<%= maxPage %>'">&raquo;</div>
			</li>			    
		</ul>
	</div>
        
        <%@include file="../common/footer.jsp" %>
        
        <script>	        
	        
	        $('.boardTitle').on('click', function(){
	        	var qNo = $(this).parents().children().eq(0).text();
				location.href='<%= request.getContextPath() %>/detailBoard.do?qNo=' + qNo;
			});
	        
	      
        </script>
    </body>
</html>
