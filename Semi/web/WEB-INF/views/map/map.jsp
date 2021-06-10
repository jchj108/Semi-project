<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, map.model.vo.Map"%>
<%
	ArrayList<Map> list = (ArrayList<Map>) request.getAttribute("list");

	if(!list.isEmpty()) {
		for(Map m : list) {
			System.out.println(m.getG_XCODE()); 
		}
	}
	
	if(!list.isEmpty()) {
		for(int i = 0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>map</title>
    <!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script
      type="text/javascript"
      src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9u1ajgwv8z"
    ></script>

    <style>

      	*{font-family: 'Noto Sans KR';}
	
	/* a태그 설정 */
	.nav a, .f2 a{
		text-decoration: none;
		color: black;
	}
	
	.nav a:hover, .f2 a:hover{
		text-decoration: none;
		color: #00B1D2;
	}
	
	/* Header */
	.navbar-light{
		background-color: white;
		border-bottom: 1px solid lightgray;
		height: 89px;
	}
	
	/* Footer */
	footer{
		background-color: white;
		color: black;
		border-top: 1px solid lightgray;
	}
	
	.f1{
		display: flex;
	}
	
	.f1-col{
		flex: 1;
		font-size: 13px;
	}
	
	.f2{
		display: flex;
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		margin: 50px 0px 50px 0px;
		padding: 15px 0px 15px 0px;
	}
	
	.f2-col{
		flex: 1;
	}
	
	.copyright{
		color: gray;
		font-size: 13px;
	}

      body {
        min-height: 700px;
        display: flex;
        flex-direction: column;
      }


      .logo,
      .item {
        display: inline-block;
      }
      .logo > img {
        height: 72px;
        margin: 20px 0px 20px 40px;
      }

      .ul-item > li {
        list-style-type: none;
        display: inline-block;
        margin: 0px 10px 0px 10px;
      }
      .item {
        margin: auto 100px auto auto;
      }

      /* footer */
      footer {
        text-align: center; /* position: absolute; left: 0; top: 0; width: 100%; height: 100%; */
      }
      #footer-name {
        display: inline-block;
        margin-right: 10px;
      }

      footer {
        margin-top: auto; /* 최소 높이 하단에서 자동으로 뻗어나가도록 설정 */
      }
    </style>
  </head>
  <body>
    <header>
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <img src="<%=request.getContextPath()%>/image/logo.png" style="height: 72px" />
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarResponsive"
            aria-controls="navbarResponsive"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="nav nav-pills ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#!">회원가입</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="#!">로그인</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <!-- Page Content-->
   	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">지도로 찾기</h1>
				<div class="list-group">
					<a class="list-group-item" href="#!">Category 1</a> <a
						class="list-group-item" href="#!">Category 2</a> <a
						class="list-group-item" href="#!">Category 3</a>
				</div>
			</div>
			<div class="col-lg-9">
				<div id="map" style="width: 750px; height: 750px"></div>
				<script>
					var map = new naver.maps.Map('map', {
						center : new naver.maps.LatLng(37.3595704, 127.105399),
						zoom : 15,
					})
					

					var marker = new CustomMarker(37.3595704, 127.105399, 1, 2,
							"헬스", "네이버 헬스", "ㅇㅇ시 ㅇㅇ동");
					var marker = new CustomMarker(37.3599704, 127.109399, 2, 2,
							"체육관", "네이버 헬스", "수시 사동");

					function overGym(childID) {
						$('#' + childID).show()
					}

					function outGym(childID) {
						$('#' + childID).hide()
					}

					function CustomMarker(lat, lng, gymID, category, gymGubun,
							name, address) {
						var contents_html = "";

						switch (category) {

						case 1:
							contents_html = '<div style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px; background-color:#b12121; color:white; text-align:center; border:1px solid #831616; border-radius:14px; opacity:75%" onmouseover="javascript:overGym(\''
									+ gymID
									+ '\');" onmouseout="javascript:outGym(\''
									+ gymID
									+ '\');">'
									+ '<div style="font-weight: bold; font-size:14px"> '
									+ gymGubun
									+ ' </div>'
									+ '<div style="font-weight: normal; font-size:13px; margin-top:3px; display:none" id="'+gymID+'">'
									+ name + '<br/>' + address + ' </div>';

						case 2:
							contents_html = '<div style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px; background-color:#b12121; color:white; text-align:center; border:1px solid #831616; border-radius:14px; opacity:75%" onmouseover="javascript:overGym(\''
									+ gymID
									+ '\');" onmouseout="javascript:outGym(\''
									+ gymID
									+ '\');">'
									+ '<div style="font-weight: bold; font-size:14px"> '
									+ gymGubun
									+ ' </div>'
									+ '<div style="font-weight: normal; font-size:13px; margin-top:3px; display:none" id="'+gymID+'">'
									+ name + '<br/>' + address + ' </div>';
						}

						var marker = new naver.maps.Marker({
							position : new naver.maps.LatLng(lat, lng),
							map : map,
							title : gymGubun,
							icon : {
								content : contents_html,
								size : new naver.maps.Size(38, 58),
								anchor : new naver.maps.Point(19, 58),
							},
							draggable : false
						});
						return marker;
					}
				</script>
			</div>
        </div>
      </div>
    </div>
    <!-- Footer-->
    <footer class="py-5">
      <div class="container">
        <div class="f1">
          <div class="f1-col">
            이용문의<br> <span
              style="font-size: 35px; font-weight: 700px; color: #00B1D2;">1588-0215</span><br>
            AM 10:00 - PM 07:00<br> 토 일 공휴일 휴무
          </div>
  
          <div class="f1-col">
            <b>내일도 운동가야지</b><br> 서울시 강남구 역삼동<br> 대표 : 꽉자바<br>
            사업자번호 : 707-0982-2133<br> contact@kkakjava.co.kr<br>
          </div>
        </div>
  
        <div class="f2">
          <div class="f2-col">
            <a href="#!">이용약관</a>
          </div>
          <div class="f2-col">
            <a href="#!">개인정보처리방침</a>
          </div>
          <div class="f2-col">
            <a href="#!">위치정보이용약관</a>
          </div>
          <div class="f2-col">
            <a href="#!">고객센터</a>
          </div>
        </div>
  
        <span class="copyright">Copyright ⓒ Kkakjava Co., Ltd. All
          rights reserved.</span>
      </div>
    </footer>
  
    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
