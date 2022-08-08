<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
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
              <h2>Update Successful</h2>
              
            </div>
          </div>
        </div>
      </div>
      <nav>
        <div class="container">
          <ol>
            <li><a href="criminals.jsp">Back</a></li>
            
          </ol>
        </div>
      </nav>
    </div><!-- End Breadcrumbs -->
<body>
<main id="section">
  <%

  String values=""; 
File file ;
int sizeMax = 60000 * 10248;
int MemMaxSize = 60000 * 10248;
ServletContext context = pageContext.getServletContext();
String filePath = context.getInitParameter("fileLocation");
// Verify the content type
String contentType = request.getContentType();

if ((contentType.indexOf("multipart/form-data") >= 0)) {
   DiskFileItemFactory factory = new DiskFileItemFactory();
   // maximum size that will be stored in memory
   factory.setSizeThreshold(MemMaxSize);
   Connection con;
   PreparedStatement psd=null;
   Class.forName("com.mysql.cj.jdbc.Driver");

   con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
   ResultSet rs=null;
   // Location to save data that is larger than maxMemSize.
   factory.setRepository(new File("E:\\java"));
   // Create a new file upload handler
   ServletFileUpload upload = new ServletFileUpload(factory);

   // maximum file size to be uploaded.
   upload.setSizeMax( sizeMax );
   try { 
       // Parse the request to get file items.
       List fileItems = upload.parseRequest(request);
       
       // Process the uploaded file items
       Iterator i = fileItems.iterator(); 
       
       
       while ( i.hasNext () ) {
          FileItem fi = (FileItem)i.next();
          if(fi.isFormField())
          {
        	  String fieldName = fi.getFieldName();
              String fileName = fi.getName();
              String value=fi.getString();
        	  if(fieldName.equals("cid"))
              {
             	values=value; 
              }
        	  
          }
          if (!fi.isFormField () ) {
             // Get the uploaded file parameters
             
             String fieldName = fi.getFieldName();
             String fileName = fi.getName();
             String value=fi.getString();
         
             out.print(fieldName);
            
             
             
             
             boolean isInMemory = fi.isInMemory();
             long sizeInBytes = fi.getSize();
          
             // Write the file
             if( fileName.lastIndexOf("\\") >= 0 ) {
                file = new File( filePath + 
                fileName.substring( fileName.lastIndexOf("\\"))) ;
             } else {
                file = new File( filePath + 
                fileName.substring(fileName.lastIndexOf("\\")+1)) ;
             }
             fi.write( file ) ;
             
             
             
             psd=con.prepareStatement("update officer set image_loc='"+fileName+"' where pid='"+values+"'"); 
             int in=psd.executeUpdate();
             if(in!=0)
             {
             %>
             <img style="display:flex; justify-content:center;margin: 0 auto;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8TYyoNWLRnlGkVc3KN7Efzu3ASjR4eKlaPw&usqp=CAU" alt="no image"/>
             <script>alert("Image added successfully!!!")</script>
             <% 
             
             }
          }
       }
       out.println("</body>");
       out.println("</html>");
    } catch(Exception ex) {
       System.out.println(ex);
    }
 } else {
    out.println("<html>");
    out.println("<head>");
    out.println("<title>File upload</title>");  
    out.println("</head>");
    out.println("<body>");
    out.println("<p>No file uploaded</p>"); 
    out.println("</body>");
    out.println("</html>");
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
</body>
</html>