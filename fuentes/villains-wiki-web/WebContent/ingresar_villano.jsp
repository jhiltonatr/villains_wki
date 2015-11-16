<%@page import="co.com.jhilton.wiki.villains.data.ResourceManager"%>
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

int insertedRows = 0;

if ("SAVE".equals(action)) {
	ResourceManager connectionManager = new ResourceManager(); 
	Connection connection = connectionManager.getConnection();
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
		connectionManager.closeConnection(connection);
	}
}
%>
<body>
<h2>Create your favorite villain</h2>
	<form method="post" >
		<input type="hidden" name="hdAction" value="SAVE" />
		<p>
			<label for="txtVillainName">Name:</label><input type="text" name="txtVillainName" />
		</p>
		<p>
			<label for="txtVillainProfile">Profile:</label><input type="text" name="txtVillainProfile" />
		</p>
		<p>
			<label for="txtVillainImage">Photo:</label><input type="text" name="txtVillainImage" />
		</p>
		<button type="submit">Create</button>
	</form>
	<% if (insertedRows > 0) { %>
			<p>You have created <%= villainName %></p>
	<%  } %>
</body>
</html>