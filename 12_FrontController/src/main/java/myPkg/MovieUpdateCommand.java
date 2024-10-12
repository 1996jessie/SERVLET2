package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieUpdateCommand implements MovieCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MovieDao mdao = MovieDao.getInstance();
		MovieBean mb = new MovieBean();
		String genre = "";
		String[] garr = request.getParameterValues("genre");
		if(garr == null) {
			genre = "좋아하는 장르 없음";
		} else {
			for(int i=0;i<garr.length;i++) {
				genre += garr[i];
				if(i != garr.length-1) {
					genre += ", ";
				}
			}
		}
		mb.setNum(Integer.parseInt((request.getParameter("num"))));
		mb.setId(request.getParameter("id"));
		mb.setName(request.getParameter("name"));
		mb.setAge(Integer.parseInt((request.getParameter("age"))));
		mb.setGenre(genre);
		mb.setTime(request.getParameter("time"));
		mb.setPartner(Integer.parseInt((request.getParameter("partner"))));
		mb.setMemo(request.getParameter("memo"));

		int cnt = mdao.updateMovie(mb);
	}

}
