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
</style>
</head>
<body>
		<%@ include file="/common/header.jsp"%>
	<div class="container mt-5">
		<div class="row" style="width: 1100px">
			<!-- Sidebar -->
			<div id="menuphim"
				class="col-1 flex-column flex-shrink-0 p-3 bg-dark"
				style="width: 270px;height:230px ; margin: 10px 0 10px -42px">
				<nav id="sidebarMenu"
					class="collapse d-lg-block sidebar collapse bg-white">
					<div class="position-sticky">
						<div class="list-group list-group-flush mx-3 mt-4">
							<a id="active" href="${pageContext.request.contextPath}/admin/listPhimDangChieu"
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
							 <a id="active" href="${pageContext.request.contextPath}/admin/them"
								class="list-group-item list-group-item-action py-2 ripple"
								aria-current="true"> <i class="fas fa-solid fa-plus me-3"></i><span>Thêm
									Phim</span>
							</a>
						</div>
					</div>
				</nav>
			</div>
			<!-- Sidebar -->
		</div>
	</div>
	<!-- Form add -->
	<script src="<c:url value="/resources/js/scripts.js"/>"></script>
</body>
</html>