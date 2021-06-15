<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="member.model.vo.Member"%>
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
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"
/>
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
	color: #323232;
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
	/* max-width: 100%; */
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
	width: 580px;
	position: absolute;
	bottom: 0%;
}

/* swipper */
.swiper-container {
	width: 100%;
	height: 100%;
	background-color: #f5f8fd;
}

.mySwiper {
	margin-top: 80px;
	width: 1000px;
	background: #f5f8fd;
	box-shadow: 0 0px 3px 0 rgb(0 0 0/ 50%);
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	width: 250px;
	height: 250px;
	box-shadow: 0 1px 3px 0 rgb(0 0 0/ 50%);
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
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.swiper-button-next, .swiper-button-prev {
	color: #00b1d2;
}

/* swipper */
.body2 {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
}

.mini-title {
	position: relative;
	top: 70px;
	font-size: 24px;
	font-weight: 700;
}

.exceptWrapper {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	min-height: 100vh;
}

.local-images {
	margin-top: 90px;
	display: flex;
	align-content: center;
	align-items: center;
	justify-content: center;
	vertical-align: middle;
	flex-direction: row;
	flex-wrap: wrap;
}

.local-image {
	width: 232px;
	height: 232px;
	overflow: hidden;
	justify-content: center;
	align-self: center;
}

.banner {
	margin-top: 50px;
	margin-bottom: 100px;
}

h3 {
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
}

.imageBox {
	width: 250px;
	height: 300px;
	/* text-align: center; */
	justify-content: center;
	align-items: center;
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
    float: left;
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
}

.ui-menu-item .ui-menu-item-wrapper.ui-state-active {
	border: 2px solid #00b1d2 !important;
    background: #00b1d2 !important;
    font-weight: bold !important;
    color: #ffffff !important;
} 
<!-- chrome autocomplete 초기화 -->
input:-webkit-autofill,
input:-webkit-autofill:hover, 
input:-webkit-autofill:focus, 
input:-webkit-autofill:active
{
 -webkit-box-shadow: 0 0 0 30px white inset !important;
} 

</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<!-- Page Content-->
	<section class="tabArea">
		<div id="main_wrapper">
			<div class="box" id="box1">
				<div id="find">
					<nav class="tab_type1">
						<ul>
							<li id="tab1"><a href="#a" class="on">서비스 찾기</a></li>
							<li id="tab2"><a href="#a">운동 추천받기</a></li>
							<li id="tab3"><a href="#a">지도에서 찾기</a></li>
						</ul>
					</nav>
				</div>
				<div id="pannel1" class="tab-content on">
					<div>
						<h2 class="main_header" id="main_header">
							어떤 서비스가 <br /> 필요하세요?
						</h2>
					</div>
					<div id="input_group">
						<div id="search">
							<form>
								<div id="group">
									<input type="text" id="search_service" placeholder="서비스를 검색하세요" />
									<div id="search_icon">
										<img src="<%=request.getContextPath()%>/image/search.png" width="20px" height="20px" alt="검색" />
									</div>
								</div>
								<!-- ajax 검색 -->
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
						        
						        $(function() {    //화면 다 뜨면 시작
						            $("#search_service").autocomplete({
						                source : function( request, response ) {
						                     $.ajax({
						                            url: 'search.do',
						                            dataType: "json",
						                            data: {keyword: $('#search_service').val()},
						                            success: function(data) {
						                                //서버에서 json 데이터 response 후 목록에 추가
						                                console.log(data)
						                                response(
						                                    $.map(data, function(item) {    //json[i] 번째 에 있는게 item 임.
						                                        return {
						                                            value: item.G_NAME +" (" + item.G_TYPE_NM +")",    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
						                      //                      value: item,    //그냥 사용자 설정값?
						                      //                      test : item+"test"    //이런식으로 사용

						                                            //[
						                         //    {"name": "하늘이", "dogType": "푸들", "age": 1, "weight": 2.14},
						                             //    {"name": "콩이", "dogType": "푸들", "age": 3, "weight": 2.5},
						                             //    {"name": "람이", "dogType": "허스키", "age": 7, "weight": 3.1}
						                             //]
						                                            // json이 다음 처럼 넘어오면
						                                            // 상황 : name으로 찾고 dogType을 넘겨야 하는 상황이면 
						                                            // label : item.dogType ,    //오토컴플릿이 되고 싶은 단어 
						                                            // value : item.family ,    //넘겨야 하는 단어
						                                            // age : item.age ,
						                                            // weight : item.weight
						                                        }
						                                    })
						                                );
						                            }
						                       });
						                    },    // source 는 자동 완성 대상
						                select : function(event, ui) {    //아이템 선택시
						                    console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
						                    console.log(ui.item.label);    //김치 볶음밥label
						                    console.log(ui.item.value);    //김치 볶음밥
						                    console.log(ui.item.test);    //김치 볶음밥test
						                    
						                },
						                focus : function(event, ui) {    //포커스 가면
						                    return false;//한글 에러 잡기용도로 사용됨
						                },
						                minLength: 1,// 최소 글자수
						                autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
						                classes: {    //잘 모르겠음
						                    "ui-autocomplete": "highlight"
						                },
//						                delay: 300,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
						                open: function(event, ui) {
						                	$(this).autocomplete("widget").css({
						                		"width" : 433
						                	});
						                }, 
//						                disabled: true, //자동완성 기능 끄기
						                position: { my : "right top", at: "right bottom" },    //잘 모르겠음
						                close : function(event){    //자동완성창 닫아질때 호출
						                    console.log(event);
						                }
						            }).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
						                  return $( "<li>" )    //기본 tag가 li로 되어 있음 
						                  .append("<div>" + item.value + "</div>")    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
						                  .appendTo( ul );
						           }
						        });

						        
								</script>
							</form>
						</div>
					</div>
					<ul class="category1-buttons categories grid">
						<li class="category"><a><div class="category-icon">
									<img src="<%=request.getContextPath()%>/image/free-icon-swimming-50004.png" width="45px" alt="수영" />
									<p>수영</p>
								</div></a></li>
						<li class="category"><a><div class="category-icon">
									<img src="<%=request.getContextPath()%>/image/free-icon-football-players-on-game-263102.png" width="45px" alt="축구" />
									<p>축구</p>
								</div></a></li>
						<li class="category"><a><div class="category-icon">
									<img src="<%=request.getContextPath()%>/image/free-icon-tennis-3332598.png" width="45px" alt="테니스" />
									<p>테니스</p>
								</div></a></li>
						<li class="category"><a><div class="category-icon">
									<img src="<%=request.getContextPath()%>/image/golfer.png" alt="골프" width="45x" />
									<p>골프</p>
								</div></a></li>
						<li class="category"><a><div class="category-icon">
									<img
										src="<%=request.getContextPath()%>/image/artboard-pixel-scalable-to-any-size-perfect-vector-image-use-web-shop-many-glyph-beautiful-football-ball-icon-121131289.jpg"
										alt="족구" width="45px"
									/>
									<p>족구</p>
								</div></a></li>
						<li class="category"><a><div class="category-icon">
									<img src="<%=request.getContextPath()%>/image/man-playing-badminton.png" alt="배드민턴" width="45x" />
									<p>배드민턴</p>
								</div></a></li>
						<li class="category"><a><div class="category-icon">
									<img src="<%=request.getContextPath()%>/image/basketball-player-scoring.png" alt="농구" width="45px" />
									<p>농구</p>
								</div></a></li>
						<li class="category"><a><div class="category-icon">
									<img src="<%=request.getContextPath()%>/image/more (1).png" alt="기타" width="45px" />
									<p>기타</p>
								</div></a></li>
					</ul>
				</div>
				<div id="pannel2" class="tab-content">
					<div>
						<h2 class="main_header" style="margin-bottom: 16px">
							내게 필요한 <br /> 운동은 뭐가 있을까?
						</h2>
					</div>
					<p
						style="font-size: 1.1rem; font-weight: 500; line-height: normal; color: #737373; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;"
					>맞춤형 운동을 제안해드려요</p>
					<button
						style="width: 215px; height: 50px; color: #fff; background-color: #00b1d2; border-color: #00b1d2; margin-top: 10px; border-radius: 0.375rem;"
						type="button" class="btn"
					>운동 추천받기</button>
				</div>
				<div id="pannel3" class="tab-content">
					<div>
						<h2 class="main_header" style="margin-bottom: 16px">
							내 주변에는 <br /> 어떤 운동 시설이 있을까?
						</h2>
					</div>
					<p
						style="font-size: 1.1rem; font-weight: 500; line-height: normal; color: #737373; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;"
					>서울시 공공 체육 시설을 찾아드려요</p>
					<button
						style="width: 215px; height: 50px; color: #fff; background-color: #00b1d2; border-color: #00b1d2; margin-top: 10px; border-radius: 0.375rem;"
						type="button" class="btn" id="searchMap"
					>지도에서 찾기</button>
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
			<h2 class="mini-title">인기 서비스</h2>
			<div class="swiper-container mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="image/flower1.PNG" />slide1
					</div>
					<div class="swiper-slide">Slide 2</div>
					<div class="swiper-slide">Slide 3</div>
					<div class="swiper-slide">Slide 4</div>
					<div class="swiper-slide">Slide 5</div>
					<div class="swiper-slide">Slide 6</div>
					<div class="swiper-slide">Slide 7</div>
					<div class="swiper-slide">Slide 8</div>
					<div class="swiper-slide">Slide 9</div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<!-- <div class="swiper-pagination"></div> -->
			</div>
			<h2 class="mini-title">방역 우수 센터</h2>
			<div class="swiper-container mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">Slide 1</div>
					<div class="swiper-slide">Slide 2</div>
					<div class="swiper-slide">Slide 3</div>
					<div class="swiper-slide">Slide 4</div>
					<div class="swiper-slide">Slide 5</div>
					<div class="swiper-slide">Slide 6</div>
					<div class="swiper-slide">Slide 7</div>
					<div class="swiper-slide">Slide 8</div>
					<div class="swiper-slide">Slide 9</div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<!-- <div class="swiper-pagination"></div> -->
			</div>
			<h2 class="mini-title">주변 시설</h2>
			<div class="local-images">
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
			</div>
			<h2 class="mini-title" style="margin-top: 0px">추천 시설</h2>
			<div class="local-images">
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
				<div class="imageBox">
					<div class="local-image">
						<img src="image/flower1.PNG" width="100%" height="100%" />
					</div>
					<h3>title</h3>
				</div>
			</div>
			<div class="banner">
				<img src="image/Myprotein-low (1).jpg" width="100%" />
			</div>
		</div>
	</div>
	<!-- Footer-->
	<%@ include file="footer.jsp" %>
	<script>
        $(function () {
            $('.tab_type1 ul li a').click(function () {
                const num = $('.tab_type1 ul li a').index($(this))

                $('.tab_type1 ul li a').removeClass('on') // 초기화
                $('.tab-content').removeClass('on')
                $(this).addClass('on')
                $('.tabArea .tab-content:eq(' + num + ')').addClass('on')
            })

            $('#slideshow > div:gt(0)').hide() // gt 안의 숫자보다 높은 인덱스 선택

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