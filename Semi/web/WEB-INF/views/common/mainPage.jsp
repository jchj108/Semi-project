<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="member.model.vo.Member, gym.model.vo.*, java.util.ArrayList"%>
<% 
String cp = request.getContextPath(); 
ArrayList<Gym> covidList = (ArrayList)request.getAttribute("covidList");
ArrayList<Gym> popularList = (ArrayList)request.getAttribute("popularList");
ArrayList<Gym> recommendList = (ArrayList)request.getAttribute("recommendList");
ArrayList<Gym> localList = (ArrayList)request.getAttribute("localList");
ArrayList<GFile> thumbList = (ArrayList)request.getAttribute("thumbList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-script-type" content="text/javascript" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- swiper -->
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<!-- swiper -->
<style>
* {
	list-style: none;
	box-sizing: border-box;
	text-decoration: none;
	font-weight: 500;
}

a {
	cursor: pointer;
}

li a:hover {
	text-decoration: none;
}

button {
	background: inherit;
	border: none;
	box-shadow: none;
	border-radius: 0;
	padding: 0;
	overflow: visible;
	cursor: pointer;
	font: 400 13.3333px Arial;
}

html {
	size: 100%;
	height: 100%;
	min-height: 100%;
	position: relative;
}

body {
	margin: 0;
	padding: 0;
	height: 100%;
	size: 100%;
	font-family: 'Noto Sans KR';
	font-size: 1rem;
	color: #323232; !important;
	text-align: left;
	background-color: #fff;
	min-height: 100%;
}

#wrapper {
	display: flex;
	flex-direction: column;
	border: 1px solid black;
	align-items: center;
}

#main_wrapper {
	box-sizing: border-box;
	position: relative;
	max-width: 62.5rem;
	margin: 0 auto;
	height: calc(100vh - 72px);
	display: flex;
	flex-direction: row;
	align-items: flex-end;
	margin-bottom: 40px;
}

.box {
	width: 485px;
	height: 500px;
	/* border: 1px solid black; */
}

#box1 {
	margin-top: 40px;
	list-style: none;
	display: flex;
	/* position: relative; */
	flex-direction: column;
	align-self: center;
	padding-right: 3.125rem;
}

#box2 {
	margin-left: 15px;
	width: 100%;
	height: 100%;
	max-width: 100%;
	width: 500px;
	display: flex;
	position: relative;
	flex-direction: column-reverse;
}

#find {
	height: 50px;
	border-bottom: 1px solid #e1e1e1;
}

#find li {
	margin-top: 15px;
}

.main_header {
	font-size: 34px;
	letter-spacing: -1px;
	word-spacing: -1px;
	margin-top: 28.22px;
	margin-bottom: 28.22px;
}

#group {
	border: 2px solid #00b1d2;
	border-radius: 4px;
	height: 60px;
	display: flex;
}

#search_service {
	width: 371px;
	border: none;
	font-size: 1rem;
	padding: 1rem 1.25rem;
	height: 56px;
	caret-color: #00b1d2;
	font-family: inherit;
	margin-left: 0px;
}

input::placeholder {
	font-weight: 500;
	color: #9e9e9e;
}

input:focus {
	outline: none;
}

#search_icon {
	display: flex;
	width: 40px;
	height: 56px;
	cursor: pointer;
}

img {
	vertical-align: middle;
	margin: auto;
	position: relative;
}

ul {
	margin-bottom: 16px;
	margin-top: 16px;
}

.tab_type1 ul {
	display: flex;
	padding: 0;
}

.tab_type1 ul li a {
	color: #737385;
	font-weight: 400;
}

.tab_type1 ul li:first-child a {
	margin-right: 20px;
}

.tab_type1 ul li a.on {
	color: #323232;
	font-weight: 600;
	padding-bottom: 10px;
	border-bottom: 0.125rem solid #323232;
}

div.category-icon {
	width: 96.75px;
	height: 88px;
	margin-bottom: 7px;
}

.grid {
	padding-left: 0px;
	width: 431px;
	height: 204px;
	padding-top: 1.75rem;
	display: flex;
	text-align: center;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: flex-start;
}

li {
	min-width: 0;
}

p {
	font-weight: 600;
	line-height: 1.43;
	letter-spacing: normal;
	color: #323232;
	font-size: 0.875rem;
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-top: 10px;
}

input#search_service {
	padding-left: 15px;
	margin-right: 10px;
}

.btn {
	font-weight: 600;
	font-size: 1rem;
}

