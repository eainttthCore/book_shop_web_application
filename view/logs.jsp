<%@page import="java.util.*"%>
<%@page import="model.LogEntry"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>System Logs</title>
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-digimedia-v1.css">
<link rel="stylesheet" href="assets/css/animated.css">
<link rel="stylesheet" href="assets/css/owl.css">
    
    <style>
    
    
   table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
	margin-bottom:10px;
	
	
}


 td,th {
	text-align:center;
	padding: 8px; 
}

tr:nth-child(even) {
	background-color: #f2f2f2;
} 
.dropdown {
  position: relative;
  display: inline-block;
}

input[type="submit"]{display: inline-block !important;
  padding: 10px 20px !important;
  color: #fa65b1 !important;
  border: 1px solid #fa65b1 !important;
  border-radius: 23px;
  font-weight: 500 !important;
  letter-spacing: 0.3px !important;
  transition: all .5s;
  }

.dropbtn {
 display: inline-block !important;
  padding: 10px 20px !important;
  color: #fa65b1 !important;
  border: 1px solid #fa65b1 !important;
  border-radius: 23px;
  font-weight: 500 !important;
  letter-spacing: 0.3px !important;
  transition: all .5s;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #fff;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  padding-bottom: 15px;
}

.dropdown-content a {
  color: #333; 
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #f2f2f2; 
}

.dropdown:hover .dropdown-content {
  display: block;
}

.debug-info {
  background-color: #f0f8ff;
  padding: 10px;
  margin: 10px 0;
  border-left: 4px solid #007bff;
}

.payment-method {
  font-weight: 500;
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 15px;
}

.payment-cash {
  background-color: #fff3cd;
  color: #856404;
}

.payment-bank {
  background-color: #d1ecf1;
  color: #0c5460;
}

.payment-credit {
  background-color: #d4edda;
  color: #155724;
}

.payment-na {
  background-color: #f8d7da;
  color: #721c24;
}

.con {padding-top: 100px;}



/* table { border-collapse: collapse; width: 100%;  }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }  */
    </style>
    
</head>
<body>





<header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="adminHome.jsp" class="logo">
              <img src="images/booklogo.png" width="70px" height="50px" alt="">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
<!--               <li class="scroll-to-section"><a href="adminHome.jsp">Home</a></li> -->
              <li class="scroll-to-section"><a href="addbook.jsp">Add Book</a></li>
              <li class="scroll-to-section"><a href="showAllBook.jsp">All Book</a></li>
              <li class="scroll-to-section"><a href="adminOrderInfo.jsp" >Order</a></li>
              <li class="scroll-to-section"><a href="UserInformationServlet">User Information</a></li>
               <li class="scroll-to-section"><a href="logs" class="active">Activity Logs</a></li>
  <a href="<%= request.getContextPath() %>/LogoutServlet" class="dropbtn">LogOut</a>
  
            <a class='menu-trigger'>
                <span>Menu</span>
            </a>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
  </header>
  
  <div class="con" >
<%
    List<LogEntry> logs = (List<LogEntry>) request.getAttribute("logs");
%>

<table>
    <tr>
        <th>No.</th>
        <th>Order ID</th>
        <th>Book</th>
        <th>User</th>
        <th>Admin</th>
        <th>Action</th>
        <th>Order Date</th>
        <th>Delivery Date</th>
        <th>Log Time</th>
    </tr>
    <%
        int i = 1;
        for (LogEntry log : logs) {
    %>
    <tr>
        <td><%= i++ %></td>
        <td><%= (log.getOrderId() != 0 ? log.getOrderId() : "-") %></td>
        <td><%= (log.getBookName() != null ? log.getBookName() : "-") %></td>
        <td><%= (log.getUserEmail() != null ? log.getUserEmail() : "-") %></td>
        <td><%= (log.getAdminName() != null ? log.getAdminName() : "-") %></td>
        <td><%= log.getAction() %></td>
        <td><%= (log.getOrderDate() != null ? log.getOrderDate() : "-") %></td>
        <td><%= (log.getDeliveryDate() != null ? log.getDeliveryDate() : "-") %></td>
        <td><%= log.getLogTime() %></td>
    </tr>
    <% } %>
</table>
</div>
</body>
</html>
