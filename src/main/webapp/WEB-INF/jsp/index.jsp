<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="fa.training.entities.TaiKhoan"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>" rel="stylesheet">
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
			<a class="navbar-brand" href="${pageContext.request.contextPath}"><img
				src="<c:url value="/resources/assets/img/T2_Logo.png"/>" alt="..." /></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars ms-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link" href="#muave">Mua
							Vé</a></li>
					<li class="nav-item"><a class="nav-link" href="#phim">Phim</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#khuyenmai">Khuyến
							Mãi</a></li>
					<li class="nav-item">
						<%
							TaiKhoan loggedInUser = (TaiKhoan) session.getAttribute("loggedInUser");
							if (loggedInUser != null) {
						%>
						<a class="nav-link" href="${pageContext.request.contextPath}/dangxuat">Đăng Xuất <%=loggedInUser.getAccount()%></a>
						<%
							} else {
						%>
						<a class="nav-link" href="${pageContext.request.contextPath}/dangnhap">Đăng Nhập</a>
						<%
							}
						%>
					</li>
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
			<!-- <a class="btn btn-primary btn-xl text-uppercase" href="#muave">Mua
				Vé</a> -->
		</div>
	</header>

	<!-- Phim đang chiếu Grid-->
	<section class="page-section bg-light" id="phim">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Phim Đang Chiếu</h2>
				<form class="d-flex">
					<input class="form-control me-2" type="search"
						placeholder="Tìm Phim" aria-label="Search" />
					<button class="btn btn-outline-warning" type="submit">
						Search</button>
				</form>
				<hr />
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 1-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#phim1">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<button class="btn btn-lg text-white border" href="#">
										Mua Vé</button>
								</div>
							</div> <img class="img-fluid"
							src="<c:url value="/resources/assets/img/phimdangchieu/phimdangchieu1.jpeg"/>"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">LẬT MẶT 6: TẤM VÉ
								ĐỊNH MỆNH</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 2-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#phim2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<button class="btn btn-lg text-white border" href="#">
										Mua Vé</button>
								</div>
							</div> <img class="img-fluid"
							src="<c:url value="/resources/assets/img/phimdangchieu/phimdangchieu2.jpeg"/>"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">CON NHÓT MÓT CHỒNG</div>
							<!-- <div class="portfolio-caption-subheading text-muted">
                  Graphic Design
                </div> -->
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 3-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#phim3">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<button class="btn btn-lg text-white border" href="#">
										Mua Vé</button>
								</div>
							</div> <img class="img-fluid"
							src="<c:url value="/resources/assets/img/phimdangchieu/phimdangchieu3.jpeg"/>" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">GUARDIANS OF THE
								GALAXY VOL.3</div>
							<div class="portfolio-caption-subheading text-muted">VỆ
								BINH DẢI NGÂN HÀ 3</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
					<!-- Portfolio item 4-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#phim4">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<button class="btn btn-lg text-white border" href="#">
										Mua Vé</button>
								</div>
							</div> <img class="img-fluid"
							src="<c:url value="/resources/assets/img/phimdangchieu/phimdangchieu4.jpeg"/>" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">SISU</div>
							<div class="portfolio-caption-subheading text-muted">GIÀ
								GÂN BÁO THÙ</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
					<!-- Portfolio item 5-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#phim5">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<button class="btn btn-lg text-white border" href="#">
										Mua Vé</button>
								</div>
							</div> <img class="img-fluid"
							src="<c:url value="resources/assets/img/phimdangchieu/phimdangchieu5.jpeg"/>" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">THE BLACK DEMON</div>
							<div class="portfolio-caption-subheading text-muted">QUÁI
								VẬT ĐEN</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<!-- Portfolio item 6-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#phim6">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<button class="btn btn-lg text-white border" href="#">
										Mua Vé</button>
								</div>
							</div> <img class="img-fluid"
							src="<c:url value="/resources/assets/img/phimdangchieu/phimdangchieu6.jpeg"/>" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">THE ACCURSED</div>
							<div class="portfolio-caption-subheading text-muted">CƠN
								THỊNH NỘ</div>
						</div>
					</div>
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
						src="<c:url value="resources/assets/img/khuyenmai/khuyenmai1.jpg"/>" alt="..." />
					</a>

					<h4 class="my-3">Mẹo Tiết Kiệm</h4>
					<p class="text-muted">Đi Đủ Vui Cực Lớn – Đi Đông Được Khuyến
						Mãi</p>
				</div>
				<div class="col-md-4">
					<a href="#"> <img class="img-fluid"
						src="<c:url value="resources/assets/img/khuyenmai/khuyenmai2.jpg"/>" alt="..." />
					</a>

					<h4 class="my-3">Milo Siêu Khủng Giá Chỉ 19K!</h4>
					<p class="text-muted">Ngày ngọt ngào – Milo Day mà Galaxy
						Cinema dành tặng các Stars sẽ trở lại vào tháng 6 này!</p>
				</div>
				<div class="col-md-4">
					<a href="#"> <img class="img-fluid"
						src="<c:url value="/resources/assets/img/khuyenmai/khuyenmai3.jpg"/>" alt="..." />
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

	<!-- Bootstrap core JS-->
	<%-- <script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"/>"> --%>
	<!-- Core theme JS-->
	<script src="<c:url value="/resources/js/scripts.js"/>"></script>

	<%-- <script src="<c:url value="https://cdn.startbootstrap.com/sb-forms-latest.js"/>"></script> --%>
</body>
</html>