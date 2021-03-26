package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDao {
private static BoardDao instance;
Connection conn;
PreparedStatement ps;
ResultSet rs;

private BoardDao() {
	Context initContext;
	try {
		initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("접속 성공");
	} catch (NamingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
public static BoardDao getInstance() {
	if(instance==null) {
		instance=new BoardDao();
	}
	return instance;
}
public int insertQuestion(BoardBean bean) {
int cnt=-1;
SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
String regdate=df.format(System.currentTimeMillis());
String sql="insert into board values(board_seq.nextval,?,?,?,?,?,?,board_seq.currval,0)";
try {
	ps=conn.prepareStatement(sql);
	ps.setString(1, bean.getMember_id());
	ps.setString(2, bean.getAgency_id());
	ps.setString(3, bean.getKind());
	ps.setInt(4, bean.getRs_no());
	ps.setString(5, bean.getContent());
	ps.setString(6,regdate);
	cnt=ps.executeUpdate();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

return cnt;
}
public ArrayList<BoardBean> getQuestionById(String id){
	ArrayList<BoardBean> blist=new ArrayList<BoardBean>();
	String sql="select * from board where member_id=? order by ref asc, re_step asc";
	try {
		ps=conn.prepareStatement(sql);
		ps.setString(1, id);
		rs=ps.executeQuery();
			
		while(rs.next()) {
			int no=rs.getInt("no");
			int rs_no=rs.getInt("rs_no");
			int ref=rs.getInt("ref");
			int re_step=rs.getInt("re_step");
			String member_id=rs.getString("member_id");
			String agency_id=rs.getString("agency_id");
			Date regdate=rs.getDate("regDate");
			String kind=rs.getString("kind");
			String content=rs.getString("content");
			BoardBean bean=new BoardBean(no,member_id,agency_id,kind,rs_no,content,regdate,ref,re_step);
			blist.add(bean);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return blist;
}
}