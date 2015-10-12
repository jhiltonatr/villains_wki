<%@page import="java.sql.SQLException"%>
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
	PreparedStatement stmt = null;
	ResultSet rs = null;
	try {
		stmt = connection.prepareStatement("SELECT * FROM villains WHERE dsname = ?");
		stmt.setString(1, villainToSearch);
		rs = stmt.executeQuery();
		if (rs.next()) {
			villain = rs.getString("dsprofile");
		}
	} finally {
		if (rs != null) {
			rs.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		if (connection != null) {
			connection.close();
		}
	}
}
%>
<body>
<h2>Find your favorite villain</h2>
	<form method="get" >
		<p>
			<label for="txtVillainName">Name:</label><input type="text" name="txtVillainName" />
		</p>
		<button type="submit">Find</button>
	</form>
	<% 
	if (villainToSearch != null && !villainToSearch.trim().isEmpty()) {
		if (!villain.isEmpty()) { %>
			<p> We have found <%= villainToSearch %>, <%= villain %></p>
	<%  } else { %>
			<p>We know nothing about <%= villainToSearch %></p>		
	<%	}
	}
	%>
</body>
</html>