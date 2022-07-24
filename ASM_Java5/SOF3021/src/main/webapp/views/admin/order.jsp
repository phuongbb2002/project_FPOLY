<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- Body -->
<div style="height: 690px; background-color: #E6E6E6">
	<div class="fs-5 p-2">Order Management</div>
	<div class="card text-center m-2 mt-0">
		<div class="card-header fs-6 text-end text-justify">
			<button type="button" class="btn btn-success" data-mdb-toggle="modal"
				data-mdb-target="#create">
				New Order?<i class="bi bi-person-plus-fill fs-6 ms-3"></i>
			</button>
			<!-- From -->
			<div class="modal fade" id="create" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New Order</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form:form method="POST"
							action="/SOF3021/admin/order/store"
							modelAttribute="ord">
							<div class="modal-body">
								<div class="mt-4">
									<form:select name="accounts" path="accounts"
										items="${ acclist }" class="form-select"
										aria-label="Default select example" />
								</div>
								<div class="mt-4">
									<div class="form-outline">
										<form:input path="createDate" name="createDate" type="date"
											id="createDate" class="form-control" />
										<label class="form-label" for="createDate">Date</label>
									</div>
								</div>
								<div class="mt-4">
									<div class="form-outline">
										<form:input path="address" name="address" type="text"
											id="address" class="form-control" />
										<label class="form-label" for="address">Address</label>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-mdb-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-success">Save</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="create" data-mdb-backdrop="static"
				data-mdb-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">New Order</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close"></button>
						</div>

					</div>
				</div>
			</div>
			<!-- From -->

		</div>
		<div class="card-footer text-muted p-0" style="height: 560px">
			<div style="height: 510px">
				<table class="table table-striped table-hover table-bordered">
					<thead>
						<tr>
							<th>STT</th>
							<th>Full Name</th>
							<th>Date</th>
							<th>Address</th>
							<th>Status</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ ordview.content }" var="ord">
							<tr>
								<td>${ ord.id }</td>
								<td>${ ord.accounts.fullname }</td>
								<td>${ ord.createDate }</td>
								<td>${ ord.address }</td>
								<td>
								<c:if test="${ ord.status == 2 }"><span class="badge badge-success rounded-pill d-inline">Đã xác nhận</span></c:if>
								<c:if test="${ ord.status != 2 }"><span class="badge badge-warning rounded-pill d-inline">Chờ xác nhận</span></c:if>
								</td>
								<td>
									<!-- Form -->
									<button type="button" class="btn btn-primary"
										data-mdb-toggle="modal" data-mdb-target="#update${ ord.id }">
										<i class="bi bi-pen-fill fs-6"> update </i>
									</button> <!-- From -->
									<div class="modal fade" id="update${ ord.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Update
														Order</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<form:form method="POST"
													action="/SOF3021/admin/order/update/${ ord.id }"
													modelAttribute="ord">
													<div class="modal-body">
														<div class="mt-4">
															<form:select name="accounts" path="accounts"
																items="${ acclist }" class="form-select"
																aria-label="Default select example" />
														</div>
														<div class="mt-4">
															<div class="form-outline">
																<form:input path="createDate" name="createDate"
																	type="date" id="createDate" class="form-control"
																	value="${ ord.createDate }" />
																<label class="form-label" for="createDate">Date</label>
															</div>
														</div>
														<div class="mt-4">
															<div class="form-outline">
																<form:input path="address" name="address" type="text"
																	id="address" class="form-control"
																	value="${ ord.address }" />
																<label class="form-label" for="address">Address</label>
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-danger"
															data-mdb-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-success">Save</button>
													</div>
												</form:form>
											</div>
										</div>
									</div> <!-- Form -->
								</td>
								<td>
									<!-- Form --> <a class="btn btn-danger" href="/SOF3021/admin/order/detail/${ ord.id }"> Chi tiết</a>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- Pagination -->
			<nav aria-label="..." class="ms-2">
				<ul class="pagination">
					<li class="page-item ${ page == 0 ? "disabled" : "" }"><a
						class="page-link"
						href="/SOF3021/admin/order/index?page=${ page - 1 }&field=${ field }">Previous</a></li>
					<c:forEach var="index" begin="0" end="${ ordview.totalPages - 1 }">
						<li class="page-item ${ index == page ? "
							active" : "" }" aria-current="page"><a class="page-link"
							href="/SOF3021/admin/ord/index?page=${ index }&field=${ field }">
								${ index + 1 } <c:if test="${ index == page }">
									<span class="visually-hidden">(current)</span>
								</c:if>
						</a></li>
					</c:forEach>
					<li class="page-item ${ page == ordview.totalPages - 1 ? "disabled" : "" }"><a
						class="page-link"
						href="/SOF3021/admin/order/index?page=${ page + 1 }&field=${ field }">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<!-- Body -->
