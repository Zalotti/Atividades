package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Activities;
import dao.ActivitiesDAO;
import dao.UsersDAO;

/**
 * Servlet implementation class CreateActivity
 */
@WebServlet("/create")
public class CreateActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ActivitiesDAO activitiesDAO = new ActivitiesDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateActivity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
        String description = request.getParameter("description");
        String status = "Em Andamento";
        LocalDate create = LocalDate.now();  

        Activities activity = new Activities();
        activity.setTitle(title);
        activity.setDescription(description);
        activity.setStatus(status);
        activity.setCreation_date(create);

        try {
            activitiesDAO.registerActivity(activity);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/createActivity.jsp");
		dispatcher.forward(request, response);
    }
	


}
