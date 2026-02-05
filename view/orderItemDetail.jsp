<%@page import="model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Order Details</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	margin-top: 20px;
	margin-bottom: 20px;
}

td, th {
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.order-header {
	background-color: #f8f9fa;
	padding: 20px;
	margin-top: 80px;
	border-radius: 8px;
	border-left: 4px solid #007bff;
}

.back-btn {
	display: inline-block !important;
	padding: 10px 20px !important;
	color: #fa65b1 !important;
	border: 1px solid #fa65b1 !important;
	border-radius: 23px;
	font-weight: 500 !important;
	letter-spacing: 0.3px !important;
	transition: all .5s;
	text-decoration: none;
	margin-bottom: 20px;
}

.book-image {
	width: 60px;
	height: 80px;
	object-fit: cover;
}

.total-row {
	background-color: #e9ecef !important;
	font-weight: bold;
}
</style>
</head>
<body>

<header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <a href="adminHome.jsp" class="logo">
              <img src="images/booklogo.png" width="70px" height="50px" alt="">
            </a>
            <ul class="nav">
<!--               <li class="scroll-to-section"><a href="adminHome.jsp">Home</a></li> -->
              <li class="scroll-to-section"><a href="addbook.jsp">Add Book</a></li>
              <li class="scroll-to-section"><a href="showAllBook.jsp">All Book</a></li>
              <li class="scroll-to-section"><a href="adminOrderInfo.jsp" class="active">Order</a></li>
              <li class="scroll-to-section"><a href="UserInformationServlet">User Information</a></li>
               <li class="scroll-to-section"><a href="logs">Activity Logs</li>
              <a href="<%= request.getContextPath() %>/LogoutServlet" class="back-btn">LogOut</a>
            </ul>
            <a class='menu-trigger'>
                <span>Menu</span>
            </a>
          </nav>
        </div>
      </div>
    </div>
</header>

<% 
    String orderIdParam = request.getParameter("orderId");
    if (orderIdParam != null) {
        int orderId = Integer.parseInt(orderIdParam);
        OrderAccess oc = new OrderAccess();
        List<orderView> orderDetails = oc.getOrderDetailsByOrderId(orderId);
        
        request.setAttribute("orderDetails", orderDetails);
        request.setAttribute("orderId", orderId);
        
        // Calculate totals
        int totalBooks = 0;
        double totalAmount = 0.0;
        
        for (orderView item : orderDetails) {
            totalBooks += item.getQty();
            totalAmount += (item.getPrice() * item.getQty());
        }
        
        request.setAttribute("totalBooks", totalBooks);
        request.setAttribute("totalAmount", totalAmount);
    }
%>


<%-- <%
    PaymentAccess pa = new PaymentAccess();
    List<Payment> payments = pa.getPaymentsByOrderId(orderId); // orderId should already be set
    request.setAttribute("payments", payments);
%> --%>



<div class="container">
    <a href="adminOrderInfo.jsp" class="back-btn">← Back to Orders</a>
    
    <c:choose>
    
        <c:when test="${empty orderDetails}">
         
            <div class="order-header">
                <h2>Order Not Found</h2>
                <p>No details found for Order ID: ${orderId}</p>
            </div>
        </c:when>
        <c:otherwise>
            <c:set var="firstItem" value="${orderDetails[0]}" />
            
            <div class="order-header">
                <h2>Order Details - Order ID: ${orderId}</h2>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Customer Email:</strong> <c:out value="${firstItem.uemail}" /></p>
                        <p><strong>Contact:</strong> <c:out value="${firstItem.umobile}" /></p>
                        <p><strong>Address:</strong> <c:out value="${firstItem.address}" /></p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Order Date:</strong> <c:out value="${firstItem.orderdate}" /></p>
                        <p><strong>Delivery Date:</strong> 
                            <c:choose>
                                <c:when test="${empty firstItem.deliverydate}">
                                    <span style="color: orange;">Pending</span>
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${firstItem.deliverydate}" />
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <p><strong>Total Books:</strong> ${totalBooks}</p>
                        
                        <p>
                        
                        <c:choose>
        <c:when test="${not empty payments}">
            <c:forEach var="pay" items="${payments}" varStatus="loop">
                <c:out value="${pay.method}" />
                <c:if test="${!loop.last}">, </c:if>
            </c:forEach>
        </c:when>
        <c:otherwise>
           
        </c:otherwise>
    </c:choose>
                    </p>
                        <p><strong>Total Amount:</strong> ${totalAmount} MMK</p>
                    </div>
                </div>
            </div>

            <h3>Order Items</h3>
            <table border="1">
                <tr>
                    <th>Book Image</th>
                    <th>Book Name</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>

                <c:forEach var="item" items="${orderDetails}">
                    <tr>
                        <td>
                            <img src="book/<c:out value='${item.photo}' />" 
                                 alt="Book Image" class="book-image">
                        </td>
                        <td><c:out value="${item.bname}" /></td>
                        <td>${item.price} MMK</td>
                        <td>${item.qty}</td>
                        <td>${item.price * item.qty} MMK</td>
                    </tr>
                </c:forEach>
                
                <tr class="total-row">
                    <td colspan="3"><strong>TOTAL</strong></td>
                    <td><strong>${totalBooks}</strong></td>
                    <td><strong>${totalAmount} MMK</strong></td>
                </tr>
            </table>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>