<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event Management System</title>

<link rel="stylesheet" href="css/style2.css">
<style>
body {
    background-color: #0e1b29;
    color: #ffffff;
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.card-container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    max-width: 1200px;
    margin: 150px auto;
    padding: 20px;
    gap: 30px;
}

.card {
    width: 250px;
    height: 250px;
    background: linear-gradient(135deg, #1c3b50, #102939);
    border-radius: 15px;
    margin: 20px;
    padding: 40px 20px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    position: relative;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    border: 1px solid rgba(255, 255, 255, 0.2);
    cursor: pointer;
}

.card:hover {
    transform: scale(1.08);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.6);
}

.card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.05), rgba(0, 0, 0, 0.3));
    transition: all 0.4s ease;
    z-index: -1;
}

.card:hover::before {
    transform: scale(1.2);
}

.card h2 {
    margin: 0;
    font-size: 1.6em;
    font-weight: bold;
    color: #fff;
    transition: color 0.3s ease;
}

.card p {
    margin: 10px 0 0;
    font-size: 1em;
    color: #ddd;
    transition: color 0.3s ease;
}

.card:hover h2, .card:hover p {
    color: #1cdaff; /* Green accent on hover */
}

.add-movies {
    background: linear-gradient(135deg, #1e3b4f, #2b6a75);
}

.view-movies {
    background: linear-gradient(135deg, #3a3f50, #3f6785);
}

.add-packages {
    background: linear-gradient(135deg, #2b2f4f, #4a679b);
}

.view-packages {
    background: linear-gradient(135deg, #3e2f4f, #6a759b);
}

.add-users {
    background: linear-gradient(135deg, #2e4b3f, #4a6b5b);
}

.view-users {
    background: linear-gradient(135deg, #4b3f4e, #5a7b8b);
}

/* Responsive Design */
@media (max-width: 1024px) {
    .card-container {
        max-width: 900px;
    }
}

@media (max-width: 768px) {
    .card-container {
        flex-direction: column;
        align-items: center;
        margin: 100px auto;
    }

    .card {
        width: 100%;
        max-width: 300px;
    }
}

.footer a:hover {
    color: #6fcf97;
}

</style>
</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<section class="sign-in">
	<div class="card-container">

		<a href="<%=request.getContextPath()%>/event_view">
			<div class="card add-movies">
				<h2>Brows Movies</h2>
				<p>Brows movies to the system</p>
			</div>
		</a> <a href="<%=request.getContextPath()%>/pkg_view">
			<div class="card view-movies">
				<h2>Brows Packages</h2>
				<p>View Available Packages in the system</p>
			</div>
		</a><a href="<%=request.getContextPath()%>/review_new">
			<div class="card add-packages">
				<h2>Add Ratings</h2>
				<p>Add new Review for your favorite movie</p>
			</div>
		</a><a href="<%=request.getContextPath()%>/review_list">
			<div class="card view-packages">
				<h2>View Ratings</h2>
				<p>View your ratings for movie </p>
			</div>
		</a><a href="<%=request.getContextPath()%>/book_new">
		<div class="card add-users">
			<h2>Book Packages</h2>
			<p>Add new users to the system</p>
		</div></a><a href="<%=request.getContextPath()%>/book_list">
		<div class="card view-users">
			<h2>View Bookings</h2>
			<p>View existing users in the system</p>
		</div></a>
	</div>
   </section>
	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
