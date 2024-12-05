<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Ticket</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
         <style>
        h2 {
            font-weight: bold;
            color: black;
            text-align: center;
        }

        form {
            border: 3px solid grey;
            padding: 20px;
            border-radius: 10px;
        }

        .container {
            max-width: 600px;
            margin-top: 50px;
        }
    </style>
    
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <div class="container mt-5">
        <h2>Edit Ticket</h2>
        <form action="update" method="post">
            <input type="hidden" name="id" value="<c:out value='${ticket.id}' />" />
            <div class="form-group">
                <label for="studentId">Reservation ID:</label>
                <input type="text" class="form-control" id="reservationId" name="reservationId" value="<c:out value='${ticket.reservationId}' />" required>
            </div>
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" class="form-control" id="fullName" name="fullName" value="<c:out value='${ticket.fullName}' />" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="<c:out value='${ticket.email}' />" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" value="<c:out value='${ticket.phoneNumber}' />" required>
            </div>
            <div class="form-group">
                <label for="message">Enter the Issue Details:</label>
                <textarea class="form-control" id="message" name="message" rows="3" required><c:out value='${ticket.message}' /></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="list" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
    <jsp:include page="footer.jsp" />
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  document.getElementById('ticketForm').addEventListener('submit', function(event) {
	  event.preventDefault();

	  const name = document.getElementById('name').value;
	  const email = document.getElementById('email').value;
	  const reservationID = document.getElementById('reservationID').value; 
	  const issueType = document.getElementById('issueType').value;
	  const description = document.getElementById('description').value;

	  // Simple validation
	  if (name && email && reservationID && issueType && description) {
	    document.getElementById('successMessage').classList.remove('d-none');
	    
	    document.getElementById('ticketForm').reset();
	  } else {
	    alert("Please fill in all the required fields");
	  }
	  
      // Validate email format
      const emailRegex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
      if (!emailRegex.test(email)) {
          isValid = false;
          document.getElementById('emailError').textContent = "Please enter a valid email (e.g., example@gmail.com).";
      } else {
          document.getElementById('emailError').textContent = "";
      }
      
      
	  
	});
  
  </script>
</body>
</html>