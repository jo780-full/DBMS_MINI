<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title> View Complaint Categories</title>
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

    <a href="landing_page.jsp" class="logo d-flex align-items-center">
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
</header><!-- End Header -->
<!-- End Header -->


  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="page-header d-flex align-items-center" style="background-image: url('assets/img/page-header.jpg');">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>View  complaints</h2>
              <p>This page shows registered Complaints</p>
            </div>
          </div>
        </div>
      </div>
      <nav>
        <div class="container">
          <ol>
            <li><a href="Officer_ComplaintView.jsp">Back</a></li>
            
          </ol>
        </div>
      </nav>
    </div><!-- End Breadcrumbs -->
    <br>
    <style> 
    
      
    
    .container1{
    
  width:30%;
  height:auto;
  background-color:white;

margin:0 auto;
  display:flex;
  justify-content: space-around;
  flex-wrap: wrap;
  align-items: center;
  background-color:black;
  color:white;
  flex-direction: column;
  padding:10px;
  box-shadow: 0px 5px 10px 0px #aaa;
  transition-duration: .25s;
  margin-top:3%;
  border-radius:3%;
    }
    
    .Total_content{
     max-width: 2000px;
  max-height:auto;
  margin: 0 auto;
  display:flex;
margin-bottom:10px;
  justify-content: space-around;
  flex-wrap: wrap;
    
    }
    
    
    </style>
<div class="Total_content">
  <% try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		//change name of db stored
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
		String q=request.getParameter("value");
		
		
		PreparedStatement psd=con.prepareStatement("select * from complaint where comp_id in ('"+q+"')");
		
		ResultSet rs=psd.executeQuery();
		
		   while(rs.next())
		   {
			   %>
			   <div class="container1">
			     
		<br>
		<hr>
			   <p><strong>Name of person who Complained:</strong> <%out.print(rs.getString("name"));%></p>
			   <hr>
			   <p><strong>Email:</strong> <%out.print(rs.getString("email"));%></p>
			   <hr>
			   <p><strong>Phone:</strong> <%out.print(rs.getString("phone"));%></p>
			   <hr>
			    <p><strong>Message:</strong> <%out.print(rs.getString("message"));%></p>
			   <hr>
			    <p><strong>Name of Employeer:</strong> <%out.print(rs.getString("nameofemployee"));%></p>
			   <hr>
			   <p><strong>Date of  Report:</strong> <%out.print(rs.getString("locinc"));%></p>
			   <hr>
			   <p><strong>Fir Filed Against:</strong> <%out.print(rs.getString("nameppl"));%></p>
			   <hr>
			   <p><strong>Reported:</strong> <%out.print(rs.getString("reported"));%></p>
			   <hr>
			   <p><strong>Complaint ID Number:</strong> <%out.print(rs.getString("comp_id"));%></p>
			   <hr>
			   <p><strong>Crime Category:</strong> <%out.print(rs.getString("crime_id"));%></p>
			   <hr>
			    <p><strong>Response Officer Id:</strong> <%out.print(rs.getString("response_id"));%></p>
			   <hr>
			   <% if(rs.getString("response_id")==null)
			   {
			   %>
			   <p>FILL FIR TO ACCEPT CASE</p>
			   <form method="post"> 
			   <input style="width:100%;"type="text" name="pids" placeholder="Enter Officer ID to Accept">
			  <br>
			  <br>
			   <input type="submit" style="background-color:white;width:100%;text-align:centre;" value="Confirm">
			    <hr style="color:white;    height: 10px;">
	
			   
			   </form>
			  
			   <%
			   try{
			   String getsd=request.getParameter("pids");
			   psd=con.prepareStatement("update complaint set response_id='"+getsd+"' where comp_id like ('"+q+"')");
			   psd.executeUpdate();
			   %>
			    <script>alert("Successfully Added")</script>
			   <% 
			   }
			   catch(Exception e){
				   e.printStackTrace();
			   }
			   }
			   
			   
			   %>
			  
			     </div>
  
		
			   <%
  }
  }
  catch(Exception e)
  {
  	e.printStackTrace();
  }

		%>
		
</div>
  </main><!-- End #main -->
<br>
  <!-- ======= Footer ======= -->

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
  
