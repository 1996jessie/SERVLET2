package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MDeleteCommand implements MemberCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDao mdao = MemberDao.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int cnt = mdao.deleteMember(num);
	}

}
