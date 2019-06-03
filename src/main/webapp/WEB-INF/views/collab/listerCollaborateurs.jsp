<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>;

<%@ page language="java" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SGP - App</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-4.3.1-
		dist/css/bootstrap.css">
	</head>
	<body>
		<h1>Les collaborateurs</h1>
		<ul>
		<%
		List<Collaborateur> listeCollaborateurs = (List<Collaborateur>) request.getAttribute("listeCollaborateurs");
		for (Collaborateur col : listeCollaborateurs) {
		%>
			<li><%=col.getNom() %>    <%=col.getPrenom() %>  
			 <%=col.getDateDeNaissance() %>  <%=col.getEmailPro() %> <%=col.getMatricule() %></li>
		<%
		}
		%>
		</ul>
	</body>
</html>