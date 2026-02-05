<%@page import="model.*"%>
<%@page import="java.util.*"%>   
<%@page import="controller.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
	<%
	CategoryAccess acc = new CategoryAccess();
	List<Category> list = acc.getCategory();
	request.setAttribute("categoryBean", list);


%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Book Store</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-digimedia-v1.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <!-- <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" type="text/css" href="icomoon/icomoon.css"> -->
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
  padding: 0 16px;
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
  </head>

<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- Pre-header Starts -->
  <div class="pre-header">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-sm-8 col-7">
          
        </div>
        <div class="col-lg-4 col-sm-4 col-5">
          <ul class="social-media">
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-behance"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- Pre-header End -->

  <!-- ***** Header Area Start ***** -->
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
  <!-- ***** Header Area End ***** -->

  <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 align-self-center">
              <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                <div class="row">
                  <div class="col-lg-12">
<!--                     <h6>Digital Media Agency</h6> -->
                    <h2>Java Programming</h2>
                    <p>Java is actually a decent programming language developed
					at Sun Microsystems. It was originally used for Internet
					applications or applets. Those applets are embedded on web
					pages and run in the browser. Java uses a special format known
					as byte code instead of an ordinary machine code.</p>
                  </div>
                  <div class="col-lg-12">
                    <!-- <div class="border-first-button scroll-to-section">
                      <a href="#contact">Free Quote</a>
                    </div>
 -->                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                <img src="images/main-banner1.jpg"  alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="about" class="about section">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6">
              <div class="about-left-image  wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.5s">
                <img src="assets/images/about-dec.png" alt="">
              </div>
            </div>
            <div class="col-lg-6 align-self-center  wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
              <div class="about-right-content">
                <div class="section-heading">
                  <h6>About Us</h6>
                  <h4>Who Are <em>We?</em></h4>
                  <div class="line-dec"></div>
                </div>
                <p>At our online book store we envision a world where the love of reading is celebrated and shared. We aim to be your go-to destination for literary exploration, inspiration, and connection. User-Friendly Interface: We've designed our website with you in mind. It's easy to navigate, search, and filter through our vast catalog. You can browse by genre, author, or even personalized recommend. Thank you for choosing [Your Bookstore Name] as your literary companion. We look forward to embarking on countless reading adventures with you.</p>
                <div class="row">
                  <div class="col-lg-4 col-sm-4">
                    <div class="skill-item first-skill-item wow fadeIn" data-wow-duration="1s" data-wow-delay="0s">
                      <div class="progress" data-percentage="90">
                        <span class="progress-left">
                          <span class="progress-bar"></span>
                        </span>
                        <span class="progress-right">
                          <span class="progress-bar"></span>
                        </span>
                        <div class="progress-value">
                          <div>
                            90%<br>
                            <span>Book Quality</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4 col-sm-4">
                    <div class="skill-item second-skill-item wow fadeIn" data-wow-duration="1s" data-wow-delay="0s">
                      <div class="progress" data-percentage="100">
                        <span class="progress-left">
                          <span class="progress-bar"></span>
                        </span>
                        <span class="progress-right">
                          <span class="progress-bar"></span>
                        </span>
                        <div class="progress-value">
                          <div>
                            100%<br>
                            <span>Reliable Service</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4 col-sm-4">
                    <div class="skill-item third-skill-item wow fadeIn" data-wow-duration="1s" data-wow-delay="0s">
                      <div class="progress" data-percentage="80">
                        <span class="progress-left">
                          <span class="progress-bar"></span>
                        </span>
                        <span class="progress-right">
                          <span class="progress-bar"></span>
                        </span>
                        <div class="progress-value">
                          <div>
                            80%<br>
                            <span>User Friendly</span>
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
    </div>
  </div>

  <div id="services" class="services section">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h6>Our Services</h6>
            <h4>What Our Agency <em>Provides</em></h4>
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
                        <span class="icon"><img src="assets/images/service-icon-01.png" alt=""></span>
                       Technology
                      </div>
                    </div>
                   <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/service-icon-02.png" alt=""></span>
                        Food &amp; Life
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/service-icon-03.png" alt=""></span>
                       Romance
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/service-icon-04.png" alt=""></span>
                      Gardening
                      </div>
                    </div>
                    <div class="last-thumb">
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/service-icon-01.png" alt=""></span>
                        Career
                      </div> 
                    </div>
                  </div>
                </div> 
                <div class="col-lg-12">
                  <ul class="nacc">
                    <li class="active">
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>About This Book</h4>
                                <p>Until now, the Internet has been about connecting humans, 
                                enabling us to share content and ideas, even if some of it is unpalatable, 
                                offensive or illegal. 
                                In the next five years, however, algorithms, software bots and 
                           smart devices are set to outstrip human internet activity.
                          </p>
                                
                               
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="images/IT9.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>About This Book</h4>
                                <p>Filled with the aroma of childhood memories, 
                                this guide helps modern cooks re-create hundreds of classic dishes for every meal of the day, from chicken and oyster gumbo to sweet potato pudding. The recipes start with appetizers, cheese, soups, relishes, and sauces, advancing to meats, fowl, fish, and all-in-one dishes. In addition to suggestions for vegetables, salads, and breads, the menu 
                                includes a mouthwatering selection of Creole dishes and delightful desserts.</p>
                                
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="images/C7.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>About This Book</h4>
                                <p>In this clever YA rom-com debut perfect for fans of Kasie West and Ashley Poston, a teen obsessed with nineteenth-century literature tries to cull advice on life and love from her favorite classic heroines to disastrous results—especially when she falls for the school’s resident Lothario.</p>
                                
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="images/R5.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>About This Book</h4>
                                <p>Learn how to buy, style, and present seasonal flower arrangements for every occasion.
                                Floret Farm's A Year in Flowers offers advice on every phase of working with cut flowers—including gardening, buying, caring for, and arranging fresh flowers.

