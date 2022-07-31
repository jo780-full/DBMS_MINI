<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>View Reports Filed  Here</title>
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
        <li><a href="view_complaints.jsp">View Crime reports</a></li>
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
              <h2>View Reports</h2>
              <p>You can view reports and cases filed</p>
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
	String q="select * from complaint where name in ('"+Query+"') or email in ('"+Query+"') or phone in ('"+Query+"') or nameofemployee in ('"+Query+"') or reported in ('"+Query+"')";
	psd=con.prepareStatement(q); 	   
	   rs=psd.executeQuery();
	   while(rs.next())
	   {
		   %>
		  
		 <p><strong>Complaint Records</strong>
       <br>
        Name:-<a href="admin_complaintValidator.jsp?value=<%=rs.getString("comp_id")%>" style="color:black;"><%out.print(rs.getString("name"));%></a>
              <br>
  email:-<%out.print(rs.getString("email"));%>
  <br>
phone:-<%out.print(rs.getString("phone"));%>
<br> 
Message:-<%out.print(rs.getString("message"));%>
<br>
Date and Time:-<%out.print(rs.getString("locinc"));%></p>

		   
		   
		   
	   <% }
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    
    
    %>
    <p>Note:Response ID's to work on a Current Case</p>
  <table style="margin-left:auto;margin-right:auto;" >
 
,<thead style="align:center;">
    <tr style="border:2px solid;text-align:center;">
 
  <th>Name</th>
  <th>Email</th>
  <th>Phone</th>
  <th>Message</th>
  <th>Employed Under</th>
  <th>Date &amp; Time of Incident</th> 
  <th>Name of People</th>
  <th>reported</th>
  <th>comp_id</th>
  <th>crime_id</th>
  <th>response_id</th>
 

</tr>
</thead>
<tbody>
  
  </thead>
 
  <tr>
  
   <% 
  try{
	  
	   
	  
		Class.forName("com.mysql.cj.jdbc.Driver");
		//change name of db stored
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
		
		Statement statement=connection.createStatement();

	  String sql="select  * from complaint";
	  rs=statement.executeQuery(sql);
	  while(rs.next())
	  {
		  
  %>
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
  <td><a href="OfficerResponse.jsp?value=<%=rs.getString("comp_id")%>" style="color:black;"><%out.print(rs.getString("name"));%></a></td>
  <td><%out.print(rs.getString("email"));%></td>
<td><%out.print(rs.getString("phone"));%></td> 
<td><%out.print(rs.getString("message"));%></td> 
<td><%out.print(rs.getString("nameofemployee"));%></td>
<td><%out.print(rs.getString("locinc"));%></td>
<td><%out.print(rs.getString("nameppl"));%></td>
<td><%out.print(rs.getString("reported"));%></td>
<td><%out.print(rs.getString("comp_id"));%></td>
<td><%out.print(rs.getString("crime_id"));%></td>
<td><%out.print(rs.getString("response_id"));%></td>

  </tr>
  <% }
	  }
  catch(Exception e)
  {
	  e.printStackTrace();
  }
	  %>
</tbody>
  </table>

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
