package com.dn.protitan.dao;

public class TpsCount {

	private int tpsCount;
	private String time;
	public int getTpsCount() {
		return tpsCount;
	}
	public void setTpsCount(int tpsCount) {
		this.tpsCount = tpsCount;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "TpsCount [tpsCount=" + tpsCount + ", time=" + time + "]";
	}
	
}
