<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="model.CategoryAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Edit Book</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
 <link rel="stylesheet" href="css/style.css"> 
<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-digimedia-v1.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">

<style type="text/css">
    input[type="submit"],input[type="button"]{display: inline-block !important;
  padding: 10px 20px !important;
  color: #fa65b1 !important;
  border: 1px solid #fa65b1 !important;
  border-radius: 23px;
  font-weight: 500 !important;
  letter-spacing: 0.3px !important;
  transition: all .5s;
  background-color: white;
  }
  .form-title{color:#FA65B1;}
  
  .dropdown-content a:hover {
  background-color: #f2f2f2; 
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
    </style>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
      <div >
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="adminHome.jsp" class="logo">
              <img src="images/booklogo.png" style="max-width: 150px; height: auto;">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li class="scroll-to-section"><a href="adminHome.jsp" class="active">Home</a></li>
              <li class="scroll-to-section"><a href="addbook.jsp">Add Book</a></li>
              <li class="scroll-to-section"><a href="showAllBook.jsp">All Book</a></li>
              <li class="scroll-to-section"><a href="adminOrderInfo.jsp">Order</a></li>
              <li class="scroll-to-section"><a href="UserInformationServlet">User Information</a></li>
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

<div class="main">
	<section class="signup">
		<div class="container">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Edit Book</h2>
					
				<form method="post" action="EditBookServlet" enctype="multipart/form-data" class="register-form" id="register-form">

						<input type="hidden" name="bookid" value="${book.bookid != null ? book.bookid : 0}" />

						<div class="form-group">
							<label for="name"><i class="zmdi zmdi-book material-icons-name"></i></label>
							<input type="text" name="bname" id="name" placeholder="Book Name"  required value="${book.bname != null ? book.bname : ''}">
						</div>

						<div class="form-group">
							<label for="author"><i class="zmdi zmdi-account material-icons-name"></i></label>
							<input type="text" name="bauthor" id="author" placeholder="Author Name" required value="${book.bauthor != null ? book.bauthor : ''}">
						</div>

						<div class="form-group">
							<label for="price"><i class="zmdi zmdi-money material-icons-name"></i></label>
							<input type="text" name="price" id="price" placeholder="Price" required value="${book.price != null ? book.price : 0}">
						</div>

						<div class="form-group">
	<label for="photo">
		<i class="zmdi zmdi-camera"></i> &nbsp; &nbsp;
	</label> &nbsp; &nbsp;
	
	<!-- Show existing photo -->
	<img src="${pageContext.request.contextPath}/images/${book.photo}" 
	     alt="Book Photo" style="max-width:150px; height:auto;" />

	<!-- Hidden field to send old photo filename -->
	<input type="hidden" name="oldPhoto" value="${book.photo}">

	<!-- File input for new photo -->
	<input type="file" name="photo" id="url">
</div>

						<div class="form-group">
							<label for="re-pass"><i
									class="zmdi zmdi-library material-icons-name"></i> &nbsp;
									&nbsp; Book Category</label> <br>
								<br>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
								<select
									name="cate_id" id="inputState">
								<c:forEach var="i" items="${categoryBean}">
									<option value="${i.cat_id}"
										<c:if test="${i.cat_id == book.cate_id}">selected</c:if>>
										${i.cat_name}
									</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group form-button">
							<input type="submit" name="edit" id="edit" class="form-submit" value="Edit Book" />
							<a href="adminHome.jsp"><input type="button" name="signup" id="signup"
									class="form-submit" value="Back to home" /></a>
						</div>

					</form>
					
				</div>
			</div>
		</div>
	</section>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	


</body>
</html>
