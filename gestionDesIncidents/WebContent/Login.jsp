<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String login=request.getParameter("login");
session.putValue("login", login);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from identification where login='"+login+"'");
if (!rs.isBeforeFirst() ) {    
    out.println("Invalid login"); 
}
else{
	

	
while(rs.next()){
	if(rs.getString(2).equals(password))
	{	if(rs.getString(3).equals("employe"))
	{

	    String redirectURL = "http://localhost:8080/gestionDesIncidents/Agent.jsp?login="+login;
	    response.sendRedirect(redirectURL);
	}
		else if(rs.getString(3).equals("responsable")){
			String redirectURL = "http://localhost:8080/gestionDesIncidents/responsable.jsp?login="+login;
		    response.sendRedirect(redirectURL);	}
		else if(rs.getString(3).equals("technicien")){
	
			String redirectURL = "http://localhost:8080/gestionDesIncidents/Technicien.jsp?login="+login;
		    response.sendRedirect(redirectURL);	

	}
	  
}
	 else{
			out.println("Invalid password ");
			
		}
 }
}


%>
</body>
</html>