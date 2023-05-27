<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
		<div class="container bg-light p-5" style="margin-top: 100px; width: 500px">
		 <%-- <c:if test="${param['error']}">Incorrect Username or Password</c:if> --%>
		
		<h2 class="text-center">ĐĂNG NHẬP</h2>
		<form:form action="${pageContext.request.contextPath}/dangnhap/in" method="Post" modelAttribute="accountForm">
			<div class="form-group">
				<form:label path="account" class="col-form-label">Account</form:label>
				<form:input path="account" name="account" id="account" class="form-control" placeholder="Account"/>
			</div>
			<div class="form-group">
				<form:label path="password" class="col-form-label">Password</form:label>
				<form:input path="password" name="password" id="password" class="form-control" placeholder="Password"/>
			</div>
			<br>
			<div class="col-auto">
				<form:button name="login" id="login" class="btn btn-success">Login</form:button>
			</div>
			<br>
			<div class="col-auto">
				<span>Hãy </span><a href="${pageContext.request.contextPath}/taikhoan/add">Đăng ký</a><span> nếu bạn chưa có account!</span>
			</div>
			<span class="text-danger">${error}</span>
			
		
		</form:form>
		
		


		</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>