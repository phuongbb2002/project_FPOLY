<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- Body -->
<div style="height: 690px; background-color: #E6E6E6">
	<div class="fs-5 p-2">Category Management</div>
	<div class="card text-center m-2 mt-0">
		<div class="card-header fs-6 text-end text-justify">
			<button type="button" class="btn btn-success" data-mdb-toggle="modal"
				data-mdb-target="#create">
				New Category?<i class="bi bi-person-plus-fill fs-6 ms-3"></i>
			</button>
			<!-- From -->
			<div class="modal fade" id="create" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New Category</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form:form method="POST"
							action="/SOF3021/admin/category/store"
							modelAttribute="cate">
							<div class="modal-body">
								<div>
									<div class="form-outline">
										<form:input path="name" name="name" type="text" id="name"
											class="form-control" />
										<label class="form-label" for="name">Category Name?</label>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-mdb-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-success">Save</button>
								</div>
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
							<h5 class="modal-title" id="staticBackdropLabel">New
								Category</h5>
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
							<th>Category Name</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ cateview.content }" var="cate">
							<tr>
								<td>${ cate.id }</td>
								<td>${ cate.name }</td>
								<td>
									<!-- Form -->
									<button type="button" class="btn btn-primary"
										data-mdb-toggle="modal" data-mdb-target="#update${ cate.id }">
										<i class="bi bi-pen-fill fs-6"> update</i>
									</button> <!-- From -->
									<div class="modal fade" id="update${ cate.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Update
														Category</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<form:form method="POST"
													action="/SOF3021/admin/category/update/${ cate.id }"
													modelAttribute="cate">
													<div class="modal-body">
														<div>
															<div class="form-outline">
																<form:input path="name" name="name" type="text"
																	id="name" class="form-control" value="${ cate.name }" />
																<label class="form-label" for="username">Category
																	Name</label>
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
									<!-- Form -->
									<button type="button" class="btn btn-danger"
										data-mdb-toggle="modal" data-mdb-target="#delete${ cate.id }">
										<i class="bi bi-trash-fill fs-6"> Xóa</i>
									</button> <!-- From -->
									<div class="modal fade" id="delete${ cate.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Delete
														Category</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Are you sure you want to
													delete this category?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-danger"
														data-mdb-dismiss="modal">Close</button>
													<a class="btn btn-success"
														href="/SOF3021/admin/category/delete/${ cate.id }">Yes</a>
												</div>
											</div>
										</div>
									</div> <!-- Form -->
								</td>
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
						href="/SOF3021/admin/category/index?page=${ page - 1 }&field=${ field }">Previous</a></li>
					<c:forEach var="index" begin="0" end="${ cateview.totalPages - 1 }">
						<li class="page-item ${ index == page ? "
							active" : "" }" aria-current="page"><a class="page-link"
							href="/PH17936_BuiQuangVu_SOF3021_ASM/admin/category/index?page=${ index }&field=${ field }">
								${ index + 1 } <c:if test="${ index == page }">
									<span class="visually-hidden">(current)</span>
								</c:if>
						</a></li>
					</c:forEach>
					<li class="page-item ${ page == cateview.totalPages - 1 ? "disabled" : "" }"><a
						class="page-link"
						href="/SOF3021/admin/category/index?page=${ page + 1 }&field=${ field }">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<!-- Body -->
