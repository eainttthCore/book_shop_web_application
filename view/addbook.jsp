<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="model.CategoryAccess"%>
<%@page import="model.BookDtlsAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<header>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Add Book</title>

 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

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
    
     
</head>
<body>
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
<!--               <li class="scroll-to-section"><a href="adminHome.jsp" class="active">Home</a></li> -->
              <li class="scroll-to-section"><a href="addbook.jsp" class="active">Add Book</a></li>
              <li class="scroll-to-section"><a href="showAllBook.jsp">All Book</a></li>
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
	CategoryAccess acc = new CategoryAccess();
	List<Category> list = acc.getCategory();
	request.setAttribute("categoryBean", list);
	%>
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Add book</h2>
						



						<form method="post" action="AddBookServlet"
							enctype="multipart/form-data" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-book material-icons-name"></i></label> <input
									type="text" name="bname" id="name" placeholder="Book Name" />
							</div>
							<div class="form-group">
								<label for="email"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="bauthor" id="email" placeholder="Author Name" />
							</div>
							<div class="form-group">
								<label for="price"><i
									class="zmdi zmdi-money material-icons-name"></i></label> <input
									type="text" name="price" id="price" placeholder="Price" />
							</div>

							<div class="form-group">

								<label for="url"><i class="zmdi zmdi-camera"></i> &nbsp;
									&nbsp; Upload Photo</label> <br> <br> <input type="file"
									name="photo" id="url" enctype="multipart/form-data" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i
									class="zmdi zmdi-library material-icons-name"></i> &nbsp;
									&nbsp; Book Category</label> <br>
								<br>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<select
									name="category" id="inputState">
									<c:forEach var="i" items="${categoryBean}">
										<option value="${i.cat_id}">${i.cat_name}</option>
									</c:forEach>

								</select>
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Add book" />
								<a href="adminHome.jsp"><input type="button" name="signup" id="signup"
									class="form-submit" value="Back to home" /></a>
								
							</div>
							
						</form>
					</div>

				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>




</body>

</html>