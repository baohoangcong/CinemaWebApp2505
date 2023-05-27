<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<style type="text/css">
#active:hover {
	background-color: #ccc;
}

#phim {
	color: red;
}
</style>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="container mt-5">
		<div class="row" style="width: 1500px">
			<!-- Sidebar -->
			<div id="menuphim"
				class="col-1 flex-column flex-shrink-0 p-3 bg-dark"
				style="width: 270px; height: 230px; margin: 10px 0 10px -42px">
				<nav id="sidebarMenu"
					class="collapse d-lg-block sidebar collapse bg-white">
					<div class="position-sticky">
						<div class="list-group list-group-flush mx-3 mt-4">
							<a id="active"
								href="${pageContext.request.contextPath}/admin/listPhimDangChieu"
								class="list-group-item list-group-item-action py-2 ripple"
								aria-current="true"> <i class="fas fa-solid fa-list me-3"></i><span>Danh
									Sách Phim Đang Chiếu</span>
									</a>
									<a id="active"
								href="${pageContext.request.contextPath}/admin/listPhimSapChieu"
								class="list-group-item list-group-item-action py-2 ripple"
								aria-current="true"> <i class="fas fa-solid fa-list me-3"></i><span>Danh
									Sách Phim Sắp Chiếu</span>
							</a> 
									 <a id="active"
								href="${pageContext.request.contextPath}/admin/them"
								class="list-group-item list-group-item-action py-2 ripple"
								aria-current="true"> <i class="fas fa-solid fa-plus me-3"></i><span>Thêm
									Phim</span>
							</a>
						</div>
					</div>
				</nav>
			</div>
			<!-- Sidebar -->
			<!-- Form list -->
			<div class="col-9 mt-5" align="center">
				<h1>Danh Sách Phim</h1>
				<p style="color: green;">${msgSave}</p>
				<p style="color: green;">${msgUpdate}</p>
			<table class="table">
				<tr>
					<th scope="col">Mã Phim</th>
					<th scope="col">Tên Phim</th>
					<th scope="col">Mô Tả Phim</th>
					<th scope="col">Đạo Diễn</th>
					<th scope="col">Ngày Khởi Chiếu</th>
					<th scope="col">Ngày Kết Thúc</th>
					<th scope="col">Thời Lượng</th>
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>
				</tr>
				<c:if test="${not empty listThongTinPhim}">
					<c:forEach var="c" items="${listThongTinPhim}">
						<tr style="border: 1px black solid;">
							<td scope="col">${c.maPhim}</td>
							<td scope="col">${c.tenPhim}</td>
							<td scope="col">${c.moTaPhim}</td>
							<td scope="col">${c.daoDien}</td>
							<td scope="col">${c.ngayKhoiChieu}</td>
							<td scope="col">${c.ngayKetThuc}</td>
							<td scope="col">${c.thoiLuong}</td>
							<td scope="col"><form
									action="${pageContext.request.contextPath}/admin/phimupdatesapchieu/${c.maPhim}">
									<button type="submit" class="btn btn-primary">Edit</button>
								</form></td>
							<td scope="col"><form
									action="${pageContext.request.contextPath}/admin/deletephimsapchieu/${c.maPhim}" onclick="return confirm('Bạn có chắc chắn muốn xóa bộ phim này không?')">
									<button type="submit" class="btn btn-danger">Delete</button>
								</form></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<br/>
			<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="listPhimSapChieu?page=${currentPage-1}">Previous</a>
			</c:if>
			<c:forEach begin="1" end="${totalPages}" var="i">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<a class="active"> ${i} </a>
					</c:when>
					<c:otherwise>
						<a href="listPhimSapChieu?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${currentPage lt totalPages}">
				<a href="listPhimSapChieu?page=${currentPage+1}">Next</a>
			</c:if>
		</div>
			</div>
			<!-- Form list -->
		</div>
	</div>
	<script src="<c:url value="/resources/js/scripts.js"/>">
	</script>
</body>
</html>