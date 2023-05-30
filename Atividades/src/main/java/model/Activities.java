package model;
import java.time.LocalDate;
import java.util.Date;

public class Activities {
	
	private int id;
    private String title;
    private String description;
    private String status;
    private LocalDate creation_date;
    private LocalDate finished_date;

	
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
	public LocalDate getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(LocalDate create) {
		this.creation_date = create;
	}
	public LocalDate getFinished_date() {
		return finished_date;
	}
	public void setFinished_date(LocalDate finished_date) {
		this.finished_date = finished_date;
	}

}
