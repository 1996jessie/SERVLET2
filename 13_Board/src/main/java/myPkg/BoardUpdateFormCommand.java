package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardUpdateFormCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDao bdao = BoardDao.getInstance();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
		BoardBean bb = bdao.updateGetArticle(num);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bb", bb);
	}

}
