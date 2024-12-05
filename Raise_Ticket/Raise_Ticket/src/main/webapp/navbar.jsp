 <header class="main-header">
        <div class="logo-container">
            <h1 class="brand-name">BookEase</h1>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="home.jsp" class="active">Home</a></li>
                <li><a href="reservation.jsp">Reservations</a></li>
                <li><a href="price.jsp">View Prices</a></li>
                <li><a href="display.jsp">My Reservations</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="index.jsp">Contact</a></li>
                <li><a href="profile.jsp" class="profile">My Profile</a></li>
           
            </ul>
        </nav>
        <style>
       

.main-header {
    display: flex;
    justify-content: space-between;
    align-items: center; /* Ensures items align vertically */
    background-color: #6495ED;
    padding: 10px 20px; /* Added more padding for better spacing */
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.logo-container {
    display: flex;
    align-items: center;
}

.brand-name {
    font-family: 'Poppins', sans-serif;
    font-weight: 600;
    font-size: 24px;
    color: white;
}

.main-nav ul {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
}

.main-nav ul li {
    margin-left: 30px;
}

.main-nav ul li a {
    font-family: 'Poppins', sans-serif;
    font-weight: 400;
    font-size: 16px;
    color: white;
    text-decoration: none;
    transition: color 0.3s ease;
}

.main-nav ul li a.profile {
	color: #45a049;
    background-color: #DFF0D8; /* Light green background fill */
    border-radius: 30px; /* Optional: rounded corners */
    padding: 8px 15px;
}

.main-nav ul li a:hover {
    color: #f0e68c;
}
        </style>
    </header>