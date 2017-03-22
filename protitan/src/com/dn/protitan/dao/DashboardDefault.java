package com.dn.protitan.dao;

public class DashboardDefault {
	private int devicetotal;
	private int cardreader; 
	private int receiptprinter;
	private int cashdispenser;
	private int epp;
	private int comm; 
	private int cashstatus; 
	private int sopstatus;
	private int outofservice;
	private int inservice;
	
	public int getDevicetotal() {
		return devicetotal;
	}
	public void setDevicetotal(int devicetotal) {
		this.devicetotal = devicetotal;
	}
	public int getCardreader() {
		return cardreader;
	}
	public int getReceiptprinter() {
		return receiptprinter;
	}
	public int getCashdispenser() {
		return cashdispenser;
	}
	public int getEpp() {
		return epp;
	}
	public int getComm() {
		return comm;
	}
	public int getCashstatus() {
		return cashstatus;
	}
	public int getSopstatus() {
		return sopstatus;
	}
	public void setCardreader(int cardreader) {
		this.cardreader = cardreader;
	}
	public void setReceiptprinter(int receiptprinter) {
		this.receiptprinter = receiptprinter;
	}
	public void setCashdispenser(int cashdispenser) {
		this.cashdispenser = cashdispenser;
	}
	public void setEpp(int epp) {
		this.epp = epp;
	}
	public void setComm(int comm) {
		this.comm = comm;
	}
	public void setCashstatus(int cashstatus) {
		this.cashstatus = cashstatus;
	}
	public void setSopstatus(int sopstatus) {
		this.sopstatus = sopstatus;
	}
	public int getOutofservice() {
		return outofservice;
	}
	public void setOutofservice(int outofservice) {
		this.outofservice = outofservice;
	}
	public int getInservice() {
		return inservice;
	}
	public void setInservice(int inservice) {
		this.inservice = inservice;
	}
	
	
	@Override
	public String toString() {
		return "DashboardDefault [devicetotal=" + devicetotal + ", cardreader=" + cardreader + ", receiptprinter="
				+ receiptprinter + ", cashdispenser=" + cashdispenser + ", epp=" + epp + ", comm=" + comm
				+ ", cashstatus=" + cashstatus + ", sopstatus=" + sopstatus + ", outofservice=" + outofservice
				+ ", inservice=" + inservice + "]";
	}
	
}
