package dev.sgp.web;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes;

public class ListerCollaborateursController extends HttpServlet {
	
	private CollaborateurService collaborateurService = Constantes.COLLAB_SERVICE;
	private DepartementService departementService = Constantes.DEP_SERVICE;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws
	ServletException, IOException {
		
		/*
		 * req.setAttribute("listeCollaborateurs", Arrays.asList("Robert", "Jean",
		 * "Hugues"));
		 */
		
		
		req.setAttribute("listeCollaborateurs", collaborateurService.listerCollaborateurs());
		req.setAttribute("listeDepartements", departementService.listerDepartements() );
		
		
		
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rechercheParam = req.getParameter("recherche");
		if(rechercheParam !=null) {
			
			
			req.setAttribute("listeDepartements", departementService.listerDepartements() );
			
			req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp").forward(req, resp);
		}
		
		
}
}
