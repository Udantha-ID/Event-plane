<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie Browsing System</title>

<link rel="stylesheet" href="css/style2.css">

<style>
body {
    background-color: #132632;
    color: #fff;
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
    margin: 120px auto;
    padding: 20px;
    gap: 20px;
}

.card {
    width: 260px;
    height: 280px;
    background: linear-gradient(135deg, #1c3b50, #102939);
    border-radius: 15px;
    margin: 20px;
    padding: 30px;
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
    box-shadow: 0px 15px 35px rgba(0, 0, 0, 0.6);
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
    font-size: 1.5em;
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
    color: #1cdaff;
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
	<jsp:include page="header.jsp"></jsp:include>
	<section class="sign-in">
	<div class="card-container">

		<a href="<%=request.getContextPath()%>/event_new">
			<div class="card add-movies">
				<h2>Add Events</h2>
				<p>Add new Events to the system</p>
			</div>
		</a> <a href="<%=request.getContextPath()%>/event_list">
			<div class="card view-movies">
				<h2>View Events</h2>
				<p>View existing movies in the system</p>
			</div>
		</a><a href="<%=request.getContextPath()%>/pkg_new">
			<div class="card add-packages">
				<h2>Add Packages</h2>
				<p>Add new packages for movie rentals</p>
			</div>
		</a><a href="<%=request.getContextPath()%>/pkg_list">
			<div class="card view-packages">
				<h2>View Packages</h2>
				<p>View existing packages for movie rentals</p>
			</div>
		</a>
		<div class="card add-users">
			<h2>View Reviews</h2>
			<p>Show users Reviews to the Movies</p>
		</div>
		<div class="card view-users">
			<h2>View Bookings</h2>
			<p>View  users Booked pPackages in the system</p>
		</div>
	</div>
  </section>
  <div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
