<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="..//members/mypage_top.jsp"%>
<%
String mid=(String)session.getAttribute("mid");
BoardDao dao=BoardDao.getInstance();
ArrayList<BoardBean> blist=dao.getQuestionById(mid);
System.out.println(blist.size());
%>
<table class="viewTable" width="300px"><caption><b>내가 문의한 글</b></caption>
<tr>
<td>매물유형</td>
<td>매물번호</td>
<td>문의내용</td>
<td>문의시간</td>
</tr>
<%for(BoardBean bean:blist){
String url=request.getContextPath()+"/members/viewDetails_"+bean.getKind()+".jsp?no="+bean.getNo(); 
%>
<tr style = "cursor:pointer;" onClick = " location.href='<%=url%>'">
<td><%=bean.getKind() %></td>
<td><%=bean.getRs_no() %></td>
<td><%
if(bean.getRe_step()>0){%>
<img src='<%=request.getContextPath()%>/img/re.gif' width='30'>
<%}
%><%=bean.getContent()%></td>
<td><%=bean.getRegdate()%></td>
</tr>
<%} %>
</table>
<%@include file="..//members/mypage_bottom.jsp"%>


 