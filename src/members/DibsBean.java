package members;

public class DibsBean {
private String id;
private String kind;
private int no;
private boolean dibs;
public DibsBean() {
	super();
	// TODO Auto-generated constructor stub
}
public DibsBean(String id, String kind, int no, boolean dibs) {
	super();
	this.id = id;
	this.kind = kind;
	this.no = no;
	this.dibs = dibs;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getKind() {
	return kind;
}
public void setKind(String kind) {
	this.kind = kind;
}
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public boolean isDibs() {
	return dibs;
}
public void setDibs(boolean dibs) {
	this.dibs = dibs;
}
}
