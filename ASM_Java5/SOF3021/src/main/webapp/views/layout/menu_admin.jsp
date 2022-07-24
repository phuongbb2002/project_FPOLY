<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div>
	<div class="row ps-4 pe-4 pt-1">
		<div class="col-6 fs-2 fw-bold"
			style="background-color: #161459; color: #F2AF5C">AnNin</div>
		<div class="col-6 fs-2 fw-bold mb-1"
			style="background-color: #F2AF5C; color: #161459">Shop</div>
		<hr>
	</div>
</div>
<div>
	<div class="d-flex justify-content-start align-items-center">
		<div>
			<a class="nav-link d-sm-flex align-items-sm-center" href="#"> <img
				src="https://thao68.com/wp-content/uploads/2022/03/avatar-siro-official-1.jpg"
				class="rounded-circle" height="70"
				alt="Black and White Portrait of a Man" loading="lazy" />
			</a>
		</div>
		<div class="p-0">
			<a href="#"><strong class="d-none d-sm-block ms-1 text-light">Bich_Phuong_Neee
					<i class="bi bi-caret-down-fill"></i>
			</strong> </a><strong class="d-none d-sm-block ms-1 text-light">Bui_Bich_Phuong</strong>
		</div>
	</div>
	<hr>
</div>
<div>
	<ul class="list-group border border-0"
		style="background-color: #161459">
		<li><a class="fw-bold fs-5 list-group-item border border-0"
			style="background-color: #161459; color: #F2AF5C"
			href="/SOF3021/admin/account/index"><i
				class="bi bi-person-circle"></i> Accounts</a></li>
		<li><a class="fw-bold fs-5 list-group-item border border-0"
			style="background-color: #161459; color: #F2AF5C"
			href="/SOF3021/admin/category/index"><i class="bi bi-bezier2"></i>
				Categories</a></li>
		<li><a class="fw-bold fs-5 list-group-item border border-0"
			style="background-color: #161459; color: #F2AF5C"
			href="/SOF3021/admin/product/index"><i class="bi bi-cart-fill"></i>
				Products</a></li>
		<li><a class="fw-bold fs-5 list-group-item border border-0"
			style="background-color: #161459; color: #F2AF5C"
			href="/SOF3021/admin/order/index"><i class="bi bi-card-checklist"></i>
				Orders</a></li>
		<li><a class="fw-bold fs-5 list-group-item border border-0"
			style="background-color: #161459; color: #F2AF5C"
			href="/SOF3021/admin/orderdetail/index"><i
				class="bi bi-card-list"></i> OrderDetails</a></li>
	</ul>
</div>
