package com.dn.protitan.dao;

public class TopTenFail {
	private String deviceid;
	private String messagetext;
	private String location;
	private String vendor;
	private String totaltime;
	
	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}
	public void setMessagetext(String messagetext) {
		this.messagetext = messagetext;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public void setTotaltime(String totaltime) {
		this.totaltime = totaltime;
	}

	public String getDeviceid() {
		return deviceid;
	}
	public String getMessagetext() {
		return messagetext;
	}
	public String getLocation() {
		return location;
	}
	public String getVendor() {
		return vendor;
	}
	public String getTotaltime() {
		return totaltime;
	}
	
	
	@Override
	public String toString() {
		return "TopTenFail [deviceid=" + deviceid + ", messagetext=" + messagetext + ", location=" + location
				+ ", vendor=" + vendor + ", totaltime=" + totaltime + "]";
	}

}
