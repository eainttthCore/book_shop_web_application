<%@page import="model.*"%>
<%@page import="model.BookDtls"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	CategoryAccess acc = new CategoryAccess();
	List<Category> list = acc.getCategory();
	request.setAttribute("categoryBean", list);
%>
<!DOCTYPE html>
<html>
 <head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<title>Cart</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-digimedia-v1.css">
<link rel="stylesheet" href="assets/css/animated.css">
<link rel="stylesheet" href="assets/css/owl.css">
</head>
<title>Cart</title>
<style type="text/css">
/* Keep all your existing CSS exactly as is */
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
	margin-top: 65px;
	margin-bottom:10px;
}
td,th {
	text-align: left;
	padding: 8px;
}
.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
.button1 {
	background-color: red;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
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
.button-cart{
border-radius: 50px;
}
</style>
</head>
<body >

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <a href="userHome.jsp" class="logo">
              <img src="images/booklogo.png" width="70px" height="50px" alt="">
            </a>
            <ul class="nav">
              <li class="scroll-to-section"><a href="userHome.jsp" class="active">Home</a></li>
              <li class="scroll-to-section"><a href="profile.jsp">Profile</a></li>
              <li class="scroll-to-section"><a href="showOrderByUser.jsp">Order</a></li>
              <li class="scroll-to-section"><a href="cart.jsp">Cart</a></li>
              <li class="scroll-to-section">
                <div class="dropdown">
                  <button class="dropbtn">Categories</button>
                  <div class="dropdown-content">
                    <c:forEach var="i" items="${categoryBean}">
                      <a href="showBookrelatedCategory.jsp?cat_id=${i.cat_id}">${i.cat_name}</a>
                    </c:forEach>
                  </div>
                </div>
              </li>  
              <a href="<%= request.getContextPath() %>/LogoutServlet" class="dropbtn">LogOut</a>
              <a class='menu-trigger'><span>Menu</span></a>
            </ul>
          </nav>
        </div>
      </div>
    </div>
</header>

<%
List<BookOrderItem> cartItems = (List<BookOrderItem>) session.getAttribute("cartItems");
if(cartItems == null) cartItems = new ArrayList<>();
request.setAttribute("cartItems", cartItems);
%>



<c:if test="${empty cartItems}">
    <div style="text-align: center; padding: 150px 50px;">
                <h3>Your cart is empty.</h3>
                <p>You haven't placed any orders yet.</p>
                <a href="userHome.jsp" class="dropbtn">Start Shopping</a>
            </div>
</c:if>
<div class="container" style="padding-top: 90px">
<c:if test="${not empty cartItems}">

<form action="OrderServlet" method="post">
<table border=1>
    <thead>
        <tr>
            <th>Book Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <c:set var="totalValue" value="0" />
    <c:forEach var="item" items="${cartItems}">
        <c:set var="itemTotal" value="${item.price * item.quantity}" />
        <c:set var="totalValue" value="${totalValue + itemTotal}" />
        <tr>
            <td>${item.bname}</td>
            <td>${item.category}</td>
            <td>${item.price}</td>
            <td>${item.quantity}</td>
            <td>${itemTotal}</td>
            <td>
                <a href="RemoveCartItemServlet?book_id=${item.bookid}">Remove</a>
            </td>
        </tr>
    </c:forEach>
   
    </tbody>
</table>    
<h2>Total Cost: ${totalValue} MMK</h2>
<input type="submit" value="Order Now">
</form>
</c:if>
</div>
</body>
</html>
