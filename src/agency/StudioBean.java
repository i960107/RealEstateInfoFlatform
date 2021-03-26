package agency;

import java.util.Date;

public class StudioBean {
	private int no;
	private String type;
	private String price;
	private String fee;
	private Date constructiondate;
	private Date moveinDate;
	private String image;
	private int area;
	private int floor;
	private int totalfloor;
	private String layout;
	private String options;
	private int parking;
	private boolean elevator;
	private String address;
	private String content;
	private String agency;
	private boolean recommended;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public Date getConstructiondate() {
		return constructiondate;
	}
	public void setConstructiondate(Date constructiondate) {
		this.constructiondate = constructiondate;
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
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public int getTotalfloor() {
		return totalfloor;
	}
	public void setTotalfloor(int totalfloor) {
		this.totalfloor = totalfloor;
	}
	public String getLayout() {
		return layout;
	}
	public void setLayout(String layout) {
		this.layout = layout;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public boolean isElevator() {
		return elevator;
	}
	public void setElevator(boolean elevator) {
		this.elevator = elevator;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public boolean isRecommended() {
		return recommended;
	}
	public void setRecommended(boolean recommended) {
		this.recommended = recommended;
	}
	public StudioBean(int no, String type, String price, String fee, Date constructiondate, Date moveinDate,
			String image, int area, int floor, int totalfloor, String layout, String options, int parking,
			boolean elevator, String address, String content, String agency, boolean recommended) {
		super();
		this.no = no;
		this.type = type;
		this.price = price;
		this.fee = fee;
		this.constructiondate = constructiondate;
		this.moveinDate = moveinDate;
		this.image = image;
		this.area = area;
		this.floor = floor;
		this.totalfloor = totalfloor;
		this.layout = layout;
		this.options = options;
		this.parking = parking;
		this.elevator = elevator;
		this.address = address;
		this.content = content;
		this.agency = agency;
		this.recommended = recommended;
	}
	public StudioBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
