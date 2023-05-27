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

.errors {
	color: red;
}

.rq {
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
							</a> <a id="active"
								href="${pageContext.request.contextPath}/admin/listPhimSapChieu"
								class="list-group-item list-group-item-action py-2 ripple"
								aria-current="true"> <i class="fas fa-solid fa-list me-3"></i><span>Danh
									Sách Phim Sắp Chiếu</span>
							</a> <a id="active"
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
			<!-- Form update -->
			<div class="col-9 mt-5" align="center">
				<h1>Cập Nhật Phim</h1>
				<form:form
					action="${pageContext.request.contextPath}/admin/updatephimsapchieu"
					method="post" enctype="multipart/form-data"
					modelAttribute="themphim">
					<table class="table">
						<tr>
							<td class="col-3"><form:label path="maPhim">Mã Phim<span
										class="rq">*</span> :</form:label></td>
							<td class="col-6"><form:input class="form-control"
									path="maPhim" readonly="true" /></td>
							<td class="col-3"><form:errors path="maPhim"
									cssClass="errors" /></td>
						</tr>
						<tr>
							<td class="col-3"><form:label path="tenPhim">Tên Phim<span
										class="rq">*</span> :</form:label></td>
							<td class="col-6"><form:input class="form-control"
									path="tenPhim"  /></td>
							<td class="col-3"><form:errors path="tenPhim"
									cssClass="errors" /></td>
						</tr>
						<tr>
							<td class="col-3"><form:label path="moTaPhim">Mô Tả Phim<span
										class="rq">*</span> :</form:label></td>
							<td class="col-6"><form:input class="form-control"
									path="moTaPhim"  /></td>
							<td class="col-3"><form:errors path="moTaPhim"
									cssClass="errors" /></td>
						</tr>
						<tr>
							<td class="col-3"><form:label path="daoDien">Đạo Diễn<span
										class="rq">*</span> :</form:label></td>
							<td class="col-6"><form:input class="form-control"
									path="daoDien" /></td>
							<td class="col-3"><form:errors path="daoDien"
									cssClass="errors" /></td>
						</tr>
						<tr>
							<td class="col-3"><form:label path="ngayKhoiChieu">Ngày Khởi Chiếu<span
										class="rq">*</span> :</form:label></td>
							<td class="col-6"><form:input type="date"
									class="form-control" path="ngayKhoiChieu" /></td>
							<td class="col-3"><form:errors path="ngayKhoiChieu"
									cssClass="errors" />
								<div class="errors">${msg4}</div></td>
						</tr>
						<tr>
							<td class="col-3"><form:label path="ngayKetThuc">Ngày Kết Thúc<span
										class="rq">*</span> :</form:label></td>
							<td class="col-6"><form:input type="date"
									class="form-control" path="ngayKetThuc" /></td>
							<td class="col-3"><form:errors path="ngayKetThuc"
									cssClass="errors" />
								<div class="errors">${msg}</div>
								<div class="errors">${msg1}</div></td>
						</tr>
						<tr>
							<td class="col-3"><form:label path="thoiLuong">Thời Lượng<span
										class="rq">*</span> :</form:label></td>
							<td class="col-6"><form:input class="form-control"
									path="thoiLuong" /></td>
							<td class="col-3"><div class="errors">${msg2}</div></td>
						</tr>
						<tr>
							<td class="col-1"><label> Cập Nhật Poster<span
									class="rq">*</span> :
							</label></td>
							<td class="col-1"><select name="luachon" id="luachon" onchange="genderChanged(this)" class="form-select"
								aria-label="Default select example">
									<option value="">Vui Lòng Chọn</option>
									<option value="co">Có</option>
									<option value="khong">Không</option>
							</select></td>
							<td> <p style="color: red" id="show_message">${msg5}</p></td>
						</tr>
						<tr>
							<td></td>
							<td><button class="btn btn-info"
									style="color: black; display: none;" id="btn-file"
									type="button">
									<i class="fa-solid fa-image"></i> Hình Ảnh
								</button> <input name="shutdown" id="input-file" type="file"
								class="form-control hidden" accept="image/png, image/jpeg"
								style="display: none;">
								<div id="mydiv" class="col-lg-4 col-sm-6 mb-4"></div>
								</td>
						</tr>
						<tr>
							<td></td>
							<td><form:button class="btn btn-success" type="submit">Cập Nhật Phim</form:button></td>
						</tr>
					</table>
				</form:form>
			</div>
			<!-- Form update -->
		</div>
	</div>
	<script src="<c:url value="/resources/js/scripts.js"/>">
		
	</script>
</body>
<script type="text/javascript">
	$("#btn-file").click(function() {
		$("#input-file").trigger('click');
	});

	$("#input-file").change(function() {
		var file = $(this)[0].files[0].name;
		var urlfile = $(this)[0].files[0];
		$("#btn-file").html('<i class="fa-solid fa-image"></i> ' + file);
		 const img = document.createElement('img');
		 const mydiv = document.getElementById('mydiv');
		 mydiv.appendChild(img);
		 img.src = URL.createObjectURL(urlfile);
		  img.alt = file;
		  img.style.maxWidth = '400px';
		  img.style.maxHeight = '200px';
	});
</script>
<script type="text/javascript">
function genderChanged(obj)
{
    var ketqua = document.getElementById('btn-file');
    var value = obj.value;
    if (value === 'co'){
    	ketqua.style.display = 'block'
    }
    else if (value === 'khong'||value === ''){
    	ketqua.style.display = 'none'
    }
}
</script>
</html>