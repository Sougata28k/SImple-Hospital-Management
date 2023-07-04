<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<center>
	<%
		Connection con = null;
		Statement st =null;
		ResultSet rs =null;
		try{
	  
	  	Class.forName("com.mysql.jdbc.Driver");
	 	con =DriverManager.getConnection("jdbc:mysql://localhost:3306/sougatadb","root"
			  ,"sougatak28");
	  	st= con.createStatement();
	
	  	String qury ="select * from hospitalmanagement";
	  	rs = st.executeQuery(qury);
	  	while(rs.next()){

	  		out.println("Name: "+rs.getString(1)+" Age: "+rs.getString(2)+ " Contact: "+rs.getString(3)+"<br>");
	  	}
	}
	  	catch(Exception e){
	  		out.println(e);
	  	}
	%>

</center>
</body>
</html>