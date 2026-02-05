<%@page import="model.orderView"%>
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
<title>Order Details</title>

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

.back-btn {
	background-color: #6c757d;
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

.back-btn:hover {
	background-color: #5a6268;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.order-info {
	background-color: #e9ecef;
	padding: 15px;
	margin-bottom: 20px;
	border-radius: 5px;
	margin-top: 80px;
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
    String orderIdParam = request.getParameter("orderId");
    int orderId = 0;
    List<orderView> orderDetailItems = null;
    double totalAmount = 0;
    
    if (orderIdParam != null && !orderIdParam.trim().isEmpty()) {
        try {
            orderId = Integer.parseInt(orderIdParam);
            OrderAccess acc = new OrderAccess();
            orderDetailItems = acc.getOrderItemsByOrderId(orderId);
            
            // Calculate total amount
            if (orderDetailItems != null) {
                for (orderView item : orderDetailItems) {
                    totalAmount += item.getPrice() * item.getQty();
                }
            }
            
        } catch (NumberFormatException e) {
            // Invalid order ID
        }
    }
    
    request.setAttribute("orderDetailItems", orderDetailItems);
    request.setAttribute("orderId", orderId);
    request.setAttribute("totalAmount", totalAmount);
%>

<div class="container">
    <c:choose>
        <c:when test="${not empty orderDetailItems}">
           <%--  <div class="order-info">
                <h2>Order Details - Order #${orderId}</h2>
                <p><strong>Order Date:</strong> <fmt:formatDate value="${orderDetailItems[0].orderdate}" pattern="dd/MM/yyyy"/></p>
                <c:if test="${orderDetailItems[0].deliverydate != null}">
                    <p><strong>Delivery Date:</strong> <fmt:formatDate value="${orderDetailItems[0].deliverydate}" pattern="dd/MM/yyyy"/></p>
                </c:if>
                <p><strong>Total Amount:</strong> 
                    <fmt:formatNumber value="${totalAmount}" type="currency" currencySymbol="" maxFractionDigits="0"/> MMK
                </p>
            </div> --%>
            
            <a href="showOrderByUser.jsp" class="back-btn">Back to Orders</a>
            
            <table border="1">
                <thead>
                    <tr>
                        <th>Book Name</th>
                        <th>Photo</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${orderDetailItems}">
                        <tr>
                            <td>${item.bname}  </td>
                            <td>
                                <img src="./bookImages/${item.photo}" height="70px" width="30px" alt="${item.bname}">
                            </td>
                            <td>
                                <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="" maxFractionDigits="0"/> MMK
                            </td>
                            <td>${item.qty}</td>
                            <td>
                                <fmt:formatNumber value="${item.price * item.qty}" type="currency" currencySymbol="" maxFractionDigits="0"/> MMK
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr style="background-color: #f8f9fa; font-weight: bold;">
                        <td colspan="4" style="text-align: right;">Total:</td>
                        <td>
                            <fmt:formatNumber value="${totalAmount}" type="currency" currencySymbol="" maxFractionDigits="0"/> MMK
                        </td>
                    </tr>
                </tfoot>
            </table>
            
        </c:when>
        <c:otherwise>
            <div style="text-align: center; padding: 100px 50px;">
                <h3>Order Not Found</h3>
                <p>The requested order could not be found or you don't have permission to view it.</p>
                <a href="showOrderByUser.jsp" class="button">← Back to Orders</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>