package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Users;

public class UsersDAO {

	public int registerUser(Users user) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO USER" +
            "  (id, name, username, email, password) VALUES " +
            " (?, ?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/activities", "root", "");

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
	        String GET_USERS_SQL = "SELECT * FROM USER WHERE USERNAME = ?" +
	        		                " AND PASSWORD = ?;";

	        boolean result = false;

	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/activities", "root", "");

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
	 
	 public int getUserId(Users user) throws ClassNotFoundException{
		 String GET_USERS_SQL = "SELECT * FROM USER WHERE USERNAME = ?";

         int result = 0;

          Class.forName("com.mysql.jdbc.Driver");

         try (Connection connection = DriverManager
         .getConnection("jdbc:mysql://localhost:3306/activities", "root", "");

         // Step 2:Create a statement using connection object
         PreparedStatement preparedStatement = connection.prepareStatement(GET_USERS_SQL)) {
         preparedStatement.setString(1, user.getUsername());

         System.out.println(preparedStatement);

         ResultSet rs = preparedStatement.executeQuery();
         while(rs.next()) {
	            result = (rs.getInt("id"));
	            }
         System.out.println(rs);

         } catch (SQLException e) {
         // process sql exception
         e.printStackTrace();
         }
        return result;
	 }
	 
	 public List<Users> listarUsuarios(Users user) throws ClassNotFoundException {
		 
	        List<Users> usuarios = new ArrayList<Users>();
	        
	        String sql = "SELECT * FROM USER WHERE USERNAME = ?" +
	        " AND PASSWORD = ?;";
	        
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/activities", "root", "");

	            PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1, user.getUsername());
	            statement.setString(2, user.getPassword());
	            
	            
	            System.out.println(statement);
	            
	            ResultSet rs = statement.executeQuery();
	            
	            while(rs.next()) {
	            user.setId(rs.getInt("id"));
	            user.setEmail(rs.getString("email"));
	            user.setName(rs.getString("name"));
	            user.setUsername(rs.getString("username"));
	            user.setPassword(rs.getString("password"));
	            }
	 
	            usuarios.add(user);
	            
		        rs.close();
		        statement.close();

	        } catch (SQLException e) {
	            // process sql exception
	            e.printStackTrace();
	        }      
	        return usuarios;

}
}
