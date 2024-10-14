package myPkg;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.*;

public class MovieDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static MovieDao instance;

	public static MovieDao getInstance() {
		if (instance == null) {
			instance = new MovieDao();
		}
		return instance;
	}//getInstance

	private MovieDao() {
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
	}//MovieDao
	
	public ArrayList<MovieBean> getAllMovies() {  
		ArrayList<MovieBean> lists = new ArrayList<MovieBean>();
		String sql = "select * from movie order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next()) {
				MovieBean mb = new MovieBean();
				mb.setNum(rs.getInt("num"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setGenre(rs.getString("genre"));
				mb.setTime(rs.getString("time"));
				mb.setPartner(rs.getInt("partner"));
				mb.setMemo(rs.getString("memo"));
				
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
	}//getAllMovies
	
	public int insertMovie(MovieBean mb) {
		int cnt = -1;
		String sql = "insert into movie values (mv_seq.nextval,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getName());
			ps.setInt(3, mb.getAge());
			ps.setString(4, mb.getGenre());
			ps.setString(5, mb.getTime());
			ps.setInt(6, mb.getPartner());
			ps.setString(7, mb.getMemo());
			
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
	}//insertMovie

	public boolean searchId(String userId) {
		boolean flag = false;
		try {
			String sql = "select * from movie where upper(id) = upper(?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				flag = true;
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
		return flag;
	}

	public int deleteMovie(int num) {
		int cnt = -1;
		try {
			String sql = "delete from movie where num = ?";
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
	}

	public int deleteAllMovie(String[] rowcheck) {
		int cnt = -1;
		int i;
		try {
			String sql = "delete from movie where num = ?";
			for(i=1;i<rowcheck.length;i++) {
				sql += " or num = ?";
			}
			//System.out.println("완성된 sql : " + sql);
			ps = conn.prepareStatement(sql);
			for(i=0;i<rowcheck.length;i++) {
				ps.setInt(i+1, Integer.parseInt(rowcheck[i]));
			}
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
	}

	public MovieBean getMovieByNum(int num) {
		// TODO Auto-generated method stub
		MovieBean mb = null;
		try {
			String sql = "select * from movie where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				mb = new MovieBean();
				mb.setNum(rs.getInt("num"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setGenre(rs.getString("genre"));
				mb.setTime(rs.getString("time"));
				mb.setPartner(rs.getInt("partner"));
				mb.setMemo(rs.getString("memo"));
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
	}

	public int updateMovie(MovieBean mb) {
		// TODO Auto-generated method stub
		int cnt = -1;
		try {
			String sql = "update movie set id = ?, name = ?, age = ?, genre = ?, time = ?, partner = ?, memo = ? where num = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getName());
			ps.setInt(3, mb.getAge());
			ps.setString(4, mb.getGenre());
			ps.setString(5, mb.getTime());
			ps.setInt(6, mb.getPartner());
			ps.setString(7, mb.getMemo());
			ps.setInt(8, mb.getNum());
			
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
	}
}
