package myPkg;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.*;
import javax.sql.*;

public class MemberDao {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static MemberDao instance;

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	} //getInstance

	private MemberDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env"); 
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
			conn = ds.getConnection(); 
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// MemberDao
	
	public int insertMember(MemberBean mb) {
		int cnt = -1;
		try {
			String sql = "insert into member values (m_seq.nextval, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getPasswd());
			ps.setString(3, mb.getName());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cnt;
	}//insertMember

	public ArrayList<MemberBean> getMemberList() {
		// TODO Auto-generated method stub
		ArrayList<MemberBean> lists = new ArrayList<MemberBean>();
		try {
			String sql = "select * from member order by num";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setNum(rs.getInt("num"));
				mb.setId(rs.getString("id"));
				mb.setPasswd(rs.getString("passwd"));
				mb.setName(rs.getString("name"));
				mb.setRegister(String.valueOf(rs.getDate("register")));
				
				lists.add(mb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lists;
	}//getMemberList

	public int deleteMember(int num) {
		int cnt = -1;
		try {
			String sql = "delete from member where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		return cnt;
	}//deleteMember

	public MemberBean getMemberByNum(int num) {
		// TODO Auto-generated method stub
		MemberBean mb = new MemberBean();
		try {
			String sql = "select * from member where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				mb.setNum(rs.getInt("num"));
				mb.setId(rs.getString("id"));
				mb.setPasswd(rs.getString("passwd"));
				mb.setName(rs.getString("name"));
				mb.setRegister(String.valueOf(rs.getDate("register")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return mb;
	}//getMemberByNum

	public int updateMember(MemberBean mb) {
		int cnt = -1;
		try {
			String sql = "update member set id = ?, passwd = ?, name = ? where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getPasswd());
			ps.setString(3, mb.getName());
			ps.setInt(4, mb.getNum());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cnt;
	}//updateMember
}
