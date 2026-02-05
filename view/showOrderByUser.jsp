<%@page import="model.OrderAccess.UserOrderList"%>
<%@page import="java.util.List"%>
<%@page import="model.OrderAccess"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>

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
	margin-top: 65px;
	margin-bottom:10px;
}

td, th {
	text-align: left;
	padding: 12px 8px;
}

.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 2px 1px;
	cursor: pointer;
	border-radius: 4px;
}

.details-btn {
	background-color: #2196F3;
	border: none;
	color: white;
	padding: 6px 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 2px 1px;
	cursor: pointer;
	border-radius: 4px;
}

.details-btn:hover {
	background-color: #fa6590;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.status-delivered {
	color: #4CAF50;
	font-weight: bold;
}

.status-pending {
	color: #FF9800;
	font-weight: bold;
}

.dropdown {
  position: relative;
  display: inline-block;
}

input[type="submit"]{
  display: inline-block !important;
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
th,td {text-align: center;}
</style>

</head>

<body>
<header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="userHome.jsp" class="logo">
              <img src="images/booklogo.png" width="70px" height="50px" alt="">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li class="scroll-to-section"><a href="userHome.jsp">Home</a></li>
              <li class="scroll-to-section"><a href="profile.jsp">Profile</a></li>
              <li class="scroll-to-section"><a href="showOrderByUser.jsp" class="active">Order</a></li>
              <li class="scroll-to-section"><a href="cart.jsp">Cart</a></li>
              
              <a href="<%= request.getContextPath() %>/LogoutServlet" class="dropbtn">LogOut</a>
            </ul>
            
            <a class='menu-trigger'>
                <span>Menu</span>
            </a>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
</header>

<%
    User user = (User)session.getAttribute("user");
    OrderAccess acc = new OrderAccess(); 
    List<UserOrderList> userOrderList = acc.getUserOrderList(user.getId());
    request.setAttribute("userOrderList", userOrderList); 
%>

<div class="container">
    <h1>My Orders</h1>
    <br>
    
    <c:choose>
        <c:when test="${not empty userOrderList}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Order No.</th>
                        <th>Total Books</th>
                        <th>Total Amount</th>
                        <th>Order Date</th>
                        <th>Delivery Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${userOrderList}" varStatus="status">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.totalBooks}</td>
                            <td>
                                <fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="" maxFractionDigits="0"/> MMK
                            </td>
                            <td>
                                <fmt:formatDate value="${order.orderdate}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.deliverydate != null}">
                                        <fmt:formatDate value="${order.deliverydate}" pattern="dd/MM/yyyy"/>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-pending">Pending</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.state == 1}">
                                        <span class="status-delivered">Delivered</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-pending">Processing</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="orderDetails.jsp?orderId=${order.orderId}" class="dropbtn">Details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <div style="text-align: center; padding: 50px;">
                <h3>No orders found</h3>
                <p>You haven't placed any orders yet.</p>
                <a href="userHome.jsp" class="button">Start Shopping</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>