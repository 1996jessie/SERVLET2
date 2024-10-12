package prd;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ProductServlet
 */
//@WebServlet("*.prd")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletContext application = null;
	String driver;
	String url;
	String user;
	String password;
	ProductDao pdao;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
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
		user = config.getInitParameter("user");
		password = config.getInitParameter("password");
		System.out.println("driver:" + driver);
		System.out.println("url:" + url);
		System.out.println("user:" + user);
		System.out.println("password:" + password);
		
		pdao = new ProductDao(driver,url,user,password);
		
	}//init

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
		int len = request.getContextPath().length();
		String command = uri.substring(len); // 
		String viewPage = null;
		//ProductDao pdao = new ProductDao();
		
		if(command.equals("/insert.prd")) {
			boolean flag = (boolean) application.getAttribute("flag");
			System.out.println("flag : " + flag);
			
			if(flag == false) { // 거쳤다
				ProductBean pb = new ProductBean();

				pb.setName(request.getParameter("name"));
				pb.setPrice(Integer.parseInt(request.getParameter("price")));
				pb.setCompany(request.getParameter("company"));

				pdao.insertProduct(pb); 

				viewPage = "select.prd";
				application.setAttribute("flag", true);
				
			}else { 
				viewPage = "select.prd";
			}

		}else if(command.equals("/select.prd")) {
			
			System.out.println("select.prd");
			ArrayList<ProductBean> list = pdao.selectAll();
			request.setAttribute("list", list);
			viewPage = "productList.jsp";
			
		}else if(command.equals("/delete.prd")) {
			System.out.println("delete.prd 들어옴");
			
			int id = Integer.parseInt(request.getParameter("id"));
			int cnt = pdao.deleteProduct(id);
			
			viewPage = "/select.prd";
		}else if(command.equals("/updateForm.prd")) {
			System.out.println("updateForm.prd");
			int id = Integer.parseInt(request.getParameter("id"));
			ProductBean pb = pdao.getDataById(id);
			request.setAttribute("pb", pb);
			viewPage = "updateForm.jsp";
			
		}else if(command.equals("/update.prd")) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			String company = request.getParameter("company");
			String regdate = request.getParameter("regdate");
			
			ProductBean pb = new ProductBean();
			pb.setId(id);
			pb.setName(name);
			pb.setPrice(price);
			pb.setCompany(company);
			pb.setRegdate(regdate);
			
			int cnt = pdao.updateProduct(pb);
			if(cnt>0) {
				viewPage = "/select.prd";
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}//doAction

}
//
//insert.prd요청=>서블릿 생성자=>init=>service => doGet or doPost=>doAction
//select.prd요청=>service => doGet or doPost=>doAction
//delete.prd요청=>service => doGet or doPost=>doAction






