<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>User Information</title>
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
<!--               <li class="scroll-to-section"><a href="adminHome.jsp" class="active">Home</a></li> -->
              <li class="scroll-to-section"><a href="addbook.jsp">Add Book</a></li>
              <li class="scroll-to-section"><a href="showAllBook.jsp">All Book</a></li>
              <li class="scroll-to-section"><a href="adminOrderInfo.jsp">Order</a></li>
              <li class="scroll-to-section"><a href="UserInformationServlet" class="active" >User Information</a></li>
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
<div id="header-wrap">

		<div class="top-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						<div class="social-links">
							<ul>
								<li><a href=""><i class="icon icon-facebook"></i></a></li>
								<li><a href=""><i class="icon icon-twitter"></i></a></li>
								<li><a href="#"><i class="icon icon-youtube-play"></i></a>
								</li>
								<li><a href="#"><i class="icon icon-behance-square"></i></a>
								</li>
							</ul>
						</div>
						<!--social-links-->
					</div>
					<div class="col-md-6">
						<div class="right-element">
							<a href="adminHome.jsp" class="user-account for-buy">
							
							 <i class='bx bxs-home-alt-2' >
								Home</i></a>
								 <a href="LogoutServlet"
								class="user-account for-buy"> <i class='bx bx-log-out'> Logout</i></a>
							
						</div>
						<!--top-right-->
					</div>

				</div>
			</div>
		</div>
		<div class="container">
	<h1>All User Information</h1>
	<br>
	<table border="1">
		<tr>
			
			<td>Name</td>
			<td>Email</td>
			<td>Mobile</td>
			<td>Address</td>
		</tr>
		<c:forEach var="item" items="${myBean }">
			<tr>
				
				<td><c:out value="${item.uname }"></c:out></td>
				<td><c:out value="${item.uemail }"></c:out></td>
				<td><c:out value="${item.umobile }"></c:out></td>
				<td><c:out value="${item.address}"></c:out></td>
			</tr>

		</c:forEach>


	</table>
	</div>
</body>
</html>