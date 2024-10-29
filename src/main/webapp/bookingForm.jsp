<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Movie Packages</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style type="text/css">
:root {
    --primary-bg-color: #f0f0f0;
    --container-bg-color: #fff;
    --shadow-color: rgba(0, 0, 0, 0.1);
    --primary-color: #4CAF50;
    --primary-hover-color: #45a049;
    --input-border-color: #ccc;
    --input-focus-border: #4CAF50;
    --font-family: 'Arial', sans-serif;
    --font-color-dark: #333;
    --font-color-light: #555;
    --form-width: 80%;
    --border-radius: 10px;
    --button-font-size: 16px;
    --button-padding: 14px 20px;
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

.wwcontainer {
    width: var(--form-width);
    margin: 200px auto;
    background-color: var(--container-bg-color);
    border-radius: var(--border-radius);
    box-shadow: 0px 10px 30px var(--shadow-color);
    padding: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    animation: slideUp 0.7s ease-out;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(50px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

h2 {
    font-size: 26px;
    font-weight: bold;
    margin-bottom: 20px;
    background: linear-gradient(90deg, #4CAF50, #1976D2);
    -webkit-background-clip: text;
    color: transparent;
    /* text-align: center; */
}

.wwcontainer img {
    max-width: 100%;
    height: 200px;
    border-radius: var(--border-radius);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

form {
    width: 100%;
    padding-left: 30px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 8px;
    color: var(--font-color-dark);
}

.form-group input[type="text"],
.form-group input[type="email"],
.form-group select,
.form-group input[type="date"],
.form-group input[type="number"] {
    width: 100%;
    padding: 12px;
    border: 2px solid var(--input-border-color);
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 16px;
    margin-top: 5px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.form-group input:focus,
.form-group select:focus {
    border-color: var(--input-focus-border);
    box-shadow: 0px 0px 10px rgba(76, 175, 80, 0.3);
    outline: none;
}

.form-group select {
    width: 100%;
}

.form-group button {
    background-color: var(--primary-color);
    color: white;
    padding: var(--button-padding);
    border: none;
    border-radius: var(--border-radius);
    cursor: pointer;
    width: 100%;
    font-size: var(--button-font-size);
    transition: background-color 0.3s ease, transform 0.3s ease;
    font-weight: bold;
    text-transform: uppercase;
}

.form-group button:hover {
    background-color: var(--primary-hover-color);
    transform: translateY(-3px);
}

@media (min-width: 768px) {
    .wwcontainer {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 40px;
        width: 75%;
    }

    form {
        width: 100%;
        padding-left: 50px;
    }

    h2 {
        font-size: 28px;
    }

    .form-group button {
        width: auto;
        max-width: 200px;
    }
}


</style>
</head>
<body>

	<jsp:include page="header2.jsp"></jsp:include>
	<div class="wwcontainer">
		<h2>
			<c:choose>
				<c:when test="${empty bookpkg}">
                    Book Events Package
                </c:when>
				<c:otherwise>
                    Update Events Details
                </c:otherwise>
			</c:choose>
			<img alt="images/EventBook.jpg" src="./assets/images/EventBook.jpg" width="500px" height="300px" style="margin-top: 150px;"/>
		</h2>
		<form
			action="<c:choose><c:when test="${empty bookpkg}">book_insert</c:when><c:otherwise>book_update</c:otherwise></c:choose>"
			method="post">
			<c:if test="${not empty bookpkg}">
				<input type="hidden" name="id" value="${bookpkg.id}" />
			</c:if>
			<div class="form-group">
			    <label for="userName">User Name:</label>
			    <input type="text" 
			    	   id="userName" 
			    	   name="userName" 
			    	   onkeypress="return /[a-zA-Z\s]/.test(event.key)"
			    	   value="" required>
			</div>
			<div class="form-group">
			    <label for="userEmail">User Email:</label>
			    <input type="email"
			           id="userEmail" name="userEmail"
			           value="${empty bookpkg ? '' : bookpkg.userEmail}"
			           required
			           pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
			           title="Please enter a valid email address.">
			</div>

			<div class="form-group">
			    <label for="bookpkgName">Package Name:</label>
			    <input type="text"
			           id="bookpkgName" name="bookpkgName"
			           value="${empty bookpkg ? '' : bookpkg.bookpkgName}"
			           required>
			    <span id="nameError" style="color:red;display:none;">Only letters are allowed.</span>
			    
			    		<script>
			    document.getElementById('bookpkgName').addEventListener('input', function() {
			        const nameInput = this;
			        const nameError = document.getElementById('nameError');
			        const namePattern = /^[A-Za-z\s]+$/;
			
			        if (!namePattern.test(nameInput.value)) {
			            nameError.textContent = 'Only letters are allowed.';
			            nameError.style.display = 'block';
			        } else {
			            nameError.style.display = 'none';
			        }
			    });
			</script>
			
			</div>
			
			<div class="form-group">
				<label for="bookpkgType">Package Type:</label> <select
					id="bookpkgType" name="bookpkgType" required>
					<option value="Standard"
						<c:if test="${!empty bookpkg and bookpkg.bookpkgType eq 'Standard'}">selected</c:if>>Standard</option>
					<option value="Premium"
						<c:if test="${!empty bookpkg and bookpkg.bookpkgType eq 'Premium'}">selected</c:if>>Premium</option>
				</select>
			</div>
			<div class="form-group">
				<label for="startDate">Start Date:</label> <input type="date"
					id="startDate" name="startDate"
					min="<%= (new java.text.SimpleDateFormat("yyyy-MM-dd")).format(new java.util.Date()) %>"
					value="${empty bookpkg ? '' : bookpkg.startDate}" required>
			</div>
			<div class="form-group">
				  <label for="duration">Duration (in days):</label>
				  <input type="number"
				         id="duration" name="duration"
				         value="${empty bookpkg ? '' : bookpkg.duration}"
				         required
				         min="1"
				         title="Duration must be 1 or more and can include decimals."
				         oninput="this.value = this.value.replace(/[^0-9.]/g, '')"> 
			</div>
			<div class="form-group">
				<label for="paymentMethod">Payment Method:</label> <select
					id="paymentMethod" name="paymentMethod" required>
					<option value="Credit Card"
						<c:if test="${!empty bookpkg and bookpkg.paymentMethod eq 'Credit Card'}">selected</c:if>>Credit
						Card</option>
					<option value="Debit Card"
						<c:if test="${!empty bookpkg and bookpkg.paymentMethod eq 'Debit Card'}">selected</c:if>>Debit
						Card</option>
					<option value="PayPal"
						<c:if test="${!empty bookpkg and bookpkg.paymentMethod eq 'PayPal'}">selected</c:if>>PayPal</option>
				</select>
			</div>
			<div class="form-group">
				<button type="submit">
					<c:choose>
						<c:when test="${empty bookpkg}">Book Package</c:when>
						<c:otherwise>Update Booking Details</c:otherwise>
					</c:choose>
				</button>
			</div>
		</form>
	</div>

	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
