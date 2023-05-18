package kcure.portal.sys.pay.pay.service.impl;

public class PaymentVO {
    private String goodsName;
    private String tid;
    private String errorCode;
    private String errorDesc;
    private String goodsType;
    private String userId;
    private String paymentType;
    private int paymentAmount;
    private int accountSeq;
    private int depositAmount;
    private String dataAplcNo;
	private String rsrAsmtNo;
	private String extdAplcNo;
	private String extdStcd;

    public String getGoodsName() {
        return goodsName;
    }
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getTid() {
        return tid;
    }
    public void setTid(String tid) {
        this.tid = tid;
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

    public String getGoodsType() {
        return goodsType;
    }
    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
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

    public int getAccountSeq() {
        return accountSeq;
    }
    public void setAccountSeq(int accountSeq) {
        this.accountSeq = accountSeq;
    }

    public int getDepositAmount() {
        return depositAmount;
    }
    public void setDepositAmount(int depositAmount) {
        this.depositAmount = depositAmount;
    }

    public String getDataAplcNo() {
        return dataAplcNo;
    }
    public void setDataAplcNo(String dataAplcNo) {
        this.dataAplcNo = dataAplcNo;
    }

    public String getRsrAsmtNo() {
		return rsrAsmtNo;
	}
	public void setRsrAsmtNo(String rsrAsmtNo) {
		this.rsrAsmtNo = rsrAsmtNo;
	}

	public String getExtdAplcNo() {
		return extdAplcNo;
	}
	public void setExtdAplcNo(String extdAplcNo) {
		this.extdAplcNo = extdAplcNo;
	}

	public String getExtdStcd() {
		return extdStcd;
	}
	public void setExtdStcd(String extdStcd) {
		this.extdStcd = extdStcd;
	}
}
