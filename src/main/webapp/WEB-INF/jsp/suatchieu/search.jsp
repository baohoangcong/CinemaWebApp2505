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

		<div class="mb-3">
			<a href="add" class="btn btn-dark">Add New Suất Chiếu</a>
		</div>


		<div>
			<form class="d-flex"
				action="${pageContext.request.contextPath}/suatchieu/search"
				method="get">
				<input type="text" name="searchKey" class="form-control"> <input
					type="submit" value="Search" class="btn btn-success mx-2">
			</form>
		</div>

		<hr>

		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>Mã Suất Chiếu</th>
					<th>Phim</th>
					<th>Phòng Chiếu</th>
					<th>Ngày Chiếu</th>
					<th>Giờ Bắt Đầu</th>
					<th>Giờ Kết Thúc</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${suatchieus}" varStatus="status">
					<tr>
						<td>${c.maSuatChieu}</td>
						<td>${c.phim.maPhim}</td>
						<td>${c.phongChieu.maPhongChieu}</td>
						<td>${c.ngayChieu}</td>
						<td>${c.gioBatDau}</td>
						<td>${c.gioKetThuc}</td>
						<td><a href="delete?id=${c.maSuatChieu}" id="delete"
							class="btn btn-danger">Delete</a> <a
							href="update/${c.maSuatChieu}" class="btn btn-warning">Update</a></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

		<br>

		<%-- <div class="pagination">
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
		</div> --%>
		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="list?page=${currentPage-1}" class="btn btn-light">&laquo;
					Previous</a>
			</c:if>

			<c:forEach var="i" begin="1" end="${totalPages}" varStatus="status">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<a class="active">${i}</a>
					</c:when>
					<c:otherwise>
						<c:if
							test="${status.index <= 2 || status.index >= totalPages - 1}">
							<a href="list?page=${i}">${i}</a>
						</c:if>
						<%-- <c:if test="${status.index == 3 && totalPages > 5}">
							<span class="ellipsis">...</span>
						</c:if> --%>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${currentPage lt totalPages}">
				<a href="list?page=${currentPage+1}" class="btn btn-light">Next
					&raquo;</a>
			</c:if>
		</div>






	</div>


	<%@ include file="/common/footer.jsp"%>
	<script type="text/javascript">
		$("#delete").on("click", function(e) {
			if (!confirm("Are you sure to delete that record?")) {
				e.preventDefault();
			}
		})
	</script>

</body>
</html>