package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.PatientDao;


@WebServlet("/Patient")
public class Patient extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Patient() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!(request.getSession().getAttribute("identifiant")==null)){
		DaoFactory fac = DaoFactory.getInstance();
		PatientDao base = fac.getPatient();
		request.setAttribute("nom", request.getParameter("nom"));
		request.setAttribute("prenom", request.getParameter("prenom"));
		request.setAttribute("liste", base.getPhotos(request.getParameter("nom"),request.getParameter("prenom"),String.valueOf(request.getSession().getAttribute("id_user"))));
		this.getServletContext().getRequestDispatcher("/WEB-INF/patient.jsp").forward(request, response);
		}
		else{
			response.sendRedirect("http://localhost:8080/PFE/index");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
