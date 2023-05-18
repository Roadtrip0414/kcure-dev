package kcure.portal.sys.pay.pay.service.impl;

public class PaymentResultVO {
	private boolean success;
	private String paymentType;
	private int paymentAmount;
	private String tid;
	private String vbankBankName;
	private String vbankNum;
	private String vbankExpDate;
	private String vbankExpTime;
	private String bankName;
	private String cardName;
	private String errorCode;
	private String errorDesc;

	public boolean getSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getVbankBankName() {
		return vbankBankName;
	}
	public void setVbankBankName(String vbankBankName) {
		this.vbankBankName = vbankBankName;
	}

	public String getVbankNum() {
		return vbankNum;
	}
	public void setVbankNum(String vbankNum) {
		this.vbankNum = vbankNum;
	}

	public String getVbankExpDate() {
		return vbankExpDate;
	}
	public void setVbankExpDate(String vbankExpDate) {
		this.vbankExpDate = vbankExpDate;
	}

	public String getVbankExpTime() {
		return vbankExpTime;
	}
	public void setVbankExpTime(String vbankExpTime) {
		this.vbankExpTime = vbankExpTime;
	}

	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorDesc() {
		return errorDesc;
	}
	public void setErrorDesc(String errorDesc) {
		this.errorDesc = errorDesc;
	}
}