.tab-content.on {
	display: block;
}

.tab-content {
	display: none;
}

.mainImage {
	max-width: 30vw;
	position: absolute;
	bottom: 0%;
}

/* swipper */
.swiper-container {
	width: 100%;
	height: 100%;
}

.mySwiper {
	width: 1000px;
	background: #fff;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	width: 250px;
	height: 250px;
	flex-direction: column;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	font-weight: 500;
	font-size: 16px;
	test-decoration: none;
	color : #323232;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 223.812px;
	object-fit: cover;
	border-radius: 10px;
	margin-bottom: 5px;
}

.swiper-slide:hover {
	opacity: 0.8;
	color: unset;
}

.swiper-container-horizontal>.swiper-pagination-bullets, .swiper-pagination-custom, .swiper-pagination-fraction {
	top: 10px;
	text-align: right;
	bottom: unset;
}

:root {
	--swiper-theme-color: #00b1d2;
}

.swiper-button-prev {
	left : -20px
}

.swiper-button-next {
	right : -20px;
}

.swiper-button-next, .swiper-button-prev {
	height:auto;
	width: 40px;
	height: 40px;
	background: white;
	border-radius: 50%;
	box-shadow: 0 1px 3px 0 #323232;
	top: 53%;
}

.swiper-button-next:hover, .swiper-button-prev:hover {
	opacity: 0.8;
}

.swiper-button-next:after, .swiper-container-rtl .swiper-button-prev:after {
	font-size: 20px;
	font-weight: 900;
	color: #323232;
}

.swiper-button-prev:after, .swiper-container-rtl .swiper-button-next:after {
	font-size: 20px;
	font-weight: 900;
	color: #323232;
}

/* swipper end */
.body2 {
	width: 1000px;
	height: 2600px;
	margin-left: auto;
	margin-right: auto;
	display: flex;
	justify-content: space-evenly;
	flex-direction: column;
}

.mini-title {
	position: relative;
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 16px;
}

.exceptWrapper {
	min-height: 100vh;
}

.local-images {
	display: flex;
	align-content: center;
	align-items: center;
	justify-content: space-between;
	vertical-align: middle;
	flex-direction: row;
	flex-wrap: wrap;
	cursor: pointer;
}

.local-image {
	width: 232px;
	height: 200px;
	overflow: hidden;
	justify-content: center;
	align-self: center;
	position: relative;
	text-align: center;
}

.local-image span {
	top:53%;
	left:50%;
	color: white;
	position: absolute;
	transform: translate(-50%, -50%);
	display: none;
	white-space: nowrap;
}

.local-image img {
	
}

h3 {
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
}

.imageBox {
	width: 232px;
	height: 250px;
	/* text-align: center; */
	justify-content: center;
	align-items: center;
	color: #323232;
	text-align: center;
}

.imageBox:hover a {
	color: #323232;
}

.imageBox:hover {
	opacity: 0.8;
}

.imageBox a {
	color: #323232;
}

.imageBox img {
	width: 100%;
	height: 100%;
	border-radius: 10px;
}

.imageBox .imgtitle {
	margin-top: 5px;
}

#tab2 {
	margin-right: 20px;
}

.ui-autocomplete {
	max-height: 350px;
	overflow-y: auto;
/* prevent horizontal scrollbar */
	overflow-x: hidden; -->
	border: 10px solid black;
}

.ui-autocomplete {
    position: absolute;
    top: 100%;
    left: 0; 
    z-index: 1000;
/*  float: left; */
    display: none;
    padding: 0;
    margin: 0;
    list-style: none;
    background-color: #ffffff;
    border-color: #ccc;
    border-color: rgba(0, 0, 0, 0.2);
    border-style: solid;
    border-width: 10px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    -webkit-background-clip: padding-box;
    -moz-background-clip: padding;
    background-clip: padding-box;
    *border-right-width: 2px;
    *border-bottom-width: 2px;
}

.ui-menu-item > a.ui-corner-all {
    display: block;
    clear: both;
    font-weight: normal;
    line-height: 18px;
    color: #555555;
    white-space: nowrap;
    text-decoration: none;
}


.ui-state-hover, .ui-state-active {
    color: #ffffff;
    text-decoration: none;
    border-radius: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    background-image: none;
}

.ui-widget.ui-widget-content {
    border: 2px solid #c5c5c5;
    border-radius: 4px;
    width: 433px; !important;
}

