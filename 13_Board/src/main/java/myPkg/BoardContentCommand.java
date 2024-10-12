package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardContentCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		BoardDao bdao = BoardDao.getInstance();
		BoardBean bb = bdao.getArticle(num);
		
		if(bb != null) {
			request.setAttribute("bb", bb);
		}
		
		int ref = bb.getRef();
		int re_step = bb.getRe_step();
		int re_level = bb.getRe_level();
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);
	}

}
