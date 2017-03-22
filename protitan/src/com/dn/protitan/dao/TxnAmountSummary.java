package com.dn.protitan.dao;

public class TxnAmountSummary {
	private String PaymentAmount;
	private String WithdrawalAmount;
	private String TransferAmount;
	private String TapcashAmount;
	private String DPSTAmount;
	private String month;
	public String getPaymentAmount() {
		return PaymentAmount;
	}
	public void setPaymentAmount(String paymentAmount) {
		PaymentAmount = paymentAmount;
	}
	public String getWithdrawalAmount() {
		return WithdrawalAmount;
	}
	public void setWithdrawalAmount(String withdrawalAmount) {
		WithdrawalAmount = withdrawalAmount;
	}
	public String getTransferAmount() {
		return TransferAmount;
	}
	public void setTransferAmount(String transferAmount) {
		TransferAmount = transferAmount;
	}
	public String getTapcashAmount() {
		return TapcashAmount;
	}
	public void setTapcashAmount(String tapcashAmount) {
		TapcashAmount = tapcashAmount;
	}
	public String getDPSTAmount() {
		return DPSTAmount;
	}
	public void setDPSTAmount(String dPSTAmount) {
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
		return "TxnAmountSummary [PaymentAmount=" + PaymentAmount + ", WithdrawalAmount=" + WithdrawalAmount
				+ ", TransferAmount=" + TransferAmount + ", TapcashAmount=" + TapcashAmount + ", DPSTAmount="
				+ DPSTAmount + ", month=" + month + "]";
	}
	
	
	
}
