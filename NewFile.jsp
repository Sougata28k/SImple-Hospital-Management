<%@ page import ="java.sql.*" %>

<title>Insert title here</title>

</head>
<body>
 <%
	  String Name = request.getParameter("name"); 
	  String Age= request.getParameter("age");
	  String Contact = request.getParameter("contact"); 
	  
	  Connection con = null;
	  Statement st =null;
	  try{
		  
		  Class.forName("com.mysql.jdbc.Driver");
		  con =DriverManager.getConnection("jdbc:mysql://localhost:3306/sougatadb","root"
				  ,"sougatak28");
		  st= con.createStatement();
		  String k="insert into hospitalmanagement (Name, Age, Contact) values (?,?,?)";
		  PreparedStatement ps = con.prepareStatement(k);
		  ps.setString(1, Name);
		  ps.setString(2, Age);
		  ps.setString(3, Contact);
		  int x = ps.executeUpdate();
		  if(x>0){
			out.println(  "Registration Successful. We will contact you shortly after");
		  }else{
			  out.println(  "Registration failed...");
		  }
		 
	  }catch(Exception e){
		  
		  out.println(e);
	  }
  %>
