package prd;

import java.sql.*;
import java.util.ArrayList;

public class ProductDao {

	Connection conn = null;
	PreparedStatement ps =null;
	ResultSet rs = null;

	public ProductDao(String driver,String url,String dbid,String dbpw){
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");
			conn = DriverManager.getConnection(url, dbid, dbpw);
			System.out.println("계정 연결");
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}//생성자

	public int insertProduct(ProductBean pb) {
		int cnt = 0;
		String sql = "insert into products values(seqprd.nextval, ?, ?, ?, sysdate)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pb.getName());
			ps.setInt(2, pb.getPrice());
			ps.setString(3, pb.getCompany());

			cnt = ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//insertProduct

	public ArrayList<ProductBean> selectAll() {
		String sql = "select * from products order by id";
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setId(rs.getInt("id"));
				pb.setName(rs.getString("name"));
				pb.setPrice(rs.getInt("price"));
				pb.setCompany(rs.getString("company"));
				pb.setRegdate(String.valueOf(rs.getDate("regdate")));
				lists.add(pb);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	}//selectAll

	public int deleteProduct(int id) {
		int cnt = -1;
		try {
			String sql = "delete from products where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			cnt = ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
					
			}catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return cnt;
	}//deleteProduct

	public ProductBean getDataById(int id) {		
		ProductBean pb = new ProductBean();
		String sql = "select * from products where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				pb.setId(rs.getInt("id"));
				pb.setName(rs.getString("name"));
				pb.setPrice(rs.getInt("price"));
				pb.setCompany(rs.getString("company"));
				pb.setRegdate(String.valueOf(rs.getDate("regdate")));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return pb;
	}//getDataById

	public int updateProduct(ProductBean pb) {
		int cnt = 0;
		String sql = "update products set name = ?, price = ?, company = ?, regdate = ? where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pb.getName());
			ps.setInt(2, pb.getPrice());
			ps.setString(3, pb.getCompany());
			ps.setString(4, pb.getRegdate());
			ps.setInt(5, pb.getId());
			
			cnt = ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//updateProduct
}