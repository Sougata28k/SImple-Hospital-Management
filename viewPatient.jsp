<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Display Data</title>
<style>
#patientDetailes {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#patientDetailes td, #patientDetailes th {
  border: 1px solid #ddd;
  padding: 8px;
}
#patientDetailes tr:nth-child(even){background-color: #f2f2f2;}

#patientDetailes tr:hover {background-color: #ddd;}
#patientDetailes th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
</head>

<body>
<center>
	<table id="patientDetailes">
		<tr>
			<th>Name</th>
			<th>Age</th>
			<th>Contact</th>
		</tr>
		<%
			Connection con = null;
			Statement st = null;
			ResultSet rs = null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sougatadb", "root", "sougatak28");
				st = con.createStatement();
				
				String query = "SELECT * FROM hospitalmanagement";
				rs = st.executeQuery(query);
				
				while (rs.next()) {
					%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
					</tr>
					<%
				}
			} catch (Exception e) {
				out.println(e);
			} finally {
				try {
					if (rs != null) rs.close();
					if (st != null) st.close();
					if (con != null) con.close();
				} catch (SQLException e) {
					out.println(e);
				}
			}
		%>
	</table>
</center>
</body>
</html>
