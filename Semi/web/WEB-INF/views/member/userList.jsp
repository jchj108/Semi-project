<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, board.model.vo.PageInfo"%>
<% 
	ArrayList<Member> list = (ArrayList)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="content-script-type" content="text/javascript" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원 목록</title>
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <style>
      * {
      	font-family: 'NotoSansKR';
        list-style: none;
        box-sizing: border-box;
        text-decoration: none;
        font-weight: 500;
      }
      
      .titleBtn {
            background-color: white;
            padding: 8px 30px !important;
            width: 366px;
            height: 50px;
            font-size: 24px;
            font-weight: bold;
            color: black;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border: 0;
            float: left;
        }

        .notice-table {
        	width: 1100px;
            text-align: center;
        }

        th {
        	width: 240px;
            background-color: dimgrey;
            height: 34px;
            color: white;
            font-size: 20px;
        }

        tr, td {
            padding: 10px;
            border-bottom: 1px solid rgba(224, 224, 224, 0.2);
            font-size: 18px;
        }
        
        .row{margin-top: 50px;}
        .notice{width: 1100px; height: 600px;}
        .col-lg-9{height: 750px;}
        
        #searchKeyword {
 			display: inline-block;
 			width: 200px;
 		}
        
        .search{width: 1100px;}
        
         .page-div{ 
         	width: 100%;
         	display: block;
         	padding-top: 50px;
         	margin-left: 50%;
         }
         
		 .delete-button{margin-left: 50%;}
      
     	 .page-div{position: absolute;}
     	 
     	 #noneLink{
     	 	color : lightgray;
     	 	pointer-events: none;
     	 	cursor: default;
     	 }
      
    </style>
  </head>
<body>
	<!-- Header -->
	<%@include file="../common/header.jsp" %>
	
	<!-- Page Content-->
	<div class="container">
		<div class="row">
        	<div class="col-lg-9">
				<div class="notice">
                	<div class="buttonbox">
						<button type="button" id="qnaListBtn" class="titleBtn" onclick="location.href='qnaBoardList.li'">Q&A 관리</button>
					    <button type="button" id="faqListBtn" class="titleBtn" onclick="location.href='faqBoardList.li'">FAQ 관리</button>
					    <button type="button" id="userListBtn" class="titleBtn">회원 관리</button>
	    			</div>
                <table class="notice-table" id="listTable">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" onclick="checkAll();"></th>
							<th>회원번호</th>
					        <th>이메일</th>
					   		<th>이름</th>
					        <th>가입일</th>
					    </tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="5">가입한 회원이 없습니다.</td>
						</tr>
						<% } else { %>
						<%		for(Member m : list){  %>
						<tr>
							<td><input type="checkbox" name="check" onclick="selectOne();"></td>
							<td><%= m.getM_no() %></td>
							<td><%= m.getM_email() %></td>
							<td><%= m.getM_name() %></td>
							<td><%= m.getM_date() %></td>
						</tr>
						<% 		} %>
						<% } %>
					</tbody>
                </table>
				</div>
                <div class="search">
					<form id="search-user">
						<select name="searchList">
							<option value="이메일">이메일</option>
							<option value="이름">이름</option>					
						</select>
						<input type="text" name="searchKeyword" maxlength="20" id='searchKeyword'>
						<input type="submit" name="searchSubmit" value="검색">
						<input type="button" class="delete-button" value="회원 삭제" id="delete-user">
						<input type="button" value="돌아가기" onClick="history.go(-1);">
					</form>
				</div>
					
				<!-- 페이지 넘기기 -->
				<div class="page-div">
					<ul class="pagination">
						<!-- 처음으로 -->
						<li class="page-item">
							<a class="page-link" onclick="location.href='<%= request.getContextPath() %>/userList.li?currentPage=1'">&laquo;</a>
						</li>
						<!-- 이전 페이지 -->
						<% if(currentPage <= 1){%>
							<li class="page-item">
								<a class="page-link" id="noneLink">&lt;</a>
							</li>
						<% } else {%>
							<li class="page-item">
								<a class="page-link" onclick="location.href='<%= request.getContextPath() %>/userList.li?currentPage=<%= currentPage - 1 %>'">&lt;</a>
							</li>
						<% } %>
						<!-- 숫자 버튼 -->
						<% for(int p = startPage; p <= endPage; p++){ %>
						<%		if(p == currentPage){ %>
									<li class="page-item">
										<a class="page-link" id="noneLink"><%=p %></a>
									</li>
						<%		} else { %>
									<li class="page-item">
										<a class="page-link" onclick="location.href='<%= request.getContextPath() %>/userList.li?currentPage=<%= p %>'"><%=p%></a>
									</li>
						<%		} %>
						<%	} %>
						<!-- 다음 페이지 -->
						<% if(currentPage >= maxPage){%>
							<li class="page-item">
								<a class="page-link" id="noneLink">&gt;</a>
							</li>
						<% } else {%>
							<li class="page-item">
								<a class="page-link" onclick="location.href='<%= request.getContextPath() %>/userList.li?currentPage=<%= currentPage + 1 %>'">&gt;</a>
							</li>
						<% } %>
						<!-- 끝으로  -->
						<li class="page-item">
							<a class="page-link" onclick="location.href='<%= request.getContextPath() %>/userList.li?currentPage=<%= maxPage %>'">&raquo;</a>
						</li>	
					</ul>
				</div>
            </div>
        </div>
    </div>
    
    <!-- Footer-->
	<%@include file="../common/footer.jsp" %>
    
    <script>
    	(window.onload = function() {
        	$('#userListBtn').css({'background':'#00B1D2','color':'white'});
		});
	        
		// 체크박스
		var check = document.getElementsByName('check');

		function checkAll(){
			
			if($('#checkAll').is(":checked")){
				for(var i = 0; i < check.length; i++){
					check[i].checked = true;
				}
			} else{
				for(var i = 0; i < check.length; i++){
					check[i].checked = false;
				}
			}
		}

		function selectOne(){
			var count = 0;
			
			for(var i = 0; i < check.length; i++){
				if(check[i].checked){
					count++;
				}
			}
			
			if(count != check.length){
				$('#checkAll').prop('checked', false);
			} else{
				$('#checkAll').prop('checked', true);
			}
			
		}
		
		$(function(){
			$('#listTable td').mouseenter(function(){
				$(this).parent().css({'background':'darkgray', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css('background', 'none');
			}).click(function(){ // 리스트 클릭했을 때 동작
//	 			var bId = $(this).parent().children().eq(0).text();
				
	<%-- 			location.href='<%= request.getContextPath() %>/detail.bo?bId=' + bId; --%>
				
			});
		});
	</script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>