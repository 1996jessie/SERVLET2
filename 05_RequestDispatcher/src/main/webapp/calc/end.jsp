<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
calc\end.jsp<br>

	수1: <%=request.getParameter("su1") %> <br>
    수2: <%=request.getParameter("su2") %> <br>
    
    합 : <%=request.getAttribute("add") %> <br>
    차 : <%=request.getAttribute("sub") %> <br>
    곱 : <%=request.getAttribute("mul") %> <br>
    나누기 : <%=request.getAttribute("div") %> <br>

      