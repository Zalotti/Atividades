package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

import java.io.IOException;

import dao.UsersDAO;

/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet("/register")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UsersDAO userDao = new UsersDAO();

    /**
     * Default constructor. 
     */
    public UserRegister() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/userRegister.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int result = 0;

        Users user = new Users();
        user.setName(name);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);

        try {
            result = userDao.registerUser(user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        if(result == 1) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/registerSucess.jsp");
		dispatcher.forward(request, response);
        }
        
        else if(result == 2) {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/registerTakenUsername.jsp");
    		dispatcher.forward(request, response);
        }
        else if(result == 3) {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/registerTakenEmail.jsp");
    		dispatcher.forward(request, response);
        }
	
	}
}

