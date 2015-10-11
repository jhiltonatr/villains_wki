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
//Como no tenmos una base de datos para almacenar la información, simularemos la base de datos con un Map
Map<String, String> myVillainsData = new HashMap<String, String>();
myVillainsData.put("Loki", "Thor's villain");
myVillainsData.put("Dr Doom", "villain from Fantastic 4");
myVillainsData.put("Red hulk", "villain from Hulk");
myVillainsData.put("Hulk", "Not really a villain, but he has kicked a lot of superheros");
myVillainsData.put("Magneto", "We all know this one");

if (villainToSearch != null && !villainToSearch.isEmpty()) {
	//Si tenemos un villano para buscar, lo buscaremos por cielo, tierra y mar si es necesario
	if (myVillainsData.containsKey(villainToSearch)) {
		villain = myVillainsData.get(villainToSearch);
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