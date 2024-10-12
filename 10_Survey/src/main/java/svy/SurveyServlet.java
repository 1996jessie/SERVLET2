package svy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SurveyServlet
 */
//@WebServlet("/SurveyServlet")
public class SurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletContext application = null;
	String driver;
	String url;
	String dbid;
	String dbpw;
	SurveyDao sdao;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SurveyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {

		application = config.getServletContext();

		driver = config.getInitParameter("driver");
		url = config.getInitParameter("url");
		dbid = config.getInitParameter("dbid");
		dbpw = config.getInitParameter("dbpw");
		System.out.println("driver : "+driver);
		System.out.println("url : "+url);
		System.out.println("dbid : "+dbid);
		System.out.println("dbpw : "+dbpw);

		sdao = new SurveyDao(driver,url,dbid,dbpw); 
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
		int len = request.getContextPath().length();
		String command = uri.substring(len);

		String viewPage = null;

		if(command.equals("/insert.sv")) {
			boolean flag = (boolean)application.getAttribute("flag");
			if(flag == false) {

				String name = request.getParameter("name");
				String company = request.getParameter("company");
				String email = request.getParameter("email");
				String satisfaction = request.getParameter("satisfaction");
				//String[] part = request.getParameterValues("part");
				String howto = request.getParameter("howto");
				int agree;

				if(request.getParameter("agree") == null) {
					agree = 0;
				}
				else {
					agree = Integer.parseInt(request.getParameter("agree"));
				}

				String part = "";
				String[] parr = request.getParameterValues("part");
				if(parr != null) {
					for(int i=0; i<parr.length; i++) {
						part += parr[i];
						if(i != parr.length-1) 
							part += ", ";
					}
				}else {
					part = "선택한 관심분야가 없습니다.";
				}

				SurveyBean sb = new SurveyBean(0,name,company,email,satisfaction, part, howto, agree);

				int cnt = sdao.insertSurvey(sb);
				application.setAttribute("flag", true);
			}
			viewPage = "/select.sv";

		}else if(command.equals("/select.sv")) {
			ArrayList<SurveyBean> lists = sdao.getSurveyList();
			if(lists.size() != 0){
				request.setAttribute("lists", lists);
			}
			viewPage = "surveyList.jsp";
		} else if(command.equals("/delete.sv")) {
			int no = Integer.parseInt(request.getParameter("no"));
			int cnt  = sdao.deleteSurvey(no);
			
			viewPage = "/select.sv";
			
		} else if(command.equals("/updateForm.sv")) {
			int no = Integer.parseInt(request.getParameter("no"));
			SurveyBean sb = sdao.getSurveyByNo(no);
			request.setAttribute("sb", sb);
			viewPage = "updateForm.jsp";
			
		} else if(command.equals("/update.sv")) {
			int no = Integer.parseInt(request.getParameter("no"));
			String name = request.getParameter("name");
			String company = request.getParameter("company");
			String email = request.getParameter("email");
			String satisfaction = request.getParameter("satisfaction");
			String howto = request.getParameter("howto");
			int agree;

			if(request.getParameter("agree") == null) {
				agree = 0;
			}
			else {
				agree = Integer.parseInt(request.getParameter("agree"));
			}

			String part = "";
			String[] parr = request.getParameterValues("part");
			if(parr != null) {
				for(int i=0; i<parr.length; i++) {
					part += parr[i];
					if(i != parr.length-1) 
						part += ", ";
				}
			}else {
				part = "선택한 관심분야가 없습니다.";
			}
			SurveyBean sb = new SurveyBean(no,name,company,email,satisfaction, part, howto, agree);
			int cnt = sdao.updateSurvey(sb);
			
			viewPage = "/select.sv";
		}
				
		if(viewPage == null) {
			System.out.println("요청 페이지가 잘못됐습니다.");
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request,response);
		}
	}//doProcess

}


