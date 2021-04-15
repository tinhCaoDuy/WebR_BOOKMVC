<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Trang Chủ</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.png">

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
<body>
	<!-- header-area-start -->
	<header>
		<!-- header-top-area-start -->
		<div class="header-top-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="language-area">	
						</div>
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
	<!-- slider-area-start -->
	<div class="slider-area">
		<div class="slider-active owl-carousel">
			<div class="single-slider slider-h1-2 pt-215 pb-100 bg-img"
				style="background-image: url(resources/client/img/slider/2.jpg);background-size:contain">			
			</div>
		</div>
	</div>
	<!-- slider-area-end -->
	<!-- new-book-area-start -->
	<div class="new-book-area pb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div
						class="section-title bt text-center pt-100 mb-30 section-title-res">
						<h2>List Books</h2>
					</div>
				</div>
			</div>
			<div class="tab-active owl-carousel">
				<c:if test="${isCate == 0}">
					<%
						int index = 1;
					%>
					<c:forEach items="${books}" var="temp">

						<%=(index % 2 != 0 ? "<div class='tab-total'>" : "")%>

						<div class="product"<%=index % 2 != 0 ? "mb-40" : ""%>">
							<div class="product-img">
								<a > <img
									src="resources/admin/img/product/${temp.image}" alt="book"
									class="primary" />
								</a>

							</div>
							<div class="product-details text-center">
								<div class="product-rating">
									<ul>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
									</ul>
								</div>
								<div class="product-title">
									<h4>
										<a
											href="${pageContext.servletContext.contextPath}/detail/${temp.bookid}">${temp.title}</a>
									</h4>

								</div>
								<div class="product-author">
									<ul>
										<li>${temp.author}</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- single-product-end -->

						<%=(index % 2 == 0 ? "</div>" : "")%>
						<%
							index++;
						%>

					</c:forEach>
					<%=(index % 2 != 0 ? "</div>" : "")%>
				</c:if>
				<c:if test="${isCate == 1}">
					<%
						int index = 1;
					%>
					<c:forEach items="${listBookByCate}" var="temp">

						<%=(index % 2 != 0 ? "<div class='tab-total'>" : "")%>

						<div class="product"<%=index % 2 != 0 ? "mb-40" : ""%>">
							<div class="product-img">
								<a > <img
									src="resources/admin/img/product/${temp.image}" alt="book"
									class="primary" />
								</a>

							</div>
							<div class="product-details text-center">
								<div class="product-rating">
									<ul>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
									</ul>
								</div>
								<div class="product-title">
									<h4>
										<a
											href="${pageContext.servletContext.contextPath}/detail/${temp.bookid}">${temp.title}</a>
									</h4>

								</div>
								<div class="product-author">
									<ul>
										<li>${temp.author}</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- single-product-end -->

						<%=(index % 2 == 0 ? "</div>" : "")%>
						<%
							index++;
						%>

					</c:forEach>
					<%=(index % 2 != 0 ? "</div>" : "")%>
				</c:if>

			</div>
		</div>
	</div>

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

