<!DOCTYPE html>
<%@page import="model.User"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Update Profile</title>

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
    input[type="submit"],input[type="button"] {display: inline-block !important;
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
    </style>
</head>
<body>

	<% User user=(User)session.getAttribute("user"); 
 

%>



	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title" >Update Profile</h2>

						<form method="post" action="ProfileUpateServlet"
							class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" value="${user.getUname()}" id="name"
									required placeholder="Your name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email"
									value="${user.getUemail()}"  readonly/>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" value="${user.getUpwd()}"
									required placeholder="Your password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									value="${user.getUpwd()}" required placeholder="Comfirm your password" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="contact" id="contact"
									value="${user.getUmobile()}" required placeholder="Your Phone Number"/>
							</div>
							<div class="form-group">
								<label for="address"><i class="zmdi zmdi-pin"></i></label> <input
									type="text" name="address" id="address"
									value="${user.getAddress()}" required placeholder="Your Address"/>
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Save Changes" />
									<a href="userHome.jsp"><input type="button" name="signup" id="signup"
									class="form-submit" value="Back to home" /></a>
							</div>
							
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/icon-user-profile-update.jpg" alt="sing up image">
						</figure>
						<!-- 						<a href="UserLogin.jsp" class="signup-image-link">I am already -->
						<!-- 							member</a> -->
						<!-- 					</div> -->
					</div>
				</div>
		</section>


	</div>
	


</body>

</html>