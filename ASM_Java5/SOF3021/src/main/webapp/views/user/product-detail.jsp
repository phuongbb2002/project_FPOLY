<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- Body -->
<div style="height: 640px; background-color: #F5F5F5">
	<div class="container">
		<div class="row pt-3 pb-3">
			<div class="col-12 fw-bold fs-5 bg-white">Trang Chủ/</div>
			<div class="col-5 p-0 mt-3">
				<img alt="" src="/SOF3021/images/${ pro.image }"
					style="height: 550px; width: 500px">
			</div>
			<div class="col-7 mt-3 bg-white">
				<p class="fw-bold fs-3">${ pro.name }</p>
				<p class="fw-bold fs-3">${ pro.price }VNĐ</p>
				<p class="fs-5">Váy Maxi hoa dáng dài, Máy Maxi Hàng Quảng Châu
					Cao Cấp Khuy ngọc trước ngực, bèo vai, bèo dọc sườn từ eo xuống
					dưới Chất liệu voan mềm.</p>
				<p class="fw-bold fs-5">Kích cỡ:
				<div class="btn-group shadow-0">
					<input type="radio" class="btn-check rounded-0" name="options"
						id="option1" autocomplete="off" checked /> <label
						class="btn btn-warning fw-bold rounded-0" for="option1">S</label>
					<input type="radio" class="btn-check rounded-0" name="options"
						id="option2" autocomplete="off" /> <label
						class="btn btn-warning fw-bold rounded-0" for="option2">M</label>
					<input type="radio" class="btn-check rounded-0" name="options"
						id="option3" autocomplete="off" /> <label
						class="btn btn-warning fw-bold rounded-0" for="option3">L</label>
				</div>
				</p>


				<p class="fw-bold fs-5">Màu sắc:
				<div class="btn-group shadow-0">
					<input type="radio" class="btn-check rounded-0" name="options1"
						id="option4" autocomplete="off" checked /> <label
						class="btn btn-warning fw-bold rounded-0" for="option4">Trắng</label>
					<input type="radio" class="btn-check rounded-0" name="options1"
						id="option5" autocomplete="off" /> <label
						class="btn btn-warning fw-bold rounded-0" for="option5">Đen</label>
					<input type="radio" class="btn-check rounded-0" name="options1"
						id="option6" autocomplete="off" /> <label
						class="btn btn-warning fw-bold rounded-0" for="option6">Xanh</label>
				</div>
				</p>

				<p class="fw-bold fs-5">Số lượng:</p>
				<div class="d-flex justify-content-start align-items-center">
					<div class="d-flex justify-content-center align-items-center">
						<a href="" class="p-1"
							style="background-color: #F2AF5C; color: white;"><i
							class="bi bi-dash-lg fw-bold fs-6"></i></a> <input type="text"
							class="form-control rounded-0 border border border-0 text-center pb-1"
							style="width: 40px" value="1" /> <a href="" class="p-1"
							style="background-color: #F2AF5C; color: white;"><i
							class="bi bi-plus-lg fw-bold fs-6"></i></a>
					</div>
					<div class=" ms-4">
						<a class="btn shadow-0 fw-bold fs-6 text-white rounded-0"
							href="/SOF3021/user/order/${ pro.id }"
							style="background-color: #DC134C"><i class="bi bi-cart-fill"></i></span>
							Thêm vào giỏ hàng</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- Body -->