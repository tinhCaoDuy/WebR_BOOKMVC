<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Sign in</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="${pageContext.servletContext.contextPath}/">
<!-- Favicon -->
<link rel="shortcut icon" type="resources/client/image/x-icon"
	href="resources/client/img/favicon.png">

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
<body class="login">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->

	<!-- breadcrumbs-area-start -->
	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a href="${pageContext.servletContext.contextPath}/abc">Home</a></li>
							<li><a
								href="${pageContext.servletContext.contextPath}/login"
								class="active">login</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	<!-- user-login-area-start -->
	<div class="user-login-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="login-title text-center mb-30">
						<h2>Sing in</h2>
						${message}
					</div>
				</div>
				<div
					class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12 col-xs-12">
					<form action="login" method="POST">
						<div class="login-form">
							<div class="single-login">
								<label>Username <span>*</span></label> <input
									type="text" name="username" />
							</div>
							<div class="single-login">
								<label>Passwords <span>*</span></label> <input type="text"
									name="password" />
							</div>
							<div class="single-login single-login-2">
								<button class="btn btn-primary">Login</button>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- user-login-area-end -->


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