     <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>View Criminal Here</title>
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
</header><!-- End Header -->
<!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="page-header d-flex align-items-center" style="background-image: url('assets/img/page-header.jpg');">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>Check for  all criminals here</h2>
              <p>Click on their names to get a detailed description</p>
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
    p{
     text-align: center;
line-height: 25px;
    
    }
   
    </style>
            </div>
          </div>
        </div>
      </div>
      <nav>
        
      </nav>
    </div><!-- End Breadcrumbs -->
    <br>
    
    <% 
  Connection con;
 PreparedStatement psd;
 ResultSet rs;
   
    try{
 	   Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
	String Query = request.getParameter("search");
	String q="select * from criminals where criminal_name in ('"+Query+"') or phone in ('"+Query+"')  or phone in ('"+Query+"') or arrested_by in ('"+Query+"')or crime_committed in ('"+Query+"') or age in ('"+Query+"') or weight in ('"+Query+"') or eyecolor in ('"+Query+"') or uidm in ('"+Query+"') or status_aftercrime in ('"+Query+"') or judicial_status in ('"+Query+"') or address in ('"+Query+"') ";
	psd=con.prepareStatement(q); 	   
	   rs=psd.executeQuery();
	 
	   while(rs.next())
	   {
		   %>
		  <hr>
		 <h4><strong>Criminal Records</strong></h4>
       <br>
       Name:-<%out.print(rs.getString("criminal_name"));%>
              <br>

phone:-<%out.print(rs.getString("phone"));%>
<br> 
crime committed:-<%out.print(rs.getString("crime_committed"));%>
<br>
Arrested By:-<%out.print(rs.getString("arrested_by"));%>
<br>
Age:-<%out.print(rs.getString("age"));%>
<br>
Weight:-<%out.print(rs.getString("weight"));%>
<br>
Eye color:-<%out.print(rs.getString("eyecolor"));%>
<br>

Unique Identification:-<%out.print(rs.getString("uidm"));%>
<br>
Judicial Status:-<%out.print(rs.getString("status_aftercrime"));%>
<br>
 Status After Crime:-<%out.print(rs.getString("judicial_status"));%>
<br>
Address:-<%out.print(rs.getString("address"));%>
<br>

<hr>
</p>

		   
		   
		   
	   <% 
	   }
	   
	 
	   
	   
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    
    
    %>
    
    
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
 
 
   <% 
  try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		//change name of db stored
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
		
		Statement statement=connection.createStatement();

	  String sql="select  * from criminals";
	rs=statement.executeQuery(sql);
	
	  while(rs.next())
	  {
		  
  %>
 <div class="container1">
 <hr>
 <hr>
<a href="criminalview.jsp?value=<%=rs.getString("cid")%>" style="color:white;"> Name: <%out.print(rs.getString("criminal_name"));%></a>
<br>
<br>
<p>Phone <%out.print(rs.getString("phone"));%><p>
<br>
<p>Arresting Officer <%out.print(rs.getString("arrested_by"));%></p> 
<br>
<p>Offences <%out.print(rs.getString("crime_committed"));%></p>
<br>
<p>Age <%out.print(rs.getString("age"));%></p> 
<br>
<p>BMI <%out.print(rs.getString("weight"));%></p> 
<br>
<p>Eye Color<%out.print(rs.getString("eyecolor"));%></p> 
<br>
<p>Body Marks <%out.print(rs.getString("uidm"));%></p> 
<br>
  <p>Status <%out.print(rs.getString("status_aftercrime"));%></p>
  <br>
<p>Trail <%out.print(rs.getString("judicial_status"));%></p>
<br>
<p>Last Known Location <%out.print(rs.getString("address"));%></p>


  </div>
  <% }
	 
   }
   
  catch(Exception e)
  {
	  e.printStackTrace();
  }
	  %>

</div>
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