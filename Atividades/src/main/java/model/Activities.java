package model;
import java.time.LocalDate;
import java.util.Date;

public class Activities {
	
	private int id;
    private String title;
    private String description;
    private String status;
    private String creation_date;
    private String finished_date;
    private int userId;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	public String getFinished_date() {
		return finished_date;
	}
	public void setFinished_date(String finished_date) {
		this.finished_date = finished_date;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

}
