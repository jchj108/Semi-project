<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"
	  rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	* {font-family: 'Noto Sans KR';}
	
	#category-title{
		font-size: 20px;
		font-weight: bold;
	}
	
	.list-group{
		width: 230px;
		padding-top: 40px;
	}
	
	.list-group img{
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.review-box{
		margin: 20px 0px 20px 20px;
		padding: 15px;
	}
	
	.section{
		margin: 20px 5px 15px 5px;
	}
	
	.title{
		width: 130px;
		margin-left: 5px;
		display: inline-block;
		vertical-align: top;
		padding-top: 2px;
	}
	
	.score-box{
		display: inline-block;
	}
	
	.rating-box{
		width: 320px;
		padding: 3px;
		margin-bottom: 5px;
		border: 1px solid lightgray;
		border-radius: 5px;
	}
	
	.rating-box-name{
		display: inline-block;
		margin: 0px 0px 0px 5px;
		width: 20%;
	}
		
	.score_star{
		cursor: pointer;
		display: inline-block;
		width: 70%;
		text-align: right;
	}
	
	.description{
		display: inline-block;
		margin: 5px 0px 8px 5px;
	}
	
	.div-keyword{
		text-align: center;
		margin: 5px 10px 10px 10px;
	}
	
	.div-keyword>input[type=checkbox]{
		margin: 0px 10px 0px 10px;
	}
	
	#button-keyword{
		margin-left: 8px;
	}
	
	.button-register{
		text-align: center;
		margin: 30px 30px 30px 30px;
	}
	
	#button-keyword, #button-photo{
		background-color: #00B1D2;
		color: white;
		border-radius: 5px;
	}
	
	#enroll{
		padding: 5px 20px 5px 20px;
		margin-left: 5px;
		background-color: #00B1D2;
		color: white;
		border-radius: 10px;
		background-color: #00B1D2;
	}
	
	#cancle{
		padding: 5px 20px 5px 20px;
		margin-right: 5px;
		background-color: white;
		color: #00B1D2;
		border-radius: 10px;
	}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="list-group list-group-flush text-center">
					<div class="list-group-item" id="category-title">A 필라테스 평가하기</div>
					<div class="list-group-item">
						<img src="image/flower1.PNG">
					</div>
					<div class="list-group-item">
						서울시 강남구 역삼동 <br> 070-1234-5678
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<form class="review-box" id="reviewForm" action="<%= request.getContextPath() %>/reviewWrite.re" method="get" encType="multipart/form-data">
					<div class="section">
						<div class="title">
							<strong>전체 평점</strong>
						</div>
						<div class="score-box">
							<div class="rating-box">
								<div class="rating-box-name">평점</div>
								<input type="hidden" name="totalStar" id="totalStar">
								<div class="score_star" id="totalStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>항목별 평점</strong>
						</div>

						<div class="score-box">
							<div class="rating-box">
								<div class="rating-box-name">시설</div>
								<div class="score_star" id="facilityStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<div class="rating-box">
								<div class="rating-box-name">강사</div>
								<div class="score_star" id="instructorStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<div class="rating-box">
								<div class="rating-box-name">서비스</div>
								<div class="score_star" id="serviceStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<div class="rating-box">
								<div class="rating-box-name">가격</div>
								<div class="score_star" id="priceStarDiv">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>시설 키워드</strong>
						</div>
						<div class="description">이 운동시설은 어떤 운동시설에 적합하나요? (복수선택가능)</div>
						<div class="div-keyword" id="div-keyword">
							<div id="div-addKeyword" class="form-check">
								<input type="checkbox" name="keyword" id="keyword1" value="체지방 감소">
								<label for="keyword1">체지방 감소</label>&nbsp;
								<input type="checkbox" name="keyword" id="keyword2" value="근력 증가">
								<label for="keyword2">근력 증가</label>&nbsp;
								<input type="checkbox" name="keyword" id="keyword3" value="재활">
								<label for="keyword3">재활</label>&nbsp;
								<input type="checkbox" name="keyword" id="keyword4" value="체형교정">
								<label for="keyword4">체형교정</label>&nbsp;
							</div>
						</div>
						<div class="div-keyword">
							<input type="text" id="addKeyword" placeholder="키워드 직접입력">
							<button type="button" id="button-keyword">키워드 추가</button>
						</div>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>이용 후기</strong>
						</div>
						<textarea style="width: 95%; height: 150px; margin-top: 10px;"
							placeholder="300자 이내로 입력해주세요."></textarea>
					</div>
					<hr>
					<div class="section">
						<div class="title">
							<strong>사진 올리기</strong>
						</div>
						<br>
						<div class="div-photo">
							<span class="description">시설 사진이나 운동 사진을 올려주세요.</span>
							<input type="file" id="reviewFile" multiple>
						</div>
						<div id="preview">
							
						</div>
					</div>
					<div class="button-register">
						<button class="submit" type="button" id="cancle">취소하기</button>
						<button class="submit" type="submit" id="enroll">등록하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	<script>
		$('.fa-star').css({'color': 'lightgray'});
		
		var check = false;
	    $('#totalStarDiv .fa-star, #facilityStarDiv .fa-star, #instructorStarDiv .fa-star, #serviceStarDiv .fa-star, #priceStarDiv .fa-star').on('click',function(){
	    	if(!check){
				$(this).parent().find('.fa-star').css({'color': 'lightgray'});
				var targetNum = $(this).index()+1;
				$(this).parent().find(':nth-child(-n+' + targetNum + ')').css({color:'#ffd700'});
				
				$(this).parent().val(targetNum);
				
				check = true;
	    	} else {
	    		$(this).parent().find('.fa-star').css({'color': 'lightgray'});
				var targetNum = $(this).index()+1;
				$(this).parent().find(':nth-child(-n+' + targetNum + ')').css({color:'#ffd700'});
				
				$(this).parent().val(targetNum);			
	    		
				check = false;
	    	}	
		});
	    
	    $('#button-keyword').on('click', function(){
	    	console.log("키워드 버튼 클릭");
	    	var addKeyword = $('#addKeyword').val();
	    	
	    	
	    	$('#div-addKeyword').append("&nbsp;").append('<input type="checkbox" checked name="keyword" id="keyword5" value=' + addKeyword + '/>')
	    	.append('<label for="keyword5">' + addKeyword + '</lable>'); 
	    });
		
	    /* 사진첨부 */
  	        var index = 0;
	    $(function(e){
	    	
	    	var files;
	    	var arr;
   	     	var sel_files = [];

   	        $('#reviewFile').change(function(e){
	    		$('#preview').empty();
	    		
	    		files = e.target.files;
	    		arr = Array.prototype.slice.call(files);
	    		
// 	    		for(var i=0; i<files.length; i++){
// 	    			if(!checkExtension(files[i].name, files[i].size)){
// 	    				return false;
// 	    			}
// 	    		}
	    		
	    		console.log(files);
	    		console.log(arr);
	    		
	    		preview(arr);
	    	});
	    	
	    	function preview(arr){
	    		arr.forEach(function(f){
	    	        
	    	        var fileName = f.name;
	    	        if(fileName.length > 10){
	    	          fileName = fileName.substring(0,7)+"...";
	    	        }
	    	        
	    	        sel_files.push(f);
	    	        console.log(sel_files);
	    	        
	    	        //div에 이미지 추가
	    	        var str = '<div style="display: inline-flex; padding: 5px 5px 5px 0px; ">';
// 	    	        str += '<span>'+fileName+'</span><br>';
	    	        
	    	        //이미지 파일 미리보기
	    	        if(f.type.match('image.*')){
						var reader = new FileReader();
						reader.onload = function(e){ //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
						  index++;
						  console.log(index+"얍");
						
						  //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
						  str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 id="fileImg_"'+index+'"" />';
						  str += '<button type="button" id="deleteImg'+index+'">삭제</button>';
						  str += '</div>';
						  $(str).appendTo('#preview');
						  
						}
						reader.readAsDataURL(f);
	    	        } else {
						intex++;
						
						str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
						$(str).appendTo('#preview');
	    	        }
	    	    });
	    	}
	    });
	    
    	$('#deleteImg'+index+'').on('click',function(){
    		console.log(index);
			sel_files.splice(index, 1);
			
			var img_id = $('#fileImg_')+index;
			$(img_id).remove();
			
			console.log(sel_files);
    	});
	
	   
    </script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>