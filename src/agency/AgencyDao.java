package agency;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class AgencyDao {
	private static AgencyDao instance;
 Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	private AgencyDao() {
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

	public static AgencyDao getInstance() {
		if (instance == null) {
			instance = new AgencyDao();
		}
		return instance;
	}

	public ArrayList<ApartmentBean> getApartmentByAgencyType(String id, String address) {
		ArrayList<ApartmentBean> aptlist = new ArrayList<ApartmentBean>();

		String sql = "select * from apartment where agency=? and address like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, "%" + address + "%");
			rs = ps.executeQuery();
			aptlist = getApartmentBeans(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return aptlist;
	}

	public ArrayList<HouseBean> getHousetByAgencyType(String id, String address) {
		ArrayList<HouseBean> houselist = new ArrayList<HouseBean>();

		String sql = "select * from house where agency=? and address like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, "%" + address + "%");
			rs = ps.executeQuery();
			houselist = getHouseBeans(rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return houselist;
	}

	public ArrayList<StudioBean> getStudioByAgencyType(String id, String address) {
		ArrayList<StudioBean> studiolist = new ArrayList<StudioBean>();

		String sql = "select * from studio where agency=? and address like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, "%" + address + "%");
			rs = ps.executeQuery();
			studiolist = getStudioBeans(rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return studiolist;
	}

	public AgencyBean getAgencyById(String id) {
		String sql = "select * from agency where id=?";
		AgencyBean bean = new AgencyBean();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {

				String password = rs.getString("password");
				String agency_name = rs.getString("agency_name");
				String agent_name = rs.getString("agent_name");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String address = rs.getString("address");
				Boolean certified = rs.getBoolean("certified");
				bean.setId(id);
				bean.setPassword(password);
				bean.setAgency_name(agency_name);
				bean.setAgent_name(agent_name);
				bean.setPhone1(phone1);
				bean.setPhone2(phone2);
				bean.setPhone3(phone3);
				bean.setAddress(address);
				bean.setCertified(certified);
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

	public ApartmentBean getApartmentByNo(String no) {
		String sql = "select * from apartment where no=?";
		ApartmentBean bean = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
			rs = ps.executeQuery();
			bean = getApartmentBean(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bean;
	}

	public HouseBean getHouseByNo(String no) {
		String sql = "select * from house where no=?";
		HouseBean bean = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
			rs = ps.executeQuery();
			bean = getHouseBean(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bean;
	}

	public StudioBean getStudioByNo(String no) {
		String sql = "select * from studio where no=?";
		StudioBean bean = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
			rs = ps.executeQuery();
			bean = getStudioBean(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bean;
	}

	public int updateStudio(MultipartRequest multi) {
		int cnt = -1;
		Enumeration fileNames = multi.getFileNames();
		String image = "";
		int i = 1;

		while (fileNames.hasMoreElements()) {
			String filename = (String) fileNames.nextElement();
			String imagename = multi.getOriginalFileName(filename);
			if (imagename != null) {
				image += imagename + " ";
			} else if(imagename==null) {
				String beforeimagefilename = "image" + i;
				String beforeimagename = multi.getParameter(beforeimagefilename);
				if (beforeimagename != null) {
					image += beforeimagename + " ";
				}
			}
			i++;
		}
		System.out.println("updatestudio:" + image);
		String sql = "update studio "
				+ "set type=?,price=?,fee=?,constructiondate=?,moveinDate=?,image=?,area=?,floor=?,totalfloor=?,"
				+ "layout=?,options=?,parking=?,elevator=?,address=?,content=?,recommended=? where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("type"));
			ps.setString(2, multi.getParameter("price"));
			ps.setString(3, multi.getParameter("fee"));
			String constructiondate = multi.getParameter("constructiondate");
			ps.setDate(4, Date.valueOf(constructiondate));
			String moveindate = multi.getParameter("moveinDate");
			ps.setDate(5, Date.valueOf(moveindate));
			ps.setString(6, image);
			ps.setInt(7, Integer.parseInt(multi.getParameter("area")));
			ps.setInt(8, Integer.parseInt(multi.getParameter("floor")));
			ps.setInt(9, Integer.parseInt(multi.getParameter("totalfloor")));
			ps.setString(10, multi.getParameter("layout"));
			ps.setString(11, multi.getParameter("options"));
			ps.setInt(12, Integer.parseInt(multi.getParameter("parking")));
			ps.setString(13, multi.getParameter("elevator"));
			ps.setString(14, multi.getParameter("address"));
			ps.setString(15, multi.getParameter("content"));
			ps.setString(16, multi.getParameter("recommended"));
			ps.setString(17, multi.getParameter("no"));
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

	public int updateHouse(MultipartRequest multi) {
		int cnt = -1;
		Enumeration fileNames = multi.getFileNames();
		String image = "";
		int i = 1;

		while (fileNames.hasMoreElements()) {
			String filename = (String) fileNames.nextElement();
			String imagename = multi.getOriginalFileName(filename);
			if (imagename != null) {
				image += imagename + " ";
			} else if(imagename==null) {
				String beforeimagefilename = "image" + i;
				String beforeimagename = multi.getParameter(beforeimagefilename);
				if (beforeimagename != null) {
					image += beforeimagename + " ";
				}
			}
			i++;
		}
		String sql = "update house "
				+ "set type=?,price=?,fee=?,constructiondate=?,moveinDate=?,image=?,area=?,floor=?,totalfloor=?,"
				+ "layout=?,parking=?,elevator=?,address=?,content=?,recommended=? where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("type"));
			ps.setString(2, multi.getParameter("price"));
			ps.setString(3, multi.getParameter("fee"));
			String constructiondate = multi.getParameter("constructiondate");
			ps.setDate(4, Date.valueOf(constructiondate));
			String moveindate = multi.getParameter("moveindate");
			ps.setDate(5, Date.valueOf(moveindate));
			ps.setString(6, image);
			ps.setInt(7, Integer.parseInt(multi.getParameter("area")));
			ps.setInt(8, Integer.parseInt(multi.getParameter("floor")));
			ps.setInt(9, Integer.parseInt(multi.getParameter("totalfloor")));
			ps.setString(10, multi.getParameter("layout"));
			ps.setInt(11, Integer.parseInt(multi.getParameter("parking")));
			ps.setString(12, multi.getParameter("elevator"));
			ps.setString(13, multi.getParameter("address"));
			ps.setString(14, multi.getParameter("content"));
			ps.setString(15, multi.getParameter("recommended"));
			ps.setString(16, multi.getParameter("no"));
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

	public int updateApartment(MultipartRequest multi) {
		int cnt = -1;
		Enumeration fileNames = multi.getFileNames();
		String image = "";
		int i =0;

		while (fileNames.hasMoreElements()) {
			i++;
			String filename = (String) fileNames.nextElement();
			String imagename = multi.getOriginalFileName(filename);
			if (imagename != null) {
				image += imagename + " ";
			} else if(imagename==null) {
				String beforeimagefilename = "image" + i;
				String beforeimagename = multi.getParameter(beforeimagefilename);
				System.out.println(beforeimagefilename+beforeimagename);
				if (beforeimagename != null) {
					image += beforeimagename + " ";
				}
			}
		}
		System.out.println("updateapartment" + image);
		String sql = "update apartment " + "set name=?,type=?,price=?,moveinDate=?,image=?,unit=?,building=?,area=?,"
				+ "developer=?,constructor=?,parking=?,heatingsystem=?,facilities=?,address=? where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("name"));
			ps.setString(2, multi.getParameter("type"));
			ps.setString(3, multi.getParameter("price"));
			String moveindate = multi.getParameter("moveindate");
			ps.setDate(4, Date.valueOf(moveindate));
			ps.setString(5, image);
			ps.setInt(6, Integer.parseInt(multi.getParameter("unit")));
			ps.setInt(7, Integer.parseInt(multi.getParameter("building")));
			ps.setInt(8, Integer.parseInt(multi.getParameter("area")));
			ps.setString(9, multi.getParameter("developer"));
			ps.setString(10, multi.getParameter("constructor"));
			ps.setInt(11, Integer.parseInt(multi.getParameter("parking")));
			ps.setString(12, multi.getParameter("heatingsystem"));
			ps.setString(13, multi.getParameter("facilities"));
			ps.setString(14, multi.getParameter("address"));
			ps.setString(15, multi.getParameter("no"));
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
		String sql = "select * from agency where id='" + id + "'";
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
	public int deleteApt(String no) {
		int cnt = -1;
		String sql = "delete from apartment where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
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

	public int deleteHouse(String no) {
		int cnt = -1;
		String sql = "delete from house where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
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

	public int deleteStudio(String no) {
		int cnt = -1;
		String sql = "delete from studio where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
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

	public int insertApartment(MultipartRequest multi, String agency) {
		int cnt = -1;
		Enumeration fileNames = multi.getFileNames();
		String image = "";
		int i = 0;
		while (fileNames.hasMoreElements()) {
			String filename = (String) fileNames.nextElement();
			String imagename = multi.getOriginalFileName(filename);
			System.out.print("insert apartment :" + i + imagename);
			if (imagename != null)
				image += imagename + " ";
			i++;
		}
		System.out.print("filename");
		String sql = "insert into apartment values(apartment_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("name"));
			ps.setString(2, multi.getParameter("type"));
			ps.setString(3, multi.getParameter("price"));
			String moveindate = multi.getParameter("moveindate");
			if (moveindate == null) {
				ps.setNull(4, java.sql.Types.NULL);
			} else {
				ps.setDate(4, Date.valueOf(moveindate));
			}
			ps.setString(5, image);
			ps.setInt(6, Integer.parseInt(multi.getParameter("unit")));
			ps.setInt(7, Integer.parseInt(multi.getParameter("building")));
			ps.setInt(8, Integer.parseInt(multi.getParameter("area")));
			ps.setString(9, multi.getParameter("developer"));
			ps.setString(10, multi.getParameter("constructor"));
			ps.setInt(11, Integer.parseInt(multi.getParameter("parking")));
			ps.setString(12, multi.getParameter("heatingsystem"));
			ps.setString(13, multi.getParameter("facilities"));
			ps.setString(14, multi.getParameter("address"));
			ps.setString(15, agency);
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

	public int getNoById(String id) {
		int no = 0;
		String sql = "select no from agency where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				no = rs.getInt("no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return no;

	}

	public ApartmentBean getApartmentBean(ResultSet rs) throws SQLException {
		ApartmentBean bean = null;
		while (rs.next()) {
			int no = rs.getInt("no");
			String name = rs.getString("name");
			String type = rs.getString("type");
			String price = rs.getString("price");
			Date moveinDate = rs.getDate("moveinDate");
			String image = rs.getString("image");
			int unit = rs.getInt("unit");
			int building = rs.getInt("building");
			int area = rs.getInt("area");
			String developer = rs.getString("developer");
			String constructor = rs.getString("constructor");
			int parking = rs.getInt("parking");
			String heatingsystem = rs.getString("heatingsystem");
			String facilities = rs.getString("facilities");
			String address = rs.getString("address");
			String id = rs.getString("agency");
			bean = new ApartmentBean(no, name, type, price, moveinDate, image, unit, building, area, developer,
					constructor, parking, heatingsystem, facilities, address, id);
		}
		return bean;
	}

	public ArrayList<ApartmentBean> getApartmentBeans(ResultSet rs) throws SQLException {
		ApartmentBean bean = null;
		ArrayList<ApartmentBean> aptlist = new ArrayList<ApartmentBean>();
		while (rs.next()) {
			int no = rs.getInt("no");
			String name = rs.getString("name");
			String type = rs.getString("type");
			String price = rs.getString("price");
			Date moveinDate = rs.getDate("moveinDate");
			String image = rs.getString("image");
			int unit = rs.getInt("unit");
			int building = rs.getInt("building");
			int area = rs.getInt("area");
			String developer = rs.getString("developer");
			String constructor = rs.getString("constructor");
			int parking = rs.getInt("parking");
			String heatingsystem = rs.getString("heatingsystem");
			String facilities = rs.getString("facilities");
			String address = rs.getString("address");
			String id = rs.getString("agency");
			bean = new ApartmentBean(no, name, type, price, moveinDate, image, unit, building, area, developer,
					constructor, parking, heatingsystem, facilities, address, id);
			aptlist.add(bean);
		}
		return aptlist;
	}

	public HouseBean getHouseBean(ResultSet rs) throws SQLException {
		HouseBean bean = null;
		while (rs.next()) {
			int no = rs.getInt("no");
			String type = rs.getString("type");
			String price = rs.getString("price");
			String fee = rs.getString("fee");
			Date constructiondate = rs.getDate("constructiondate");
			Date moveinDate = rs.getDate("moveinDate");
			String image = rs.getString("image");
			int area = rs.getInt("area");
			int floor = rs.getInt("floor");
			int totalfloor = rs.getInt("totalfloor");
			String layout = rs.getString("layout");
			int parking = rs.getInt("parking");
			Boolean elevator = rs.getBoolean("elevator");
			String address = rs.getString("address");
			String content = rs.getString("content");
			String agency = rs.getString("agency");
			Boolean recommended = rs.getBoolean("recommended");
			bean = new HouseBean(no, type, price, fee, constructiondate, moveinDate, image, area, floor, totalfloor,
					layout, parking, elevator, address, content, agency, recommended);
		}
		return bean;
	}

	public ArrayList<HouseBean> getHouseBeans(ResultSet rs) throws SQLException {
		HouseBean bean = null;
		ArrayList<HouseBean> houselist = new ArrayList<HouseBean>();
		while (rs.next()) {
			int no = rs.getInt("no");
			String type = rs.getString("type");
			String price = rs.getString("price");
			String fee = rs.getString("fee");
			Date constructiondate = rs.getDate("constructiondate");
			Date moveinDate = rs.getDate("moveinDate");
			String image = rs.getString("image");
			int area = rs.getInt("area");
			int floor = rs.getInt("floor");
			int totalfloor = rs.getInt("totalfloor");
			String layout = rs.getString("layout");
			int parking = rs.getInt("parking");
			Boolean elevator = rs.getBoolean("elevator");
			String address = rs.getString("address");
			String content = rs.getString("content");
			String agency = rs.getString("agency");
			Boolean recommended = rs.getBoolean("recommended");
			bean = new HouseBean(no, type, price, fee, constructiondate, moveinDate, image, area, floor, totalfloor,
					layout, parking, elevator, address, content, agency, recommended);
			houselist.add(bean);
		}
		return houselist;
	}

	public ArrayList<StudioBean> getStudioBeans(ResultSet rs) throws SQLException {
		StudioBean bean = null;
		ArrayList<StudioBean> studiolist = new ArrayList<StudioBean>();
		while (rs.next()) {
			int no = rs.getInt("no");
			String type = rs.getString("type");
			String price = rs.getString("price");
			String fee = rs.getString("fee");
			Date constructiondate = rs.getDate("constructiondate");
			Date moveinDate = rs.getDate("moveinDate");
			String image = rs.getString("image");
			int area = rs.getInt("area");
			int floor = rs.getInt("floor");
			int totalfloor = rs.getInt("totalfloor");
			String layout = rs.getString("layout");
			String options = rs.getString("options");
			int parking = rs.getInt("parking");
			Boolean elevator = rs.getBoolean("elevator");
			String address = rs.getString("address");
			String content = rs.getString("content");
			String agency = rs.getString("agency");
			Boolean recommended = rs.getBoolean("recommended");
			bean = new StudioBean(no, type, price, fee, constructiondate, moveinDate, image, area, floor, totalfloor,
					layout, options, parking, elevator, address, content, agency, recommended);
			studiolist.add(bean);
		}
		return studiolist;
	}

	public StudioBean getStudioBean(ResultSet rs) throws SQLException {
		StudioBean bean = null;
		while (rs.next()) {
			int no = rs.getInt("no");
			String type = rs.getString("type");
			String price = rs.getString("price");
			String fee = rs.getString("fee");
			Date constructiondate = rs.getDate("constructiondate");
			Date moveinDate = rs.getDate("moveinDate");
			String image = rs.getString("image");
			int area = rs.getInt("area");
			int floor = rs.getInt("floor");
			int totalfloor = rs.getInt("totalfloor");
			String layout = rs.getString("layout");
			String options = rs.getString("options");
			int parking = rs.getInt("parking");
			Boolean elevator = rs.getBoolean("elevator");
			String address = rs.getString("address");
			String content = rs.getString("content");
			String agency = rs.getString("agency");
			Boolean recommended = rs.getBoolean("recommended");
			bean = new StudioBean(no, type, price, fee, constructiondate, moveinDate, image, area, floor, totalfloor,
					layout, options, parking, elevator, address, content, agency, recommended);
		}
		return bean;
	}

	public ArrayList<ApartmentBean> getApartmentByAgency(String id) {
		ArrayList<ApartmentBean> aptlist = new ArrayList<ApartmentBean>();
		String sql = "select * from apartment where agency=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			aptlist = getApartmentBeans(rs);

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

	public ArrayList<HouseBean> getHouseByAgency(String id) {
		ArrayList<HouseBean> houselist = new ArrayList<HouseBean>();
		String sql = "select * from house where agency=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			houselist = getHouseBeans(rs);

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

	public ArrayList<StudioBean> getStudioByAgency(String id) {
		ArrayList<StudioBean> studiolist = new ArrayList<StudioBean>();
		String sql = "select * from studio where agency=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			studiolist = getStudioBeans(rs);
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

	public int insertStudio(MultipartRequest multi, String agency) {
		int cnt = -1;
		Enumeration fileNames = multi.getFileNames();
		String image = "";
		while (fileNames.hasMoreElements()) {
			String filename = (String) fileNames.nextElement();
			String imagename = multi.getOriginalFileName(filename);
			if (imagename != null)
				image += imagename + " ";
		}
		String optionsArr[] = multi.getParameterValues("options");
		String options = "";
		for (String option : optionsArr) {
			options += option + " ";
		}
		String sql = "insert into studio values(studio_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("type"));
			ps.setString(2, multi.getParameter("price"));
			ps.setString(3, multi.getParameter("fee"));
			ps.setString(4, multi.getParameter("constructiondate"));
			ps.setString(5, multi.getParameter("moveintDate"));
			ps.setString(6, image);
			ps.setInt(7, Integer.parseInt(multi.getParameter("area")));
			ps.setInt(8, Integer.parseInt(multi.getParameter("floor")));
			ps.setInt(9, Integer.parseInt(multi.getParameter("totalfloor")));
			ps.setString(10, multi.getParameter("layout"));
			ps.setString(11, options);
			ps.setInt(12, Integer.parseInt(multi.getParameter("parking")));
			ps.setBoolean(13, Boolean.parseBoolean(multi.getParameter("elevator")));
			ps.setString(14, multi.getParameter("address"));
			ps.setString(15, multi.getParameter("content"));
			ps.setString(16, agency);
			ps.setBoolean(17, Boolean.parseBoolean(multi.getParameter("recommended")));
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

	public ArrayList<ApartmentBean> searchApartment(String type, String address) {
		ArrayList<ApartmentBean> aptlist = new ArrayList<ApartmentBean>();

		String sql = "select * from apartment where type=? and address like ? ";
		System.out.print("type:" + type);
		System.out.print("address:" + address);
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ps.setString(2, "%" + address + "%");
			rs = ps.executeQuery();
			aptlist = getApartmentBeans(rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return aptlist;
	}

	public boolean isRecommendedByCertifiedAgency(String kind, String no) {
		boolean isRecommended = false;
		String sql = "select recommended from " + kind
				+ " a join agency on a.agency=agency.id where certified=1 and a.no=? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
			rs = ps.executeQuery();
			if (rs.next()) {
				isRecommended = rs.getBoolean("recommended");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return isRecommended;
	}

	public ArrayList<HouseBean> searchHouse(String type, String address) {
		ArrayList<HouseBean> houselist = new ArrayList<HouseBean>();

		String sql = "select * from house join agency on house.agency=agency.id where type=? and house.address like ? order by recommended asc , certified asc ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ps.setString(2, "%" + address + "%");
			rs = ps.executeQuery();
			houselist = getHouseBeans(rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return houselist;
	}

	public ArrayList<StudioBean> searchStudio(String type, String address) {
		ArrayList<StudioBean> studiolist = new ArrayList<StudioBean>();

		String sql = "select * from studio join agency on studio.agency=agency.id where type=? and studio.address like ? order by recommended asc , certified asc ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ps.setString(2, "%" + address + "%");
			rs = ps.executeQuery();
			studiolist = getStudioBeans(rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return studiolist;
	}

	public int insertHouse(MultipartRequest multi, String agency) {
		int cnt = -1;
		Enumeration fileNames = multi.getFileNames();
		String image = "";
		while (fileNames.hasMoreElements()) {
			String filename = (String) fileNames.nextElement();
			String imagename = multi.getOriginalFileName(filename);
			if (imagename != null)
				image += imagename + " ";
		}
		String sql = "insert into house values(house_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("type"));
			ps.setString(2, multi.getParameter("price"));
			ps.setString(3, multi.getParameter("fee"));
			String constructiondate = multi.getParameter("constructiondate");
			ps.setDate(4, Date.valueOf(constructiondate));
			String moveindate = multi.getParameter("moveinDate");
			ps.setDate(5, Date.valueOf(moveindate));
			ps.setString(6, image);
			ps.setInt(7, Integer.parseInt(multi.getParameter("area")));
			ps.setInt(8, Integer.parseInt(multi.getParameter("floor")));
			ps.setInt(9, Integer.parseInt(multi.getParameter("totalfloor")));
			ps.setString(10, multi.getParameter("layout"));
			ps.setInt(11, Integer.parseInt(multi.getParameter("parking")));
			ps.setBoolean(12, Boolean.parseBoolean(multi.getParameter("elevator")));
			ps.setString(13, multi.getParameter("address"));
			ps.setString(14, multi.getParameter("content"));
			ps.setString(15, agency);
			ps.setBoolean(16, Boolean.parseBoolean(multi.getParameter("recommended")));
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

	public int updateAgency(AgencyBean bean) {
		int cnt = -1;
		System.out.println(bean.getId() + bean.getPassword() + bean.getAgency_name() + bean.getPhone1()
				+ bean.getAddress() + bean.getCertified());
		String sql = "update agency set password=?,agency_name=?,agent_name=?,phone1=?,phone2=?,phone3=?,address=?,certified=? where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(9, bean.getId());
			ps.setString(1, bean.getPassword());
			ps.setString(2, bean.getAgency_name());
			ps.setString(3, bean.getAgent_name());
			ps.setString(4, bean.getPhone1());
			ps.setString(5, bean.getPhone2());
			ps.setString(6, bean.getPhone3());
			ps.setString(7, bean.getAddress());
			ps.setBoolean(8, bean.getCertified());
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

	public int insertAgency(AgencyBean bean) {
		int cnt = -1;
		String sql = "insert into agency values(agency_seq.nextval,?,?,?,?,?,?,?,?,?)";
		try {
			System.out.println(bean.getId());
			System.out.println(bean.getPassword());
			System.out.println(bean.getAgency_name());
			System.out.println(bean.getAgent_name());
			System.out.println(bean.getAddress());
			System.out.println(bean.getCertified());
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getPassword());
			ps.setString(3, bean.getAgency_name());
			ps.setString(4, bean.getAgent_name());
			ps.setString(5, bean.getPhone1());
			ps.setString(6, bean.getPhone2());
			ps.setString(7, bean.getPhone3());
			ps.setString(8, bean.getAddress());
			ps.setBoolean(9, bean.getCertified());
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

	public boolean logIn(String id, String password) {
		boolean loginResult = false;
		String sql = "select * from agency where id=? and password=?";
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

	public String findIdbyName(String agency_name, String agent_name) {
		String id = null;
		String sql = "select * from agency where agency_name=? and agent_name=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, agency_name);
			ps.setString(2, agent_name);
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