.ui-menu-item .ui-menu-item-wrapper.ui-state-active {
	border: 2px solid #00b1d2 !important;
    background: #00b1d2 !important;
    font-weight: bold !important;
    color: #ffffff !important;
} 

a { text-decoration:none !important } a:hover { text-decoration:none !important }

.swiper-slide .subtext {
	position: absolute;
	font-size: 20px;
	color: white;
	opacity: 1;
	display: none;
}

.location-list {
	margin: 0px;
	padding: 0px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
}

.location-list li {
	width: 166.66px;
	margin-top: 16px;
	font-weight: 400;
	padding-left: 5px;
	cursor: pointer;
}

.banner {
	margin-top: 50px;
}

</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<!-- Page Content-->
	<section class="tabArea">
		<div id="main_wrapper">
			<div class="box" id="box1">
				<div id="find">
					<nav class="tab_type1">
						<ul>
							<li id="tab1"><a href="#a" class="on">????????? ??????</a></li>
							<li id="tab2"><a href="#a">?????? ????????????</a></li>
							<li id="tab3"><a href="#a">???????????? ??????</a></li>
						</ul>
					</nav>
				</div>
				<div id="pannel1" class="tab-content on">
					<div>
						<h2 class="main_header" id="main_header">
							?????? ???????????? <br /> ????????????????
						</h2>
					</div>
					<div id="input_group">
						<div id="search">
							<form>
								<div id="group">
									<input type="text" id="search_service" placeholder="???????????? ???????????????" />
									<div id="search_icon">
										<img src="<%=request.getContextPath()%>/image/search.png" width="20px" height="20px" alt="??????" />
									</div>
								</div>
								<!-- ajax ?????? -->
								<div class="suggestion_box" id="suggestion_box"></div>
								
								<script>
