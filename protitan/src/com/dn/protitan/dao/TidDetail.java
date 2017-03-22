package com.dn.protitan.dao;

public class TidDetail {
	private String deviceid;
	private String lokasi;
	private String wilayah;
	private String cabang;
	private String vendor;
	private String flm;
	private String hardware;
	
	
	public String getDeviceid() {
		return deviceid;
	}
	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}
	public String getHardware(){
		return hardware;
	}
	public void setHardware(String hardware){
		this.hardware = hardware;
	}
	public String getLokasi() {
		return lokasi;
	}
	public void setLokasi(String lokasi) {
		this.lokasi = lokasi;
	}
	public String getWilayah() {
		return wilayah;
	}
	public void setWilayah(String wilayah) {
		this.wilayah = wilayah;
	}
	public String getCabang() {
		return cabang;
	}
	public void setCabang(String cabang) {
		this.cabang = cabang;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public String getFlm() {
		return flm;
	}
	public void setFlm(String flm) {
		this.flm = flm;
	}
	
	@Override
	public String toString() {
		return "TidDetail [deviceid=" + deviceid + ",hardware=" + hardware+ ", lokasi=" + lokasi + ", wilayah=" + wilayah + ", cabang=" + cabang
				+ ", vendor=" + vendor  + ", flm=" + flm + "]";
	}
	
	
	
	

}
