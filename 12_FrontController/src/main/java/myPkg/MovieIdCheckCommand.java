package myPkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieIdCheckCommand implements MovieCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MovieDao mdao = MovieDao.getInstance();
		String userId = request.getParameter("userId");
		
		boolean flag = mdao.searchId(userId);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag == true) {
			//System.out.println("아이디 중복");
			out.print("not allowed");
		}else {
			//System.out.println("아이디 중복 아님");
			out.print("allowed");
		}
	}
}
