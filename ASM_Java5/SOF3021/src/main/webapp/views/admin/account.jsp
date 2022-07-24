<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- Body -->
<div style="height: 690px; background-color: #E6E6E6">
	<div class="fs-5 p-2">Account Management</div>
	<div class="card text-center m-2 mt-0 rounded-0">
		<div class="card-header fs-6 text-end text-justify">
			<button type="button" class="btn btn-success" data-mdb-toggle="modal"
				data-mdb-target="#create">
				New Account?<i class="bi bi-person-plus-fill fs-6 ms-3"></i>
			</button>
			<!-- From -->
			<div class="modal fade" id="create" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content rounded-0">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New Account</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form:form method="POST"
							action="/SOF3021/admin/account/store"
							modelAttribute="acc" name="account" enctype="multipart/form-data">
							<div class="modal-body">
								<div>
									<div class="form-outline">
										<form:input path="username" name="username" type="text"
											id="username" class="form-control" />
										<label class="form-label" for="username">User Name</label>
									</div>
									<form:errors path="username" class="text-danger"></form:errors>
								</div>
								<div class="mt-4">
									<div class="form-outline">
										<form:input path="password" name="password" type="password"
											id="password" class="form-control" />
										<label class="form-label" for="password">Password</label>
									</div>
									<form:errors path="password" class="text-danger"></form:errors>
								</div>
								<div class="mt-4">
									<div class="form-outline">
										<form:input path="fullname" name="fullname" type="text"
											id="fullname" class="form-control" />
										<label class="form-label" for="password">Full Name</label>
									</div>
									<form:errors path="fullname" class="text-danger"></form:errors>
								</div>
								<div class="mt-4">
									<div class="form-outline">
										<form:input path="email" name="email" type="email" id="email"
											class="form-control" />
										<label class="form-label" for="email">Email</label>
									</div>
									<form:errors path="email" class="text-danger"></form:errors>
								</div>
								<div class="mt-4">
									<div class="form-outline">
										<input name="photofile" type="file" id="photofile"
											class="form-control" />
									</div>
									<form:errors path="photo" class="text-danger"></form:errors>
								</div>
								<div class="mt-4">
									<form:select class="form-select"
										aria-label="Default select example" path="admin" name="admin">
										<option value="1">Admin</option>
										<option value="2" selected>Member</option>
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
			</div>
			<!-- Modal -->
			<div class="modal fade" id="create" data-mdb-backdrop="static"
				data-mdb-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">New Account</h5>
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
							<th>Full Name</th>
							<th>User Name</th>
							<th>Email</th>
							<th>Photo</th>
							<th>Activated</th>
							<th>Role</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ accview.content }" var="acc">
							<tr>
								<td>${ acc.id }</td>
								<td>${ acc.fullname }</td>
								<td>${ acc.username }</td>
								<td>${ acc.email }</td>
								<td><img
									src="/SOF3021/images/${ acc.photo }"
									style="height: 100px; width: 100px" /></td>
								<td>${ acc.activated == 0 ? "In-Active" : "Active" }</td>
								<td>${ acc.admin == 0 ? "Admin" : "Member" }</td>
								<td>
									<!-- Form -->
									<button type="button" class="btn btn-primary"
										data-mdb-toggle="modal" data-mdb-target="#update${ acc.id }">
										<i class="bi bi-pen-fill fs-6"></i>
									</button> <!-- From -->
									<div class="modal fade" id="update${ acc.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Update
														Account</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<form:form method="POST"
													action="/SOF3021/admin/account/update/${ acc.id }"
													modelAttribute="acc" enctype="multipart/form-data">
													<div class="modal-body">
														<div>
															<div class="form-outline">
																<form:input path="username" name="username" type="text"
																	id="username" class="form-control"
																	value="${ acc.username }" />
																<label class="form-label" for="username">User
																	Name</label>
															</div>
														</div>
														<div class="mt-4">
															<div class="form-outline">
																<form:input path="password" name="password"
																	type="password" id="password" class="form-control"
																	value="${ acc.password }" />
																<label class="form-label" for="password">Password</label>
															</div>
														</div>
														<div class="mt-4">
															<div class="form-outline">
																<form:input path="fullname" name="fullname" type="text"
																	id="fullname" class="form-control"
																	value="${ acc.fullname }" />
																<label class="form-label" for="password">Full
																	Name</label>
															</div>
														</div>
														<div class="mt-4">
															<div class="form-outline">
																<form:input path="email" name="email" type="email"
																	id="email" class="form-control" value="${ acc.email }" />
																<label class="form-label" for="email">Email</label>
															</div>
														</div>
														<div class="mt-4">
															<div class="form-outline">
																<input name="photofile" type="file" id="photofile"
																	class="form-control" />
															</div>
														</div>
														<div class="mt-4">
															<form:select class="form-select"
																aria-label="Default select example" path="admin"
																name="admin">
																<option value="0" ${ acc.admin == 0 ? "selected" : ""}>Admin</option>
																<option value="1" ${ acc.admin == 1 ? "selected" : ""}>Member</option>
															</form:select>
														</div>
														<div class="mt-4">
															<form:select class="form-select"
																aria-label="Default select example" path="activated"
																name="activated">
																<option value="0"
																	${ acc.activated == 0 ? "selected" : ""}>In-Active</option>
																<option value="1"
																	${ acc.activated == 1 ? "selected" : ""}>Active</option>
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
										data-mdb-toggle="modal" data-mdb-target="#delete${ acc.id }">
										<i class="bi bi-trash-fill fs-6"></i>
									</button> <!-- From -->
									<div class="modal fade" id="delete${ acc.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Delete
														Account</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Are you sure you want to
													delete this account?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-danger"
														data-mdb-dismiss="modal">Close</button>
													<a class="btn btn-success"
														href="/SOF3021/admin/account/delete/${ acc.id }">Yes</a>
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
						href="/SOF3021/admin/account/index?page=${ page - 1 }&field=${ field }">Previous</a></li>
					<c:forEach var="index" begin="0" end="${ accview.totalPages - 1 }">
						<li class="page-item ${ index == page ? "
							active" : "" }" aria-current="page"><a class="page-link"
							href="/SOF3021/admin/account/index?page=${ index }&field=${ field }">
								${ index + 1 } <c:if test="${ index == page }">
									<span class="visually-hidden">(current)</span>
								</c:if>
						</a></li>
					</c:forEach>
					<li class="page-item ${ page == accview.totalPages - 1 ? "disabled" : "" }"><a
						class="page-link"
						href="/SOF3021/admin/account/index?page=${ page + 1 }&field=${ field }">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<!-- Body -->


