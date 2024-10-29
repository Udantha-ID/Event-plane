<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign In</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">


<link rel="stylesheet" href="css/style2.css">
<!-- Main css -->
<link rel="stylesheet" href="css/style3.css">
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
					<label for="language"> <ion-icon name="globe-outline"></ion-icon>
					</label> <select name="language" id="language">
						<option value="en">English</option>
						<option value="au">Australian</option>
						<option value="ar">Arabic</option>
						<option value="tr">Turkish</option>
						<option value="fr">French</option>
						<option value="de">German</option>
					</select>
				</div>

				<button class="btn btn-primary">Sign in</button>

				<a href="adminLogin.jsp">
					<button class="btn btn-primary">Admin</button>
				</a>


			</div>

			<button class="menu-open-btn" data-menu-open-btn>
				<ion-icon name="reorder-two"></ion-icon>
			</button>

			<nav class="navbar" data-navbar>

				<div class="navbar-top">

					<a href="./index.html" class="logo"> <img
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
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="c234container">
				<div class="signup-image">

					<img src="./assets/images/person.png" alt="sing up image">

				</div>
				<div class="signup-content">


					<div class="signin-form">
						<h2 class="form-title">Sign In</h2>
						<form method="post" action="log" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="email"
									placeholder="Your Email" pattern="[a-zA-Z0-9._%+-]+@gmail\.com$ || [a-zA-Z0-9._%+-]+@gmail\.lk$" title="Please enter a valid email ending with @gmail.com." />
									<span id="emailError" style="color:red; display:none;">Email must end with @gmail.com.</span>
									    <script>
							    document.getElementById('email').addEventListener('input', function() {
							        const emailInput = this;
							        const emailError = document.getElementById('emailError');
							        const gmailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/ || /^[a-zA-Z0-9._%+-]+@gmail\.ls$/ ;
							

							        if (!gmailPattern.test(emailInput.value)) {
							            emailError.style.display = 'block';
							        } else {
							            emailError.style.display = 'none';
							        }
							    });
							</script>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<footer class="footer">

		
			<div class="footer-bottom">
				<div class="container">

					<p class="copyright">
						&copy; 2024 <a href="#">codewithsadee</a>. All Rights Reserved
					</p>

					<img src="./assets/images/footer-bottom-img.png"
						alt="Online banking companies logo" class="footer-bottom-img">

				</div>
			</div>

		</footer>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("Sorry", "Wrong Username or Password", "error");
		}
	</script>
</body>

</html>