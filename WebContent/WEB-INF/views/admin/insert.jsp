<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<title>Insert title here</title>
<link href="resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/admin/css/style.css" rel="stylesheet">
<link href="resources/admin/css/style2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="resources/admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
</head>
<body>
	<div id="header" class="w-100">
		<div class="book- info text-center mb-30">
			<h2>Book Information</h2>
			${message}
		</div>
	</div>
	<div class="w-100">
		<form:form action="admin/insert" modelAttribute="book"
			enctype="multipart/form-data" class="w-50 m-auto" method="POST">
			<form:hidden path="bookid" />
			<div class="form-group">
				<label for="title">Title:</label>
				<form:input type="text" class="form-control" path="title" />
			</div>
		<div class="form-group">
				<label for="image">Image:</label> <img alt="" class="small-image"
					src="resources/admin/img/product/${book.image}"> <input
					type="file" class="form-control" name="photo" accept="image/*"
					value="/${book.image}" />
				<form:hidden path="image" />
			</div>
			<div class="form-group">
				<label for="author">Author:</label>
				<form:input type="text" class="form-control" path="author" />
			</div>
			<div class="form-group">
				<label for="category">Category:</label>
				<form:select class="custom-select mr-sm-2"
					path="loaisach.categoryid" id="inlineFormCustomSelect">
					<c:forEach var="c" items="${category}">
						<option value="${c.categoryid}" label="${c.name}" />
					</c:forEach>

				</form:select>
			</div>


			<div class="form-group">
				<label for="description">Description:</label>
				<form:input type="text" class="form-control" path="description" />
			</div>
			<div class="row">
				<div class="col-md-6">
					<button type="submit" class="btn btn-primary">Insert</button>
				</div>
				<div class="col-md-6 text-right">
					<a class="btn btn-primary" href="admin">Home</a>
				</div>
			</div>
		</form:form>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="resources/admin/js/demo/datatables-demo.js"></script>

</body>
</html>