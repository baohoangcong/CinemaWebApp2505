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
	<%@ include file="/common/header.jsp"%>

	<header class="bg-dark" style="padding-top: 100px">
		<div class="container px-5">
			<div class="row gx-5 align-items-center justify-content-center">
				<div class="col-lg-8 col-xl-7 col-xxl-6">
					<div class="my-5 text-center text-xl-start">
						<h1 class="display-5 fw-bolder text-white mb-2">GUARDIANS OF
							THE GALAXY VOL.3</h1>
						<p class="lead fw-normal text-white-50 mb-4">
							Diễn viên: <span class="text-white">Bradley Cooper, Vin
								Diesel, Chris Pratt, Karen Gillan, Zoe Saldana, Dave Bautista</span>
						</p>
						<p class="lead fw-normal text-white-50 mb-4">
							Nhà sản xuất: <span class="text-white">Marvel Studios</span>
						</p>
						<p class="lead fw-normal text-white-50 mb-4">
							Thể loại: <span class="text-white">Hành Động, Phiêu Lưu,
								Hài</span>
						</p>
						<p class="lead fw-normal text-white-50 mb-4">
							Quốc gia: <span class="text-white">Mỹ</span>
						</p>
						<p class="lead fw-normal text-white-50 mb-4">
							Đạo diễn: <span class="text-white">James Gunn</span>
						</p>
						<p class="lead fw-normal text-white-50 mb-4">
							Ngày khởi chiếu: <span class="text-white">3/5/2023</span>
						</p>
						<div
							class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
							<a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">SUẤT
								CHIẾU</a> <a class="btn btn-outline-light btn-lg px-4" href="#!">ĐĂNG
								KÝ</a>
						</div>
					</div>
				</div>
				<%-- <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
					<img class="img-fluid rounded-3 my-5"
						src="<c:url value="/resources/assets/img/phimdangchieu/phimdangchieu3.jpeg"/>" alt="..." />
				</div> --%>
				<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
					<a href="https://www.youtube.com/watch?v=cfbKqpbdrYg"> <img
						class="img-fluid rounded-3 my-5"
						src="<c:url value="https://cdn.galaxycine.vn/media/2023/4/24/300x450_1682320148816.jpg"/>"
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
					<!-- <div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">@</span>
					</div> -->
					<input type="date" class="form-control" placeholder="Ngày chiếu">
				</div>
			</div>
			
			<div
				class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start border border-secondary p-5">
				<p class="mx-5">2D - Phụ đề</p>
				<a class="btn btn-outline-primary btn-lg px-4 me-sm-3" href="#features">16:30</a> 
				<a class="btn btn-outline-primary btn-lg px-4 me-sm-3" href="#features">19:15</a>
				<a class="btn btn-outline-primary btn-lg px-4 me-sm-3" href="#features">22:00</a>
			</div>
		</div>
	</section>

	<!-- Suất Chiếu-->
	<section class="page-section" id="lichchieu">
		<div class="container">

			
		</div>
	</section>

	

	<%@ include file="/common/footer.jsp"%>

	<script src="<c:url value="/resources/js/scripts.js"/>"></script>

</body>
</html>