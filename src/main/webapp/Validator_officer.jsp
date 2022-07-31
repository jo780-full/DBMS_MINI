<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.regex.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Forgot Password</title>
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
  
<style>
  th{
  border:1px solid black;
  padding:10dp;
  text-align:centre;
  
  }
  td{
  border:1px solid black;
  padding:10dp;
  text-align:centre;
  
  }
  
  
  </style>

  
</header><!-- End Header -->
<main id="main">
 <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="page-header d-flex align-items-center" style="background-image: url('assets/img/page-header.jpg');">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>GO back to Login Page to Test</h2>
              
            </div>
          </div>
        </div>
      </div>
      <nav>
        <div class="container">
          <ol>
            <li><a href="offloging.jsp">Back</a></li>
            
          </ol>
        </div>
      </nav>
    </div><!-- End Breadcrumbs -->

 <% String regex = "^(?=.*[0-9])"
        + "(?=.*[a-z])(?=.*[A-Z])"
        + "(?=.*[@#$%^&+=])"
        + "(?=\\S+$).{8,20}$";
        
Pattern p = Pattern.compile(regex);   
Connection con;
PreparedStatement psd;
ResultSet rs=null;
  
   try{
	   Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
String password=request.getParameter("newp");

String confirm=request.getParameter("confirm");

String adminid=request.getParameter("adminid");
if(password.equals(confirm))
{
if(p.matcher(password)!=null)
	{
	String add_pass="update officer set password ='"+password+"'where pid = '"+adminid+"'";
	psd=con.prepareStatement(add_pass);
	psd.executeUpdate();
	%>
	<script>alert("Successfully Updated")</script>
	<img style="display:flex; justify-content:center;margin: 0 auto;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8TYyoNWLRnlGkVc3KN7Efzu3ASjR4eKlaPw&usqp=CAU" alt="no image"/>
	<% 
	}
	else
	{
		%>
		
		<script>alert("invalid password type")</script>
		<img style="display:flex; justify-content:center;margin: 0 auto;" src="data:image/png;base64,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" alt="">
		<% 
		
	}
}
	else
	{
		%>
		<script>alert("Password not done!!")</script>
		<img style="display:flex; justify-content:center;margin: 0 auto;" src="data:image/png;base64,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" alt="">
		<% 
	
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}





 %>
</main><!-- End #main -->
<!-- End Header -->
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
 

</html>