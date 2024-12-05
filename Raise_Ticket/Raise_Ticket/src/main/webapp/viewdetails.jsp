<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Tickets</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <div class="container mt-5">
        <h2>Ticket Details</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Reservation ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Message</th>
                    <th>Created At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${listTickets}">
                    <tr>
                        <td><c:out value="${ticket.id}" /></td>
                        <td><c:out value="${ticket.reservationId}" /></td>
                        <td><c:out value="${ticket.fullName}" /></td>
                        <td><c:out value="${ticket.email}" /></td>
                        <td><c:out value="${ticket.phoneNumber}" /></td>
                        <td><c:out value="${ticket.message}" /></td>
                        <td><c:out value="${ticket.createdAt}" /></td>
                        <td>
                            <a href="edit?id=<c:out value='${ticket.id}' />" class="btn btn-sm btn-primary">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="delete?id=<c:out value='${ticket.id}' />" class="btn btn-sm btn-danger" onclick="return confirmDelete()">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="new" class="btn btn-success">Create New Ticket</a>
        
        
    </div>
    <jsp:include page="footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
     <script>
        // Function to confirm deletion and show a success message
        function confirmDelete() {
            let confirmAction = confirm("Are you sure you want to delete this ticket?");
            if (confirmAction) {
                alert("You deleted the ticket successfully!");
                return true; 
            } else {
                return false; 
            }
        }
    </script>
    
</body>
</html>