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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
   
  </header><!-- End Header -->
  <!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero d-flex align-items-center">
    <div class="container">
      <div class="row gy-4 d-flex justify-content-between">
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
          <h2 data-aos="fade-up">Your solution to crime busting</h2>
          <p data-aos="fade-up" data-aos-delay="100">We record and manage data of criminals in a location and offer protection services.</p>

          <form action="landing_page.jsp"  method="post" class="form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200">
            <input type="text" name="query" class="form-control" placeholder="Search for criminal/policeofficer " >
            <button type="submit" class="btn btn-primary">Search</button>
                    </form>
          
        	   
        	   
 
        	   
     
      
     
          

      
        </div>

        <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
          <img src="assets/img/logo.jpg" class="img-fluid mb-3 mb-lg-0" alt="">
        </div>

      </div>
    </div>
  </section><!-- End Hero Section -->
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
  p {
  margin-top: 100px;
  margin-bottom: 100px;
  margin-right: 150px;
  margin-left: 80px;
}

h3{

margin-top: 100px;
  margin-bottom: 100px;
  margin-right: 150px;
  margin-left: 80px;
}
  
  </style>
  <main id="main">
 

<%
            Connection con;
           PreparedStatement pst,psd,psl;
           ResultSet rs,rt,rr;
           try{
        	   Class.forName("com.mysql.cj.jdbc.Driver");
       		con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
       	String Query = request.getParameter("query");
       	String Query1="select c.*,o.*,co.* from criminals c,officer o,complaint co  where c.criminal_name= '"+Query+"' or  o.name='"+Query+"' or co.name='"+Query+"'" ;
    	
        	   psd=con.prepareStatement(Query1);
        	 
        	   
        	   rs=psd.executeQuery();
        
        	   if(rs.next())
        	   {
        		  
        			%>
        			<h3>Results of Search Query</h3>
        			
        			
        			<p><strong>Criminal Records</strong>
        			<br>
        			
        			<br>

Criminals on record:-<%out.print(rs.getString("criminal_name"));%>
<br>
Crime Committed:-<%out.print(rs.getString("crime_committed"));%>
<br>
Verdict:-<%out.print(rs.getString("judicial_status"));%>
<br>
  Status:-<%out.print(rs.getString("status_aftercrime"));%>
  <br>
  </p>
  	
                
       <p><strong>Officers on Active Duty</strong>
       <br>
       Name:-<%out.print(rs.getString("name"));%>
              <br>
  email:-<%out.print(rs.getString("email"));%>
  <br>
phone:-<%out.print(rs.getString("phone"));%>
<br> 
Designation:-<%out.print(rs.getString("designation"));%>
<br>
Station Name:-<%out.print(rs.getString("station_name"));%></p>




 
 


  
        			
        			
        			
        		
        				
        		
        	
  
  <%
        	   }   }
           catch(Exception e)
           {
        	   e.printStackTrace();
        	   
           }
        	   
        		   %>
        			
<p> 
 We strongly believe this is the solution to your problem .
<br>

We Observe, compare, and analyze crime risk for all your locations.
<br>
Take a technologically advanced approach to mitigating risk with expert-level crime forecasting.

</p>  
<hr>
<div class="card" style="width:80%;margin-left:5%;">
<br>
    <h5 class="card-title" style="margin-left:5%;margin-top:3%">The Message from the New Commissioner</h5>
    <hr>
    
   
  <div class="card-body" >
   
    <iframe width="500" height="315"
src="https://www.youtube.com/embed/y1ax0NX59Xk">
</iframe> 
   
  </div>
  <div class="card-para" style="position:relative;width: 100%;
    height:10%;display:flex;justify-content:center;
    "> 
 
    <p>
     <a href="#" class="fa fa-instagram"></a>
      <a href="#" class="fa fa-google"></a> 
    <a href="#" class="fa fa-facebook"></a>
<a href="#" class="fa fa-twitter"></a>
    </p>
  
    
    </div>
  <button class="buttoncd""><a href="https://bengaluruurban.nic.in/en/department/police-department/" style="color:white;"><span>Visit Website</span></a></button>
  <br>
</div>
<style> 

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

margin-bottom:2%;
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

.fa {
  padding: 20px;
  font-size: 30px;
  width: 50px;
  text-align: center;
  text-decoration: none;
}

/* Add a hover effect if you want */
.fa:hover {
  opacity: 0.7;
}
.card-body 
{
 

   display: flex;
  justify-content: space-between;
  margin-left:30%;
  height: 315px;
  padding:0%;
  width: 500px;
  background: #f2f2f2;
  overflow: hidden;
  border-radius: 20px;
  cursor: pointer;
  box-shadow: 0 0 20px 8px #d0d0d0;

}
</style>
</main><!-- End #main -->
  <!-- ======= Footer ======= -->
  <br>
  <br>
  <footer id="footer" class="footer">


      

        <div class="footers_contact" style="text-align:center;">
          <h4>Contact Us</h4>
          <p>
            52,3rd Cross <br>
            Kumarswamy Layout<br>
            Bengaluru - 560078<br><br>
            <strong>Phone:</strong>+91 7238292029 <br>
            <strong>Email:</strong> partnersincrime@example.com<br>
          </p>

        </div>

      </div>
    </div>

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