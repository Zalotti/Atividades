package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.time.LocalDate;

import model.Activities;

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



            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            e.printStackTrace();
        }
        return result;
    }
}
