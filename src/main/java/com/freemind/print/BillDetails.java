package com.freemind.print;

public class BillDetails {
    private String srNo;
    private String description;
    private double qty;
    private double rate;
    private double amount;

    public BillDetails(String srNo, String description, double qty, double rate, double amount) {
        super();
        this.srNo = srNo;
        this.description = description;
        this.qty = qty;
        this.rate = rate;
        this.amount = amount;
    }

    public String getSrNo() {
        return srNo;
    }

    public void setSrNo(String srNo) {
        this.srNo = srNo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getQty() {
        return qty;
    }

    public void setQty(double qty) {
        this.qty = qty;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

}
