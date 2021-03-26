package agency;

import java.util.Date;

public class ApartmentBean {
private int no;
private String name;
private String type;
private String price;
private Date moveinDate;
private String image ;
private int unit;
private int building;
private int area;
private String developer;
private String constructor ;
private int parking;
private String heatingsystem;
private String facilities ;
private String address;
private String agency;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public Date getMoveinDate() {
	return moveinDate;
}
public void setMoveinDate(Date moveinDate) {
	this.moveinDate = moveinDate;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public int getUnit() {
	return unit;
}
public void setUnit(int unit) {
	this.unit = unit;
}
public int getBuilding() {
	return building;
}
public void setBuilding(int building) {
	this.building = building;
}
public int getArea() {
	return area;
}
public void setArea(int area) {
	this.area = area;
}
public String getDeveloper() {
	return developer;
}
public void setDeveloper(String developer) {
	this.developer = developer;
}
public String getConstructor() {
	return constructor;
}
public void setConstructor(String constructor) {
	this.constructor = constructor;
}
public int getParking() {
	return parking;
}
public void setParking(int parking) {
	this.parking = parking;
}
public String getHeatingsystem() {
	return heatingsystem;
}
public void setHeatingsystem(String heatingsystem) {
	this.heatingsystem = heatingsystem;
}
public String getFacilities() {
	return facilities;
}
public void setFacilities(String facilities) {
	this.facilities = facilities;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getAgency() {
	return agency;
}
public void setAgency(String agency) {
	this.agency = agency;
}
public ApartmentBean(int no, String name, String type, String price, Date moveinDate, String image, int unit,
		int building, int area, String developer, String constructor, int parking, String heatingsystem,
		String facilities, String address, String agency) {
	super();
	this.no = no;
	this.name = name;
	this.type = type;
	this.price = price;
	this.moveinDate = moveinDate;
	this.image = image;
	this.unit = unit;
	this.building = building;
	this.area = area;
	this.developer = developer;
	this.constructor = constructor;
	this.parking = parking;
	this.heatingsystem = heatingsystem;
	this.facilities = facilities;
	this.address = address;
	this.agency = agency;
}
public ApartmentBean() {
	super();
	// TODO Auto-generated constructor stub
}

}
