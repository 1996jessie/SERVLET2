package myPkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InitServlet
 */
@WebServlet("/init.do")
public class InitServlet extends HttpServlet {  
	private static final long serialVersionUID = 1L;
	private String company;   
	private String singer;
	private String manager;
	private String singer2;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InitServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */

	//ServletConfig config = new ServletConfig();
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init");

		ServletContext sc = config.getServletContext();
		company = sc.getInitParameter("company");
		singer = sc.getInitParameter("singer");
		manager = sc.getInitParameter("manager");
		System.out.println("company : " + company);
		
		singer2 = config.getInitParameter("singer");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("회사 : "+company+"<br>");
		out.append("가수 : "+singer+"<br>");
		out.append("매니저 : "+manager+"<br>");
		
		out.append("가수2 : "+singer2+"<br>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
