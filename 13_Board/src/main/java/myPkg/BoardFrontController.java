package myPkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class BoardFrontController
 */
/* @WebServlet("/BoardFrontController") */
public class BoardFrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	ServletContext application = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		String command = uri.substring(request.getContextPath().length());
		String viewPage = null;
		BoardCommand bc = null;
		
		if(command.equals("/insert.bd")) {
			boolean flag = (boolean)application.getAttribute("flag");
			
			if(!flag) {
				bc = new BoardWriteCommand();
				bc.execute(request, response);				
				application.setAttribute("flag", true);			
			}
			viewPage = "select.bd";
		} 
		else if(command.equals("/select.bd")) {
			bc = new BoardListCommand();
			bc.execute(request, response);
			viewPage = "list.jsp";
		}
		else if(command.equals("/content.bd")) {
			bc = new BoardContentCommand();
			bc.execute(request, response);
			viewPage = "content.jsp";
		}
		else if(command.equals("/replyForm.bd")) {
			bc = new BoardReplyFormCommand();
			bc.execute(request, response);
			viewPage = "replyForm.jsp";
		}
		else if(command.equals("/reply.bd")) {
			boolean flag = (boolean)application.getAttribute("flag");
			if(!flag) {
				bc = new BoardReplyCommand();
				bc.execute(request, response);
				application.setAttribute("flag", true);		
			}
			viewPage = "select.bd";			
		}
		else if(command.equals("/updateForm.bd")) {
			bc = new BoardUpdateFormCommand();
			bc.execute(request, response);
			viewPage = "updateForm.jsp";
		}
		else if(command.equals("/update.bd")) {
			bc = new BoardUpdateCommand();
			bc.execute(request, response);
		    viewPage = "select.bd";
		}
		else if(command.equals("/deleteForm.bd")) {
			bc = new BoardDeleteFormCommand();
			bc.execute(request, response);
			viewPage = "deleteForm.jsp";
		}
		else if(command.equals("/delete.bd")) {
		    bc = new BoardDeleteCommand();
			bc.execute(request, response);
			
		    int pageNum = 1;
		    try {
		        pageNum = (int) request.getAttribute("pageNum");
		    } catch (NullPointerException e) {		
		    	System.out.println("null 반환");
		    } 
		    System.out.println("front pageNum : " + pageNum);
		    viewPage = "select.bd?pageNum="+pageNum;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		try{
			dispatcher.forward(request, response);
		} catch (IllegalStateException e2) {
	    	System.out.println("이미 커밋 어쩌구");
	    }
	}

}
