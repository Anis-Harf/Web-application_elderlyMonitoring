package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Utilisateur;
import dao.DaoFactory;
import dao.UtilisateurDao;

/**
 * Servlet implementation class Authentification
 */
@WebServlet("/Authentification")
public class Authentification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Authentification() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/WEB-INF/authentification.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DaoFactory fact= DaoFactory.getInstance();
		dao.UtilisateurDao base =fact.getUtilisateur();
		int result;
		boolean result2;
		if((String)request.getParameter("Username") !=null){ // authentification
			result = base.verifier((String)request.getParameter("Username"), (String)request.getParameter("Password"));
			if (result != 0) {
				HttpSession session = request.getSession();
				session.setAttribute("identifiant", (String)request.getParameter("Username"));
				session.setAttribute("id_user", result);
				response.sendRedirect("http://localhost:8080/PFE/surveillance");
			}
			else {
				request.setAttribute("errone", "Ce compte n'existe pas !");
			}
		}
		else { // enregistrement
			if(!((String)request.getParameter("mp")).equals((String)request.getParameter("rp"))){
				request.setAttribute("errone", "La confirmation du mot de passe est erronée !");
			}
			else{
				System.out.println((String)request.getParameter("identifiant"));
				result2 = base.verifierIdent((String)request.getParameter("identifiant"));
				if (result2){
					request.setAttribute("errone", "Cet identifiant existe deja !");

				}
				else{ // on crée un compte
					Utilisateur user = new Utilisateur((String)request.getParameter("identifiant"),(String)request.getParameter("mp"));
					result= base.ajouter(user);
					HttpSession session = request.getSession();
					session.setAttribute("identifiant", (String)request.getParameter("identifiant"));
					session.setAttribute("id-user", result);
				}
			}
			this.getServletContext().getRequestDispatcher("/WEB-INF/authentification.jsp").forward(request, response);

		}

	}

}
