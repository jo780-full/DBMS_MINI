<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
  <!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>View Officers  Here</title>
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
              <h2>Manage Criminals</h2>
             <%
             String q=request.getParameter("username");
             Class.forName("com.mysql.cj.jdbc.Driver");
         	//change name of db stored
         	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
         	try
         	{
         	PreparedStatement psd1=con.prepareStatement("select * from officer where username='"+q+"'");
             ResultSet rs=psd1.executeQuery();
            if(rs.next())
            {
            	%>
            	<p>Welcome Officer <%out.print(rs.getString("name")); %> with Id Number <%out.print(rs.getString("pid")); %></p>
            	<% 
            }
         	}
         	catch(Exception e)
         	{
         		e.printStackTrace();
         	}
            
             %>
            </div>
          </div>
        </div>
      </div>
      <nav>
        <div class="container">
          <ol>
            <li><a href="landing_page.jsp">Home</a></li>
        
            <li><a href="criminals.jsp">Criminals</a></li>
          </ol>
        </div>
      </nav>
    </div><!-- End Breadcrumbs -->
    <br>
  
 <main>
    
    <% 	String name=request.getParameter("name");
String email=request.getParameter("criminal_jail_id");
String phone=request.getParameter("phone");
String msg=request.getParameter("arrested_by");
String noe=request.getParameter("crime_commited");
String dloc=request.getParameter("age");
String comp_id=request.getParameter("comp_id");
String ppl=request.getParameter("eyecolor");
String rep=request.getParameter("weight");
String crime_id=request.getParameter("crime_id");
String uidm=request.getParameter("uidm");
String sa=request.getParameter("status_aftercrime");
String js=request.getParameter("judicial_status"); 
String add=request.getParameter("add");
String pid=request.getParameter("pid");

try{
	
	PreparedStatement psd=con.prepareStatement("insert into criminals(criminal_name,cid,phone,arrested_by,crime_committed,age,weight,eyecolor,uidm,status_aftercrime,judicial_status,address,pid,crime_id,comp_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    psd.setString(1,name);
	psd.setString(2,email);
	psd.setString(3,phone);
	psd.setString(4, msg);
	psd.setString(5,noe);
	psd.setString(6,dloc);
	psd.setString(7,rep);
	psd.setString(8,ppl);
	psd.setString(9,uidm);
	psd.setString(10,sa);
	psd.setString(11,js);
	psd.setString(12,add);
	psd.setString(13,pid);
	psd.setString(14,crime_id);
	psd.setString(15,comp_id);
	
	int x=psd.executeUpdate();
	if(x>0) out.println("<p style=' margin-top: 100px;margin-bottom: 100px;margin-right: 150px;margin-left: 80px;'><strong>Criminal Added Successfully</strong></p>");
	else
	out.println("Server error");
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
<div  class="buttonholder" data-aos="flip-left">
<div style=" position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;">
<a  style="width:200px;height:300px"href="criminal_form.html"><button   name="Add Criminals"  class="buttoncd" /><span>Add Criminals</span></button></a>
</div>
<div style=" position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;">
<a href="DeleteCriminal.jsp"><button  name="delete Criminals" class="buttoncd"/><span>Delete Criminal Logs</span></button></a> 
</div>
<div style=" position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;">
<a href="UpdateCriminal.jsp"><button name="update Criminals"  class="buttoncd"/><span>Update Criminals Database</span></button></a>
</div>

<div style=" position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;">
<a href="crimeimage.jsp"><button  name="delete Criminals" class="buttoncd"/><span>Insert Criminals  Images into Database</span></button></a> 
</div>
</div>
   
  </main><!-- End #main -->
<br>
<style>


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
     
   
    
    
    
    
    
