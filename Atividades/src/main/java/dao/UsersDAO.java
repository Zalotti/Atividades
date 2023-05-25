package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Users;

public class UsersDAO {

	public int registerUser(Users user) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO USERS" +
            "  (id, name, username, email, password) VALUES " +
            " (?, ?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/employees", "root", "");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setInt(1, (int) (Math.random() * (100 - 1) + 1));
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getUsername());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPassword());


            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            e.printStackTrace();
        }
        return result;
    }
	
	 public boolean loginUser(Users user) throws ClassNotFoundException {
	        String GET_USERS_SQL = "SELECT * FROM USERS WHERE USERNAME = ?" +
	        		                " AND PASSWORD = ?;";

	        boolean result = false;

	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/employees", "root", "");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(GET_USERS_SQL)) {
	        	preparedStatement.setString(1, user.getUsername());
	            preparedStatement.setString(2, user.getPassword());
	            
	            
	            System.out.println(preparedStatement);
	            
	            ResultSet rs = preparedStatement.executeQuery();
	            result = rs.next();
	            System.out.println(rs);

	        } catch (SQLException e) {
	            // process sql exception
	            e.printStackTrace();
	        }
	        return result;
	    }
}
