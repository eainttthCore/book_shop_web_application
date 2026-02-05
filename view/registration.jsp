<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Registration for Online Book</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

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
 </style>
</head>
<body>
<% String alUser=request.getParameter("emailExit"); %>
	<input type="hidden" id="status"
		value="<%= request.getAttribute("status") %>">


	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Registration</h2>
						<p style="display: flex; gap: 5px; font-family: Arial, sans-serif;">
  Already have an account? 
  <a href="UserLogin.jsp" 
     style="color:#FA65B1; font-weight: bold; text-decoration: underline;">
   Login
  </a>
</p>
 <br>

						<form method="post" action="UserRegistrationServlet"
							class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
									<input
									type="text" name="name" id="name" 
									placeholder="Your Name" />
							</div>
							<c:if test="${not empty sessionScope.failMsg}">
							<p class="text-danger">${sessionScope.failMsg}</p>
							    
							    <c:remove var="failMsg" scope="session" />
							</c:if>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> 
								 
								<input
									type="email" name="email" id="email" 
									placeholder="Your Email" />
							</div>
							
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" 
									placeholder="Password" />
							</div>
							 <c:if test="${not empty failpass}">
        <span style="color:red;">${failpass}</span>
    </c:if>
			
							<%-- <c:if test="${not empty sessionScope.failpass}">
							<p class="text-danger">${sessionScope.failpass}</p>
							<c:remove var="failpass" scope="session" />
							</c:if> --%>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass" 
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="contact" id="contact" 
									placeholder="Contact no" />
							</div>
							<c:if test="${not empty sessionScope.failumobile}">
							<p class="text-danger">${sessionScope.failumobile}</p>
							    
							    <c:remove var="failumobile" scope="session" />
							</c:if>
							<div class="form-group">
								<label for="address"><i class="zmdi zmdi-pin"></i></label> <input
									type="text" name="address" id="address" 
									placeholder="Address" />
							</div>
							<c:if test="${not empty sessionScope.uaddress}">
							<p class="text-danger">${sessionScope.uaddress}</p>
							    
							    <c:remove var="uaddress" scope="session" />
							</c:if>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"  
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
  <input type="submit" name="signup" id="signup"
  
    value="Register"
    />
</div>
	</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/pink.jpg" alt="sing up image" style="margin-top: 70px;">
						</figure>
						
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
	
	var status=document.getElementById("status").value;
	if(status == "success"){
		swal("Congrats","Account Created Successfully","success");
	}
	</script>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>