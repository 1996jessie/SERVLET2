package myPkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InputServ
 */
@WebServlet("/sub")
public class InputServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html ; charset=UTF-8");
		
		String name = request.getParameter("name");
		System.out.println(name);
		String age = request.getParameter("age");
		System.out.println(age);
		
		request.setAttribute("name", name+"님~");
		request.setAttribute("age", 20); // age = 20
		request.setAttribute("addr", "서울시"); // addr=서울시
		
		PrintWriter out = response.getWriter();
		out.print("이름: "+ name+"<br>"); // X 
		
		//out.close();
		
		Person per = new Person("태연",30,58.7);
		request.setAttribute("per", per);
		
		RequestDispatcher dispatcher =  request.getRequestDispatcher("result.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
/* 차이점
 * forward 액션태그
 * 
 * response.sendRedirect
 * 
 */









