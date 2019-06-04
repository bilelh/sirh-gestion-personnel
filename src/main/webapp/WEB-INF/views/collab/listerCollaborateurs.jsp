<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>;
<%@page import="dev.sgp.entite.Departement" %>
<%@page import="dev.sgp.util.Constantes" %>

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
		<h1 style="padding-left:20px;">Les collaborateurs</h1>

	<div style="margin:auto; max-width:900px;" class="formulaire">
		<form method="POST">
			<div class="row">
				<div class="col-sm">Rechercher un nom ou un prenom qui commence par:</div>
				<div style="display:flex;" class="col-sm">
					<input type="text" id="recherche" name="rechercher">
					<button  style="margin-left:5px;" type="submit" class="btn btn-primary">Rechercher</button>
				</div>
				<div class="col-sm">
					<input type="checkbox"> 
					<label>Voir les collaborateurs désactivés</label>
				</div>
			</div>
		</form>

		<div class="row">
			<div class="col-md-3 ">Filtrer par département:</div>
			<div class="col-md-3">
				<select>
					<option selected>Tous</option>
				<%
					List<Departement> listDepartement = Constantes.DEP_SERVICE.listerDepartements();
					for(Departement dep : listDepartement){
				%>
						<option value="<%=dep.getNom()%>">  <%=dep.getNom()%>  </option>
				<%
					}
				%>
				</select>
			</div>
		</div>

		<div style="display: flex; flex-direction: row; flex-wrap: wrap;" class="container">
			<%
			List<Collaborateur> listeCollaborateur = Constantes.COLLAB_SERVICE.listerCollaborateurs();
				for (Collaborateur col : listeCollaborateur) { 
				%>
			<div style="border: 1px solid black; width: 200px; margin-top:30px;">
				<div style="display: block; font-weight:bold; border-bottom: 1px solid black; padding: 5px;">
					<p><%=col.getNom() + " " + col.getPrenom()%></p>
				</div>
				<div style="display:flex; padding: 10px;">
					<div><img src="<%=col.getPhoto()%>" alt="" style=" width: 50px;height:50px; margin: 5px;" />
						</div>
					<div>
						<p>Fonction :     <%=col.getIntitulePoste()%></p>
						<p>Département :  <%=col.getDepartement()%></p>
						<p>Email :        <%=col.getEmailPro()%></p>
						<p>Téléphone :    N/A</p>
						<button href="#" class="btn btn-primary">Editer</a>
					</div>
				</div>
			</div>

			<%
			}
		%>
		</div>



</body>
</html>