

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
//@WebServlet({"/insert.do","/update.do","/select.do","/delete.do"})
//@WebServlet("*.do") //절대로 안된다.
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("FC doGet");
		
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

	private void doProcess(HttpServletRequest request, HttpServletResponse response){
		
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String conPath = request.getContextPath();
		
		System.out.println("uri : " + uri);
		System.out.println("url : " + url);
		System.out.println("conPath : " + conPath);
		int len = conPath.length();
		System.out.println("len : " + len);
		String command = uri.substring(len);
		///07_URL_Pattern/insert.do
		System.out.println("command : " + command);
		System.out.println("--------------------------");
		
		if(command.equals("/insert.do")) {
			System.out.println("insert요청 들어옴");
			
		}else if(command.equals("/select.do")) {
			System.out.println("select요청 들어옴");
			
		}else if(command.equals("/update.do")) {
			System.out.println("update요청 들어옴");
			
		}else if(command.equals("/delete.do")) {
			System.out.println("delete요청 들어옴");
		}
	}//doProcess
}