Brimming with indispensable tips and hundreds of vibrant photographs, this book is an invitation to live a flower-filled life and perfect for anyone who loves flowers.
                                </p>
                                
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="images/H7.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>About This Book</h4>
                                <p>Have you tried, and failed, to sustain a successful connection with a partner? Clinical psychologists Peter Sheras and Phyllis Koch- Sheras have helped thousands of people rejuvenate their relationships to create a meaningful and deeply fulfilling love.

Their proven 4-step program is based on a dramatic shift in the way in which relationships are viewed—where the couple is seen as an entity in and of itself, 
greater than the sum of its individual parts.</p>
                                
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="images/C8.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>          
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  
  

  <div id="portfolio" class="our-portfolio section">
    <div class="container">
      <div class="row">
        <div class="col-lg-5">
          <div class="section-heading wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.3s">
<!--             <h6>Our Portofolio</h6> -->
            <h4>See Our <em>Best Selling Books</em></h4>
            <div class="line-dec"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid wow fadeIn" data-wow-duration="1s" data-wow-delay="0.7s">
      <div class="row">
        <div class="col-lg-12">
          <div class="loop owl-carousel">
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="images/R3.jpg" height=300px alt="">
                </div>
                <div class="down-content">
                  <h4>Racing The Sun</h4>
                  <span>Karina Halle</span>
                </div>
              </div>
              </a>  
            </div>
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="images/IT3.jpg" height=300px alt="">
                </div>
                <div class="down-content">
                  <h4>SQL</h4>
                  <span>Walter Shield</span>
                </div>
              </div>
              </a>  
            </div>
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="images/C3.jpg" height=300px alt="">
                </div>
                <div class="down-content">
                  <h4>Feeling Good</h4>
                  <span>David D. Burns</span>
                </div>
              </div>
              </a>  
            </div>
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="images/F3.jpg" height=300px alt="">
                </div>
                <div class="down-content">
                  <h4>Ramen CookBook</h4>
                  <span>Jiu Chung</span>
                </div>
              </div>
              </a>  
            </div>
            <div class="item">
              <a href="#">
                <div class="portfolio-item">
                <div class="thumb">
                  <img src="images/H2.jpg" height=300px alt="">
                </div>
                <div class="down-content">
                  <h4>Cut Flower Garden</h4>
                  <span>Erin Benzakein</span>
                </div>
              </div>
              </a>  
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
 
  <div id="contact" class="contact-us section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 offset-lg-3">
          <div class="section-heading wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s">
            <h6>Contact Us</h6>
            <h4>Get In Touch With Us <em>Now</em></h4>
            <div class="line-dec"></div>
          </div>
        </div>
        <div class="col-lg-12 wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.25s">
          <form id="contact" action="" method="post">
            <div class="row">
              <div class="col-lg-12">
                <div class="contact-dec">
                  <img src="assets/images/contact-dec.png" alt="">
                </div>
              </div>
              <div class="col-lg-5">
                <div id="map">
                  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3392.1204443620477!2d97.22220980247704!3d19.69549708759992!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30cf9bd9dc85195d%3A0x8b34fc6a026b5097!2sUniversity%20of%20Computer%20Studies%2CLoikaw(UCSL)!5e1!3m2!1sen!2smm!4v1694500743863!5m2!1sen!2smm" width="100%" height="636px" frameborder="0"
                   style="border:0" allowfullscreen></iframe>
                </div>
              </div>
              <div class="col-lg-7">
                <div class="fill-form">
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="info-post">
                        <div class="icon">
                          <img src="assets/images/phone-icon.png" alt="">
                          <a href="#">09-123456789</a>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="info-post">
                        <div class="icon">
                          <img src="assets/images/email-icon.png" alt="">
                          <a href="#">book@gmail.com</a>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="info-post">
                        <div class="icon">
                          <img src="assets/images/location-icon.png" alt="">
                          <a href="#">Loikaw, Kayah</a>
                        </div>
                      </div>
                    </div>
                    <div>
                    <h6>Open 7 Days a Week </h6> <br>
<h1>Opening Hours</h1> <br>
<h3>Monday - Saturday <em> 09:30 - 17:00  </em></h3>

<h3>Sunday & Bank Holidays <em> 10:30 - 17:00</em> </h3> <br>

We're closed on Christmas Day, Boxing Day & New Year's Day, sorry!  <br>

We may sometimes have to operate reduced opening hours at short notice due to severe weather or COVID-19.
 To avoid disappointment please call ahead before making a special journey.
</p>
</div>
                    
                   
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
         <!--  <p>Copyright © 2022 DigiMedia Co., Ltd. All Rights Reserved. 
          <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p> -->
        </div>
      </div>
    </div>
  </footer>


  <!-- Scripts -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/animation.js"></script>
  <script src="assets/js/imagesloaded.js"></script>
  <script src="assets/js/custom.js"></script>

</body>
</html>