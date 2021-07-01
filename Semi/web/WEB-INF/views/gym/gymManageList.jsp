<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="gym.model.vo.Gym, java.util.ArrayList, board.model.vo.PageInfo"
%>
<!DOCTYPE html>
<%
ArrayList<Gym> list = (ArrayList) request.getAttribute("gymList");
PageInfo pi = (PageInfo) request.getAttribute("pi");
String cp = request.getContextPath();

int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();

String searchCategory = (String) request.getAttribute("category");
String searchKeyword = (String) request.getAttribute("keyword");
%>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-script-type" content="text/javascript" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>시설 관리</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"
/>
<script src="<%=cp%>/tools/jquery-3.6.0.min.js"></script>
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
	background-color: #00b1d2;
	height: 34px;
	color: white;
	font-size: 20px;
}

th:nth-child(2n) {
	width: 200px;
}

th:nth-child(3n) {
	width: 600px;
}

th:nth-child(4n) {
	width: 500px;
}

th:nth-child(6n) {
	width: 200px;
}

tr, td {
	padding: 10px;
	border-bottom: 1px solid rgba(224, 224, 224, 0.2);
	font-size: 16px;
	font-weight: 400;
	height: 47px;
}

.row {
	margin-top: 50px;
}

.notice {
	width: 1100px;
	height: 630px;
}

.col-lg-9 {
	height: 750px;
}

#searchKeyword {
	display: inline-block;
	width: 200px;
}

.search {
	width: 1100px;
}

.search form {
	display: flex;
	justify-content: space-between;
	margin-top: 0px;
	padding-top: 0px;
}

#noneLink {
	color: lightgray;
	pointer-events: none;
	cursor: default;
}

.pagination {
	margin-top: 50px;
	justify-content: center;
	width: 1100px;
}

.row {
	height: 830px;
}

.page-link {
	font-weight: 300;
}

.activePage {
	font-weight: 700;
	color: black;
}

.titleBtn {
	cursor: pointer;
}

.sortLeft {
	display: flex;
	width: 335px;
	margin-top:0px !important;
	padding-top:0px !important;
	align-content: space-between;
	justify-content: space-between;
}

.sortRight {
	margin-top:0px !important;
	padding-top:0px !important;
}

#search-user {
	align-items: center;
}

