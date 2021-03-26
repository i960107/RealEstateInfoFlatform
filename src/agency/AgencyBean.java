package agency;

public class AgencyBean {
private int no;
private String id;
private String password;
private String agency_name;
private String agent_name;
private String phone1;
private String phone2;
private String phone3;
private String address;
private Boolean certified;
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
public String getAgency_name() {
	return agency_name;
}
public void setAgency_name(String agency_name) {
	this.agency_name = agency_name;
}
public String getAgent_name() {
	return agent_name;
}
public void setAgent_name(String agent_name) {
	this.agent_name = agent_name;
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
public Boolean getCertified() {
	return certified;
}
public void setCertified(Boolean certified) {
	this.certified = certified;
}
public AgencyBean(int no, String id, String password, String agency_name, String agent_name, String phone1,
		String phone2, String phone3, String address, Boolean certified) {
	super();
	this.no = no;
	this.id = id;
	this.password = password;
	this.agency_name = agency_name;
	this.agent_name = agent_name;
	this.phone1 = phone1;
	this.phone2 = phone2;
	this.phone3 = phone3;
	this.address = address;
	this.certified = certified;
}
public AgencyBean() {
	super();
	// TODO Auto-generated constructor stub
}

}