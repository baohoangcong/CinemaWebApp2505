<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="fa.training.entities.TaiKhoan"%>
<style>
	.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #212529;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
}

.dropdown-content a {
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}



.dropdown:hover .dropdown-content {
  display: block;
}
	
</style>
<div>
	<!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark" id="mainNav" style="height: 80px">
      <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin">
        	<img src="<c:url value="/resources/assets/img/T2_Logo.png"/>" alt="..." style="height: 70px"/>
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarResponsive"
          aria-controls="navbarResponsive"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          Menu
          <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0 navbar">
            <li class="nav-item">
              <a class="nav-link" href="#khachhang">Khách Hàng</a>
            </li>
            <li class="nav-item">
              <!-- <a class="nav-link" href="#dichvu">Dịch Vụ</a> -->
              <div class="dropdown">
				    <a class="nav-link">Dịch Vụ
				      <i class="fa fa-caret-down"></i>
				    </a>
				    <div class="dropdown-content">
				      <a class="nav-link" href="${pageContext.request.contextPath}/dichvu/...">Danh Sách</a>
				      <a class="nav-link" href="${pageContext.request.contextPath}/dichvu/...">QL Dịch Vụ</a>
				      <a class="nav-link" href="${pageContext.request.contextPath}/dichvu/...">QL Khuyến Mãi</a>
				    </div>
				  </div>
            </li>
            <li class="nav-item">
            	<div class="dropdown">
				    <a class="nav-link">Phim
				      <i class="fa fa-caret-down"></i>
				    </a>
				    <div class="dropdown-content">
				      <a class="nav-link" href="${pageContext.request.contextPath}/admin/phongchieu/list">Phòng Chiếu</a>
				      <a class="nav-link" href="${pageContext.request.contextPath}/admin/suatchieu/list">Suất Chiếu</a>
				      <a class="nav-link" href="${pageContext.request.contextPath}/admin/menu">Phim</a>
				    </div>
				  </div>
            </li>
            <li class="nav-item">
              <!-- <a class="nav-link" href="#thongke">Thống Kê</a> -->
              <div class="dropdown">
				    <a class="nav-link">Thống Kê
				      <i class="fa fa-caret-down"></i>
				    </a>
				    <div class="dropdown-content">
				      <a class="nav-link" href="${pageContext.request.contextPath}/admin/thongke/khachhang">Insight Khách Hàng</a>
				      <a class="nav-link" href="${pageContext.request.contextPath}/admin/thongke/doanhthu/theophim">Doanh Thu Theo Phim</a>
				      <a class="nav-link" href="${pageContext.request.contextPath}/admin/thongke/doanhthu">Doanh Thu Theo Thời Gian</a>
				    </div>
				  </div>
            </li>
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
</div>

