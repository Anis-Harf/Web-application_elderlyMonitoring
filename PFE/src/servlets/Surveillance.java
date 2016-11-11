package servlets;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.PatientDao;

/**
 * Servlet implementation class Surveillance
 */
@WebServlet("/Surveillance")
public class Surveillance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Surveillance() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!(request.getSession().getAttribute("identifiant")==null)){
		DaoFactory fac = DaoFactory.getInstance();
		PatientDao base = fac.getPatient();
		request.setAttribute("liste", base.lister(String.valueOf(request.getSession().getAttribute("id_user"))));
		this.getServletContext().getRequestDispatcher("/WEB-INF/surveillance.jsp").forward(request, response);
		}
		else{
			response.sendRedirect("http://localhost:8080/PFE/index");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ident = request.getParameter("Patient");
		StringTokenizer st2 = new StringTokenizer(ident, " ");
		String nom = st2.nextToken();
		String prenom = null;
		if(st2.hasMoreTokens()) prenom = st2.nextToken();
		DaoFactory fac = DaoFactory.getInstance();
		PatientDao base = fac.getPatient();
		request.setAttribute("liste", base.checkPatient(nom,prenom, String.valueOf(request.getSession().getAttribute("id_user"))));
		this.getServletContext().getRequestDispatcher("/WEB-INF/surveillance.jsp").forward(request, response);
		
	}
	

}
