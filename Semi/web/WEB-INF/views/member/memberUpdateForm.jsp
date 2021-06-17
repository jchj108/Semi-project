<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%  Member mem = (Member)request.getSession().getAttribute("loginUser");
	String email = mem.getM_email();
	String pwd = mem.getM_pwd();
	String name = mem.getM_name();
	String address = mem.getM_address();
	char gender = mem.getM_gender();	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>회원정보 수정</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/tools/jquery-3.6.0.min.js"></script>
<style>
	*{font-family: 'Noto Sans KR';}
	
</style>
</head>
<body>

	<div class="input-form-backgroud row">
		<div class="input-form mx-auto">
			<h4 class="mb-3 text-center">회원정보 수정</h4>
			<form class="validation-form" name="updateMemberForm" id="updateMemberForm" action="<%= request.getContextPath() %>/update.me" method="post"+>
				<div class="mb-3">
					<label for="gender">대표사진 변경</label><br>
						<img src="<%= request.getContextPath() %>/profile_uploadFiles/<%= mem.getM_profile() %>" class="img-fluid" style="height: 100px;">
					<div class="custom-file d-inline-block align-bottom" style="width:200px;">
						<input type="file" class="custom-file-input" id="customFile">
						<label class="custom-file-label" for="customFile">파일선택</label>
					</div>
				</div>
				
				<div class="mb-3">
					<label for="email">이메일</label> 
					<input type="email" class="form-control" id="email" name="email" value="<%= email %>" readonly>
				</div>

				<div class="mb-3">
					<label for="password">비밀번호 변경</label>
					<input type="password" class="form-control" id="pwd" name="pwd" placeholder="변경할 비밀번호를 입력해주세요." required>
				</div>

				<div class="mb-3">
					<label for="password2">비밀번호 확인</label>
					<input type="password" class="form-control" id="pwd2" name="pwd2" required>
				</div>

				<div class="row mb-3">
					<div class="col-md-6">
						<label for="name">이름</label>
						<input type="text" class="form-control" id="name" name="name" value="<%= name %>" readonly>
					</div>
					<div class="col-md-6">
						<label for="gender">성별</label>
						<div class="radio">
							<label style="margin-right: 50px;">
							<input type="radio" name="gender" value="man" checked>남
							&nbsp; &nbsp;
							<input type="radio" name="gender" value="woman">여
							</label>
						</div>
					</div>
				</div>

				<div class="mb-3">
					<label for="address">주소 변경을 위해 새로운 주소를 입력해주세요</label>
					<input type="text" class="form-control" id="address" name="address" placeholder="서울특별시 강남구 역삼동 (동까지 기재)" value="<%= address %>"required>
				</div>

				<div class="row mb-3">
					<div class="col-md-4">
						<label for="excersice">운동 경력</label>
						<select class="custom-select d-block w-100" id="excersice">
							<option value=""></option>
							<option selected>경력없음</option>
							<option>3개월 이상</option>
							<option>6개월 이상</option>
							<option>1년 이상</option>
						</select>
					</div>
					<div class="col-md-8">
						<label for="favorite">선호하는 운동</label>
						<input type="text" class="form-control" id="favorite">
					</div>
				</div>

				<hr class="mb-4">
				<div class="mb-4">
					<button class="btn btn-lg btn-block" type="submit" style="background-color: #00B1D2; color: white;">수정 완료</button>
				</div>
				
				<div class="text-right">
				<span style="font-size: 15px;">탈퇴를 원하시면 회원 탈퇴 버튼을 눌러주세요.</span>
				<button class="btn btn-sm" type="button" style="background-color: #00B1D2; color: white;" id="deleteMemberBtn">회원 탈퇴</button>
				</div>
			</form>
			
		</div>
	</div>
	
	<script>
		$('#deleteMemberBtn').on('click', function(){
			var check = window.confirm("정말 탈퇴하시겠습니까?");
			
			if(check) {
				$('#updateMemberForm').attr('action', "<%= request.getContextPath() %>/delete.me");
				$('#updateMemberForm').submit();
			}
			
		});
	</script>

</body>
</html>