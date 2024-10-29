
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Review List</title>

<style>
:root {
    --primary-bg-color: #f4f4f4;
    --container-bg-color: #fff;
    --shadow-color: rgba(0, 0, 0, 0.1);
    --button-bg-update: #4CAF50;
    --button-bg-update-hover: #45a049;
    --button-bg-delete: #f44336;
    --button-bg-delete-hover: #d32f2f;
    --table-header-bg-color: #f2f2f2;
    --table-row-hover-bg: #e9e9e9;
    --font-family: 'Arial', sans-serif;
    --font-color-dark: #333;
    --font-color-light: #555;
    --button-font-size: 16px;
    --border-radius: 8px;
    --table-border-color: #ddd;
    --header-font-size: 24px;
}

body {
    background-color: var(--primary-bg-color);
    font-family: var(--font-family);
    margin: 0;
    padding: 0;
    color: var(--font-color-dark);
    animation: fadeIn 1s ease-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.ttcontainer {
    background-color: var(--container-bg-color);
    border-radius: var(--border-radius);
    box-shadow: 0 8px 20px var(--shadow-color);
    padding: 30px;
    width: 85%;
    margin: 200px auto;
    animation: slideUp 0.6s ease-out;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

h2 {
    font-size: var(--header-font-size);
    font-weight: bold;
    color: var(--font-color-dark);
    text-align: center;
    margin-bottom: 20px;
    background: linear-gradient(90deg, #4CAF50, #1976D2);
    -webkit-background-clip: text;
    color: transparent;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: var(--container-bg-color);
    border-radius: 10px;
    overflow: hidden;
}

th, td {
    padding: 15px 20px;
    text-align: left;
    font-size: 16px;
    color: var(--font-color-light);
}

th {
    background-color: var(--table-header-bg-color);
    font-size: 18px;
    font-weight: 600;
    letter-spacing: 0.05em;
    text-transform: uppercase;
    position: relative;
}

th::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    height: 4px;
    width: 100%;
    background-color: #4CAF50;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: var(--table-row-hover-bg);
    transform: scale(1.02);
    transition: all 0.3s ease;
}

.button-container {
    text-align: center;
    display: flex;
    justify-content: space-evenly;
}

.ttbtn {
    padding: 12px 24px;
    border: none;
    cursor: pointer;
    border-radius: var(--border-radius);
    transition: all 0.3s ease;
    font-weight: bold;
    text-transform: uppercase;
    font-size: var(--button-font-size);
}

.btn-update {
    background-color: var(--button-bg-update);
    color: white;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.btn-update:hover {
    background-color: var(--button-bg-update-hover);
    transform: translateY(-3px);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

.btn-delete {
    background-color: var(--button-bg-delete);
    color: white;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.btn-delete:hover {
    background-color: var(--button-bg-delete-hover);
    transform: translateY(-3px);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

.footer {
    text-align: center;
    padding: 10px 0;
    background-color: #333;
    color: #ddd;
    width: 100%;
    margin-top: 40px;
    font-size: 14px;
}

@media (max-width: 768px) {
    .ttcontainer {
        width: 90%;
        padding: 20px;
    }

    table th, table td {
        font-size: 14px;
        padding: 10px;
    }

    .ttbtn {
        font-size: 14px;
        padding: 10px 18px;
    }

    h2 {
        font-size: 28px;
    }
}

</style>
</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="ttcontainer">
		<h2>Event Review List</h2>
		<table>
			<thead>
				<tr>
					<th>Event Title</th>
					<th>Rating</th>
					<th>Review</th>
					<th>Reviewer Name</th>
					<th>Reviewer Email</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listReviews}" var="review">
					<tr class="fadeIn">
						<td>${review.title}</td> <!-- Changed from review.movie to review.title -->
						<td>${review.rating}/5</td>
						<td>${review.review}</td>
						<td>${review.reviewerName}</td> <!-- Changed from review.name to review.reviewerName -->
						<td>${review.reviewerEmail}</td> <!-- Changed from review.email to review.reviewerEmail -->
						<td class="button-container">
							<a href="review_edit?id=${review.id}">
								<button class="ttbtn btn-update" type="submit">Update</button>
							</a>
							<a href="review_delete?id=${review.id}">
								<button class="ttbtn btn-delete" type="submit">Delete</button>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
