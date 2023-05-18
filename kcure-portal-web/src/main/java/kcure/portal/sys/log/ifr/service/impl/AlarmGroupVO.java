package kcure.portal.sys.log.ifr.service.impl;

public class AlarmGroupVO {

	public String id;
	public String name;
	public String alarmTypeEmail;
	public String alarmTypePhone;
	public String createdDateTime;
	public String updatedDateTime;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAlarmTypeEmail() {
		return alarmTypeEmail;
	}
	public void setAlarmTypeEmail(String alarmTypeEmail) {
		this.alarmTypeEmail = alarmTypeEmail;
	}
	public String getAlarmTypePhone() {
		return alarmTypePhone;
	}
	public void setAlarmTypePhone(String alarmTypePhone) {
		this.alarmTypePhone = alarmTypePhone;
	}
	public String getCreatedDateTime() {
		return createdDateTime;
	}
	public void setCreatedDateTime(String createdDateTime) {
		this.createdDateTime = createdDateTime;
	}
	public String getUpdatedDateTime() {
		return updatedDateTime;
	}
	public void setUpdatedDateTime(String updatedDateTime) {
		this.updatedDateTime = updatedDateTime;
	}
	
}
