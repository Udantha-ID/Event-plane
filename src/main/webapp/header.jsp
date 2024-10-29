<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="./assets/css/style.css">
</head>
<body>
	<header class="header" data-header>
		<div class="container">

			<div class="overlay" data-overlay></div>

			<a href="./index.html" class="logo"> 
			<img src="./assets/images/logo-2.png" alt="Filmlane logo" width="250" height="80">
			</a>

			<div class="header-actions">

				<button class="search-btn">
					<ion-icon name="search-outline"></ion-icon>
				</button>

				<div class="lang-wrapper">
					<label for="language"> 
					</label> <select name="language" id="language">
						<option value="en">English</option>
						<option value="au">Australian</option>
						<option value="ar">Arabic</option>
						<option value="tr">Turkish</option>
						<option value="fr">French</option>
						<option value="de">German</option>
					</select>
				</div>
				<a href="<%=request.getContextPath()%>/out">
					<button class="btn btn-primary">Sign Out</button>
				</a>




			</div>

			<button class="menu-open-btn" data-menu-open-btn>
				<ion-icon name="reorder-two"></ion-icon>
			</button>

			<nav class="navbar" data-navbar>

				<div class="navbar-top">
					S <a href="./index.html" class="logo"> <img
						src="./assets/images/logo.svg" alt="Filmlane logo">
					</a>

					<button class="menu-close-btn" data-menu-close-btn>
						<ion-icon name="close-outline"></ion-icon>
					</button>

				</div>

				<ul class="navbar-list">

					<li>
						<a href="./index.html" class="navbar-link">Home</a>
					</li>

					<li>
						<a href="#" class="navbar-link">Events</a>
					</li>

					<li>
						<a href="#" class="navbar-link">Features</a>
					</li>

					<li>
						<a href="#" class="navbar-link">Pricing</a>
					</li>

					<li>
						<a href="#" class="navbar-link">About</a>
					</li>

				</ul>

				<ul class="navbar-social-list">

					<li><a href="#" class="navbar-social-link"> <ion-icon
								name="logo-twitter"></ion-icon>
					</a></li>

					<li><a href="#" class="navbar-social-link"> <ion-icon
								name="logo-facebook"></ion-icon>
					</a></li>

					<li><a href="#" class="navbar-social-link"> <ion-icon
								name="logo-pinterest"></ion-icon>
					</a></li>

					<li><a href="#" class="navbar-social-link"> <ion-icon
								name="logo-instagram"></ion-icon>
					</a></li>

					<li><a href="#" class="navbar-social-link"> <ion-icon
								name="logo-youtube"></ion-icon>
					</a></li>

				</ul>

			</nav>

		</div>
	</header>
</body>
</html>