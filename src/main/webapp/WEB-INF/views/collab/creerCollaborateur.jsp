<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SGP - App</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-4.3.1-
		dist/css/bootstrap.css">
		<!-- <style>
		h1 {margin-left:30px;}
		.container {margin-left: 200px; width: 1000px;}
		#inputAdresse {height:100px;}
		button {margin-left:450px}
		</style> -->
		<style>#inputAdresse {height:100px;}</style>
	</head>
	<body>
		<h1>Nouveau Collaborateur</h1>
		
		<div class="container">
		<form method="POST">
			<div class="form-group row">
				<label for="inputNom" class="col-sm-4 col-form-label">Nom</label>
				<div class="col-sm-5">
					<input type="text"  class="form-control "
						id="inputNom" name="nom" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPrenom" class="col-sm-4 col-form-label">Prenom</label>
				<div class="col-sm-5">
					<input type="text" class="form-control"
						id="inputPrenom" name="prenom" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputDate" class="col-sm-4 col-form-label">Date de naissance</label>
				<div class="col-sm-5">
					<input type="date" class="form-control"
						id="inputDate" name="dateDeNaissance" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputAdresse" class="col-sm-4 col-form-label">Adresse</label>
				<div class="col-sm-5 h-50">
					<input type="text" class="form-control"
						id="inputAdresse" name="adresse" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputSecu" class="col-sm-4 col-form-label">Numéro de sécurité sociale</label>
				<div class="col-sm-5">
					<input type="text" class="form-control"
						id="inputSecu" name="secu" size="15" required>
				</div>
			</div>
			
			<button type="submit" class="btn btn-primary">Créer</button>
		</form>
		
		</div>
		
		
		
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-4.3.1-dist/js/bootstrap.js"></script>
</body>
</html>