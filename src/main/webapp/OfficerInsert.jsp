<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
              <h2>Insert Officer Image Page</h2>
              <p>Add Recent Image of Officer....</p>
              
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
    	 	String q="select * from officer where name in ('"+Query+"') or email in ('"+Query+"') or phone in ('"+Query+"') or designation in ('"+Query+"') or date_of_joining in ('"+Query+"')or academy in ('"+Query+"') or station_name in ('"+Query+"') or station_id in ('"+Query+"') or pid in ('"+Query+"')";
    		psd=con.prepareStatement(q); 	   
    		   rs=psd.executeQuery();
    		   while(rs.next())
    		   {
    			   %>
    			  
    			 <p><strong>Officers Records</strong>
    	       <br>
    	       Name:-<%out.print(rs.getString("name"));%>
    	              <br>
    	  email:-<%out.print(rs.getString("email"));%>
    	  <br>
    	phone:-<%out.print(rs.getString("phone"));%>
    	<br> 
    	designation:-<%out.print(rs.getString("designation"));%>
    	<br>
    	Date and Time:-<%out.print(rs.getString("date_of_joining"));%>
    	<br>
    	Academy:-<%out.print(rs.getString("academy"));%>
    	<br>
    	Station Name:-<%out.print(rs.getString("station_name"));%>
    	<br>
    	Station ID:-<%out.print(rs.getString("station_ID"));%>
    	<br>
    	PID:-<%out.print(rs.getString("pid"));%>

    	</p>

    			   
    			   
    			   
    		   <% }
    	    }
    	    catch(Exception e)
    	    {
    	    	e.printStackTrace();
    	    }
    	    
    	    
    	    
    	    %>
    	          

    <style>


}

.buttonholder{
display: flex;
justify-content: center;
}
.buttoncd{
background-color:var(--color-secondary);
color:white;
width:200px;
margin-top:10px;
margin-right:30px;
margin-left:-10px;
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
            <hr>
            <form action="fileupload.jsp" method="post" enctype="multipart/form-data" style="display:flex;justify-content:center;flex-direction:column;margin: auto; width:20%">
   
      
        <h6>Select an Image To Upload</h6>
        <hr>
    
      <br>
      <input  type="text" name="cid" placeholder="Enter The Officer ID to Insert Images" style="width:50%;">
      <br>
   
        <input type="file" name="file">
      <br>
      
      <br>
      
      
       <input type="submit" class="buttoncd" >
     <br>
      </form>
      </main>
      </body>
      </html>