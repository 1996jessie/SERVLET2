

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SecondServlet
 */
//@WebServlet("/insert.mb")
//@WebServlet({"/insert.mb","/update.mb","/select.mb","/delete.mb"})
//@WebServlet("*.mb")
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecondServlet() {
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
		//System.out.println("SS doGet");
		
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
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) {
		String uri = request.getRequestURI();
		int len = request.getContextPath().length();
		String command = uri.substring(len);
		System.out.println("command:" + command);
		
		if(command.equals("/insert.mb")) {
			System.out.println("insert 요청 들어옴");
		}else if(command.equals("/select.mb")) {
			System.out.println("select 요청 들어옴");
		}else if(command.equals("/delete.mb")) {
			System.out.println("delete 요청 들어옴");
		}else if(command.equals("/update.mb")) {
			System.out.println("update 요청 들어옴");
		}
	}
}



