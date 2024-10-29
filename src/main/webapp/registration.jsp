<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>


<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<style type="text/css">
	body {
    background-color: #132632;
    color: #ffffff; /* Maintain text color for contrast */
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
}
</style>
<!-- Main css -->
<link rel="stylesheet" href="css/style3.css">
<link rel="stylesheet" href="css/style2.css">
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

		<!-- Sign up form -->
		<section class="sign-in">
			<div class="c234container">
			<div class="signup-image">
						<img src="./assets/images/person.png" alt="Sign up image" width="320" height="400">
					</div>
				<div class="signup-content">
					
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>

						<form method="post" action="reg" class="register-form"
							id="register-form">
							<div class="form-group">
							    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
							    <input type="text" name="name" id="name" placeholder="Your Name" required pattern="[A-Za-z\s]+" title="Only letters and spaces are allowed.">
							    <span id="nameError" style="color:red; display:none;">Only letters are allowed.</span>
							    
							    <script>
							    document.getElementById('name').addEventListener('input', function() {
							        const nameInput = this;
							        const nameError = document.getElementById('nameError');
							        const validNamePattern = /^[A-Za-z\s]+$/;
							        
							        nameInput.value = nameInput.value.replace(/[^A-Za-z\s]/g, '');

							        if (!validNamePattern.test(nameInput.value)) {
							            nameError.style.display = 'block';
							        } else {
							            nameError.style.display = 'none';
							        }
							    });
							    </script>
							</div>

						<div class="form-group">
						    <label for="email"><i class="zmdi zmdi-email"></i></label>
						    <input type="email" name="email" id="email" placeholder="Your Email" required pattern="[a-zA-Z0-9._%+-]+@gmail\.com$ || [a-zA-Z0-9._%+-]+@gmail\.lk$" title="Please enter a valid email ending with @gmail.com.">
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
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">
							    <label for="contact"><i class="zmdi zmdi-phone"></i></label>
							    <input type="text" name="contact" id="contact" placeholder="Enter Number" maxlength="10" required>
							    <!-- <span id="contactError" style="color:red; display:none;">Please enter exactly 10 digits.</span> -->
							    <script>
								    document.getElementById('contact').addEventListener('input', function() {
								        const contactInput = this;
								        const contactError = document.getElementById('contactError');
								        
								        contactInput.value = contactInput.value.replace(/\D/g, '');
								        if (contactInput.value.length !== 10) {
								            contactError.style.display = 'block';
								        } else {
								            contactError.style.display = 'none';
								        }
								    });
								</script>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
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
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Congrats", "Account Created Successfully", "success");
		}
		if (status == "invalidName") {
			swal("Sorry", "Please Enter Your Name", "error");
		}
		if (status == "invalidEmail") {
			swal("Sorry", "Please Enter Your Email", "error");
		}
		if (status == "invalidUpwd") {
			swal("Sorry", "Please Enter Password", "error");
		}

		if (status == "invalidMobile") {
			swal("Sorry", "Please Enter Mobile No", "error");
		}
		if (status == "invalidMobileLength") {
			swal("Sorry", "Mobile Number Should be 10 Digits", "error");
		}
		if (status == "invalidConfirmPass") {
			swal("Sorry", "Password is Mistmatch", "error");
		}
	</script>
	
</body>
</html>