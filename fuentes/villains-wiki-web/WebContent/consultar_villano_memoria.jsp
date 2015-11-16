<%@page import="co.com.jhilton.wiki.villains.domain.Villain"%>
<%@page import="co.com.jhilton.wiki.villains.data.impl.VillainsManagerInMemoryImpl"%>
<%@page import="co.com.jhilton.wiki.villains.data.IVillainsManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Villain search</title>
</head>
<% 
String villainToSearch = request.getParameter("txtVillainName");
Villain villain = null;

if (villainToSearch != null && !villainToSearch.isEmpty()) {
	IVillainsManager villainManager = new VillainsManagerInMemoryImpl();
	villain = villainManager.getVillainByName(villainToSearch);
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
		if (villain != null) { %>
			<p> We have found <%= villainToSearch %>, <%= villain.getDescription() %></p>
	<%  } else { %>
			<p>We know nothing about <%= villainToSearch %></p>		
	<%	}
	}
	%>
</body>
</html>