package myPkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ThirdServlet
 */
@WebServlet(urlPatterns = {"/third.do"}, 
initParams = {
		@WebInitParam(name = "singer", value = "방탄소년단"),
		@WebInitParam(name = "title" , value="Dynamite")
})
public class ThirdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String company;
	String singer;
	String title;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThirdServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		ServletContext sc = config.getServletContext();
		System.out.println(sc.getInitParameter("company"));
		System.out.println(sc.getInitParameter("singer"));
		System.out.println(sc.getInitParameter("manager"));
		System.out.println(config.getInitParameter("singer"));
		System.out.println(config.getInitParameter("title"));
		company = sc.getInitParameter("company");
		singer = config.getInitParameter("singer");
		title = config.getInitParameter("title");
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
		out.append("제목 : "+title+"<br>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
