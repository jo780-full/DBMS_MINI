<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Connection con;
PreparedStatement psd;
ResultSet rs;
String Username=request.getParameter("username");
String Passwords=request.getParameter("pass");	
  try{
	   Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/criminal_db","root","");
	String q="select username,password from officer"; 
	psd=con.prepareStatement(q); 	   
    rs=psd.executeQuery();
while(rs.next())
{
	String Usernames=rs.getString("username");
	String Password=rs.getString("password");
	if(Usernames!=null)
	{
  if(Usernames.equals(Username) && Passwords.equals(Password))
  {
	  %>
	  <p>User Sign-In Validated</p>
	  <% 
  }
  else
  {
	  %>
	  <p>User Sign-In Invalid</p>
	  <% 
  }
}
}
  }
  catch(Exception e)
  {
	  e.printStackTrace();
  }

%>
</body>
</html>