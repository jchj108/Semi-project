<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	char bDiv = ((String)request.getAttribute("bDiv")).charAt(0);
	
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>게시물 작성</title>
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
 			margin-top: 10px; 
			}
			
			#fileInput1, #fileInput2 {
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
			margin: 10px; 
			text-align: center;
			}
	
		
			
		
        </style>
    </head>
    <body>
      <!-- Header-->
         <%@include file="../common/header.jsp" %>	
        
        <!-- Page Content-->
        <div class="container" style="height: 700px;">
        	<div class="input">
			<form action="<%=request.getContextPath()%>/boardInsert.do" method="post" id="boardInsert" name="boardInsert" encType="multipart/form-data">
				<span class="title">제목<input type="hidden" name="bDiv" value="<%= bDiv %>"></span>
				<input type="text" max="50" id="titleInput" name="titleInput"><br>
				<span class="body">내용</span>
				<textarea rows="10" cols="20" id="bodyInput" name="bodyInput"></textarea><br>
				
				<span class="file">파일</span>
				<div class="fileInput">		
				<input type="text" name="fileName1" id="fileName1" style="width: 550px;"disabled="disabled">				
				<input type="file" name="fileInput1" id="fileInput1" onchange="loadName();">
				<input type="button" value="파일 등록" class="upload" style="top:0;"><br>
				</div>
				<span class="fileDelete" onclick="fileDelete();">파일 삭제</span><br>
				
				<span class="file"></span>
				<div class="fileInput">		
				<input type="text" name="fileName2" id="fileName2" style="width: 550px;"disabled="disabled">				
				<input type="file" name="fileInput2" id="fileInput2" onchange="loadName2();">
				<input type="button" value="파일 등록" class="upload" style="top:0;"><br>				
				</div>
				<span class="fileDelete" onclick="fileDelete2();">파일 삭제</span><br>		
				
				
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
              
         function loadName(){
        	 document.getElementById('fileName1').value =  document.getElementById('fileInput1').value;
         }
         
         function loadName2(){
        	 document.getElementById('fileName2').value =  document.getElementById('fileInput2').value;
         }
         
         function fileDelete(){
        	 document.getElementById('fileInput1').value = "";
        	 document.getElementById('fileName1').value =  document.getElementById('fileInput1').value;  	      	       	 
        		 
         }
         
         function fileDelete2(){
        	 document.getElementById('fileInput2').value = "";
        	 document.getElementById('fileName2').value =  document.getElementById('fileInput2').value;  	      	       	 
        		 
         }
		
      </script>
    </body>