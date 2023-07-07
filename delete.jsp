<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
    String id = request.getParameter("id");

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sougatadb", "root", "sougatak28");

        String query = "DELETE FROM hospitalmanagement WHERE id = ?";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, id);
        pstmt.executeUpdate();
    } catch (Exception e) {
        out.println(e);
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println(e);
        }
    }
%>

