package com.example.ajax;
import java.io.Serializable;
import java.util.Date;
//JSON 으로 VO 클래스를 변환하기 위해서 Serializable 인터페이스 상속
public class ContactVO implements Serializable {
	//경고 장비용
	private static final long serialVersionUID = 1L;

	private Integer no;
	private String name;
	private Date birthDate;
	private String email;
	private String phone;
	private String address;
	
	public ContactVO() {}
	public ContactVO(Integer no, String name, Date birthDate, String email,
			String phone, String address) {
		super();
		this.no = no;
		this.name = name;
		this.birthDate = birthDate;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public Integer getNo() {
		return no;	}
	public void setNo(Integer no) {
		this.no = no;	}
	public String getName() {
		return name;	}
	public void setName(String name) {
		this.name = name;	}
	public Date getBirthDate() {
		return birthDate;	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;	}
	public String getEmail() {
		return email;	}
	
	public void setEmail(String email) {
		this.email = email;	}
	public String getPhone() {
		return phone;	}
	public void setPhone(String phone) {
		this.phone = phone;	}
	public String getAddress() {
		return address;	}
	public void setAddress(String address) {
		this.address = address;	}

}//end class
