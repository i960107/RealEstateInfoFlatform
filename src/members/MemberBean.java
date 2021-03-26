package members;

public class MemberBean {
private int no;
private String id;
private String password;
private String name;
private String phone1;
private String phone2;
private String phone3;
private String address;
private String email;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPhone1() {
	return phone1;
}
public void setPhone1(String phone1) {
	this.phone1 = phone1;
}
public String getPhone2() {
	return phone2;
}
public void setPhone2(String phone2) {
	this.phone2 = phone2;
}
public String getPhone3() {
	return phone3;
}
public void setPhone3(String phone3) {
	this.phone3 = phone3;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public MemberBean(int no, String id, String password, String name, String phone1, String phone2, String phone3,
		String address, String email) {
	super();
	this.no = no;
	this.id = id;
	this.password = password;
	this.name = name;
	this.phone1 = phone1;
	this.phone2 = phone2;
	this.phone3 = phone3;
	this.address = address;
	this.email = email;
}
public MemberBean() {
	super();
	// TODO Auto-generated constructor stub
}

}
