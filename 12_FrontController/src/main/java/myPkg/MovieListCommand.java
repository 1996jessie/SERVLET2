package myPkg;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieListCommand implements MovieCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MovieDao mdao = MovieDao.getInstance();
		ArrayList<MovieBean> lists = mdao.getAllMovies();
		if(lists.size() != 0) {
			request.setAttribute("lists", lists);
		}
	}

}
