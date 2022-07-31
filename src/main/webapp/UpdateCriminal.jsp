<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Delete Criminal</title>
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
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="page-header d-flex align-items-center" style="background-image: url('assets/img/page-header.jpg');">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>Update Criminal Page</h2>
              
              
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
    	 	String q="select * from criminals where criminal_name in ('"+Query+"') or phone in ('"+Query+"') or cid in ('"+Query+"') or phone in ('"+Query+"') or arrested_by in ('"+Query+"')or crime_committed in ('"+Query+"') or age in ('"+Query+"') or weight in ('"+Query+"') or eyecolor in ('"+Query+"') or uidm in ('"+Query+"') or status_aftercrime in ('"+Query+"') or judicial_status in ('"+Query+"') or address in ('"+Query+"') or comp_id in ('"+Query+"') or pid in ('"+Query+"')";
    	 	psd=con.prepareStatement(q); 	   
    	 	   rs=psd.executeQuery();
    	 	   while(rs.next())
    	 	   {
    	 		   %>
    	 		  
    	 		 <p><strong>Criminal Records</strong>
    	        <br>
    	        Name:-<%out.print(rs.getString("criminal_name"));%>
    	               <br>
    	   Criminal id:-<%out.print(rs.getString("cid"));%>
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
    	 Status AfterCrime:-<%out.print(rs.getString("status_aftercrime"));%>
    	 <br>
    	 Judicial Status:-<%out.print(rs.getString("judicial_status"));%>
    	 <br>
    	 Address:-<%out.print(rs.getString("address"));%>
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
          
            <form action="UpdateCriminal.jsp" method="post">
             
              <div class="col-lg-12">
                <br>
                <h4>Criminal Details</h4>
              </div>
<br>


<div class="col-md-6">

              
              <div class="col-md-12 ">
                <input type="text" class="form-control" name="criminal_jail_id" placeholder="Criminal ID to Update " required>
              </div>
              <br>
              <div class="col-md-12">
                <input type="text" name="name" class="form-control" placeholder="Name" required>
                <br>
              </div>
              
               <div class="col-md-12">
                <input type="text" name="pid" class="form-control" placeholder="Police ID" required>
                <br>
              </div>
               <div class="col-md-12">
                <input type="text" name="comp_id" class="form-control" placeholder="Complaint ID" >
                <br>
              </div>
              <div class="col-md-12">
                <input type="text" class="form-control" name="phone" placeholder="Phone" required>
              </div>
              <br>
              <div class="col-md-12">
                <input type="text" class="form-control" name="arrested_by"  placeholder="arrested_by" required>
              </div>
              <br>
               <div class="col-md-12">
                <input type="text" class="form-control" name="crime_commited"  placeholder="crime committed" required>
              </div>
              <br>
              </div>
                <div class="col-md-6">
               
                
                  <div class="col-md-12">
                    <input type="text" name="age" class="form-control" placeholder="age" required>
                    <br>
                  </div>
                
                  <div class="col-md-12">
                    <input type="text" name="eyecolor" class="form-control" placeholder="eye color" required>
                    <br>
                  </div>
                   
                  <div class="col-md-12">
                    <input type="text" name="weight" class="form-control" placeholder="weight" required>
                    <br>
                  </div>
                    
                    <div class="col-md-12">
                <input type="text" name="add" class="form-control" placeholder="Address" required>
                <br>
              </div>
                  <div class="col-md-12">
                    <input type="text" name="uidm" class="form-control" placeholder="unique identification mark" required>
                    <br>
                  </div>
                  
                  
                  <div class="col-md-12">
                    <input type="text" name="status_aftercrime" class="form-control" placeholder="status_aftercrime" required>
                    <br>
                  </div>
                  
                  
                  <div class="col-md-12">
                    <input type="text" name="judicial_status" class="form-control" placeholder="judicial status" required>
                    <br>
                  </div>

                  
               
                  <button type="submit" class="buttoncd">Update Criminal</button>
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
              </div>
            </form>
          </div><!-- End  Complaint Form -->

        </div>

      </div>
      <%
      String name=request.getParameter("name");
      String criminal=request.getParameter("criminal_jail_id");
      String phone=request.getParameter("phone");
      String msg=request.getParameter("arrested_by");
      String noe=request.getParameter("crime_commited");
      String dloc=request.getParameter("age");
      String ppl=request.getParameter("eyecolor");
      String rep=request.getParameter("weight");
      String comp=request.getParameter("comp_id");
      String uidm=request.getParameter("uidm");
      String sa=request.getParameter("status_aftercrime");
      String js=request.getParameter("judicial_status"); 
      String add=request.getParameter("add");
      String pid=request.getParameter("pid");

      try{
      
       
      	String q="update criminals set criminal_name=? ,arrested_by=?,crime_committed=?,age=?,weight=?,eyecolor=?,uidm=?,status_aftercrime=?,judicial_status=?,address=?,comp_id=?,pid=?,phone=? where cid="+criminal;
    	psd=con.prepareStatement(q);
    if(dloc!=null && phone!=null && msg!=null && msg!=null && noe!=null && name!=null && ppl!=null && rep!=null && uidm!=null && sa!=null && js!=null && add!=null)
    {
    	 psd.setString(1,name);
    		psd.setString(2,msg);
    		psd.setString(3,noe);
    		psd.setString(4, dloc);
    		psd.setString(5,rep);
    		psd.setString(6,ppl);
    		psd.setString(7,uidm);
    		psd.setString(8,sa);
    		psd.setString(9,js);
    		psd.setString(10,add);
    		psd.setString(11,comp);
    		psd.setString(12,pid);
    		psd.setString(13,phone);
    		
    		
    		int x=psd.executeUpdate();
    		if(x>0) out.println("<p style=' margin-top: 100px;margin-bottom: 100px;margin-right: 150px;margin-left: 80px;'><script>alert('Criminal Data Added Successfully')</script></p>");
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
