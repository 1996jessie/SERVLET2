package myPkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberServlet
 */
//@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletContext application = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		application = config.getServletContext();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		doProcess(request,response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String command = uri.substring(request.getContextPath().length());
		String viewPage = null;
		MemberCommand mc = null;
		
		if(command.equals("/insert.do")) {
			boolean flag = (boolean)application.getAttribute("flag");
			
			if(!flag) {
				mc = new MInsertCommand();
				mc.execute(request, response);
				application.setAttribute("flag", true);
			}
			viewPage = "list.do";

		}else if(command.equals("/list.do")) {
			mc = new MListCommand();
			mc.execute(request, response);
			viewPage = "list.jsp";
			
		}else if(command.equals("/delete.do")) {
			mc = new MDeleteCommand();
			mc.execute(request, response);
			viewPage = "list.do";
			
		}else if(command.equals("/updateForm.do")) {
			mc = new MUpdateFormCommand();
			mc.execute(request, response);
			viewPage = "updateForm.jsp";
			
		}else if(command.equals("/update.do")) {
			mc = new MUpdateCommand();
			mc.execute(request, response);
			viewPage = "list.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}//doProcess

}