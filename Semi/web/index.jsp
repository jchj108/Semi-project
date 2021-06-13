<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/tools/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
location.href =  "<%= request.getContextPath() %>/home.do";
</script>
</head>
<body>
</body>
</html>