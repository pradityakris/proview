package com.dn.protitan.dao;

public class TxnPage {
	
	private String PaymentFreq;
	private String INQUIRYtFreq;
	private String WithdrawalFreq;
	private String TransferFreq;
	private String TapcashFreq;
	private String DPSTFrequency;
	private String StartDate;
	private String EndDate;
	
	private int PaymentAmount;
	private int WithdrawalAmount;
	private int TransferAmount;
	private int TapcashAmount;
	private int DPSTAmount;
	private String month;
	public String getPaymentFreq() {
		return PaymentFreq;
	}
	public void setPaymentFreq(String paymentFreq) {
		PaymentFreq = paymentFreq;
	}
	public String getINQUIRYtFreq() {
		return INQUIRYtFreq;
	}
	public void setINQUIRYtFreq(String iNQUIRYtFreq) {
		INQUIRYtFreq = iNQUIRYtFreq;
	}
	public String getWithdrawalFreq() {
		return WithdrawalFreq;
	}
	public void setWithdrawalFreq(String withdrawalFreq) {
		WithdrawalFreq = withdrawalFreq;
	}
	public String getTransferFreq() {
		return TransferFreq;
	}
	public void setTransferFreq(String transferFreq) {
		TransferFreq = transferFreq;
	}
	public String getTapcashFreq() {
		return TapcashFreq;
	}
	public void setTapcashFreq(String tapcashFreq) {
		TapcashFreq = tapcashFreq;
	}
	public String getDPSTFrequency() {
		return DPSTFrequency;
	}
	public void setDPSTFrequency(String dPSTFrequency) {
		DPSTFrequency = dPSTFrequency;
	}
	public String getStartDate() {
		return StartDate;
	}
	public void setStartDate(String startDate) {
		StartDate = startDate;
	}
	public String getEndDate() {
		return EndDate;
	}
	public void setEndDate(String endDate) {
		EndDate = endDate;
	}
	public int getPaymentAmount() {
		return PaymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		PaymentAmount = paymentAmount;
	}
	public int getWithdrawalAmount() {
		return WithdrawalAmount;
	}
	public void setWithdrawalAmount(int withdrawalAmount) {
		WithdrawalAmount = withdrawalAmount;
	}
	public int getTransferAmount() {
		return TransferAmount;
	}
	public void setTransferAmount(int transferAmount) {
		TransferAmount = transferAmount;
	}
	public int getTapcashAmount() {
		return TapcashAmount;
	}
	public void setTapcashAmount(int tapcashAmount) {
		TapcashAmount = tapcashAmount;
	}
	public int getDPSTAmount() {
		return DPSTAmount;
	}
	public void setDPSTAmount(int dPSTAmount) {
		DPSTAmount = dPSTAmount;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	@Override
	public String toString() {
		return "TxnPage [PaymentFreq=" + PaymentFreq + ", INQUIRYtFreq=" + INQUIRYtFreq + ", WithdrawalFreq="
				+ WithdrawalFreq + ", TransferFreq=" + TransferFreq + ", TapcashFreq=" + TapcashFreq
				+ ", DPSTFrequency=" + DPSTFrequency + ", StartDate=" + StartDate + ", EndDate=" + EndDate
				+ ", PaymentAmount=" + PaymentAmount + ", WithdrawalAmount=" + WithdrawalAmount + ", TransferAmount="
				+ TransferAmount + ", TapcashAmount=" + TapcashAmount + ", DPSTAmount=" + DPSTAmount + ", month="
				+ month + "]";
	}
	
	
}
