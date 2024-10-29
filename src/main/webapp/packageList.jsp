<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Package List - Order Confirmation System</title>
<style>

body {
    background-color: #1c1c1c; 
    font-family: 'Arial', sans-serif;
    margin: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    color: white;
}

.ttcontainer {
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
    padding: 50px;
    width: 80%;
    margin: 250px auto;
    flex-grow: 1;
    animation: fadeIn 0.6s ease;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    border: 1px solid #ddd;
    color: #000000;
    padding: 12px;
    text-align: left;
    font-size: 16px;
}

th {
    background-color: #132632;
    color: white;
    font-size: 18px;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #e0e0e0;
}

.button-container {
    text-align: center;
    display: flex;
    justify-content: center;
    gap: 15px;
}

.ttbtn {
    padding: 12px 20px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    text-transform: uppercase;
    transition: all 0.3s ease;
    display: inline-block;
    color: black;
}

.btn-update {
    background-color: #4CAF50;
    color: white;
}

.btn-update:hover {
    background-color: #45a049;
    transform: scale(1.05);
}

.btn-delete {
    background-color: #f44336;
    color: white;
}

.btn-delete:hover {
    background-color: #d32f2f;
    transform: scale(1.05);
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.footer {
    text-align: center;
    padding: 15px 0;
    background-color: #333;
    color: #ccc;
    width: 100%;
    margin-top: 20px;
}

h2 {
    font-size: 32px;
    font-weight: bold;
    color: #333;
    margin-bottom: 20px;
}

@media (max-width: 768px) {
    .ttcontainer {
        width: 90%;
        padding: 20px;
    }

    table th, table td {
        font-size: 14px;
        padding: 8px;
    }

    .ttbtn {
        font-size: 14px;
        padding: 10px 16px;
    }
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="ttcontainer">
		<h2>Package List</h2>
		<table>
			<thead>
				<tr>
					<th>Package Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Duration (Days)</th>
					<th>Service Level</th> <!-- Changed from Video Quality -->
					<th>Event Type</th> <!-- Changed from Package Type -->
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listPackages}" var="item">
					<tr class="fadeIn">
						<td>${item.pkgName}</td>
						<td>${item.description}</td>
						<td>${String.format("%.2f", item.price)}</td>
						<td>${item.duration}</td>
						<td>${item.serviceLevel}</td> <!-- Changed from Video Quality -->
						<td>${item.eventType}</td> <!-- Changed from Package Type -->
						<td class="button-container">
							<a href="pkg_edit?id=${item.id}">
								<button class="ttbtn btn-update" type="submit">Update</button>
							</a> 
							<a href="pkg_delete?id=${item.id}">
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
