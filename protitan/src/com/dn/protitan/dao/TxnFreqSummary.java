package com.dn.protitan.dao;

public class TxnFreqSummary {
	
	private String PaymentFreq;
	private String INQUIRYtFreq;
	private String WithdrawalFreq;
	private String TransferFreq;
	private String TapcashFreq;
	private String DPSTFrequency;
	private String StartDate;
	private String EndDate;
	
	
	

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




	@Override
	public String toString() {
		return "TxnFreqSummary [PaymentFreq=" + PaymentFreq + ", INQUIRYtFreq=" + INQUIRYtFreq + ", WithdrawalFreq="
				+ WithdrawalFreq + ", TransferFreq=" + TransferFreq + ", TapcashFreq=" + TapcashFreq
				+ ", DPSTFrequency=" + DPSTFrequency + ", StartDate=" + StartDate + ", EndDate=" + EndDate + "]";
	}
	
}
