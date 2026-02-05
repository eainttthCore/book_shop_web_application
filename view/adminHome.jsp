<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin BookStore</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Admin Home</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-digimedia-v1.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <style type="text/css">
    .dropdown {
  position: relative;
  display: inline-block;
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
<!--               <li class="scroll-to-section"><a href="userHome.jsp" class="active">Home</a></li> -->
              
              
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

<div id="services" class="services section">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
           
            <h4>Hello, &nbsp; <em> Admin</em></h4>
            <div class="line-dec"></div>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="naccs">
            <div class="grid">
              <div class="row">
                <div class="col-lg-12">
                  <div class="menu">
                <div class="first-thumb active"> 
                    <div class="thumb">
                    <a href="addbook.jsp">
                        <span class="icon"><img src="assets/images/notebook_3237588.png" alt=""></span>
                      </a>
                       Add Book
                      </div>
                    </div>
                   <div>
                      <div class="thumb"> 
                      <a href="showAllBook.jsp">                
                        <span class="icon"><img src="assets/images/book_11015790.png" alt=""></span>
                       </a>
                        All Book
                      </div>
                    </div>
                    <div>
                      <div class="thumb"> 
                      <a href="adminOrderInfo.jsp">                
                        <span class="icon"><img src="assets/images/form_5181854.png" alt=""></span>
                        </a>
                      Order
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                       <a href="UserInformationServlet"> 
                       <span class="icon"><img src="assets/images/use-case_10605240.png" alt=""></span>
                       </a>
                        User Infomation
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                       <a href="logs"> 
                       <span class="icon"><img src="assets/images/analysis_5706228.png" alt=""></span>
                       </a>
                        Activity Logs
                      </div>
                    </div>
                  </div>
                </div> 
                
                 
                 
            </div> 
          </div>
            </div> 
          </div>
        </div>
      </div>
    </div>
  
	<!-- Scripts -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/animation.js"></script>
  <script src="assets/js/imagesloaded.js"></script>
  <script src="assets/js/custom.js"></script>

					

	
	



	<script src="js/jquery-1.11.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="js/plugins.js"></script>
	<script src="js/script.js"></script>

</body>
</html>