<%@page import="co.com.jhilton.wiki.villains.data.IVillainsDAO"%>
<%@page import="co.com.jhilton.wiki.villains.data.impl.VillainsInMemoryDAOImpl"%>
<%@page import="co.com.jhilton.wiki.villains.data.impl.VillainsMySqlDAOImpl"%>
<%@page import="co.com.jhilton.wiki.villains.domain.Villain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Villain search</title>
</head>
<% 
String villainToSearch = request.getParameter("txtVillainName");
String tipoOrigenDatos = request.getParameter("cbxTipoOrigenDatos");
Villain villain = null;

if (villainToSearch != null && !villainToSearch.isEmpty()) {
	IVillainsDAO villainManager = null;
	if ("MEMORY".equals(tipoOrigenDatos)) {
		villainManager = new VillainsInMemoryDAOImpl();
	} else {
		villainManager = new VillainsMySqlDAOImpl();
	}
	
	villain = villainManager.getVillainByName(villainToSearch);
}
%>
<body>
<h2>Find your favorite villain</h2>
	<form method="get" >
		<p>
			<label for="cbxTipoOrigenDatos">Data source:</label>
			<select name="cbxTipoOrigenDatos" >
				<option value="MEMORY" selected="selected">En memoria</option>
				<option value="DB">Base de datos</option>
			</select>
		</p>
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