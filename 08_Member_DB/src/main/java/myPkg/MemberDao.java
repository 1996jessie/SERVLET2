package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "sqlid";
	String pw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;	
	
	public MemberDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,id,pw);
			System.out.println("드라이브 로드 및 접속 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}//MemberDao

	public int insertData(MemberBean mb){
		int cnt = -1;

		String sql = "insert into mymem values(seqmem.nextval, ?, ?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getName());
			ps.setString(2, mb.getPassword());

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//insertData
	
	public ArrayList<MemberBean> getMemberList(){
		ArrayList<MemberBean> lists = new ArrayList<MemberBean>();
		String sql = "select * from mymem order by id";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setId(rs.getInt("id"));
				mb.setName(rs.getString("name"));
				mb.setPassword(rs.getString("password"));
				lists.add(mb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	}//getMemberList

	public int deleteData(int id) {
		// TODO Auto-generated method stub
		int cnt = -1;
		try {
			String sql = "delete from mymem where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	public MemberBean getMemberById(int id) {
		MemberBean mb = new MemberBean();
		try {
			String sql = "select * from mymem where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				mb.setId(rs.getInt("id"));
				mb.setName(rs.getString("name"));
				mb.setPassword(rs.getString("password"));
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
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return mb;
	}

	public int updateMember(MemberBean mb) {
		// TODO Auto-generated method stub
		int cnt = -1;
		String sql = "update mymem set name = ?, password = ? where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getName());
			ps.setString(2, mb.getPassword());
			ps.setInt(3, mb.getId());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cnt;
	}
}




