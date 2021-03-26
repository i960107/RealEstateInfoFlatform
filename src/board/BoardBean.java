package board;

import java.util.Date;

public class BoardBean {
	private int no;
private String member_id;
private String agency_id;
private String kind;
private int rs_no;
private String content;
private Date regdate;
private int ref;
private int re_step;
public BoardBean() {
	super();
	// TODO Auto-generated constructor stub
}
public BoardBean(int no, String member_id, String agency_id, String kind, int rs_no, String content, Date regdate,
		int ref, int re_step) {
	super();
	this.no = no;
	this.member_id = member_id;
	this.agency_id = agency_id;
	this.kind = kind;
	this.rs_no = rs_no;
	this.content = content;
	this.regdate = regdate;
	this.ref = ref;
	this.re_step = re_step;
}
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getMember_id() {
	return member_id;
}
public void setMember_id(String member_id) {
	this.member_id = member_id;
}
public String getAgency_id() {
	return agency_id;
}
public void setAgency_id(String agency_id) {
	this.agency_id = agency_id;
}
public String getKind() {
	return kind;
}
public void setKind(String kind) {
	this.kind = kind;
}
public int getRs_no() {
	return rs_no;
}
public void setRs_no(int rs_no) {
	this.rs_no = rs_no;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
public int getRef() {
	return ref;
}
public void setRef(int ref) {
	this.ref = ref;
}
public int getRe_step() {
	return re_step;
}
public void setRe_step(int re_step) {
	this.re_step = re_step;
}
}
