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
Class.forName("com.mysql.cj.jdbc.Driver");
//change name of db stored
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/criminal","root","password");
String q=request.getParameter("value");


PreparedStatement psd=con.prepareStatement("delete from complaint where comp_id like ('"+q+"')");
int x=psd.executeUpdate();
if(x>0)
{
	%>
	<script>alert("Deleted Complaint")</script>
	<jsp:forward page="view_complaints.jsp"/>
	<% 
}
   
%>
</body>
</html>