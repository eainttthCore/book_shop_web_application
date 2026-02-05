<!DOCTYPE html>
<%@page import="model.User"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Log in for Online Book</title>

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
<!-- defines a hidden input field with the id "status" and sets its value to the result of request.getAttribute("status") and it later used in JavaScript -->
	<input type="hidden" id="status"
		value="<%= request.getAttribute("status") %>">
<!-- retrieves the User object from the session("user") and assigns it to the variable use -->
	<%User user=(User)session.getAttribute("user");
	 
	%>
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/book.png" style="max-width: 300px; height: auto;" alt="sing up image">
						</figure>
						
					</div>

					<div class="signin-form">
						<h2 class="form-title">Log in</h2>
						<form method="post" action="LoginServlet" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
  <input type="submit" name="signin" id="signin"
    class="form-submit"
    value="Log in"
     />
     <br> <br>
    <p style="display: flex; gap: 5px; font-family: Arial, sans-serif;">
  Don't have an account? 
  <a href="registration.jsp" 
     style="color:#FA65B1; font-weight: bold; text-decoration: underline;">
    Sign up
  </a>
</p>

    
</div>

						</form>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
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
	if(status == "failed"){
		swal("Sorry!","Account invalid","failed");
	}
	

	</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>