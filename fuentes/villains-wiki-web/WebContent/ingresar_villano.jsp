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
<title>Add Villain</title>
</head>
<% 
String villainName = request.getParameter("txtVillainName");
String villainProfile = request.getParameter("txtVillainProfile");
String villainImage = request.getParameter("txtVillainImage");
String action = request.getParameter("hdAction");
String villain = "";

int insertedRows = 0;

if ("SAVE".equals(action)) {
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/villains", "villainApp", "imevil");
	PreparedStatement stmt = null;
	try {
		stmt = connection.prepareStatement("INSERT INTO villains(dsname, dsprofile, dsphoto) VALUES (?, ?, ?)");
		stmt.setString(1, villainName);
		stmt.setString(2, villainProfile);
		stmt.setString(3, villainImage);

		insertedRows = stmt.executeUpdate();
	} finally {
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
<h2>Ingresa tu villano favorito</h2>
	<form method="post" >
		<input type="hidden" name="hdAction" value="SAVE" />
		<p>
			<label for="txtVillainName">Nombre:</label><input type="text" name="txtVillainName" />
		</p>
		<p>
			<label for="txtVillainProfile">Información:</label><input type="text" name="txtVillainProfile" />
		</p>
		<p>
			<label for="txtVillainImage">Foto:</label><input type="text" name="txtVillainImage" />
		</p>
		<button type="submit">Ingresar</button>
	</form>
	<% if (insertedRows > 0) { %>
			<p>You have created <%= villainName %></p>
	<%  } %>
</body>
</html>