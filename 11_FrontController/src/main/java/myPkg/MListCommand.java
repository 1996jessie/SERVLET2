package myPkg;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MListCommand implements MemberCommand {
	//interface 만든 이유 : 똑같은 이름의 메서드를 사용하지 않으면 에러가 날 수 있도록 미완성된 인터페이스를 상속받음
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//System.out.println("MListCommand의 execute");
		MemberDao mdao = MemberDao.getInstance();
		ArrayList<MemberBean> lists = mdao.getMemberList();
		if(lists.size() != 0) {
			request.setAttribute("lists", lists);
		}
	}
	
}
