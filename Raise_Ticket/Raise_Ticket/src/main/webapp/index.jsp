<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Raise a Ticket</title>
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
        <h2>Raise a Ticket</h2>
        <form action="insert" method="post">
            <div class="form-group">
                <label for="studentId">Reservation ID:</label>
                <input type="text" class="form-control" id="reservationId" name="reservationId" required>
            </div>
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required>
            </div>
            <div class="form-group">
                <label for="message">Enter the Issue details:</label>
                <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="list" class="btn btn-secondary">View Details</a>
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