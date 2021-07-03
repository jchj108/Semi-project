<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, gym.model.vo.*, board.model.vo.PageInfo"%>
<%
	ArrayList<Gym> gList = (ArrayList)request.getAttribute("gList");	
	String cate = request.getParameter("category");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String category = null;
	
	switch(cate) {
	case "all": category="운동"; break;
	case "swimming": category="수영"; break;
	case "soccer": category="축구"; break;
	case "tennis": category="테니스"; break;
	case "golf": category="골프"; break;
	case "footVolley": category="족구"; break;
	case "badminton": category="배드민턴"; break;
	case "basketball": category="농구"; break;
	}
	
			
	
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
        margin-bottom: 30px;
      }

      .list-group {
        width: 230px;
        padding-top: 40px;
      }
      
      .list-group-item {
        color: black;
      }
      
      .side:hover {color:#00b1d2;}
      
    
      
    </style>
  </head>
  <body>
    <!-- Header-->
    <%@include file="../common/header.jsp" %>	
    
    <!-- Page Content-->
    <div class="container" style="height: auto;">
      <div class="row">
        <div class="col-lg-3">
          <div class="list-group">
            <div class="list-group-item" style="font-weight: bold;">운동 카테고리</div>
            <a class="list-group-item side" href="gymCategory.do?category=all">전체보기</a>
            <a class="list-group-item side" href="gymCategory.do?category=swimming">수영</a>
            <a class="list-group-item side" href="gymCategory.do?category=soccer">축구</a>
            <a class="list-group-item side" href="gymCategory.do?category=tennis">테니스</a>
            <a class="list-group-item side" href="gymCategory.do?category=golf">골프</a>
            <a class="list-group-item side" href="gymCategory.do?category=footVolley">족구</a>
            <a class="list-group-item side" href="gymCategory.do?category=badminton">배드민턴</a>
            <a class="list-group-item side" href="gymCategory.do?category=basketball">농구</a>
          </div>
        </div>
        <div class="col-lg-9">
          <div class="title"><h4>서울시의 <%=category %> 시설</h4></div>

         
        <div class="row">
       <% if(!gList.isEmpty()) { %>
       	<% for(Gym g : gList) {%>
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="detail.do?gNo=<%=g.getG_NO()%>"
                  ><img
                    class="card-img-top"
                    src="<%= request.getContextPath() %>/gym_uploadFiles/<%= g.getG_FILE() %>"
                    alt="..."
                    height="170"
                /></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="detail.do?gNo=<%=g.getG_NO()%>"  style="color: #00b1d2"><%= g.getG_NAME() %></a>
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
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/gymCategory.do?category=<%=cate%>&currentPage=1'">&laquo;</div>
			</li>
			
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/gymCategory.do?category=<%=cate%>&currentPage=<%= currentPage - 1 %>'" id="beforeBtn"> &lt; </button>
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
					<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/gymCategory.do?category=<%=cate%>&currentPage=<%= p %>'"><%= p %></div>
				</li>						
				<% } %>
			<% } %>
			<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/gymCategory.do?category=<%=cate%>&currentPage=<%= currentPage + 1 %>'" id="afterBtn"> &gt; </button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>) {
						$('#afterBtn').prop('disabled', true);
					}
				</script>
			</li>
			
			<li class="page-item">
				<div class="page-link" onclick="location.href='<%= request.getContextPath() %>/gymCategory.do?category=<%=cate%>&currentPage=<%= maxPage %>'">&raquo;</div>
			</li>			    
		</ul>
	</div>
    
    <!-- Footer-->
   	 <%@include file="../common/footer.jsp" %>

  </body>

  <script>
  

  </script>
</html>