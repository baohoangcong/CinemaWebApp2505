<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%><%@taglib
	uri="http://www.springframework.org/tags/form" prefix="form"%><!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<style type="text/css"></style>
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
					<li class="nav-item"><a class="nav-link" href="#">Đăng Ký</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<header class="bg-dark" style="padding-top: 100px">
		<div class="container px-5">
			<div class="row gx-5 align-items-center justify-content-center">
				<div class="col-lg-8 col-xl-7 col-xxl-6">
					<div class="my-5 text-center text-xl-start">
						<h1 class="display-5 fw-bolder text-white mb-2">${phim.tenPhim}</h1>
						<p class="lead fw-normal text-white-50 mb-4">
							Thể loại: <span class="text-white">${phim.moTaPhim}</span>
						</p>
						<p class="lead fw-normal text-white-50 mb-4">
							Đạo diễn: <span class="text-white">${phim.daoDien}</span>
						</p>
						<p class="lead fw-normal text-white-50 mb-4">
							Ngày khởi chiếu: <span class="text-white">${phim.ngayKhoiChieu}</span>
						</p>
						<p class="lead fw-normal text-white-50 mb-4">
							Thời Lượng: <span class="text-white">${phim.thoiLuong}</span>
						</p>
						<div
							class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
							<a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">SUẤT
								CHIẾU</a> <a class="btn btn-outline-light btn-lg px-4" href="#!">ĐĂNG
								KÝ</a>
						</div>
					</div>
				</div>
				<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
					<a href="https://www.youtube.com/watch?v=cfbKqpbdrYg"> <img
						class="img-fluid rounded-3 my-5"
						src="${phim.poster}"
						alt="..." />
					</a>
				</div>
			</div>
		</div>
	</header>
	<!-- Nội dung phim-->
	<section class="page-section bg-light" id="noidungphim">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Nội Dung Phim</h2>
				<hr />
			</div>
			<div class="py-1 bg-light">
				<div class="container px-5 my-5">
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-10 col-xl-7">
							<div class="text-justify">
								<div class="fs-4 mb-4 fst-italic">Trong phần phim thứ 3 về
									Vệ Binh Dải Ngân Hà, biệt đội mà chúng ta từng biết sẽ có một
									vài sự thay đổi. Peter Quill vẫn đang chìm đắm trong nỗi đau
									mất đi Gamora nhưng vẫn phải làm tròn trách nhiệm tập hợp cả
									đội để bảo vệ toàn vũ trụ. Họ phải đối mặt với một nhiệm vụ cam
									go và nếu như thất bại, đội Vệ Binh có thể phải kết thúc sứ
									mệnh của họ. Dù không có quá nhiều người biết đến từ trước khi
									lên phim lần đầu tiên vào năm 2014, “rạp xiếc giải ngân hà” vẫn
									nhận được sự yêu thích hùng hậu từ người hâm mộ. Tiếp đà thành
									công đó, phần tiếp theo mang tên Guardian of The Galaxy Vol.2
									cũng được đánh giá vô cùng tích cực. Năm nay, phần cuối
									Guardians of the Galaxy Vol.3 sẽ là bộ phim chiếu rạp nhiều
									người hâm mộ mong chờ. Phim mới Vệ binh dải Ngân Hà 3 ra mắt
									tại các rạp chiếu phim từ 03.05.2023. Xem thêm tại:
									https://www.galaxycine.vn/dat-ve/guardians-of-the-galaxy-vol3</div>
								<div class="d-flex align-items-center justify-content-center">
									<img class="rounded-circle me-3"
										src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
									<div class="fw-bold">
										Tom Ato <span class="fw-bold text-primary mx-1">/</span> CEO,
										Pomodoro
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Lịch Chiếu-->
	<section class="page-section" id="lichchieu">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Lịch Chiếu</h2>
			</div>
			<div class="row text-center">
				<div class="input-group mb-3">
					<!-- <div class="input-group-prepend"> <span class="input-group-text" id="basic-addon1">@</span> </div> -->
					<input type="date" class="form-control" placeholder="Ngày chiếu">
				</div>
			</div>
		</div>
	</section>
	<!-- Suất Chiếu-->
	<section class="page-section" id="lichchieu">
		<div class="container">
			<div class>
				<div class="row d-flex">
					<div>
						<a href="#" class="btn btn-outline-warning btn-lg" role="button"
							aria-pressed="true">16:30</a>
					</div>
					<div>
						<a href="#" class="btn btn-outline-warning btn-lg" role="button"
							aria-pressed="true">19:15</a>
					</div>
					<div>
						<a href="#" class="btn btn-outline-warning btn-lg" role="button"
							aria-pressed="true">22:30</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Suất Chiếu-->
	<section class="py-5">
		<div class="container px-5 my-5">
			<div class="row gx-5">
			<c:if test="${not empty listPhim}">
					<c:forEach var="c" items="${listPhim}">
				<div class="col-lg-4 mb-5">
					<div class="card h-100 shadow border-0">
						<img class="card-img-top"
							src="${c.poster}" alt="..." />
						<div class="card-body p-4">
							<div class="badge bg-primary bg-gradient rounded-pill mb-2">Phim Đang Chiếu</div>
							<a class="text-decoration-none link-dark stretched-link"
								href="${pageContext.request.contextPath}/phimview/${c.maPhim}">
								<h5 class="card-title mb-3">${c.tenPhim}</h5></a>
							<p class="card-text mb-0">Đạo Diễn: ${c.daoDien}</p>
							<p class="card-text mb-0">Thể Loại: ${c.moTaPhim}</p>
						</div>
					</div>
				</div>
					</c:forEach>
				</c:if>
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
	<script src="<c:url value="/resources/js/scripts.js"/>"></script>
</body>
</html>