/*						        $(function() {  
						            $("#search_service").keyup(function() {
						            	$.ajax({
						            		url: 'search.do',
						            		data: {keyword : $('#search_service').val()},
						            		success: function(data) {
						            			console.log(data);
						            			
						    					var result = '';
						    					$('#suggestion_box').html('');
						    					for(var i in data) {
						    						result += "(" + data[i].G_TYPE_NM + ") "
						    							   + data[i].G_NAME + "<br>"
						    					}
						    					$('#suggestion_box').html(result);
						            		}
						            	});
						            });
						        });					*/
						        
						        $(function() {    //?????? ??? ?????? ??????
						            $("#search_service").autocomplete({
						                source : function( request, response ) {
						                     $.ajax({
						                            url: 'search.do',
						                            dataType: "json",
						                            data: {keyword: $('#search_service').val()},
						                            success: function(data) {
						                                //???????????? json ????????? response ??? ????????? ??????
						                                console.log(data)
						                                response(
						                                    $.map(data, function(item) {    //json[i] ?????? ??? ????????? item .
						                                        return {
						                                            value: item.G_NAME +" (" + item.G_TYPE_NM +")",    //UI ?????? ???????????? ??????, ?????? ???????????? ?????? ??????
																	gNo: "<%= request.getContextPath() %>/detail.do?gNo=" + item.G_NO
						                                        }
						                                    })
						                                );
						                            }
						                       });
						                    },    // source ??? ?????? ?????? ??????
						                select : function(event, ui) {    //????????? ?????????
						                    
						                    var url = ui.item.gNo; // ?????? ??????
						                    location.href=url; 
						                    
						                },
						                focus : function(event, ui) {    
						                    return false;//?????? ?????? ??????????????? ?????????
						                },
						                minLength: 1,// ?????? ?????????
						                autoFocus: true, //????????? ?????? ?????? ????????? ????????? false
						                classes: {    
						                    "ui-autocomplete": "highlight"
						                },
						                close : function(event){    //??????????????? ???????????? ??????
						                    console.log(event);
						                }
						            }).autocomplete( "instance" )._renderItem = function( ul, item ) {    // UI??? ???????????? ???????????? ??????
						                  return $( "<li>" )    //?????? tag??? li??? ?????? ?????? 
						                  .append("<div>" + item.value + "</div>")    //??????????????? ????????? ????????? HTML??? ????????? UI??? ????????? ???????????? ??????.
						                  .appendTo( ul );
						           }
						        });
								</script>
							</form>
						</div>
					</div>
					<ul class="category1-buttons categories grid">
						<li class="category">
							<a href="<%=cp %>/gymCategory.do?category=swimming"><div class="category-icon">
								<img src="<%=cp%>/image/free-icon-swimming-50004.png" width="45px" alt="??????" />
									<p>??????</p>
								</div></a></li>
						<li class="category">
							<a href="<%=cp %>/gymCategory.do?category=soccer"><div class="category-icon">
									<img src="<%=cp%>/image/free-icon-football-players-on-game-263102.png" width="45px" alt="??????" />
									<p>??????</p>
								</div></a></li>
						<li class="category">
							<a href="<%=cp %>/gymCategory.do?category=tennis"><div class="category-icon">
									<img src="<%=cp%>/image/free-icon-tennis-3332598.png" width="45px" alt="?????????" />
									<p>?????????</p>
								</div></a></li>
						<li class="category">
							<a href="<%=cp %>/gymCategory.do?category=golf"><div class="category-icon">
									<img src="<%=cp%>/image/golfer.png" alt="??????" width="45x" />
									<p>??????</p>
								</div></a></li>
						<li class="category">
							<a href="<%=cp %>/gymCategory.do?category=footVolley"><div class="category-icon">
									<img
										src="<%=cp%>/image/artboard-pixel-scalable-to-any-size-perfect-vector-image-use-web-shop-many-glyph-beautiful-football-ball-icon-121131289.jpg"
										alt="??????" width="45px"
									/>
									<p>??????</p>
								</div></a></li>
						<li class="category">
							<a href="<%=cp %>/gymCategory.do?category=badminton"><div class="category-icon">
									<img src="<%=cp%>/image/man-playing-badminton.png" alt="????????????" width="45x" />
									<p>????????????</p>
								</div></a></li>
						<li class="category">
							<a href="<%=cp %>/gymCategory.do?category=basketball"><div class="category-icon">
									<img src="<%=cp%>/image/basketball-player-scoring.png" alt="??????" width="45px" />
									<p>??????</p>
								</div></a></li>
						<li class="category">
							<a href="<%=cp %>/gymCategory.do?category=all"><div class="category-icon">
									<img src="<%=cp%>/image/more (1).png" alt="??????" width="45px" />
									<p>????????????</p>
								</div></a></li>
					</ul>
				</div>
				<div id="pannel2" class="tab-content">
					<div>
						<h2 class="main_header" style="margin-bottom: 16px">
							?????? ????????? <br /> ????????? ?????? ??????????
						</h2>
					</div>
					<p style="font-size: 1.1rem; font-weight: 500; line-height: normal; color: #737373; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;">
						????????? ????????? ??????????????????</p>
					<button
						style="width: 215px; height: 50px; color: #fff; background-color: #00b1d2; border-color: #00b1d2; margin-top: 10px; border-radius: 0.375rem;"
						type="button" class="btn" id="recommend">?????? ????????????</button>
				</div>
				
				
				<script>
				<% if(loginUser != null){ %>
					userName = "<%= loginUser.getM_name() %>";
					userLike = "<%= loginUser.getM_like() %>";
				<% } %>
				</script>
				<div class="modal fade" id="recommendModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				 	<%@include file="../member/recommend.jsp" %>
				</div>
										
				<div id="pannel3" class="tab-content">
					<div>
						<h2 class="main_header" style="margin-bottom: 16px">
							??? ???????????? <br /> ?????? ?????? ????????? ??????????
						</h2>
					</div>
					<p
						style="font-size: 1.1rem; font-weight: 500; line-height: normal; color: #737373; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;"
					>????????? ?????? ?????? ????????? ???????????????</p>
					<button
						style="width: 215px; height: 50px; color: #fff; background-color: #00b1d2; border-color: #00b1d2; margin-top: 10px; border-radius: 0.375rem;"
						type="button" class="btn" id="searchMap"
					>???????????? ??????</button>
				</div>
			</div>
			<div class="box" id="box2">
				<div id="slideshow">
					<div id="mainImage1">
						<img class="mainImage" src="<%=request.getContextPath()%>/image/pt_trainer.jpg" />
					</div>
					<div id="mainImage2">
						<img class="mainImage" src="<%=request.getContextPath()%>/image/pt_trainer_1.jpg" />
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main firstpage wrapper -->
	<div class="exceptWrapper">
		<div class="body2">
			<div class="popular" style="position: relative">
			<h2 class="mini-title">?????? ?????????</h2>
				<div class="swiper-container mySwiper" style="position:static">
					<div class="swiper-pagination"></div> 
					<div class="swiper-wrapper">
						<% for(int i = 0; i<popularList.size(); i++) { %>
 							<a class="swiper-slide" href="<%= cp %>/detail.do?gNo=<%=popularList.get(i).getG_NO()%>">
 							<% for(int j = 0; j < thumbList.size(); j++) { %>
 								<% if(popularList.get(i).getG_NO() == thumbList.get(j).getgNo()) { %>
 									<img src="<%= cp %>/gym_uploadFiles/<%= thumbList.get(j).getgChangeName() %>">
 								<% } %>
							<%	} %> 							
							<span class="subtext">????????? : <%=popularList.get(i).getG_COUNT() %></span>
							<%= popularList.get(i).getG_NAME() %>
							</a>
						<% } %>
					</div>
					
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
			<div class="covid" style="position: relative">
			<h2 class="mini-title">?????? ?????? ??????</h2>
				<div class="swiper-container mySwiper" style="position:static">
					<div class="swiper-pagination"></div> 
					<div class="swiper-wrapper">
						<% for(int i = 0; i<covidList.size(); i++) { %>
 							<a class="swiper-slide" href="<%= cp %>/detail.do?gNo=<%=covidList.get(i).getG_NO()%>">
 							<% for(int j = 0; j < thumbList.size(); j++) { %>
 								<% if(covidList.get(i).getG_NO() == thumbList.get(j).getgNo()) { %>
 									<img src="<%= cp %>/gym_uploadFiles/<%= thumbList.get(j).getgChangeName() %>">
 								<% } %>
							<%	} %> 							
							<span class="subtext">????????? : <%=covidList.get(i).getG_COVID() %></span>
							<%= covidList.get(i).getG_NAME() %>
							</a>
						<% } %>
					</div>
					
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
				
				<script>
					$(document).ready(function() {
						$('.swiper-slide').mouseover(function() {
							$(this).children('.subtext').attr('style', "display:inline-block");
						})
						$('.swiper-slide').mouseout(function() {
							$(this).children('.subtext').attr('style', "display:none");
						})
					});			
				</script>
				
			</div>
			<div>
			<h2 class="mini-title">?????? ??????</h2>
			<div class="local-images">
				<% if(loginUser == null) { %>
					<% for(int i = 0; i<localList.size(); i++) { %>
						<div class="imageBox">
							<div class="local-image">
 							<% for(int j = 0; j < thumbList.size(); j++) { %>
 								<% if(localList.get(i).getG_NO() == thumbList.get(j).getgNo()) { %>
								<img src="<%=cp%>/gym_uploadFiles/<%=thumbList.get(j).getgChangeName() %>">
								<%	} %>
							<%	} %>
								<span><%=localList.get(i).getG_GU_NM() %></span>
							</div>
						<div class="imgtitle"><%= localList.get(i).getG_NAME() %></div>
						</div>
					<% } %>
				<% } else { %>
					<% for(int i = 0; i<localList.size(); i++) { %>
						<div class="imageBox">
							<a href="<%=cp%>/detail.do?gNo=<%=localList.get(i).getG_NO() %>">
								<div class="local-image">
		 							<% for(int j = 0; j < thumbList.size(); j++) { %>
		 								<% if(localList.get(i).getG_NO() == thumbList.get(j).getgNo()) { %>
										<img src="<%=cp%>/gym_uploadFiles/<%=thumbList.get(j).getgChangeName() %>">
										<%	} %>
									<%	} %>
									<span><%=localList.get(i).getG_GU_NM() %></span>
								</div>
							<div class="imgtitle"><%= localList.get(i).getG_NAME() %></div>
							</a>
						</div>
					<% } %>
				<% } %>
			</div>
			</div>
			<div>
			<h2 class="mini-title">?????? ??????</h2>
