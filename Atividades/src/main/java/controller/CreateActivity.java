package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Activities;
import model.Users;
import dao.ActivitiesDAO;
import dao.UsersDAO;

/**
 * Servlet implementation class CreateActivity
 */
@WebServlet("/create")
public class CreateActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ActivitiesDAO activitiesDAO = new ActivitiesDAO();
	UsersDAO usersDAO = new UsersDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateActivity() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/createActivity.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String status = "Em Andamento";
		String creation_date = request.getParameter("creation_date");
		String finished_date = request.getParameter("finished_date");
		
		int id;
		
		HttpSession session = request.getSession();

		Activities activity = new Activities();
		Users user = new Users();
		
		activity.setTitle(title);
		activity.setDescription(description);
		activity.setStatus(status);
		activity.setCreation_date(creation_date);
		activity.setFinished_date(finished_date);
		
		user.setUsername((String) session.getAttribute("username"));

		try {
			id = usersDAO.getUserId(user);
			activitiesDAO.registerActivity(activity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/activityRegisterSucess.jsp");
		dispatcher.forward(request, response);
	}

}
