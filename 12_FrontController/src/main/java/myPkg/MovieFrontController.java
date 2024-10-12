package myPkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MovieFrontController
 */
@WebServlet("*.mv")
public class MovieFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletContext application = null;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MovieFrontController() {
		super();
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
		doAction(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		doAction(request,response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		String command = uri.substring(request.getContextPath().length());
		String viewPage = null;
		MovieCommand mc = null;

		if(command.equals("/insert.mv")) {
			boolean flag = (boolean)application.getAttribute("flag");
			
			if(flag == false) {
				mc = new MovieInsertCommand();
				mc.execute(request, response);
				
				viewPage = "select.mv";
				application.setAttribute("flag", true);
				
			}else {
				viewPage = "select.mv";
			}
		}
		else if(command.equals("/select.mv")) {
			mc = new MovieListCommand();
			mc.execute(request, response);
			viewPage = "select.jsp";
		}
		else if(command.equals("/id_check_proc.mv")) {
			mc = new MovieIdCheckCommand();
			mc.execute(request, response);
			return; //아래 dispatcher을 만나지 않도록
		}
		else if(command.equals("/delete.mv")) {
			mc = new MovieDeleteCommand();
			mc.execute(request, response);
			viewPage = "select.mv";
		}
		else if(command.equals("/deleteAll.mv")) {
			mc = new MovieDeleteAllCommand();
			mc.execute(request, response);
			viewPage = "select.mv";
		}
		else if(command.equals("/updateForm.mv")) {
			mc = new MovieUpdateFormCommand();
			mc.execute(request, response);
			viewPage = "updateForm.jsp";
		} 
		else if(command.equals("/update.mv")) {
			mc = new MovieUpdateCommand();  
			mc.execute(request, response);
			viewPage = "select.mv";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}//doAction
}
