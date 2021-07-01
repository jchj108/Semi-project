<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, gym.model.vo.Gym, page.model.vo.Page"%>
<%
	ArrayList<Gym> gList = (ArrayList)request.getAttribute("gList");	
	String cate = request.getParameter("g_gu_nm");
	
	Page pi = (Page)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>검색 상세 페이지</title>
   
    <!-- Core theme CSS (includes Bootstrap)-->
<!--     <link href="css/styles.css" rel="stylesheet" /> -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      * {font-family: 'Noto Sans KR';}
      
      a {
 		text-decoration: none;
        color: black;
      }
      
      a:hover {
        text-decoration: none;
        color: #00b1d2;
      }

    
      /* a태그 설정 */
      .nav a, .f2 a {
        text-decoration: none;
        color: black;
      }

      .nav a:hover, .f2 a:hover {
        text-decoration: none;
        color: #00b1d2;
        
      }

      .sortPack {
        text-align: right;
        margin-bottom: 10px;
      }

      .sort {
        display: inline-block;
        text-decoration: none;
        color: white;
        background: #00b1d2;
        padding: 0.5rem;
        width: 150px;
        text-align: center;
        margin: 10px;
        border-radius: 10px;
      }

     .page {margin-bottom: 50px; margin-top: 50px;}
		 		
	 .pagination {
		list-style-type: none;
		display: block;
		text-align: center;
		margin-left: 40%;
 	  }
			 	
	 .page-item {
		display: inline-block;
		padding: 0.2rem;
	  }		

      .title {
        margin-top: 50px;
        margin-bottom: 20px;
      }

      
      
      .side:hover {color:#00b1d2;}
      
    </style>
  </head>
  <body>
    <!-- Header-->
    <%@include file="../common/header.jsp" %>	
    
    <!-- Page Content-->
    <div class="container" style="height: auto;">
     
        
        <div class="col-lg-9" style="margin: auto;">
          <div class="title"><h4><%= cate %> 운동시설</h4></div>

          <!-- 정렬 버튼 -->
          <div class="sortPack">
            <span class="sort" id="reviewSort">리뷰 순 정렬</span>
            <span class="sort" id="scoreSort">평점 순 정렬</span>
          </div>         
        <div class="row">
       <% if(!gList.isEmpty()) { %>
       	<% for(Gym g : gList) {%>
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#!"
                  ><img
                    class="card-img-top"
                    src="<%= request.getContextPath() %>/gym_uploadFiles/<%= g.getG_FILE() %>"
                    alt="..."
                /></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#!" style="color: #00b1d2"><%= g.getG_NAME() %></a>
                  </h4>

                  <p class="card-text"><%= g.getG_ADDRESS() %></p>
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
      

     <div class="page">
		<ul class="pagination">
			<li class="page-item">
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/category.do?g_gu_nm=<%=cate%>&currentPage=1'">&laquo;</div>
			</li>
			
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/category.do?g_gu_nm=<%=cate%>&currentPage=<%= currentPage - 1 %>'" id="beforeBtn"> &lt; </button>
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
					<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/category.do?g_gu_nm=<%=cate%>&currentPage=<%= p %>'"><%= p %></div>
				</li>						
				<% } %>
			<% } %>
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/category.do?g_gu_nm=<%=cate%>&currentPage=<%= currentPage + 1 %>'" id="afterBtn"> &gt; </button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>) {
						$('#afterBtn').prop('disabled', true);
					}
				</script>
			</li>
			
			<li class="page-item">
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/category.do?g_gu_nm=<%=cate%>&currentPage=<%= maxPage %>'">&raquo;</div>
			</li>			    
		</ul>
	</div>
    
    <!-- Footer-->
   	 <%@include file="../common/footer.jsp" %>

  </body>

  
</html>