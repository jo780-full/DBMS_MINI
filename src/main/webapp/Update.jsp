<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Admin Update Section</title>
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
              <h2>Update Admin</h2>
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
        <div class="container">
          <ol>
            <li><a href="landing_page.jsp">Home</a></li>
            <li><a href="admins.jsp">Admin</a></li>
          </ol>
        </div>
      </nav>
    </div><!-- End Breadcrumbs -->
    <br>
        <%
 Connection con;
 PreparedStatement psd;
 ResultSet rs;
 Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
    try{
 	  
	String Query = request.getParameter("search");
	if(Query!=null)
	{
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
username:-<%out.print(rs.getString("username"));%>
<br>
AdminID:-<%out.print(rs.getString("adminID"));%>
<br> 

</p>

		   
		   
		   
	   <% }
	}
	else
	{
		out.print("<script>alert('enter a query')</script>");
	}
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    
    
    %>
   <!-- ======= Get a Quote Section ======= -->
    <section id="get-a-quote" class="get-a-quote">
      <div class="container" data-aos="fade-up">

       
    

          <div class="col-lg-7">
          
          
          
            <form action="Update.jsp" method="post">
              <h3>Admin form</h3>
             
                <br>
                <h4>Update Your Personal Details</h4>
              </div>
<br>
<div class="col-md-12">
                <input type="text" name="aid" class="form-control" placeholder="Enter Admin Id" required>
                <br>
              </div>
              
              <div class="col-md-12">
                <input type="text" name="name1" class="form-control" placeholder="Name" required>
                <br>
              </div>

              <div class="col-md-12 ">
                <input type="text" class="form-control" name="email1" placeholder="Email" required>
              </div>
              <br>
              <div class="col-md-12">
                <input type="text" class="form-control" name="phone1" placeholder="Phone" required>
              </div>
              <br>
              <div class="col-md-12">
                <input type="text" class="form-control" name="username1" placeholder="Username" required>
              </div>
              <br>
               <div class="col-md-12">
                <input type="text" class="form-control" name="password1" placeholder="Password" required>
              </div>
              <br>
               <div class="col-md-12">
                <input type="text" class="form-control" name="repassword1" placeholder="Re Type Password" required>
              </div>
              <br>
                            </div>
                 <br>
      
             <button type="submit" name="Add Admin"  class="buttoncd"/><span>Update Admin</span></button>
            
              <br>           
                           
            </form>
          </div><!-- End  Complaint Form -->

        </div>

      </div>
    </section><!-- End Get a Quote Section -->
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
margin-left:120px;
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
<%


String aid=request.getParameter("aid");
String names=request.getParameter("name1");
String emails=request.getParameter("email1");
String phone=request.getParameter("phone1");
String username=request.getParameter("username1");
String password=request.getParameter("password1");	
try{
	   Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
	String q="update admin set name=? , email=? ,phone=? ,username=?,password=? where adminID="+aid;
	psd=con.prepareStatement(q);
if(names!=null && emails!=null && phone!=null && username!=null && password!=null)
{
psd.setString(1,names);
	psd.setString(2,emails);
	psd.setString(3,phone);
	psd.setString(4,username);
	psd.setString(5,password);
	
	int x=psd.executeUpdate();
	if(x>0)out.println("<p style=' margin-top: 100px;margin-bottom: 100px;margin-right: 150px;margin-left: 80px;'><strong>Admin Updated Successfully</strong></p>");
	else
	out.println("Server error");

}
}
catch(Exception e)
{
	  e.printStackTrace();
}
%>


  </main><!-- End #main -->

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
      </body>
    