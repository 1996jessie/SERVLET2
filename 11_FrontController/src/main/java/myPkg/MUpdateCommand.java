package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MUpdateCommand implements MemberCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDao mdao = MemberDao.getInstance();
		MemberBean mb = new MemberBean();
		mb.setNum(Integer.parseInt(request.getParameter("num")));
		mb.setId(request.getParameter("id"));
		mb.setPasswd(request.getParameter("passwd"));
		mb.setName(request.getParameter("name"));
		
		int cnt = mdao.updateMember(mb);
	}

}
