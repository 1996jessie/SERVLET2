package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieDeleteAllCommand implements MovieCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MovieDao mdao = MovieDao.getInstance();
		String rowcheck[] = request.getParameterValues("rowcheck");
		int cnt = mdao.deleteAllMovie(rowcheck);
	}

}
