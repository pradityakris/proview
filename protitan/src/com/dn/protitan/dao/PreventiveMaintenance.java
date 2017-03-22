package com.dn.protitan.dao;

public class PreventiveMaintenance {
	private String deviceid;
	private String date;
	private boolean status;
	
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getDeviceid() {
		return deviceid;
	}
	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "PreventiveMaintenance [deviceid=" + deviceid + ", date=" + date + ", status=" + status + "]";
	}

}
