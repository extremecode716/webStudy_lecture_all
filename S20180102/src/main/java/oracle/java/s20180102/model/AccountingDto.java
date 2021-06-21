package oracle.java.s20180102.model;

import java.sql.Date;

public class AccountingDto {
	private int gno;
	private Date depositDate;
	private int paymentCost;
	private int balance;
	private int inCost;
	
	
	public int getInCost() {
		return inCost;
	}
	public void setInCost(int inCost) {
		this.inCost = inCost;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public Date getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(Date depositDate) {
		this.depositDate = depositDate;
	}
	public int getPaymentCost() {
		return paymentCost;
	}
	public void setPaymentCost(int paymentCost) {
		this.paymentCost = paymentCost;
	}
	
	
}
