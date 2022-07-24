<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- Body -->
<div style="height: 690px; background-color: #E6E6E6">
	<div class="fs-5 p-2">Product Management</div>
	<div class="card text-center m-2 mt-0 rounded-0">
		<div class="card-header fs-6 text-end text-justify">
			<button type="button" class="btn btn-success" data-mdb-toggle="modal"
				data-mdb-target="#create">
				New Product?<i class="bi bi-person-plus-fill fs-6 ms-3"></i>
			</button>
			<!-- From -->
			<div class="modal fade" id="create" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content rounded-0">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New Product</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form:form method="POST"
							action="/SOF3021/admin/product/store"
							modelAttribute="pro" enctype="multipart/form-data">
							<div class="modal-body">
								<div>
									<div class="form-outline">
										<form:input path="name" name="name" type="text" id="name"
											class="form-control" />
										<label class="form-label" for="name">Product Name?</label>
									</div>
								</div>
								<div class="mt-4">
									<div class="form-outline">
										<input name="imagefile" type="file" id="imagefile"
											class="form-control" />
									</div>
								</div>
								<div class="mt-4">
									<div class="form-outline">
										<form:input path="price" name="price" type="number" id="price"
											class="form-control" />
										<label class="form-label" for="price">Price</label>
									</div>
								</div>
								<div class="mt-4">
									<div class="form-outline">
										<form:input path="createdDate" name="createdDate" type="date"
											id="createdDate" class="form-control" />
										<label class="form-label" for="createdDate">Date</label>
									</div>
								</div>
								<div class="mt-4">
									<form:select name="categories" path="categories"
										items="${ catelist }" class="form-select"
										aria-label="Default select example" />
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
							<h5 class="modal-title" id="staticBackdropLabel">New Product</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close"></button>
						</div>

					</div>
				</div>
			</div>
			<!-- From -->

		</div>
		<div class="card-footer text-muted p-1" style="height: 560px">
			<div style="height: 510px">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>STT</th>
							<th>Name</th>
							<th>Image</th>
							<th>Price</th>
							<th>Category</th>
							<th>Date</th>
							<th>Available</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ proview.content }" var="pro">
							<tr>
								<td>${ pro.id }</td>
								<td>${ pro.name }</td>
								<td><img src="/SOF3021/images/${ pro.image }"
									style="height: 100px; width: 100px" /></td>
								<td>${ pro.price }</td>
								<td>${ pro.categories.name }</td>
								<td>${ pro.createdDate }</td>
								<td>${ pro.available == 0 ? "No" : "Yes" }</td>
								<td>
									<!-- Form -->
									<button type="button" class="btn btn-primary"
										data-mdb-toggle="modal" data-mdb-target="#update${ pro.id }">
										<i class="bi bi-pen-fill fs-6"></i>
									</button> <!-- From -->
									<div class="modal fade" id="update${ pro.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Update
														Product</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<form:form method="POST"
													action="/SOF3021/admin/product/update/${ pro.id }"
													modelAttribute="pro" enctype="multipart/form-data">
													<div class="modal-body">
														<div>
															<div class="form-outline">
																<form:input path="name" name="name" type="text"
																	id="name" class="form-control" value="${ pro.name }" />
																<label class="form-label" for="name">Product
																	Name?</label>
															</div>
														</div>
														<div class="mt-4">
															<div class="form-outline">
																<input name="imagefile" type="file" id="imagefile"
																	class="form-control" />
															</div>
														</div>
														<div class="mt-4">
															<div class="form-outline">
																<form:input path="price" name="price" type="number"
																	id="price" class="form-control" value="${ pro.price }" />
																<label class="form-label" for="price">Price</label>
															</div>
														</div>
														<div class="mt-4">
															<div class="form-outline">
																<form:input path="createdDate" name="createdDate"
																	type="date" id="createdDate" class="form-control"
																	value="${ pro.createdDate }" />
																<label class="form-label" for="createdDate">Date</label>
															</div>
														</div>
														<div class="mt-4">
															<form:select path="categories" name="categories"
																class="form-select" aria-label="Default select example">
																<form:options items="${ catelist }" />
															</form:select>
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
									<!-- Form -->
									<button type="button" class="btn btn-danger"
										data-mdb-toggle="modal" data-mdb-target="#delete${ pro.id }">
										<i class="bi bi-trash-fill fs-6"></i>
									</button> <!-- From -->
									<div class="modal fade" id="delete${ pro.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Delete
														Product</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Are you sure you want to
													delete this product?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-danger"
														data-mdb-dismiss="modal">Close</button>
													<a class="btn btn-success"
														href="/SOF3021/admin/product/delete/${ pro.id }">Yes</a>
												</div>
											</div>
										</div>
									</div> <!-- Form -->
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
						href="/SOF3021/admin/product/index?page=${ page - 1 }&field=${ field }">Previous</a></li>
					<c:forEach var="index" begin="0" end="${ proview.totalPages - 1 }">
						<li class="page-item ${ index == page ? "
							active" : "" }" aria-current="page"><a class="page-link"
							href="/SOF3021/admin/product/index?page=${ index }&field=${ field }">
								${ index + 1 } <c:if test="${ index == page }">
									<span class="visually-hidden">(current)</span>
								</c:if>
						</a></li>
					</c:forEach>
					<li class="page-item ${ page == proview.totalPages - 1 ? "disabled" : "" }"><a
						class="page-link"
						href="/SOF3021/admin/product/index?page=${ page + 1 }&field=${ field }">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<!-- Body -->