package dev.sgp.web;

import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;
import dev.sgp.entite.Collaborateur;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZonedDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;

public class CreerCollaborateurController extends HttpServlet {
	
	private CollaborateurService collaborateurService = Constantes.COLLAB_SERVICE;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws
	ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/collab/creerCollaborateur.jsp")
		.forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws
	ServletException, IOException {
		
		// Récuperation des parametres du formulaire
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		LocalDate dateDeNaissance = LocalDate.parse(req.getParameter("dateDeNaissance"));
		String adresse = req.getParameter("adresse");
		String secu = req.getParameter("secu");
		
		// On genere un matricule
		int counterMatricule = Collaborateur.getCounter();
		String matricule= "Matricule"+Integer.toString(counterMatricule);
		
		// On genere la date de création
		ZonedDateTime dateHeureCreation =ZonedDateTime.now();
		
		// On genere le mail
		String emailPro = prenom+"."+nom+"@societe.com";
		
		// Photo
		String photo = "photo fictive";
		// Le collaborateur est actif par defaut
		boolean actif = true;
		// Le numero de secu doit avoir 15 caracteres ==> erreur 400 sinon
		if(secu.length() != 15) {
			resp.setStatus(400);
		}else {
		// On crée le collaborateur
		Collaborateur collab = new Collaborateur (matricule, nom, prenom, dateDeNaissance,
				adresse, secu, emailPro, photo, dateHeureCreation, actif);
		
		// On sauvegarde le collaborateur dans la liste des collaborateurs
		collaborateurService.sauvegarderCollaborateur(collab);
		
		// On sauvegarde
		req.setAttribute("listeCollaborateurs", collaborateurService.listerCollaborateurs());
		
		// On redirige sur la page de liste de collaborateurs
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
		}
	}

}
