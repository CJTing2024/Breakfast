package com.ting;

import java.io.Serializable;
import java.util.HashMap;

public class Member implements Serializable {
	
	/**
	 * 
	 */
	private long memberId;
	private String memberEmail;
	private String memberName;
	private int memberPoints;
	private HashMap<String,Integer> voucher;
	
	//建構
	public Member() {}
	public Member(Member member){
		//shallow copying 淺複製 物件參考指標都一樣
		this.memberId = member.getMemberId();
		this.memberEmail = member.getMemberEmail();
		this.memberName = member.getMemberName();
		this.memberPoints = member.getMemberPoints();
		this.voucher = member.getVoucher();
	}
	
	public long getMemberId(){
		return this.memberId;
	}
	public String getMemberEmail(){
		return this.memberEmail;
	}
	public String getMemberName(){
		return this.memberName;
	}
	public int getMemberPoints(){
		return this.memberPoints;
	}
	public HashMap<String,Integer> getVoucher(){
		return this.voucher;
	}
	public void setMemberId(long memberId){
		this.memberId= memberId;
	}
	public void setMemberEmail(String memberEmail){
		this.memberEmail= memberEmail;
	}
	public void setMemberName(String memberName){
		this.memberName= memberName;
	}
	public void setMemberPoints(int memberPoints){
		this.memberPoints = memberPoints;
	}
	public void setVoucher(HashMap<String,Integer> voucher){
		this.voucher= voucher;
	}
}
