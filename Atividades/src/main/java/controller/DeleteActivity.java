package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.UsersDAO;
import dao.ActivitiesDAO;

import model.Users;
import model.Activities;

@WebServlet("/deleteactivity")
public class DeleteActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsersDAO usersDao = new UsersDAO();
	ActivitiesDAO activitiesDao = new ActivitiesDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteActivity() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	 int userId = 0;
    	 Users user = new Users();
    	 Activities activity = new Activities();
    	 HttpSession session = request.getSession(); 
    	 
    	String username = (String) session.getAttribute("username");
    	String password = (String) session.getAttribute("password");
    	
    	user.setUsername(username);
        user.setPassword(password);
    	
        List<Users> usuarios;
        List<Activities> atividades;
        
		try {
			usuarios = usersDao.listarUsuarios(user);
			userId = usersDao.getUserId(user);
			atividades = activitiesDao.listarAtividades(userId);
			request.setAttribute("usuarios", usuarios);
			request.setAttribute("atividades", atividades);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// Encaminha para o JSP responsável por exibir os dados
		request.getRequestDispatcher("/WEB-INF/views/deleteActivity.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
