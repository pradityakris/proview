package com.dn.protitan.dao;

public class ComponentDetail {

	private String deviceid;
	private String messagetext;
	private String location;
	private String vendor;
	private String totaltime;
	
	public String getDeviceid() {
		return deviceid;
	}

	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}
	public String getMessagetext() {
		return messagetext;
	}
	public void setMessagetext(String messagetext) {
		this.messagetext = messagetext;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public String getTotaltime() {
		return totaltime;
	}
	public void setTotaltime(String totaltime) {
		this.totaltime = totaltime;
	}
	
	@Override
	public String toString() {
		return "deviceid=" + deviceid + ", messagetext=" + messagetext + ", location=" + location
				+ ", vendor=" + vendor + ", totaltime=" + totaltime;
	}
	

}
