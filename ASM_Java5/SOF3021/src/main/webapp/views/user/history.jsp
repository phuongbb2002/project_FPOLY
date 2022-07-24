<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- Body -->
<div style="background-color: #F5F5F5">
	<div class="container">
		<div class="row pt-3 pb-3">
			<div class="col-12 fw-bold fs-5 bg-white">Trang Chủ/ Lịch Sử
				Đặt Hàng</div>
			<div class="col-12 p-0 mt-3">
				<table class="table align-middle mb-0 bg-white">
					<thead class="text-center"
						style="background-color: #F2AF5C; color: #161459">
						<tr>
							<th class="fw-bold fs-6">Date</th>
							<th class="fw-bold fs-6">Address</th>
							<th class="fw-bold fs-6">Status</th>
							<th class="fw-bold fs-6">Actions</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach items="${ od }" var="od">
							<tr>
								<td>${ od.createDate }<c:if
										test="${ od.createDate == null }">Đặt hàng để cập nhật</c:if>
								</td>
								<td>${ od.address }<c:if test="${ od.address == null }">Đặt hàng để cập nhật</c:if>
								</td>
								<td><c:choose>
										<c:when test="${ od.status == 0 }">
											<span class="badge badge-warning rounded-pill d-inline">Đang
												mua sắm</span>
										</c:when>
										<c:when test="${ od.status == 1 }">
											<span class="badge badge-warning rounded-pill d-inline">Chờ
												xác nhận</span>
										</c:when>
										<c:when test="${ od.status == 2 }">
											<span class="badge badge-success rounded-pill d-inline">Thành
												công</span>
										</c:when>
										<c:when test="${ od.status == 3 }">
											<span class="badge badge-danger rounded-pill d-inline">Bị
												hủy từ phía người bán</span>
										</c:when>
										<c:otherwise> - </c:otherwise>
									</c:choose></td>
								<td><c:if test="${ od.status == 0 }">
										<a class="btn btn-danger"
											href="/SOF3021/user/cart"><i
											class="bi bi-trash-fill"></i>Chi tiết</a>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>

</div>
<!-- Body -->