<%-- 			<% if(request.getSession().getAttribute("loginUser") != null && ((Member)request.getSession().getAttribute("loginUser")).getM_like() != null) { %>
			<% 		for(int i = 0; i<recommendList.size(); i++) { %>
					<%= recommendList.get(i).getG_NAME() %>
			<%		} 	%>
			<% } else { %>
			<% 		for(int i = 0; i<recommendList.size(); i++) { %>
					<%= recommendList.get(i).getG_NAME() %>
			<%		} 	%>
			<% } %> --%>
			
			<div class="local-images">
				<% if(loginUser != null) { %>
					<% for(int i = 0; i<recommendList.size(); i++) { %>
						<div class="imageBox">
							<a href="<%=cp%>/detail.do?gNo=<%=recommendList.get(i).getG_NO() %>">
								<div class="local-image">
		 							<% for(int j = 0; j < thumbList.size(); j++) { %>
		 								<% if(recommendList.get(i).getG_NO() == thumbList.get(j).getgNo()) { %>
										<img src="<%=cp%>/gym_uploadFiles/<%=thumbList.get(j).getgChangeName() %>">
										<%	} %>
									<%	} %>								
									<span><%=recommendList.get(i).getG_TYPE_NM() %></span>
								</div>
							<div class="imgtitle"><%= recommendList.get(i).getG_NAME() %></div>
							</a>
						</div>
					<% } %>
				<%} else { %>
					<% for(int i = 0; i<recommendList.size(); i++) { %>
						<div class="imageBox">
								<div class="local-image">
		 							<% for(int j = 0; j < thumbList.size(); j++) { %>
		 								<% if(recommendList.get(i).getG_NO() == thumbList.get(j).getgNo()) { %>
										<img src="<%=cp%>/gym_uploadFiles/<%=thumbList.get(j).getgChangeName() %>">
										<%	} %>
									<%	} %>									
									<span><%=recommendList.get(i).getG_TYPE_NM() %></span>
								</div>
							<div class="imgtitle"><%= recommendList.get(i).getG_NAME() %></div>
						</div>
					<% } %>
				<% } %>
			</div>
			</div>
				<script>
					$(function() {
						$('.local-image').mouseover(function() {
							$(this).children('span').attr('style', 'display:block');
						})
						$('.local-image').mouseout(function() {
							$(this).children('span').attr('style', 'display:none');
						})
					});
				</script>
			<div>
				<h2 class="mini-title">??????????????? ??????</h2>
				<div style="position:relative">
				<img src="<%=cp %>/image/mapbg.PNG" style="width:100%; height: 56px; border-radius:10px;">
				<div style="position:absolute; top:30%; margin-left:25px">???? ????????? ?????? ?????? ????????? ??????????????? ???????????????</div></div>
				<ul class="location-list">
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>????????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>????????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>????????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>?????????</li>
				</ul>
			</div>
			<div class="banner">
				<img src="image/Myprotein-low (1).jpg" width="100%" />
			</div>
			
		<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<%@include file="../common/loginAlert.jsp" %>
		</div>
		</div>
		<script>
	        $(function () {
				$('.location-list li').click(function() {
						var $location = $(this).text();
						window.location.href = "<%=cp%>/category.do?g_gu_nm="+$location;
					});
				});
		</script>
		

		
		<script>
			<% if(loginUser == null) { %>
				$('.local-images').on('click', function() {
					$('#alertModal').modal("show");
				});
				$('#recommend').on('click', function() {
					$('#alertModal').modal("show");
				});
			<% } else { %>
				$('#recommend').on('click', function(){
					$('#recommendModal').modal("show");
				});
			<% } %>
		</script>
		
	<!-- Footer-->
	<%@ include file="footer.jsp" %>
	<script>
        $(function () {
            $('.tab_type1 ul li a').click(function () {
                const num = $('.tab_type1 ul li a').index($(this))

                $('.tab_type1 ul li a').removeClass('on') // ?????????
                $('.tab-content').removeClass('on')
                $(this).addClass('on')
                $('.tabArea .tab-content:eq(' + num + ')').addClass('on')
            })

            $('#slideshow > div:gt(0)').hide() // gt ?????? ???????????? ?????? ????????? ??????

            setInterval(function () {
                $('#slideshow > div:first').fadeOut(2000).next().fadeIn(2000).end().appendTo('#slideshow')
            }, 10000)
        })

        $('.category-icon').hover(function () {
            console.log($(this).find('img'))
            $(this).find('img').animate({
                bottom : '10px',
            }, 100)
        }, function () {
            $('.category-icon > img').animate({
                bottom : '0px',
            }, 100)
        })
    </script>
	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
        var swiper = new Swiper('.mySwiper', {
            slidesPerView : 3,
            spaceBetween : 30,
            slidesPerGroup : 3,
            loop : true,
            loopFillGroupWithBlank : true,
            pagination : {
                el : '.swiper-pagination',
                clickable : true,
            },
            navigation : {
                nextEl : '.swiper-button-next',
                prevEl : '.swiper-button-prev',
            },
            url : "",
        })
    </script>
	<script>
    	$('#searchMap').click(function() {
    		location.href ="<%=request.getContextPath()%>/map.do";
		});
	</script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>