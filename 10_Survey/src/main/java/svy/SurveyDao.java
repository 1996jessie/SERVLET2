package svy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SurveyDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public SurveyDao(String driver, String url, String dbid, String dbpw){

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbid, dbpw);
			System.out.println("드라이브 로드 및 계정 접속 완료");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//SurveyDao

	public int insertSurvey(SurveyBean sb) {

		int cnt = -1;
		String sql = "insert into survey values(seqmy.nextval, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sb.getName());
			ps.setString(2, sb.getCompany());
			ps.setString(3, sb.getEmail());
			ps.setString(4, sb.getSatisfaction());
			ps.setString(5, sb.getPart());
			ps.setString(6, sb.getHowto());
			ps.setInt(7, sb.getAgree());

			cnt = ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//insertSurvey

	public ArrayList<SurveyBean> getSurveyList() {

		ArrayList<SurveyBean> lists = new ArrayList<SurveyBean>();
		String sql = "select * from survey order by no";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				SurveyBean sb = new SurveyBean();
				sb.setNo(rs.getInt("no"));
				sb.setName(rs.getString("name"));
				sb.setCompany(rs.getString("company"));
				sb.setEmail(rs.getString("email"));
				sb.setSatisfaction(rs.getString("satisfaction"));
				sb.setPart(rs.getString("part")); 
				sb.setHowto(rs.getString("howto"));
				sb.setAgree(rs.getInt("agree"));
				lists.add(sb);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null) {
					ps.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	}//getSurveyList

	public int deleteSurvey(int no) {
		int cnt = -1;
		try {
			String sql = "delete from survey where no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
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
	}//deleteSurvey

	public SurveyBean getSurveyByNo(int no) {
		SurveyBean sb = new SurveyBean();
		try {
			String sql = "select * from survey where no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				sb.setNo(rs.getInt("no"));
				sb.setName(rs.getString("name"));
				sb.setCompany(rs.getString("company"));
				sb.setEmail(rs.getString("email"));
				sb.setSatisfaction(rs.getString("satisfaction"));
				sb.setPart(rs.getString("part")); 
				sb.setHowto(rs.getString("howto"));
				sb.setAgree(rs.getInt("agree"));
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
		return sb;
	}//getSurveyByNo

	public int updateSurvey(SurveyBean sb) {
		int cnt = -1;
		try {
			String sql = "update survey set name = ?, company = ?, email = ?, satisfaction = ?, part = ?, howto = ?, agree = ? where no = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sb.getName());
			ps.setString(2, sb.getCompany());
			ps.setString(3, sb.getEmail());
			ps.setString(4, sb.getSatisfaction());
			ps.setString(5, sb.getPart());
			ps.setString(6, sb.getHowto());
			ps.setInt(7, sb.getAgree());
			ps.setInt(8, sb.getNo());
			
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
	}//updateSurvey	
}