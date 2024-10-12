package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MInsertCommand implements MemberCommand{
	//interface 만든 이유 : 똑같은 이름의 메서드를 사용하지 않으면 에러가 날 수 있도록 미완성된 인터페이스를 상속받음

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//System.out.println("MInsertCommand의 execute");		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");

		MemberDao mdao = MemberDao.getInstance();
		MemberBean mb = new MemberBean();
		mb.setId(id);
		mb.setPasswd(passwd);
		mb.setName(name);

		int cnt = mdao.insertMember(mb);
	}
}
