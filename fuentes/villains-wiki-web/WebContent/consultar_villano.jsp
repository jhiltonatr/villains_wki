<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Villain search</title>
</head>
<% 
String villainToSearch = request.getParameter("txtVillainName");
String villain = "";

if (villainToSearch != null && !villainToSearch.isEmpty()) {
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/villains", "villainApp", "imevil");
	PreparedStatement stmt = connection.prepareStatement("SELECT * FROM villains WHERE dsname = '" + villainToSearch + "'");
	ResultSet rs = stmt.executeQuery();
	if (rs.next()) {
		villain = rs.getString("dsprofile");
	}
}
%>
<body>
<h2>Consulta tu villano favorito</h2>
	<form method="get" >
		<p>
			<label for="txtVillainName">Nombre:</label><input type="text" name="txtVillainName" />
		</p>
		<button type="submit">Consultar</button>
	</form>
	<% if (!villain.isEmpty()) { %>
		<p> We have found <%= villainToSearch %>, <%= villain %></p>
	<% } else {
		out.print("<p>We know nothing about " + villainToSearch + "</p>");
	}
	%>
</body>
</html>