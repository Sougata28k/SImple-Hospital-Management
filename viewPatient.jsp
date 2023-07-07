<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expires" content="0">
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
.delete-button {
  background-color: #f44336; /* Red */
  color: white;
  border: none;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 4px;
  cursor: pointer;
}
.delete-button:hover {
  background-color: #df362c; /* Darker red on hover */
}
In this example, I've used a red background color for the button with white text. The padding property adds some space around the text inside the button. The border property is set to none to remove the button's default border. The border-radius property gives the button rounded corners. The cursor property is set to pointer to indicate that the button is clickable.

When you hover over the button, it will become slightly darker to provide visual feedback to the user.

Feel free to adjust the colors, padding, font size, and other properties to suit your preferences or match your website's design.







</style>
</head>

<body>
<center>
    <table id="patientDetails">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Contact</th>
            <th>Delete Data</th>
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
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("age") %></td>
                        <td><%= rs.getString("contact") %></td>
                        <td><button onclick="deleteRow(this)" class="delete-button">Delete</button></td>
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


<script>
    function deleteRow(button) {
        var row = button.parentNode.parentNode;
        var id = row.cells[0].innerHTML;

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                row.parentNode.removeChild(row);
            }
        };

        xhr.open("POST", "delete.jsp?id=" + id, true);
        xhr.send();
    }
</script>


</body>
</html>
