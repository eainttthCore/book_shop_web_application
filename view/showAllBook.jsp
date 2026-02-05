<%@page import="model.*"%>
<%@page import="model.BookDtls"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>All Book</title>
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

</style>
<meta charset="ISO-8859-1">

</head>

<body >
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
<!--               <li class="scroll-to-section"><a href="adminHome.jsp" class="active">Home</a></li> -->
              <li class="scroll-to-section"><a href="addbook.jsp">Add Book</a></li>
              <li class="scroll-to-section"><a href="showAllBook.jsp" class="active">All Book</a></li>
              <li class="scroll-to-section"><a href="adminOrderInfo.jsp">Order</a></li>
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
BookDtlsAccess acc = new BookDtlsAccess();
	List<BookView> list = acc.getAllBookInfo();
	request.setAttribute("myBook", list);
	%>
	<div class="container">
	<h1>All Book Information</h1>
	<br>
	<table border="1">
		<tr>
			<td>ID</td>
			
			<td>Book Name</td>
			<td>Author</td>
			<td>Price</td>
			<td>Categories</td>
			<td>Images</td>
			<td>Action</td>
			
		</tr>
		<c:forEach var="item" items="${myBook }">
			<tr>
				<td><c:out value="${item.bookid }"></c:out></td>

				<td><c:out value="${item.bname }"></c:out></td>
				<td><c:out value="${item.bauthor }"></c:out></td>
				<td><c:out value="${item.price }">MMK</c:out></td>
				<td><c:out value="${item.category }"></c:out></td>
				<td>
				<img src="./bookImages/${item.photo}" height="80px" width="80px" /></td>
				 <td>
   <a href="EditBookServlet?bookid=${item.bookid}" class="dropbtn">Edit</a>
   
   <form action="DeleteBookServlet" method="post" style="display:inline;">
       <input type="hidden" name="bookid" value="${item.bookid}"/>
       <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this book?');"/>
   </form>
</td>
				 
			</tr>


		</c:forEach>


	</table>
	</div>
</body>
</html>