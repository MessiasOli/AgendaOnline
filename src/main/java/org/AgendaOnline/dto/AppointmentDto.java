package org.AgendaOnline.dto;

import java.util.Date;

public class AppointmentDto {

	private int id;
	private String description;
	private String local;
	private String formatDate;
	private String formatHour;
	private Integer contactId;
	
	public String getFormatHour() {
		return formatHour;
	}

	public void setFormatHour(String formatHour) {
		this.formatHour = formatHour;
	}
	
	public String getFormatDate() {
		return formatDate;
	}

	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}
		
	public Integer getContactId() {
		return contactId;
	}

	public void setContactId(Integer contactId) {
		this.contactId = contactId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

}
