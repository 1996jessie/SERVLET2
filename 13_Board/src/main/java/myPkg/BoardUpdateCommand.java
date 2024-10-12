package myPkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardUpdateCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDao bdao = BoardDao.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String passwd = request.getParameter("passwd");
		
		BoardBean bb = new BoardBean();
		bb.setNum(num);
		bb.setWriter(request.getParameter("writer"));
		bb.setSubject(request.getParameter("email"));
		bb.setEmail(request.getParameter("email"));
		bb.setContent(request.getParameter("content"));
		bb.setPasswd(passwd);
		int cnt = bdao.updateArticle(bb); 
		
		/*
		String msg;
		String url;
		if(cnt > 0) {	
			msg = "update 성공";
			url = "list.bd?pageNum="+pageNum;
		}else if(cnt ==0) {
			msg = "비밀번호가 일치하지 않습니다.";
			url = "updateForm.bd?num="+num+"&pageNum="+pageNum;
		}else {
			msg = "update 실패";
			url = "updateForm.bd?num="+num+"&pageNum="+pageNum;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		*/
		
		response.setContentType("text/html;charset=UTF-8");
		if(cnt != 1) {
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.println("<script>alert('비밀번호가 일치하지 않음'); history.go(-1);</script>");
			out.flush(); //내보내겠다
		}
	}

}
