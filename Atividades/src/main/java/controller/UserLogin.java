package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

import java.io.IOException;

import dao.UsersDAO;

@WebServlet("/login")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UsersDAO userDao = new UsersDAO();

    /**
     * Default constructor. 
     */
    public UserLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean valid = false; 
		
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        HttpSession session = request.getSession(); 
        session.setAttribute("username", username);


        Users user = new Users();

        user.setUsername(username);
        user.setPassword(password);

        try {
            valid = userDao.loginUser(user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        if(valid == true) {
        request.setAttribute("username", user.getUsername());
        request.setAttribute("password", user.getPassword());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/mainpage");
		dispatcher.forward(request, response);
        }
        else { 
        	
        }
    }
	

}
