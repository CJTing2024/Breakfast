package com.ting;

import java.io.Serializable;
import java.util.HashMap;

public class MemberPassword extends Member implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberPassword;
	private String memberGender;
	private String memberBirthday;
	private String memberTel;
	private String memberPhone;
	private String city;
	private String district;
	private String address;
	
	public MemberPassword() {
		super();
	}
	public MemberPassword(Member member) {
		super(member);
	}
	
	public String getMemberPassword(){
		return this.memberPassword;
	}

	public String getMemberGender(){
		return this.memberGender;
	}
	public String getMemberBirthday(){
		return this.memberBirthday;
	}
	public String  getMemberTel(){
		return this.memberTel;
	}
	public String getMemberPhone(){
		return this.memberPhone;
	}
	public String getCity(){
		return this.city;
	}
	public String getDistrict(){
		return this.district;
	}
	public String getAddress(){
		return this.address;
	}	
	public void setMemberPassword(String memberPassword){
		this.memberPassword = memberPassword;
	}
	public void setMemberGender(String memberGender){
		this.memberGender=memberGender;
	}
	public void setMemberBirthday(String memberBirthday){
		this.memberBirthday=memberBirthday;
	}
	public void setMemberTel(String memberTel){
		this.memberTel=memberTel;
	}
	public void setMemberPhone(String memberPhone){
		this.memberPhone=memberPhone;
	}
	public void setCity(String city){
		this.city=city;
	}
	public void  setDistrict(String district){
		this.district = district;
	}
	public void setAddress(String address){
		this.address=address;
	}
}
