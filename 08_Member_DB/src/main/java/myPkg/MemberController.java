package myPkg;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("doGet");
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		System.out.println("doPost");
		doProcess(request,response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		int len = request.getContextPath().length();
		String command = uri.substring(len);

		System.out.println("uri:" + uri);
		System.out.println("len:" + len);
		System.out.println("command:" + command);

		MemberDao mdao = new MemberDao();
		String viewPage = null;
		if(command.equals("/insert.mem")) {
			System.out.println("/insert요청 들어옴");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			
			MemberBean mb = new MemberBean(0,name,password);
			int cnt = mdao.insertData(mb);
			viewPage = "memberTo.jsp";
			
		}else if(command.equals("/select.mem")) {
			System.out.println("/select요청 들어옴");
			
			ArrayList<MemberBean> lists = mdao.getMemberList();
			request.setAttribute("memlists", lists);
			viewPage = "memberList.jsp"; //로 이동
		}else if(command.equals("/updateForm.mem")) {
			System.out.println("/updateForm요청 들어옴");
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("/updateForm.mem id : " + id);	
			MemberBean mb = mdao.getMemberById(id);  
			request.setAttribute("mb", mb);
			viewPage = "memberUpdateForm.jsp";
				
		}else if(command.equals("/update.mem")) {
			System.out.println("/update요청 들어옴");
			
			MemberBean mb = new MemberBean();
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			mb.setId(id);
			mb.setName(name);
			mb.setPassword(password);
			
			int cnt = mdao.updateMember(mb);
			System.out.println("cnt : " + cnt);
			viewPage = "/select.mem";

		}else if(command.equals("/delete.mem")) {
			System.out.println("/delete요청 들어옴");
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("delete.mem id : " + id);
			 int cnt = mdao.deleteData(id);
				/*
				 * ArrayList<MemberBean> lists = mdao.getMemberList();
				 * request.setAttribute("memlists", lists); viewPage = "memberList.jsp"; //로 이동
				 */
			 viewPage = "/select.mem";
		}
		
		if(viewPage == null) {
			System.out.println("요청 페이지가 잘못됐습니다.");
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	}//doProcess
}
