<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<style type="text/css">
</style>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top"><img
				src="<c:url value="/resources/assets/img/T2_Logo.png"/>" alt="..." /></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars ms-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/phim/danhsach">Mua Vé</a></li>
					<li class="nav-item"><a class="nav-link" href="#phim">Phim</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#khuyenmai">Khuyến
							Mãi </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/taikhoan/dangnhap">Đăng
							Nhập</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-subheading">Welcome To Our Cinema!</div>
			<div class="masthead-heading text-uppercase">GUARDIANS OF THE
				GALAXY</div>
			<a class="btn btn-primary btn-xl text-uppercase" href="#muave">Mua
				Vé</a>
		</div>
	</header>

	<!-- Phim đang chiếu Grid-->
	<section class="page-section bg-light" id="phim">
		<div class="container">
			<div class="text-center">
				<div>
					<h2 class="section-heading text-uppercase">
						<a id="phimDangChieu" class="link-offset-2 link-underline link-underline-opacity-0"
							href="#phim"
							style="text-decoration: none;">Phim Đang Chiếu</a>
					</h2>
				</div>
				<div>
					<h2 class="section-heading text-uppercase">
						<a class="link-offset-2 link-underline link-underline-opacity-0"
							href="${pageContext.request.contextPath}/phimsapchieu"
							style="text-decoration: none;">Phim Sắp Chiếu</a>
					</h2>
				</div>
				<form class="d-flex"
					action="${pageContext.request.contextPath}/search" method="get">
					<table class="table">
						<tr>
							<th class="col-5"><input  id="search" type="search" class="form-control"
								aria-label="Search" aria-describedby="search-addon"
								name="searchKey" /></th>
							<th class="col-3"><input class="form-control" id="mydate" name="mydate" type="date" style="display: none" /></th>
							<th class="col-3"><select name="timkiem" onchange="genderChanged(this)" class="form-select"
							aria-label="Default select example">
								<option value="1">Tên Phim</option>
								<option value="2">Đạo Diễn</option>
								<option value="3">Thể Loại</option>
								<option value="4">Ngày</option>
						</select></th>
							<th class="col-1"><input type="submit" value="Search"
								class="btn btn-outline-primary" /></th>
						</tr>
					</table>
				</form>
				<hr />
			</div>
			<div class="row">
				<c:if test="${not empty listPhim}">
					<c:forEach var="c" items="${listPhim}">
						<div class="col-lg-4 col-sm-6 mb-4">
							<!-- Portfolio item 1-->
							<form action="${pageContext.request.contextPath}/phimview/${c.maPhim}">
							<div class="portfolio-item">
								<a class="portfolio-link" data-bs-toggle="modal" href="">
									<div class="portfolio-hover">
										<div class="portfolio-hover-content">
											<button class="btn btn-lg text-white border">
												Mua Vé</button>
										</div>
									</div> <img class="img-fluid" src="${c.poster}" alt="..." />
								</a>
								<div class="portfolio-caption">
									<div class="portfolio-caption-heading">${c.tenPhim}</div>
								</div>
								<div class="portfolio-caption">
									<div class="portfolio-caption-heading"> Đạo Diễn: ${c.daoDien}</div>
								</div>
								<div class="portfolio-caption">
									<div class="portfolio-caption-heading"> Thể Loại: ${c.moTaPhim}</div>
								</div>
							</div>
							</form>
						</div>
					</c:forEach>
				</c:if>
				<br />
				<div class="pagination">
					<c:if test="${currentPage > 1}">
						<a href="trangchu?page=${currentPage-1}">Previous</a>
					</c:if>
					<c:forEach begin="1" end="${totalPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<a class="active"> ${i} </a>
							</c:when>
							<c:otherwise>
								<a href="trangchu?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${currentPage lt totalPages}">
						<a href="trangchu?page=${currentPage+1}">Next</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!-- Khuyến Mãi-->
	<section class="page-section" id="khuyenmai">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Tin Khuyến Mãi</h2>
				<h3 class="section-subheading text-muted">Thông Tin Khuyến Mãi
					Đang Được Áp Dụng</h3>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<a href="#"> <img class="img-fluid"
						src="<c:url value="resources/assets/img/khuyenmai/khuyenmai1.jpg"/>"
						alt="..." />
					</a>

					<h4 class="my-3">Mẹo Tiết Kiệm</h4>
					<p class="text-muted">Đi Đủ Vui Cực Lớn – Đi Đông Được Khuyến
						Mãi</p>
				</div>
				<div class="col-md-4">
					<a href="#"> <img class="img-fluid"
						src="<c:url value="resources/assets/img/khuyenmai/khuyenmai2.jpg"/>"
						alt="..." />
					</a>

					<h4 class="my-3">Milo Siêu Khủng Giá Chỉ 19K!</h4>
					<p class="text-muted">Ngày ngọt ngào – Milo Day mà Galaxy
						Cinema dành tặng các Stars sẽ trở lại vào tháng 6 này!</p>
				</div>
				<div class="col-md-4">
					<a href="#"> <img class="img-fluid"
						src="<c:url value="/resources/assets/img/khuyenmai/khuyenmai3.jpg"/>"
						alt="..." />
					</a>

					<h4 class="my-3">Happy Day</h4>
					<p class="text-muted">Vào thứ 3 hàng tuần – Happy Day, Galaxy
						Cinema dành tặng giá vé ưu đãi CHỈ TỪ 50K!</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<footer class="footer py-4">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 text-lg-start">Copyright &copy; T2 CINEMA
					2023</div>
				<div class="col-lg-4 my-3 my-lg-0">
					<a class="btn btn-dark btn-social mx-2" href="#!"
						aria-label="Twitter"><i class="fab fa-twitter"></i></a> <a
						class="btn btn-dark btn-social mx-2" href="#!"
						aria-label="Facebook"><i class="fab fa-facebook-f"></i></a> <a
						class="btn btn-dark btn-social mx-2" href="#!"
						aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<div class="col-lg-4 text-lg-end">
					<a class="link-dark text-decoration-none me-3" href="#!">Privacy
						Policy</a> <a class="link-dark text-decoration-none" href="#!">Terms
						of Use</a>
				</div>
			</div>
		</div>
	</footer>
<script>
	window.scrollTo(0, 650)
	</script>
	<!-- Bootstrap core JS-->
	<%-- <script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"/>"> --%>
	<!-- Core theme JS-->
	<script src="<c:url value="/resources/js/scripts.js"/>"></script>

	<%-- <script src="<c:url value="https://cdn.startbootstrap.com/sb-forms-latest.js"/>"></script> --%>
</body>
<script type="text/javascript">
function genderChanged(obj)
{
    var ketqua = document.getElementById('mydate');
    var search = document.getElementById('search');
    var value = obj.value;
    if (value === '4'){
    	ketqua.style.display = 'block';
    	search.style.display = 'none';
    }
    else if (value === '1'||value === '2'||value === '3'){
    	ketqua.style.display = 'none';
    	search.style.display = 'block';
    }
}
</script>
</html>