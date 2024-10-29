<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event List</title>
<link rel="stylesheet" href="css/tablestyle.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
<script
    src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
<style>

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f7fc;  
    margin: 0;
    padding: 0;
    color: #333;
}

h1 {
    text-align: center;
    color: #222;
    margin-bottom: 30px;
    text-transform: uppercase;
    letter-spacing: 3px;
    font-size: 2.5rem;
}

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 30px;
    padding: 20px;
}

.card {
    width: 270px;
    height: 380px;
    background-color: #fff;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    padding: 20px;
    text-align: center;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease-in-out;
    cursor: pointer;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}


.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
}


.card img {
    height: 180px;
    width: 100%;
    border-radius: 10px;
    object-fit: cover;
    object-position: center;
    transition: transform 0.3s ease;
    display: block;
}


.card:hover img {
    transform: scale(1.1);
}

.card h3 {
    color: #333;
    font-size: 1.5rem;
    margin-bottom: 15px;
    font-weight: 600;
}

.card p {
    margin: 5px 0;
    color: #777;
    font-size: 0.9rem;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}

.actions {
    display: flex;
    justify-content: space-between;
    margin-top: auto;
    font-size: 1.2rem;
}

.actions a i {
    margin: 0 8px;
    cursor: pointer;
}

.fa-edit {
    color: #4e73df; 
}

.fa-trash {
    color: #e74a3b;
}

.ccc {
    margin-top: 130px;
    text-align: center;
}

.ccc h1 {
    color: #fff;
    font-size: 3rem;
    font-weight: 700;
}

.footer {
    background-color: #222;
    color: #fff;
    text-align: center;
    padding: 30px 0;
    margin-top: 100px;
    font-size: 0.9rem;
}

</style>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="ccc">
        <h1>Event List</h1>
        <div class="container">
            <c:forEach items="${listEvents}" var="event">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/${event.imageUrl}"
                        alt="${event.name}">
                    <h3>ID: ${event.id}</h3>
                    <p>Name: ${event.name}</p>
                    <p>Type: ${event.type}</p>
                    <p>Date: ${event.eventDate}</p>
                    <p>Description: ${event.description}</p>
                    <div class="actions">
                        <a href="event_edit?id=${event.id}"><i class="fas fa-edit"></i></a>
                        <a href="event_delete?id=${event.id}"><i class="fas fa-trash"></i></a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="footer">
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
