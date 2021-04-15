<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Detail</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="resources/client/css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="resources/client/css/animate.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="resources/client/css/meanmenu.min.css">
<!-- owl.carousel css -->
<link rel="stylesheet" href="resources/client/css/owl.carousel.css">
<!-- font-awesome css -->
<link rel="stylesheet" href="resources/client/css/font-awesome.min.css">
<!-- flexslider.css-->
<link rel="stylesheet" href="resources/client/css/flexslider.css">
<!-- chosen.min.css-->
<link rel="stylesheet" href="resources/client/css/chosen.min.css">
<!-- style css -->
<link rel="stylesheet" href="resources/client/css/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="resources/client/css/responsive.css">
<!-- modernizr css -->
<script src="resources/client/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body class="blog-details">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<header>
		<!-- header-area-start -->
		<header>
			<!-- header-top-area-start -->
			<div class="header-top-area">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="language-area"></div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="account-area text-right">
								<ul>
									<c:choose>
										<c:when test="${clientLogin == null}">
											<li><a
												href="${pageContext.servletContext.contextPath}/register">Sign
													up</a></li>
											<li><a
												href="${pageContext.servletContext.contextPath}/login">Sign
													in</a></li>
										</c:when>
										<c:otherwise>
											<li>${clientLogin.username}</li>
											<li><a
												href="${pageContext.servletContext.contextPath}/signout">Sign
													Out</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- header-top-area-end -->
			<!-- main-menu-area-start -->
			<div class="main-menu-area hidden-sm hidden-xs sticky-header-1"
				id="header-sticky">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="menu-area">
								<nav>
									<ul>
										<li class="active"><a
											href="${pageContext.servletContext.contextPath}/abc">Home</a></li>
										<li><a href="product-details.html">Categories<i
												class="fa fa-angle-down"></i></a>
											<div class="mega-menu">
												<c:forEach var="c" items="${category}">
													<span> <a
														href="${pageContext.servletContext.contextPath}/cate/${c.categoryid}">${c.name}</a>
													</span>
												</c:forEach>
												<%-- <span> <a href="${pageContext.servletContext.contextPath}/cate">Khoa học- Công nghệ</a> </span>  --%>
											</div></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- main-menu-area-end -->

		</header>
		<!-- header-area-end -->
		<!-- blog-main-area-start -->
		<div class="blog-main-area mb-70">
			<div class="container">
				<div class="row">

					<div class="blog-main-wrapper">

						<img src="resources/admin/img/product/${detail.image}" alt="book" />

						<div class="single-blog-content">
							<div class="single-blog-title">
								<h3>${detail.title}</h3>
							</div>
							<div class="blog-single-content">
								<p>${detail.description}</p>

							</div>
						</div>

						<div class="comment-title-wrap mt-30">
							<h3>Comments</h3>
						</div>
						<div class="comment-reply-wrap mt-50">
							<ul>
								<li>
									<div class="public-comment">

										<div class="public-text">
											<c:forEach var="c" items="${listComment}">
												<span><strong>${c.client.username}</strong> :
													${c.comment}</span>
												<br>
											</c:forEach>
										</div>
									</div>
								</li>

								<div class="comment-title-wrap mt-30">
									<h3>Leave a comment</h3>
								</div>
								<form:form
									action="${pageContext.servletContext.contextPath}/comment"
									modelAttribute="comment">
									<form:hidden path="id" />
									<form:hidden path="sach.bookid" value="${detail.bookid}" />
									<form:hidden path="client.id" value="${clientLogin.id}" />
									<div class="comment-input mt-40">

										<div class="comment-input-textarea mb-30">
											<div class="form-group">
												<label>Comment</label>
												<form:textarea path="comment" cols="30" rows="10"
													placeholder="Write your comment here" class="form-control"></form:textarea>
											</div>

										</div>								
									</div>
									<div class="single-post-button">
										<c:choose>
											<c:when test="${clientLogin == null}">
												<a href="${pageContext.servletContext.contextPath}/login"
													onclick="return confirm('Đăng nhập để comment!')">Post
													Comment</a>
											</c:when>
											<c:otherwise>
												<form:button type="submit" class="btn btn-light">Post Comment</form:button>
											</c:otherwise>
										</c:choose>


									</div>
								</form:form>
						</div>
					</div>
				</div>
			</div>
			<!-- blog-main-area-end -->
			<!-- all js here -->
			<!-- jquery latest version -->
			<script src="resources/client/js/vendor/jquery-1.12.0.min.js"></script>
			<!-- bootstrap js -->
			<script src="resources/client/js/bootstrap.min.js"></script>
			<!-- owl.carousel js -->
			<script src="resources/client/js/owl.carousel.min.js"></script>
			<!-- meanmenu js -->
			<script src="resources/client/js/jquery.meanmenu.js"></script>
			<!-- wow js -->
			<script src="resources/client/js/wow.min.js"></script>
			<!-- jquery.parallax-1.1.3.js -->
			<script src="resources/client/js/jquery.parallax-1.1.3.js"></script>
			<!-- jquery.countdown.min.js -->
			<script src="resources/client/js/jquery.countdown.min.js"></script>
			<!-- jquery.flexslider.js -->
			<script src="resources/client/js/jquery.flexslider.js"></script>
			<!-- chosen.jquery.min.js -->
			<script src="resources/client/js/chosen.jquery.min.js"></script>
			<!-- jquery.counterup.min.js -->
			<script src="resources/client/js/jquery.counterup.min.js"></script>
			<!-- waypoints.min.js -->
			<script src="resources/client/js/waypoints.min.js"></script>
			<!-- plugins js -->
			<script src="resources/client/js/plugins.js"></script>
			<!-- main js -->
			<script src="resources/client/js/main.js"></script>
</body>
</html>

