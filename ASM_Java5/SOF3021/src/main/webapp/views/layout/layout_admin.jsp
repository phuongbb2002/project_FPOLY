<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ASGINMENT</title>
<link rel="stylesheet"
	href="/SOF3021/icon/bootstrap-icons.css">
	<link rel="stylesheet" href="/SOF3021/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/SOF3021/icon/bootstrap-icons.css" />
<link rel="stylesheet"
	href="/SOF3021/MDB/css/mdb.min.css">
	<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
</head>
<body>
	<div class="row m-0 p-0">
		<div class="col-2 m-0 p-0 shadow" style="background-color: #161459">
			<tiles:insertAttribute name="menu_admin"></tiles:insertAttribute>
		</div>
		<div class="col-10 m-0 p-0">
			<header>
				<tiles:insertAttribute name="header_admin"></tiles:insertAttribute>
			</header>

			<div>
				<tiles:insertAttribute name="body_admin"></tiles:insertAttribute>
			</div>

			<footer>
				<tiles:insertAttribute name="footer_admin"></tiles:insertAttribute>
			</footer>
		</div>
	</div>

	<script src="/SOF3021/js/jquery.min.js"></script>
	<script src="/SOF3021/js/popper.min.js"></script>
	<script src="/SOF3021/js/bootstrap.min.js"></script>
	<script src="/SOF3021/MDB/js/mdb.min.js"></script>
</body>
</html>