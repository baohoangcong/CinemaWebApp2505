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
<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

table, td, th {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
	width: 50%;
}

td {
	text-align: center;
}
</style>
</head>
<body style="background-color: #E6E9EB">
	<%@ include file="/common/header.jsp"%>



	<div class="container bg-light p-5"
		style="margin-top: 100px; margin-bottom: 100px; width: 80%">

		<%-- <div>
				<a href="add" class="btn btn-primary">Add New Customer</a> 
				<a href="${pageContext.request.contextPath}" class="btn btn-primary">Home</a>
			</div> --%>

		<!-- <br> -->

		<div>
			<form action="${pageContext.request.contextPath}/Customer/search"
				method="get">
				<input type="text" name="searchKey" class="form-control mb-1">
				<input type="submit" value="Search" class="btn btn-primary">
			</form>
		</div>

		<hr>

		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>Mã Phòng Chiếu</th>
					<th>Hạng Phòng</th>
					<th>Số Lượng Ghế</th>
					<th>Đơn Giá</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${phongchieus}" varStatus="status">
					<tr>
						<td>${c.maPhongChieu}</td>
						<td>${c.hangPhong}</td>
						<td>${c.soLuongGhe}</td>
						<td>${c.donGia}</td>
						<td><a href="delete?id=${c.maPhongChieu}" id="delete"
							class="btn btn-danger">Delete</a> <a
							href="update/${c.maPhongChieu}" class="btn btn-warning">Update</a></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

		<br>

		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="list?page=${currentPage-1}" class="btn btn-light">Previous</a>
			</c:if>
			<c:forEach begin="1" end="${totalPages}" var="i">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<a class="active"> ${i} </a>
					</c:when>
					<c:otherwise>
						<a href="list?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage lt totalPages}">
				<a href="list?page=${currentPage+1}" class="btn btn-light">Next</a>

			</c:if>
		</div>
	</div>


	<%@ include file="/common/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#delete").on("click", function(e) {
				if (!confirm("Are you sure to delete that record?")) {
					e.preventDefault();
				}
			});
		});
	</script>
</body>
</html>