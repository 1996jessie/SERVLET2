package myPkg;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardReplyCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDao bdao = BoardDao.getInstance();
		
		BoardBean bb = new BoardBean();
		bb.setNum(Integer.parseInt(request.getParameter("num")));
		bb.setWriter(request.getParameter("writer"));
		bb.setEmail(request.getParameter("email"));
		bb.setSubject(request.getParameter("subject"));
		bb.setPasswd(request.getParameter("passwd"));
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		bb.setRef(Integer.parseInt(request.getParameter("ref")));
		bb.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		bb.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		bb.setContent(request.getParameter("content"));
		bb.setIp(request.getRemoteAddr());
		
		bdao.replyArticle(bb);
		
	}

}
