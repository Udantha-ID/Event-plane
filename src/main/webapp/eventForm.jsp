<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:if test="${event != null}">Edit</c:if><c:if
		test="${event == null}">Add</c:if> Event - Event Management</title>
<link rel="stylesheet" href="css/styles.css">
<!-- Include SweetAlert library from CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">

<style>
/* Form container */

.fcontainer {
    width: 50%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 150px;
    padding: 30px;
    background-color: #f0faff; 
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(173, 216, 230, 0.7);
    animation: fadeIn 0.5s ease;
}


h1 {
    text-align: center;
    margin-bottom: 30px;
    color: #00bcd4;  
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 2rem;
}

label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
    color: #00bcd4; 
}


input[type="text"], input[type="file"], input[type="date"], textarea {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #00bcd4; 
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 16px;
    background-color: #f4faff; 
    color: #333;
}

/* Form button */
.fcontainer button {
    width: 100%;
    padding: 15px;
    background-color: #4caf50;
    border: 1px solid #00bcd4;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

/* Button hover effect */
.fcontainer button:hover {
    background-color: #098a30;
}

/* Animations */
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

/* Footer styles */
.footer {
    background-color: #222;
    color: #fff;
    margin-top: 200px;
    text-align: center;
    padding: 30px 0;
    font-size: 0.9rem;
}

</style>
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="fcontainer">
		<h1>
			<c:if test="${event != null}">
				<span>Edit</span> Event
            </c:if>
			<c:if test="${event == null}">
				<span>Add Event</span>
            </c:if>
		</h1>

		<form id="eventForm"
			action="<c:if test='${event != null}'>event_update</c:if><c:if test='${event == null}'>event_insert</c:if>"
			method="post" enctype="multipart/form-data">

			<c:if test="${event != null}">
				<input type="hidden" name="id" value="<c:out value='${event.id}' />" />
			</c:if>

			<div class="input-group">
			    <label for="name">Event Name:</label>
			    <input type="text"
			           id="name" name="name"
			           value="<c:out value='${event.name}' />"
			           required>
			    <span id="nameError" style="color:red;display:none;">Only letters are allowed.</span>
			    
				    <script>
					    document.getElementById('name').addEventListener('input', function(e) {
					        const nameInput = this;
					        const nameError = document.getElementById('nameError');
					        const validPattern = /^[A-Za-z\s]+$/;
					        
					        if (!validPattern.test(nameInput.value)) {
					            nameError.textContent = 'Only letters are allowed.';
					            nameError.style.display = 'block';
					            nameInput.value = nameInput.value.replace(/[^A-Za-z\s]/g, '');
					        } else {
					            nameError.style.display = 'none';
					        }
					    });
					</script>
			</div>
			
			<div class="input-group">
				<label for="eventDate">Event Date:</label> <input type="date"
					id="eventDate" name="eventDate"
					min="<%= (new java.text.SimpleDateFormat("yyyy-MM-dd")).format(new java.util.Date()) %>"
					value="<c:out value='${event.eventDate}' />" required>
			</div>

			<div class="input-group">
				<label for="type">Type:</label> <input type="text" id="type"
					name="type" value="<c:out value='${event.type}' />" required>
			</div>

			<div class="input-group">
				<label for="organizer">Organizer:</label> <input type="text"
					id="organizer" name="organizer"
					value="<c:out value='${event.organizer}' />" required>
			</div>

			<div class="input-group">
				<label for="description">Description:</label>
				<textarea id="description" name="description" rows="4" required><c:out
						value='${event.description}' /></textarea>
			</div>

			<div class="input-group">
				<label for="image">Upload Image:</label> <input type="file"
					id="image" name="image" accept="image/*">
				<c:if test="${event != null}">
					<input type="hidden" name="imageUrl"
						value="<c:out value='${event.imageUrl}' />" />
				</c:if>
			</div>

			<button type="submit">
				<c:if test="${event != null}">Update</c:if>
				<c:if test="${event == null}">Add</c:if>
			</button>
		</form>
	</div>

	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
