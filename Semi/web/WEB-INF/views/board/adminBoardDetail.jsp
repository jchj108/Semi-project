<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board, board.model.vo.Comments, board.model.vo.QnaFile, java.util.ArrayList"%>
    
<% 
	Board b = (Board)request.getAttribute("b");
	ArrayList<Comments> cList = (ArrayList)request.getAttribute("cList");
	ArrayList<QnaFile> fileList = (ArrayList)request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>게시글 조회하기</title>
   
        <!-- Core theme CSS (includes Bootstrap)-->
<!--         <link href="css/styles.css" rel="stylesheet" /> -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
        	*{font-family: 'Noto Sans KR';}
			
			.wrap {
				margin: 30px;
				margin-top: 80px;
			}
			
			.info {
		    	font-size: 10pt;
		    	color: #00b1d2;
		    	font-weight: bold;
		    	float: right;
		    	margin: 5px;
		    }
		    
		    .content-body {
		    	width:80%;
		    	height: 350px;
		    	clear: both;
		    	
		    }   
		  
		    
		    #update, #delete {
		    	width: 80px;
		    	background: #00b1d2;
		    	text-align: center;
		    	padding: 0.2rem;
		    	color: white;
		    	font-weight: bold;
		    	border-radius: 10px;
		    	float: right;
		    	margin: 10px;
		    	border: none;		    	
		    }
		    
 		    button:hover, #insertComment:hover {cursor: pointer;} 
 		    
		    #com {
		    	display: inline-block;
		    	width: 88%;
		    }
		    
		    .comment {font-size: 10pt;}
		    
		    .comment-head {
		    	color: #00b1d2;
		    	font-weight: bold;
		    }
		    
		    .comment-body {
		    	margin: 8px;
		    	display: inline-block;
		    	margin-bottom: 20px;
		    }
		    
		    .commentBtnPack{display: inline-block; float:right;}

 		    .commentUpdate, .commentDelete{background: none; border: none; color:#00b1d2; font-weight:bold;}
 		    
 		    .commentDelete:hover, .commentUpdate:hover{color:grey;}
		    
		    input {
		    	margin: 5px;
		    	padding: 0.3rem;
		    }
		    
		    #insertComment {
		    	background: #00b1d2;
		    	color: white;
		    	font-weight: bold;
		    	border-radius: 10px;
		    	border: none;
		    	padding: 0.5rem;
		    }
		    
		    .uploaeFileArea {
		    	border-bottom: 1px solid grey;
		    	border-top: 1px solid grey;
		    	background: lightgrey;
		    	padding: 10px;
		    }
		    
		    .uploadFile {
		    	display:inline-block;
		    	font-weight:bold;
		    	font-size: 11pt;		    	
		    }
		    
		    a {
		    	font-size: 11pt;
		    	margin-left: 10px;
		    	
		    }
		    
			
        </style>
    </head>
    <body>
    <%@include file="../common/header.jsp" %>	
        
        <!-- Page Content-->
        <div class="container" style="height: auto;">
        	<div class="wrap">
				<form class="content" name="updateBoardForm" id="updateBoardForm" method="post" action="<%= request.getContextPath() %>/boardUpdateForm.do" encType="multipart/form-data">
					<input type="hidden" id="qNo" name="qNo" value="<%=b.getQ_no() %>">
					<input type="hidden" id="bDiv" name="bDiv" value="<%=b.getQ_board_div() %>">
					<div class="title"><h3><%= b.getQ_title() %><input type="hidden" name="title" value="<%= b.getQ_title() %>"></h3></div>
					<hr>
					<div class="info">날짜 <%= b.getQ_date()%> | 작성자 <%= b.getWriterName()%> | 조회수 <%= b.getQ_count()%></div>
					<div class="content-body"><%= b.getQ_body() %><input type="hidden" name="body" value="<%= b.getQ_body() %>"></div>
					
					
					<% if(!fileList.isEmpty()) { %>
					<div class="uploaeFileArea">
						<% for(int i = 0; i < fileList.size(); i++) { %>						
							<div class="uploadFile" id="uploadFile<%=i%>"> 첨부파일 <%=i + 1%></div>
							<a href="<%= request.getContextPath() %>/board_uploadFiles/<%= fileList.get(i).getChangeName()%>" download="<%= fileList.get(i).getChangeName()%>">
							<%= fileList.get(i).getChangeName() %>
							</a><br>
						<% } %>
					</div>	
					<% } %>
				<div class="buttonPack">
				<% if(loginUser != null && (loginUser.getM_no() == b.getWriterNo() || loginUser.getM_auth() == 0)) { %>
					<button type="button" id="delete">삭제</button>
					<button type="submit" id="update">수정</button>
				<% } %>
				</div>
			</form>
				<hr style='clear:both;'>
				<form method="post" id="commetsForm">
				<div class="comment">				
 					<div class="comment-head">댓글 (<%= cList.size() %>)</div>					
 					<hr>

				
				<table class="commentList" id="commentList">
 					<% if(!cList.isEmpty()) { %>
 					
 						<% for(Comments c : cList) {%>

						<tr>
							<td class="comment-writer" style='font-weight: bold;' width="150px"><%= c.getcWriterName() %></td>
							<td width="750px" class="comment-body"><%= c.getC_body() %></td>
							<td width="100px" class="commentBtnPack">						
								<% if(loginUser.getM_no() == c.getcWriterNo()) { %>
									<input type="hidden" id="cNo" name="cNo" value="<%= c.getC_no() %>">
									<button class="commentUpdate" id="commentUpdate">수정</button>
									<button class="commentDelete" id="commentDelete">삭제</button>									
								<% } %>
							</td>							
						</tr>
 						<% } %>
 								
 					<% } %>
				</table>	
					
					<br>				
 						<input type="text" max="300" name="com" id="com" placeholder="댓글을 입력하세요.">
 						<span id="counter">0</span>/150
 						<input type="button" value="확인" id="insertComment" style="float: right;">
 						
 				</div>
			</form>
 			</div>
         </div>
        <%@include file="../common/footer.jsp" %>
        
     
        
        <script>
		
		$('#com').keyup(function(){
			// 댓글 글자 수 세기 & 150자 이상 작성 불가
			var input = $(this).val();
			var inputLength = input.length;
			$('#counter').html(inputLength);
			
			if(inputLength > 150) {
				$('#counter').css('font-weight', 'bold');
				var substr = input.substr(0, 150);
				$(this).val(substr);
			}			
		});
						
		$('#delete').click(function(){
			if(window.confirm("정말 삭제하시겠습니까?")) {
				$('#updateBoardForm').attr('action', 'deleteBoard.do');
				$('#updateBoardForm').submit();
			}
		});
		
		$('#insertComment').on('click', function(){
			var mNo = <%=loginUser.getM_no()%>;
			var qNo = <%= b.getQ_no()%>;
			var cBody = $('#com').val();
			
			$.ajax({
				url: 'insertComment.do',
				type: 'post',
				data: {mNo:mNo, qNo:qNo, cBody:cBody},
				success: function(data) {
					console.log("성공");
					
					$commentList = $('#commentList');
					$commentList.html('');
	 				
					for(var i in data) {
						var $tr = $("<tr>");
						var $tdWriter = $('<td>').attr("class", "comment-writer").css({'font-weight':'bold', 'width':'150px'}).text(data[i].cWriterName);
						var $tdBody = $('<td>').attr("class", "comment-body").css({'width':'750px'}).text(data[i].c_body);
						var $tdBtn = $('<td>').attr("class", "commentBtnPack").css({'width':'100px'});
					

					if(<%=loginUser.getM_no()%> == data[i].writerNo) {
						var updateBtn = $('<button>').attr({"class": "commentUpdate", "id":"commentUpdate"}).text("수정");							
						var deleteBtn = $('<button>').attr({"class": "commentDelete", 'id':"commentDelete"}).text("삭제");
						var cNo = $('<input>').attr({"type":"hidden", "name":"cNo"}).val("data[i].c_no");
						
						$tdBtn.append(cNo);
						$tdBtn.append(updateBtn);
						$tdBtn.append(deleteBtn);
					}
						
					$tr.append($tdWriter);
					$tr.append($tdBody);
					$tr.append($tdBtn);
					$commentList.append($tr);												
						
								
					$('#com').val("");
					$('#counter').text(0);
					}
					
				},
				error: function(data) {					
					console.log("서버 전송 실패");
				},
				complete: function(data) {
					console.log(data);
				}
				
			});
		});
		
		// 댓글 삭제
		$('.commentDelete').on('click', function(){
				if(window.confirm("정말 삭제하시겠습니까?")){
					
				}
			
		});
		
	</script>
    </body>
</html>
