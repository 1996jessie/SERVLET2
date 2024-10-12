package myPkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDao;

public class BoardDeleteCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDao bdao = BoardDao.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		String passwd = request.getParameter("passwd");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		request.setAttribute("num", num);
		//request.setAttribute("pageNum", pageNum);
		
		int cnt = bdao.deleteArticle(num, passwd);
		
		
		/*
		String msg;
		String url;
		if(cnt > 0) {
			msg = "delete 성공";
			if(pageCount < pageNum) {
				pageNum = pageCount;
			}
			url = "list.bd?pageNum=" + pageNum;
		}else if(cnt == 0){
			msg = "비밀번호가 일치하지 않습니다.";
			url = "deleteForm.bd?num=" + num + "&pageNum=" + pageNum;		
		}else{
			msg = "삭제 실패";
			url = "deleteForm.bd?num=" + num + "&pageNum=" + pageNum;	
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
		} else {

			int count = bdao.getArticleCount();
			int pageSize = 10;
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			System.out.println("pageCount : " + pageCount);
			if(pageCount < pageNum) {
				pageNum = pageCount;
			}
			System.out.println("delete pageNum : " + pageNum);
			request.setAttribute("pageNum", pageNum);
		}
	}
}
