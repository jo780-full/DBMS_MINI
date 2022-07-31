<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Delete Admin</title>
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
            <li><a href="offlog.html">Officer</a></li>
            <li><a href="CrimeCategory.jsp">Crime Type</a></li>
            </ul>
        <li><a href="report.jsp">Complaint</a></li>
     
    </nav><!-- .navbar -->

  </div>
</header><!-- End Header -->
<!-- End Header -->

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
  
.buttonholder{
display: flex;
justify-content: center;
}
.buttoncd{
background-color:var(--color-secondary);
color:white;
margin-top:10px;
margin-right:30px;
margin-left:25px;
border-radius:20px;
padding: 33px 20px;
box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}
.buttoncd span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.buttoncd span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.buttoncd:hover span {
  padding-right: 25px;
}

.buttoncd:hover span:after {
  opacity: 1;
  right: 0;
}



  
  </style>
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="page-header d-flex align-items-center" style="background-image: url('assets/img/page-header.jpg');">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>Delete Admin Page</h2>
              <p>We thank you for your service....</p>
              
              <form id="formb">
    <input id="search" type="text" name="search" placeholder="Search Query here....">
    
    </form>
   
    <style>
    #search{
  height:50px;
         border: none;
    background-color: transparent;
    resize: none;
    outline: none;
    
    
    }
    #formb{
    background-color:white;
    border-radius:20px;
    width:400px;
    display:flex;
    justify-contents:centre;
    margin-left:auto;
    margin-right:auto;
    }
    
    #searchb{
    background-color:white;
     border: none;
    background-color: transparent;
    resize: none;
    outline: none;
    }
    
    P{
    text-align: center;
line-height: 25px;
    
    }
   
    </style>
            </div>
            </div>
            </div>
            </div>
            </div>
             <%
 Connection con;
 PreparedStatement psd;
 ResultSet rs;
 Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
    try{
 	  
    	String Query = request.getParameter("search");
    
    	String q="select * from admin where name in ('"+Query+"') or email in ('"+Query+"') or phone in ('"+Query+"') or username in ('"+Query+"') or adminID in ('"+Query+"')";
    	psd=con.prepareStatement(q); 	   
    	   rs=psd.executeQuery();
	   while(rs.next())
	   {
		   %>
		  
		 <p><strong>Admin Records</strong>
       <br>
       Name:-<%out.print(rs.getString("name"));%>
              <br>
  email:-<%out.print(rs.getString("email"));%>
  <br>
phone:-<%out.print(rs.getString("phone"));%>
<br> 
Username:-<%out.print(rs.getString("username"));%>
<br>
Username:-<%out.print(rs.getString("adminID"));%>
<br>


</p>

		   
		   
		   
	   <% }
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    
    
    %>
            <form data-aos="fade-up" style="margin-left:auto;margin-right:auto;">
            <br>
            <h3>Enter the Admin Id to be Removed:</h3>
            <br>
            <input style="width:400px;height:65px;border-radius:10px" type="text" name="pids" placeholder="Enter the Admin id here">
            <br>
            <input type="submit" value="Submit" class="buttoncd">
            </form>   
  
<%
try{
	PreparedStatement pst;
String Query = request.getParameter("pids");
String q="delete  from admin where adminID="+Query+"";
pst=con.prepareStatement(q);
int i=pst.executeUpdate(q);
if(i>0)  
{
	   %>
	    <p><script>alert("data altered!!")</script></p>
	
	   <%
}
	   else if(i<0)
	   {
		   %>
		  <p><script>alert("data  was not altered!!")</script></p>
		   <%
	   }
}
catch(Exception e)
    {
	e.printStackTrace();
    }

%>
  </main><!-- End #main -->
<br>
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
