<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board, board.model.vo.QnaFile, java.util.ArrayList"%>

<%
	Board b = (Board)request.getAttribute("b");
	char secret = b.getQ_secret().charAt(0);
	ArrayList<QnaFile> fileList = (ArrayList)request.getAttribute("fileList");
	
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>게시물 수정</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
        	*{font-family: 'Noto Sans KR';}
			a{text-decoration: none; color: black;}
			a:hover{text-decoration: none; color: #00B1D2;}
			
			.input{margin: 5%;}
			
			.title, .body, .file, .open, .pwd {
				display: inline-block;
				width: 10%;
				margin: 10px;
				font-weight: bold;
			}
			
			#titleInput, #bodyInput {
				width: 75%
			}
			
			#bodyInput {
				height: 400px;
			}
			
			#submit, #reset {
				width: 70px;
				padding: 0.3rem;
				background: #00b1d2;
				color: white; 
		 		font-weight: bold; 
				border-radius: 10px; 
				border: none;
				cursor: pointer;
			}
			
			.body {
				vertical-align: top;
			}
			
			.button {
				margin-left: 75%;
				margin-top: 30px;
			}	
			
			.fileInput{
			display: inline-block;
			position:relative; 
			overflow:hidden;
 			margin-top: 5px; 
			}
			
			#fileInput2, #fileInput1 {
			opacity: 0; 
			position: absolute; 
			}
			
			.upload, .fileDelete {
				font-size: 10pt;
				width: 100px;
				padding: 0.3rem;
				background: #00b1d2;
				color: white; 
		 		font-weight: bold; 
				border-radius: 10px; 
				border: none;
				cursor: pointer;
			}
			
			.fileDelete{
			position: absolute; 
			margin: 5px; 
			text-align: center;}
	
		
        </style>
    </head>
    <body>
      <!-- Header-->
         <%@include file="../common/header.jsp" %>	
        
        <!-- Page Content-->
        <div class="container" style="height: auto;">
        	<div class="input">
			<form action="<%=request.getContextPath()%>/boardUpdate.do" method="post" id="boardUpdate" name="boardUpdate" encType="multipart/form-data">
				<span class="title">제목<input type="hidden" name="qNo" value="<%=b.getQ_no()%>"></span>
				<input type="text" max="50" value="<%= b.getQ_title() %>" id="titleInput" name="titleInput"><br>
				<span class="body">내용</span>
				<textarea rows="10" cols="20" id="bodyInput" name="bodyInput"><%=b.getQ_body() %></textarea><br>
				
				<% if(fileList.isEmpty()) { %>
				<span class="file">파일</span>
				
				<div class="fileInput">		
				<input type="text" name="fileName1" id="fileName1" style="width: 550px;"disabled="disabled">				
				<input type="file" name="fileInput1" id="fileInput1" onchange="loadName1();">
				<input type="button" value="파일 등록" class="upload" style="top:0;"><br>
				</div>
				<span class="fileDelete" onclick="fileDelete1();">파일 삭제</span><br>
				
				<span class="file"></span>
				<div class="fileInput">		
				<input type="text" name="fileName2" id="fileName2" style="width: 550px;"disabled="disabled">				
				<input type="file" name="fileInput2" id="fileInput2" onchange="loadName2();">
				<input type="button" value="파일 등록" class="upload" style="top:0;"><br>				
				</div>
				<span class="fileDelete" onclick="fileDelete2();">파일 삭제</span><br>				
				<% } else { %>
					<% for(int i = 0; i < fileList.size(); i++) {%>
					<span class="file">첨부파일 <%= i + 1 %></span>
				
					<div class="fileInput">
					<input type="hidden" name="fileNo" value="<%= fileList.get(i).getQ_file_no() %>">
					<input type="text" name="fileName<%= i + 1 %>" id="fileName<%= i + 1 %>" style="width: 650px;"disabled="disabled" value="<%= fileList.get(i).getChangeName() %>">				
					<input type="file" name="fileInput<%= i + 1 %>" id="fileInput<%= i + 1 %>" onchange="loadName<%= i + 1 %>();" value="<%=fileList.get(i).getQ_file() %><%= fileList.get(i).getChangeName() %>">
					<input type="button" value="파일 등록" class="upload" style="top:0;"><br>
					</div><br>			
				
					<% } %>
				<% } %>
				<span class="open">공개 여부</span>
					<input type="radio" id="open" name="openChoice" value="Y"> 공개
					<input type="radio" id="nOpen" name="openChoice" value="N"> 비공개<br>
				
				<div class="button">
					<input type="submit" id="submit" value="확인">
					<input type="reset" value="취소" id="reset">
				</div>
			</form>
			</div>
		</div>
      
        
         <!-- Footer-->
         <%@include file="../common/footer.jsp" %>
      
      <script>
         if('<%=secret%>' == 'Y') {
			$('#open').prop('checked', true);
		} else {
			$('#nOpen').prop('checked', true);
		}
         
         function loadName1(){
        	 document.getElementById('fileName1').value =  document.getElementById('fileInput1').value;
        
         }
         
         function loadName2(){
        	 document.getElementById('fileName2').value =  document.getElementById('fileInput2').value;
         }
         
         function fileDelete1(){
        	 document.getElementById('fileInput1').value = "";
        	 document.getElementById('fileName1').value =  document.getElementById('fileInput1').value;  	      	       	 
        		 
         }
         
         function fileDelete2(){
        	 document.getElementById('fileInput2').value = "";
        	 document.getElementById('fileName2').value =  document.getElementById('fileInput2').value;  	      	       	 
        		 
         }
         
       
		
      </script>
    </body>
</html>