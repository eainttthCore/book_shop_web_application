<%@page import="java.util.List"%>
<%@page import="model.BookView"%>
<%@page import="controller.*"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	CategoryAccess accs = new CategoryAccess();
	List<Category> lists = accs.getCategory();
	request.setAttribute("categoryBean", lists);

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

    

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-digimedia-v1.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">
<title>Show Book Related Category</title>

<style type="text/css">

.items{display: flex;
flex-wrap: wrap;
}
 

.card1 {
            border: 1px solid #ccc;
            margin: 35px;
            padding: 10px;
            text-align: center;
            width: 230px;
            margin-top:105px;
        }

 .card1 img {
           width:200px;
            height:300px;
        }

    button {
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

.dropbtn{
	margin-left: 10px;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.text-pink{
color: #fa65b1 !important;
}

</style>
</head>
<body >
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
              <li class="scroll-to-section"><a href="userHome.jsp" class="active">Home</a></li>
              <li class="scroll-to-section"><a href="profile.jsp">Profile</a></li>
              <li class="scroll-to-section"><a href="showOrderByUser.jsp">Order</a></li>
              <li class="scroll-to-section"><a href="cart.jsp">Cart</a></li>
               <div class="dropdown">
      <button class="dropbtn">Categories</button>
      <div class="dropdown-content">
        <c:forEach var="i" items="${categoryBean}">
          <a class="text-pink" href="showBookrelatedCategory.jsp?cat_id=${i.cat_id}">${i.cat_name}</a>
        </c:forEach>
      </div>
    </div>
   
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
	int cat_id = Integer.parseInt(request.getParameter("cat_id"));
	BookDtlsAccess acc = new BookDtlsAccess();
	List<BookView> list = acc.getAllBookByCategoryId(cat_id);
	request.setAttribute("viewBookbycatId", list);
	System.out.println(list);
	%>
	
	
	<div class="items">

		<c:forEach var="item" items="${viewBookbycatId}">
		
<div class="card1">

			<img src="./bookImages/${item.photo }" >

			<br>

			${item.bname }
			<br>
			${item.bauthor }
			<br>
			${item.price } MMK
			<br>
			<a href="AddToCartServlet?book_id=${item.bookid }">
				<button type="button" class="add-to-cart">Add toCart</button>
			</a>
			</div>

			</c:forEach>

			</div>


				<footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p></p>
         <!--  <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p> -->
        </div>
      </div>
    </div>
  </footer>
			</div>
		</div>
	</div>
</body>
</html>