<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.stream.*"%>
<%@page import="model.OrderAccess"%>
<%@page import="model.OrderAccess.OrderSummary"%>
<%@page import="model.Payment"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Order Info</title>
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
</style>
<meta charset="ISO-8859-1">
</head>
<body>

<c:if test="${not empty sessionScope.failMsg}">
    <script>
        alert("${sessionScope.failMsg}");
    </script>
    <c:remove var="failMsg" scope="session" />
</c:if>

<c:if test="${not empty sessionScope.succMsg}">
    <script>
        alert("${sessionScope.succMsg}");
    </script>
    <c:remove var="succMsg" scope="session" />
</c:if>

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
              <li class="scroll-to-section"><a href="adminOrderInfo.jsp" class="active">Order</a></li>
              <li class="scroll-to-section"><a href="UserInformationServlet">User Information</a></li>
               <li class="scroll-to-section"><a href="logs">Activity Logs</li>
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

<%
    OrderAccess oc = new OrderAccess();
    // Get order summaries grouped by order_id instead of user email
    List<OrderAccess.OrderSummary> orderSummaries = oc.getOrderSummaries();
    
    // Debug: Print total orders found
    System.out.println("Total order summaries found: " + orderSummaries.size());
    
    request.setAttribute("orderSummaries", orderSummaries);
    request.setAttribute("totalOrderCount", orderSummaries.size());
%>



<div class="container">
<h1>Book Order Summary</h1>

<!-- Debug Information -->


<table border="1">
    <tr>
        <th>User Email</th>
        <th>Contact</th>
        <th>Address</th>
        <th>Total_Books</th>
        <th>Total_Amount</th>
        <th>Order_Date</th>
        <th>Status</th>
        <th>Payment Method</th>
        <th>Action</th>
    </tr>

    <c:choose>
        <c:when test="${empty orderSummaries}">
            <tr>
                <td colspan="9">No orders found</td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach var="order" items="${orderSummaries}">
                <tr>
                    <td><c:out value="${order.uemail}" /></td>
                    <td><c:out value="${order.umobile}" /></td>
                    <td><c:out value="${order.address}" /></td>
                    <td>${order.totalBooks}</td>
                    <td>${order.totalAmount} MMK</td>
                    <td><c:out value="${order.orderdate}" /></td>
                    <td>
                        <c:choose>
                            <c:when test="${order.state == 0}">
                                <span style="color: orange;">Pending</span>
                            </c:when>
                            <c:when test="${order.state == 1}">
                                <span style="color: green;">Delivered</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: gray;">Unknown</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${order.paymentMethod == 'Cash on Delivery'}">
                                <span class="payment-method payment-cash">COD</span>
                            </c:when>
                            <c:when test="${order.paymentMethod == 'Bank Transfer'}">
                                <span class="payment-method payment-bank">KPay</span>
                            </c:when>
                            <c:when test="${order.paymentMethod == 'Credit Card'}">
                                <span class="payment-method payment-credit">Credit Card</span>
                            </c:when>
                            <c:otherwise>
                                <span class="payment-method payment-na">N/A</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a class="dropbtn" 
                           href="orderItemDetail.jsp?orderId=<c:out value='${order.orderId}' />">
                           Details
                        </a>
                        <c:if test="${order.state == 0}">
                            <br><br>
                            <a class="dropbtn" style="background-color:#fadde1; padding: 5px 5px !important; "
                               href="DeliverOrderServlet?orderId=<c:out value='${order.orderId}' />">
                               Mark Delivered
                            </a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</table>
</div>

</body>
</html>