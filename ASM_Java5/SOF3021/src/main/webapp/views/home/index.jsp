<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- Body -->
<div style="background-color: #F5F5F5">
	<!-- Banner -->
  <header>
        <!-- Intro settings -->
        <style>
          /* Default height for small devices */
          #intro-example {
            height: 100px;
          }
      
          /* Height for devices larger than 992px */
          @media (min-width: 992px) {
            #intro-example {
              height: 300px;
            }
          }
        </style>
      
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
          <div class="container-fluid">
            <button
              class="navbar-toggler"
              type="button"
              data-mdb-toggle="collapse"
              data-mdb-target="#navbarExample01"
              aria-controls="navbarExample01"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <i class="fas fa-bars"></i>
            </button>
          
          </div>
        </nav>
        <!-- Navbar -->
      
        <!-- Background image -->
        <div
          id="intro-example"
          class="p-5 text-center bg-image"
          style="background-image: url('https://mdbcdn.b-cdn.net/img/new/slides/041.webp');"
        >
          <div class="mask" style="background-color: rgba(0, 0, 0, 0.7);">
            <div class="d-flex justify-content-center align-items-center h-100">
              <div class="text-white">
                <h1 class="mb-3">WELLCOME TO ANNIN SHOP</h1>
                <h5 class="mb-4">Best & free guide of responsive web design</h5>
              </div>
            </div>
          </div>
        </div>
        <!-- Background image -->
      </header>
	<!-- Banner -->

	<!-- Danh Mục -->
	<div class="row m-0 p-0">
		<div>
			<div class="col-12 fw-bold fs-4 pe-3 ps-3"
				style="background-color: #161459; color: #F2AF5C">DANH MỤC</div>
		</div>
		<div class="col-12 row m-0 p-0">
			<c:forEach items="${ cate }" var="cate">
				<div class="col-2 p-3">
					<div class="bg-white">
						<a class="text-dark" href="#"> <img alt=""
							src="https://imgcdn.thitruongsi.com/tts/rs:fill:600:0:1:1/g:sm/plain/file://product/2019/07/20/3aa82690-ab07-11e9-b659-99191ba19554.jpg"
							style="height: 70px; width: 70px"> ${ cate.name }
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- Danh Mục -->

	<!-- Sản Phẩm -->
	<div class="row m-0 p-0">
		<div>
			<div class="col-12 fw-bold fs-4 pe-3 ps-3"
				style="background-color: #161459; color: #F2AF5C">SẢN PHẨM NỔI
				BẬT</div>
		</div>
		<div class="col-12 row m-0 p-0">
			<c:forEach items="${ pro }" var="pro">
				<div class="col-2 p-3">
					<div class="card hover-shadow rounded-0">
						<img
							src="/SOF3021/images/${ pro.image }"
							class="card-img-top rounded-0" style="height: 250px" />
						<div class="card-body text-center">
							<div class="fw-bold fs-5">${ pro.name }</div>
							<div>${ pro.price }VNĐ</div>
							<div class="mt-3">
								<a class="btn btn-outline-warning" data-mdb-ripple-color="dark"
									href="/SOF3021/user/getProduct/${ pro.id }">Chi
									tiết</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- Sản Phẩm -->
</div>
<!-- Body -->
