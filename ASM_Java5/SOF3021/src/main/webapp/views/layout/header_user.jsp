<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- Header -->
<header class="waves-effect sticky-top">
	<!-- Nav -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>
			<div class="row p-0 ms-3">
				<div class="col-6 fs-2 fw-bold"
					style="background-color: #161459; color: #F2AF5C">AnNin</div>
				<div class="col-6 fs-2 fw-bold"
					style="background-color: #F2AF5C; color: #161459">Shop</div>
			</div>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				</ul>
				<form class="d-flex input-group w-auto">
					<input type="search" class="form-control" placeholder="Search"
						aria-label="Search" />
					<button class="btn btn-outline-primary" type="button"
						data-mdb-ripple-color="dark">
						<i class="bi bi-search"></i>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- Nav -->

	<!-- Menu -->
	<!-- Navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #161459">
		<div class="container-fluid justify-content-between">
			<!-- Left elements -->
			<div class="d-flex ms-3">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/SOF3021/index">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Introduce</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Feedback</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Q&A</a></li>

					<!-- Navbar dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-mdb-toggle="dropdown" aria-expanded="false">
							Danh Mục Sản Phẩm </a> <!-- Dropdown menu -->
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- Left elements -->

			<!-- Right elements -->
			<c:if test="${ sessionScope.acc == null }">
				<div class="flex-row">
					<!-- Đăng Nhập -->
					<a class="btn btn-outline-warning fw-bold"
						data-mdb-ripple-color="dark" data-mdb-toggle="modal"
						data-mdb-target="#login">Đăng Nhập</a>

					<!-- Đăng Ký -->
					<a class="btn btn-outline-warning fw-bold"
						data-mdb-ripple-color="dark">Đăng Ký</a>
				</div>
			</c:if>
			<c:if test="${ sessionScope.acc != null }">
				<ul class="navbar-nav flex-row">
					<li class="nav-item me-3 me-lg-1"><a class="nav-link"
						href="/SOF3021/user/cart"> <span><i
								class="bi bi-cart-fill"></i></span> <span
							class="badge rounded-pill badge-notification bg-danger">${ sessionScope.monhang }</span></a></li>
					<li class="nav-item me-3 me-lg-1"><a
						class="nav-link d-sm-flex align-items-sm-center" href="#"> <img
							src="https://thao68.com/wp-content/uploads/2022/03/avatar-siro-official-1.jpg"
							class="rounded-circle" height="22"
							alt="Black and White Portrait of a Man" loading="lazy" /> <strong
							class="d-none d-sm-block ms-1">${ sessionScope.acc.fullname }</strong>
					</a></li>

					<li class="nav-item dropdown me-3 me-lg-1"><a
						class="nav-link dropdown-toggle hidden-arrow" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-mdb-toggle="dropdown" aria-expanded="false"> <i
							class="fas fa-chevron-circle-down fa-lg"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownMenuLink">
							<c:if test="${ sessionScope.acc.admin != 0 }">
								<li><a class="dropdown-item"
									href="/SOF3021/user/cart">Cart</a></li>
								<li><a class="dropdown-item"
									href="/SOF3021/user/history">History</a></li>
							</c:if>
							<c:if test="${ sessionScope.acc.admin == 0 }">
								<li><a class="dropdown-item"
									href="/SOF3021/admin/account/index">Admin</a></li>
							</c:if>
							<li><a class="dropdown-item"
								href="/SOF3021/user/logout">Log Out</a></li>
						</ul></li>
				</ul>
			</c:if>
			<!-- Right elements -->
		</div>
	</nav>
	<!-- Navbar -->
	<!-- Menu -->

</header>
<!-- Modal Login -->
<div class="modal fade" id="login" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content rounded-0">
			<div class="modal-header">
				<div class="row p-0">
					<div class="col-6 fs-2 fw-bold"
						style="background-color: #161459; color: #F2AF5C">AnNin</div>
					<div class="col-6 fs-2 fw-bold"
						style="background-color: #F2AF5C; color: #161459">Shop</div>
				</div>
				<button type="button" class="btn-close" data-mdb-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body ms-0 me-0 pt-0 pb-0">
				<div class="row">
					<div class="col-7 p-0 m-0 pe-1">
						<img class="img-fluid" style="height: 450px; width: 500px" alt=""
							src="https://stathanasiusacademy.org/wp-content/uploads/2020/03/kissclipart-welcome-clipart-logo-brand-banner-0d29f2cbcb1e5b11-1.png">
					</div>
					<div class="col-5 p-0 m-0">
						<div class="fw-bold fs-4 text-center"
							style="background-color: #161459; color: #F2AF5C">AnNin Shop
							Login</div>
						<form:form method="POST"
							action="/SOF3021/user/login"
							modelAttribute="acc">
							<div class="mt-4">
								<div class="form-outline">
									<form:input path="username" name="username" type="text"
										id="username" class="form-control" />
									<label class="form-label" for="username">User Name</label>
								</div>
								<form:errors path="username" class="text-danger"></form:errors>
							</div>
							<div class="mt-4 mb-4">
								<div class="form-outline">
									<form:input path="password" name="password" type="password"
										id="password" class="form-control" />
									<label class="form-label" for="password">Password</label>
								</div>
								<form:errors path="password" class="text-danger"></form:errors>
							</div>

							<div class="row mb-4">
								<div class="col d-flex justify-content-center">

									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="form2Example34" checked /> <label
											class="form-check-label" for="form2Example34">
											Remember me? </label>
									</div>
								</div>

								<div class="col">

									<a href="#!">Forgot password?</a>
								</div>
							</div>

							<div>
								<button type="submit" class="fs-5 btn btn-info btn-block mb-4"
									style="background-color: #161459; color: #F2AF5C">Sign
									in</button>
							</div>

							<div class="text-center mb-3">
								<c:url var="manage" value="/manage"></c:url>
								<p>
									Not a member? <a href="${ manage }/signupG">Register</a>
								</p>
								<p>or sign up with:</p>
								<button type="button" class="btn btn-primary btn-floating mx-1"
									style="background-color: #3b5998;">
									<i class="fab fa-facebook-f"></i>
								</button>

								<button type="button" class="btn btn-primary btn-floating mx-1"
									style="background-color: #dd4b39;">
									<i class="fab fa-google"></i>
								</button>

								<button type="button" class="btn btn-primary btn-floating mx-1"
									style="background-color: #0082ca;">
									<i class="fab fa-twitter"></i>
								</button>

								<button type="button" class="btn btn-primary btn-floating mx-1"
									style="background-color: #333333;">
									<i class="fab fa-github"></i>
								</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal Login -->

<!-- Header -->