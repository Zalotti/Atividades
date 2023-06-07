package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.time.LocalDate;

import model.Activities;
import model.Users;

public class ActivitiesDAO {

	public int registerActivity(Activities activity) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO ACTIVITY" +
            "  (id, title, description, status, creation_date, finished_date, user_id) VALUES " +
            " (?, ?, ?, ?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/activities", "root", "");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setInt(1, (int) (Math.random() * (100 - 1) + 1));
            preparedStatement.setString(2, activity.getTitle());
            preparedStatement.setString(3, activity.getDescription());
            preparedStatement.setString(4, activity.getStatus());
            preparedStatement.setString(5, activity.getCreation_date());
            preparedStatement.setString(6, activity.getFinished_date());
            preparedStatement.setInt(7, activity.getUserId());



            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            e.printStackTrace();
        }
        return result;
    }
	 public List<Activities> listarAtividades(int userId) throws ClassNotFoundException {
		 
	        List<Activities> atividades = new ArrayList<Activities>();
	        
	        String sql = "SELECT * FROM ACTIVITY WHERE USER_ID = ?;";
	        
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/activities", "root", "");

	            PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, userId);
	            
	            System.out.println(statement);
	            
	            ResultSet rs = statement.executeQuery();
	            
	            while(rs.next()) {
	            Activities activity = new Activities();
	            activity.setTitle(rs.getString("title"));
	            activity.setDescription(rs.getString("description"));
	            activity.setStatus(rs.getString("status"));
	            activity.setCreation_date(rs.getString("creation_date"));
	            activity.setFinished_date(rs.getString("finished_date"));
	            
	            atividades.add(activity);
	            }
	            
		        rs.close();
		        statement.close();

	        } catch (SQLException e) {
	            // process sql exception
	            e.printStackTrace();
	        }      
	        return atividades;

}
}