.custom-file-label::after {
	background-color : #00b1d2 !important;
	color: white !important;
}
</style>
</head>
<body>
	<!-- Header -->
	<%@include file="../common/header.jsp"%>
	<!-- Page Content-->
	<div class="container">
		<div class="row">
			<div class="col-lg-9">
				<div class="notice">
					<form id="gymManage" method="post">
						<button type="button" id="qnaListBtn" class="titleBtn">시설 관리</button>
						<table class="notice-table" id="listTable">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkAll"></th>
									<th>시설 번호</th>
									<th>이름</th>
									<th>타입</th>
									<th>군/구</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (list.isEmpty()) {
								%>
								<tr>
									<td colspan="5">작성된 시설이 없습니다.</td>
								</tr>
								<%
									} else {
								%>
								<%
									for (Gym g : list) {
								%>
								<tr>
									<td class="checkBoxes">
										<input type="checkbox" name="check" onclick="selectOne();" value="<%= g.getG_NO()%>">
									</td>
									<td><%=g.getG_NO()%></td>
									<td><%=g.getG_NAME()%></td>
									<td><%=g.getG_TYPE_NM()%></td>
									<td><%=g.getG_GU_NM()%></td>
									<td><%=g.getG_COUNT()%></td>
								</tr>
								<%
									}
								%>
								<%
									}
								%>
							</tbody>
						</table>
					</form>
				</div>
				<div class="search">
					<form id="search-user" method="get" action="<%=cp%>/gymManage.do">
						<span class="sortLeft"> <select name="searchList">
								<option ${(param.searchList == "이름") ? "selected" : ""} value="이름">이름</option>
								<option ${(param.searchList == "타입") ? "selected" : ""} value="타입">타입</option>
								<option ${(param.searchList == "군/구") ? "selected" : ""} value="군/구">군/구</option>
								<option ${(param.searchList == "시설번호") ? "selected" : ""} value="시설번호">시설번호</option>
							</select> <input type="text" name="searchKeyword" maxlength="20" id='searchKeyword' value="${param.searchKeyword }"> <input type="submit"
								name="searchSubmit" class="btn btn-primary btn-sm" value="검색"
							>
						</span> <span class="sortRight"> <input type="button" class="insert-button btn btn-info btn-sm" value="시설 등록" id="insert-gym"> <input type="button"
								class="delete-button btn btn-sm btn-warning" value="시설 삭제" id="delete-gym" onclick="deleteGym();"
							> <input type="button" class="button right btn btn-default btn-sm" value="돌아가기" onclick="history.go(-1);">
						</span>
					</form>
				</div>
				<!-- 페이지 넘기기 -->
				<div class="page-div text-center">
					<ul class="pagination">
						<!-- 처음으로 -->
						<%
							if (searchKeyword != null && searchCategory != null) {
						%>
						<%
							if (currentPage <= 1) {
						%>
						<li class="page-item"><a class="page-link" id="noneLink">&laquo;</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=1&searchList=<%=searchCategory%>&searchKeyword=<%=searchKeyword%>'"
						>&laquo;</a></li>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							if (currentPage <= 1) {
						%>
						<li class="page-item"><a class="page-link" id="noneLink">&laquo;</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link" onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=1'">&laquo;</a></li>
						<%
							}
						%>
						<%
							}
						%>
						<!-- 이전 페이지 -->
						<%
							if (searchKeyword != null && searchCategory != null) {
						%>
						<%
							if (currentPage <= 1) {
						%>
						<li class="page-item"><a class="page-link" id="noneLink">&lt;</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=<%=currentPage - 1%>&searchList=<%=searchCategory%>&searchKeyword=<%=searchKeyword%>'"
						>&lt;</a></li>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							if (currentPage <= 1) {
						%>
						<li class="page-item"><a class="page-link" id="noneLink">&lt;</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=<%=currentPage - 1%>'"
						>&lt;</a></li>
						<%
							}
						%>
						<%
							}
						%>
						<!-- 숫자 버튼 -->
						<%
							for (int p = startPage; p <= endPage; p++) {
						%>
						<%
							if (p == currentPage) {
						%>
						<li class="page-item"><a class="page-link activePage"><%=p%></a></li>
						<%
							} else if (searchCategory == null && searchKeyword == null) {
						%>
						<li class="page-item"><a class="page-link" onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=<%=p%>'"><%=p%></a>
						</li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=<%=p%>&searchList=<%=searchCategory%>&searchKeyword=<%=searchKeyword%>'"
						><%=p%></a> <%
 	}
 %> <%
 	}
 %> <!-- 다음 페이지 --> <%
 	if (searchKeyword != null && searchCategory != null) {
 %> <%
 	if (currentPage >= maxPage) {
 %> <li class="page-item"><a class="page-link" id="noneLink">&gt;</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=<%=currentPage + 1%>&searchList=<%=searchCategory%>&searchKeyword=<%=searchKeyword%>'"
						>&gt;</a></li>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							if (currentPage >= maxPage) {
						%>
						<li class="page-item"><a class="page-link" id="noneLink">&gt;</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=<%=currentPage + 1%>'"
						>&gt;</a></li>
						<%
							}
						%>						
						<%
													}
												%>
						<!-- 끝으로  -->
						<%
							if (searchKeyword != null && searchCategory != null) {
						%>
							<%
								if (currentPage >= maxPage) {
							%>
								<li class="page-item"><a class="page-link" id="noneLink">&raquo;</a></li>
							<%
								} else {
							%>
								<li class="page-item"><a class="page-link"
							onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=<%=maxPage%>&searchList=<%=searchCategory%>&searchKeyword=<%=searchKeyword%>'"
						>&raquo;</a></li>
							<%
								}
							%>
						<%
							} else {
						%>
							<%
								if (currentPage >= maxPage) {
							%>
								<li class="page-item"><a class="page-link" id="noneLink">&raquo;</a></li>
							<%
								} else {
							%>
								<li class="page-item"><a class="page-link" onclick="location.href='<%=request.getContextPath()%>/gymManage.do?currentPage=<%=maxPage%>'">&raquo;</a></li>
							<%
								}
							%>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 시설 등록 -->
	<div class="modal fade" id="gymInsertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<%@include file="../gym/gymInsertModal.jsp"%>
	</div>	
	
	<!-- 시설 수정 -->
	<div class="modal fade" id="gymUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<%@include file="../gym/gymUpdateModal.jsp"%>
	</div>	
	
	<!-- Footer-->
	<%@ include file="../common/footer.jsp"%>
	<script>
	(window.onload = function() {
    	$('#qnaListBtn').css({'background':'#00B1D2','color':'white'});
    	
    	$('#insert-gym').on('click', function() {
    		$('#gymInsertModal').modal("show");
    	});
	});

	// 체크박스
	var check = document.getElementsByName('check');
	
	$('#checkAll').on('click', function(){
		if($('#checkAll').prop('checked') == false){
			for(var i = 0; i < check.length; i++){
				check[i].checked = false;
			}
		} else {
			for(var i = 0; i < check.length; i++){
				check[i].checked = true;
			}
		}
	});

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
		});
	});
	
	$(function() {
		$('#listTable td:not(.checkBoxes)').click(function() { // 체크박스 시 modal popup 제외
			
			var gNo = $(this).parent().children().eq(1).text();
			var changeName = [];
			
			$.ajax({
				url: 'gymUpdateForm.do',
				type: 'get',
				data: {gNo : gNo},
				success: function(data) {
					console.log(data);
					for(var i in data) {
						if(i == 0) {
							for (var key in data[i]) {
								var updateGNo = data[i][key].G_NO;	
								console.log(data[i][key].G_NO);
								var gymName = data[i][key].G_NAME;
								var gymType = data[i][key].G_TYPE_NM;
								var gymAddr = data[i][key].G_ADDRESS;
								var gymTel = data[i][key].G_TEL;
								var gymHomepage = data[i][key].G_HOMEPAGE;
								var gymParking = data[i][key].G_PARKING_LOT;
								var gymBigo = data[i][key].G_BIGO;
								var gymEduYN = data[i][key].G_EDU_YN;
								var gymInOut = data[i][key].G_IN_OUT;
								var gymCovid = data[i][key].G_COVID;
								
							}
						} else {
							for (var key in data[i]) {
								if(key == 0) {
									var thumbnail = data[i][key].gChangeName;
									var originNo1 = data[i][key].gFileNo;
								} else if (key != null && key == 1) {
									var image1 = data[i][key].gChangeName;
									var originNo2 = data[i][key].gFileNo;
								} else if (key != null && key == 2) {
									var image2 = data[i][key].gChangeName;
									var originNo3 = data[i][key].gFileNo;
								} else if (key != null && key == 3) {
									var image3 = data[i][key].gChangeName;
									var originNo4 = data[i][key].gFileNo;
								}
							}	
						}
					}
					
					$('#gymUpdateModal').modal("show");
					$('#gymUpdateNo').val(updateGNo)
					$('#gymUpdateName').val(gymName);
					$('#gymUpdateType').val(gymType);
					$('#gymUpdateAddr').val(gymAddr);
					$('#gymUpdateTel').val(gymTel);
					$('#gymUpdateHomepage').val(gymHomepage);
					$('#gymUpdateParking').val(gymParking);
					$('#gymUpdateBigo').val(gymBigo);
					
					if(thumbnail != null) {
						$('#updateImg1').attr("src", "<%=cp%>/gym_uploadFiles/" + thumbnail);
						$('#updateImg1').show();
						
						$('#gymUpdateImg1').on("change", function() {
							$('#hiddenImg1').val(originNo1);
						});
					} else {
						$('#hiddenImg1').val('-1');
						$('#updateImg1').hide();
					}
					
					if(image1 != null) {
						$('#updateImg2').attr("src", "<%=cp%>/gym_uploadFiles/" + image1);
						$('#updateImg2').show();
						
						$('#gymUpdateImg2').on("change", function() {
							$('#hiddenImg2').val(originNo2); 
						});
					} else {
						$('#gymUpdateImg2').on("change", function() {
							$('#hiddenImg2').val('-1');
							console.log($('#hiddenImg2').val());

						});
						$('#updateImg2').hide();
					} 
					
					if (image2 != null) {
						$('#updateImg3').attr("src", "<%=cp%>/gym_uploadFiles/" + image2);
						$('#updateImg3').show();
						$('#gymUpdateImg3').on("change", function() {
							$('#hiddenImg3').val(originNo3); 
						});
					} else {
						$('#gymUpdateImg3').on("change", function() {
							$('#hiddenImg3').val('-1');
							console.log($('#hiddenImg3').val());
						});
						$('#updateImg3').hide();
					} 
					
					if (image3 != null) {
						$('#updateImg4').attr("src", "<%=cp%>/gym_uploadFiles/" + image3);
						$('#updateImg4').show();
						$('#gymUpdateImg4').on("change", function() {
							console.log($('#hiddenImg4').val()); 
							$('#hiddenImg4').val(originNo4); 
						});
					} else {
						$('#gymUpdateImg4').on("change", function() {
							$('#hiddenImg4').val('-1');
							console.log($('#hiddenImg4').val());
						});
						$('#updateImg4').hide();
					}
					
					
					if(gymEduYN == "유") {
						$('#eduY').attr("checked", true);
					} else {
						$('#eduN').attr("checked", true);
					}
					
					if(gymInOut == "실내") {
						$("#in_outIn").attr("checked", true);
					} else {
						$("#in_outOut").attr("checked", true);
					}
					
					switch(gymCovid) {
						case 1 : $('#covid1').attr("checked", true); break;
						case 2 : $('#covid2').attr("checked", true); break;
						case 3 : $('#covid3').attr("checked", true); break;
						case 4 : $('#covid4').attr("checked", true); break;
						case 5 : $('#covid5').attr("checked", true); break;
					}
				}
			});
		});
	});

	
	function deleteGym() {
		
		var count = 0;
		
		for(i = 0; i < check.length; i++){ // 체크박스 체크 여부 확인
			if(check[i].checked){
				count++;
			}
		}
		if(count == 0){
			alert("선택된 항목이 없습니다.");
		} else {
			var bool = confirm("정말 삭제하시겠습니까?");
			if(bool){
				$('#gymManage').attr('action', 'gymDelete.do');
				$('#gymManage').submit();
			}
		}
	};
		
    
	</script> <!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

	</body>
</html>
