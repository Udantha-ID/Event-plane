<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Package</title>
<style>
body {
    background-color: #222222; /* Dark background */
    color: #fff;
    display: flex;
    flex-direction: column;
    min-height: 150vh;
    margin: 0;
    font-family: 'Roboto', sans-serif;
}
.f1container {
    width: 60%;
    margin: 150px auto;
    background-color: rgba(255, 255, 255, 0.85); /* Semi-transparent white */
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    text-align: center;
    animation: fadeIn 0.8s ease-in-out; /* Fade in animation */
}
h1 {
    font-size: 32px;
    color: #333;
    margin-bottom: 30px;
}
form {
    width: 100%;
}
.input-group {
    margin-bottom: 25px;
}
label {
    display: block;
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 8px;
    color: #444;
}
.f1container input[type="text"],
.f1container input[type="number"],
.f1container textarea,
.f1container select {
    width: 100%;
    padding: 14px;
    border: 2px solid #ccc;
    border-radius: 6px;
    font-size: 16px;
    color: #333;
    background-color: #fff;
    box-sizing: border-box;
    transition: all 0.3s ease;
}
.f1container input[type="text"]:focus,
.f1container input[type="number"]:focus,
.f1container textarea:focus,
.f1container select:focus {
    border-color: #4CAF50;
    outline: none;
    box-shadow: 0 0 8px rgba(76, 175, 80, 0.5);
}
.f1container textarea {
    resize: vertical;
    min-height: 120px;
}
.f1container button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin-top: 20px;
    border: none;
    border-radius: 6px;
    font-size: 18px;
    cursor: pointer;
    width: 100%;
    transition: background-color 0.3s ease, transform 0.2s ease;
}
.f1container button:hover {
    background-color: #45a049;
    transform: translateY(-3px);
}
.f1container button:active {
    transform: translateY(0px);
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
/* Responsive Design for Mobile Devices */
@media (max-width: 768px) {
    .f1container {
        width: 90%;
        padding: 20px;
        margin: 50px auto;
    }

    h1 {
        font-size: 28px;
    }

    .input-group {
        margin-bottom: 15px;
    }
    .f1container button {
        padding: 12px;
        font-size: 16px;
    }
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="f1container">
		<h1>
			<c:if test="${pkg != null}">
				<span>Edit</span> Package
        </c:if>
			<c:if test="${pkg == null}">
				<span>Add Package</span> 
        </c:if>
		</h1>
		<form id="pkgForm"
			action="<c:if test='${pkg != null}'>pkg_update</c:if><c:if test='${pkg == null}'>pkg_insert</c:if>"
			method="post" class="fadeIn">
			<c:if test="${pkg != null}">
				<input type="hidden" name="id" value="<c:out value='${pkg.id}' />" />
			</c:if>
		<div class="input-group">
		    <label for="pkgName">Package Name:</label> 
		    <input type="text" 
		           id="pkgName" 
		           name="pkgName" 
		           value="<c:out value='${pkg != null ? pkg.pkgName : ""}' />" 
		           required>
		    <span id="pkgNameError" style="color:red; display:none;">Only letters are allowed.</span>
			    
			    <script>
				    document.getElementById('pkgName').addEventListener('input', function(e) {
				        const input = this;
				        const errorMsg = document.getElementById('pkgNameError');
				        const validPattern = /^[A-Za-z\s]+$/;
				        if (!validPattern.test(input.value)) {
				            errorMsg.textContent = 'Only letters are allowed.';
				            errorMsg.style.display = 'block';
				            input.value = input.value.replace(/[^A-Za-z\s]/g, '');
				        } else {
				            errorMsg.style.display = 'none';
				        }
				    });
				</script>
		</div>

			<div class="input-group">
				<label for="description">Description:</label>
				<textarea id="description" name="description" rows="4" required><c:out value='${pkg != null ? pkg.description : ""}' /></textarea>
			</div>
			<div class="input-group">
			    <label for="price">Price:</label>
			    <input type="number" 
			           id="price" 
			           name="price" 
			           min="0" 
			           step="0.01" 
			           value="<c:out value='${pkg != null ? pkg.price : ""}' />" 
			           required
			           onblur="if(this.value) this.value = parseFloat(this.value).toFixed(2);">
			</div>
			<div class="input-group">
				<label for="duration">Duration (Days):</label> 
				<input type="number" 
					   id="duration" 
					   name="duration" 
					   min="1"
					   value="<c:out value='${pkg != null ? pkg.duration : ""}' />" required>
			</div>
			<div class="input-group">
				<label for="serviceLevel">Service Level:</label> 
				<select id="serviceLevel" name="serviceLevel" required>
					<option value="Basic" <c:if test="${pkg != null && pkg.serviceLevel eq 'Basic'}">selected</c:if>>Basic</option>
					<option value="Premium" <c:if test="${pkg != null && pkg.serviceLevel eq 'Premium'}">selected</c:if>>Premium</option>
					<option value="VIP" <c:if test="${pkg != null && pkg.serviceLevel eq 'VIP'}">selected</c:if>>VIP</option>
				</select>
			</div>
			<div class="input-group">
				<label for="eventType">Event Type:</label> 
				<select id="eventType" name="eventType" required>
					<option value="Wedding" <c:if test="${pkg != null && pkg.eventType eq 'Wedding'}">selected</c:if>>Wedding</option>
					<option value="Corporate" <c:if test="${pkg != null && pkg.eventType eq 'Corporate'}">selected</c:if>>Corporate</option>
					<option value="Birthday" <c:if test="${pkg != null && pkg.eventType eq 'Birthday'}">selected</c:if>>Birthday</option>
				</select>
			</div>
			<button type="submit">
				<c:if test="${pkg != null}">Update Package</c:if>
				<c:if test="${pkg == null}">Add Package</c:if>
			</button>
		</form>
	</div>
	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
