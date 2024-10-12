package myPkg;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardWriteCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDao bdao = BoardDao.getInstance();
		BoardBean bb = new BoardBean();
		bb.setWriter(request.getParameter("writer"));
		bb.setEmail(request.getParameter("email"));
		bb.setSubject(request.getParameter("subject"));
		bb.setPasswd(request.getParameter("passwd"));
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		bb.setContent(request.getParameter("content"));
		bb.setIp(request.getRemoteAddr());
		int cnt = bdao.insertArticle(bb);
		
		String pageNum = request.getParameter("pageNum"); //문자열을 숫자로 바꿈
		if(pageNum == null) {
			pageNum = "1";
			request.setAttribute("pageNum", pageNum);
		}
	}

}
