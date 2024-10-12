package myPkg;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardListCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int pageSize = 10; //한 페이지에 10개씩
		request.setAttribute("pageSize", pageSize);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		} else {
			System.out.println("List pageNum : " + pageNum);
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1; 
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;

		BoardDao bdao = BoardDao.getInstance();
		ArrayList<BoardBean> lists = bdao.getArticles(startRow, endRow);
		if(lists.size() != 0) {
			request.setAttribute("lists", lists);
		}
		count = bdao.getArticleCount();
		request.setAttribute("count", count);
		number = count - (currentPage - 1) * pageSize;
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);

		if(count > 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 10; //한번에 10개의 페이지가 보이게 하자
			
			int startPage = ((currentPage - 1) / pageBlock * pageBlock) +  1;
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
		}
	}
}


