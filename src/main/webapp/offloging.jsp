<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Partners In crime</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/logo.jpg" rel="icon">
  

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

  </head>
  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="header d-flex align-items-center fixed-top">
      
         <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

    <a href="index.html" class="logo d-flex align-items-center">
      <!-- Uncomment the line below if you also wish to use an image logo -->
      <img src="assets/img/logo.jpg" alt=""> 
      <h1>Partners In Crime </h1>
    </a>

    <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
    <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
    <nav id="navbar" class="navbar">
      <ul>
        <li><a href="landing_page.jsp" class="active">Home</a></li>
        <li><a href="view_criminal.jsp">View Criminals</a></li>
        <li><a href="viewofficer.jsp">View Police officers</a></li>
        <li><a href="category.jsp">View Crime reports</a></li>
        <li class="dropdown"><a href="#"><span>Login</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
          <ul>
            <li><a href="admin.html">Admin</a></li>
            <li><a href="offloging.jsp">Officer</a></li>
            <li><a href="CrimeCategory.jsp">Crime Type</a></li>
            </ul>
        <li><a href="report.jsp">Complaint</a></li>
     
    </nav><!-- .navbar -->

  </div>
  </header>
  <section id="hero" class="hero d-flex align-items-center">
   
    <div class="container">
      <div class="row gy-4 d-flex justify-content-between"> 
        <h2 data-aos="fade-up">Officer Login</h2>
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
        <!-----form section -->
          <form action="offloging.jsp"   class="form1" data-aos="fade-up" data-aos-delay="200">
            <label for="text" style="color:black">Username:</label>
            <input type="text" name="username"  id="" placeholder="Username " required style="width:600px; height:60px">
          </label>
            <br>
            <br>
            <label for="password" style="color:black">Password:
              <br>
            <input type="password"   name="pass" required id="password" placeholder="Password" style="width:600px; height:60px">
          </label>
            <br>
            <br>
          <input type="submit"class="btn-primary" value="Login" style="color:white;border-radius: 8px;"  >
           
          </form>
          <a href="ResetOfficer.jsp"><button  value="Forgot Password" style="width:633px;color:white;background-color:black;border-radius: 8px;">Reset</button></a>
            
      <!---end form-->
        </div>

        <%

Connection con;
PreparedStatement psd;
Class.forName("com.mysql.cj.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
ResultSet rs;
String Username=request.getParameter("username");
String Passwords=request.getParameter("pass");	
  try{
	 boolean entrance=false;
	String q="select username,password from officer"; 
	psd=con.prepareStatement(q); 	   
    rs=psd.executeQuery();
while(rs.next())
{
	String Usernames=rs.getString("username");
	String Password=rs.getString("password");
	if(Usernames!=null)
	{
  if(Usernames.equals(Username) && Passwords.equals(Password))
  {
	  entrance=true;
	  %>
	  <script>alert("User Sign-In Validated")</script>
	   <jsp:forward page="criminals.jsp"/>
	  <% 
  }
  else
  {
	  entrance=false;
	  %>
	 

	  <% 
  }
}
}
  }
  catch(Exception e)
  {
	  e.printStackTrace();
  }

%>
        
        
       

      </div>
    </div>
  </section>
 
<footer id="footer" class="footer">


      

  

<div class="container mt-4">
<div class="copyright">
  &copy; Copyright <strong><span>Partners in crime</span></strong>. All Rights Reserved
</div>
<div class="credits">
 
</div>
</div>

</footer><!-- End Footer -->
<!-- End Footer -->

<a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<div id="preloader"></div>

<!-- Vendor JS Files -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>
  </body>
    