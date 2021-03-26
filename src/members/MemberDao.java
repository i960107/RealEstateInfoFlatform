package members;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import agency.AgencyDao;
import agency.ApartmentBean;
import agency.HouseBean;
import agency.StudioBean;

public class MemberDao {
	private Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	private static MemberDao instance;

	private MemberDao() {
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

	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}

	AgencyDao adao = AgencyDao.getInstance();

	public ArrayList<ApartmentBean> getApartmentDibs(String id) {
		ArrayList<ApartmentBean> aptlist = null;
		String sql = "select * from apartment a join dibs d on a.no=d.no where kind='apartment' and id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			aptlist = adao.getApartmentBeans(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return aptlist;

	}

	public ArrayList<HouseBean> getHouseDibs(String id) {
		ArrayList<HouseBean> houselist = null;
		String sql = "select * from house a join dibs d on a.no=d.no where kind='house' and id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			houselist = adao.getHouseBeans(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return houselist;

	}

	public ArrayList<StudioBean> getStudioDibs(String id) {
		ArrayList<StudioBean> studiolist = null;
		String sql = "select * from studio a join dibs d on a.no=d.no where kind='studio' and id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			studiolist = adao.getStudioBeans(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return studiolist;

	}

	public MemberBean getMemberById(String id) {
		MemberBean bean = new MemberBean();
		String sql = "select * from members where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				bean.setNo(Integer.parseInt(rs.getString("no")));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setPassword(rs.getString("password"));
				bean.setEmail(rs.getString("email"));
				bean.setAddress(rs.getString("address"));
				bean.setPhone1(rs.getString("phone1"));
				bean.setPhone2(rs.getString("phone2"));
				bean.setPhone3(rs.getString("phone3"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return bean;

	}

	public boolean getDibs(String id, String kind, String no) {
		boolean isDibs = false;
		String sql = "select * from dibs where id=? and kind=? and no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, kind);
			ps.setString(3, no);
			rs = ps.executeQuery();
			if (rs.next()) {
				isDibs = true;
				System.out.print(isDibs);
			} else {
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return isDibs;
	}

	public int insertMember(MemberBean bean) {
		int cnt = -1;
		String sql = "insert into members values(member_Seq.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getPassword());
			ps.setString(3, bean.getName());
			ps.setString(4, bean.getEmail());
			ps.setString(5, bean.getPhone1());
			ps.setString(6, bean.getPhone2());
			ps.setString(7, bean.getPhone3());
			ps.setString(8, bean.getAddress());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}

		return cnt;
	}

	public int insertDibs(String id, String kind, String no) {
		int cnt = -1;
		String sql = "insert into dibs values(?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, kind);
			ps.setString(3, no);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		}
		return cnt;
	}

	public int deleteDibs(String id, String kind, String no) {
		int cnt = -1;
		String sql = "delete from dibs where id=? and kind=?and no=? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, kind);
			ps.setString(3, no);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		}
		return cnt;
	}

	public int updateMember(MemberBean bean) {
		int cnt = -1;
		String sql = "update members set id=?,password=?,name=?,email=?,phone1=?,phone2=?,phone3=?,address=? where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getPassword());
			ps.setString(3, bean.getName());
			ps.setString(4, bean.getEmail());
			ps.setString(5, bean.getPhone1());
			ps.setString(6, bean.getPhone2());
			ps.setString(7, bean.getPhone3());
			ps.setString(8, bean.getAddress());
			ps.setInt(9, bean.getNo());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}

		return cnt;
	}

	public boolean IdDuplicateCheck(String id) {
		boolean idChecked = true;
		String sql = "select * from members where id='" + id + "'";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				idChecked = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}

		return idChecked;
	}

	public boolean logIn(String id, String password) {
		boolean loginResult = false;
		String sql = "select * from members where id=? and password=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				loginResult = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return loginResult;
	}

	public String findIdbyNameEmail(String name, String email) {
		String id = null;
		String sql = "select * from members where name=? and email=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getString("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
}
