<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="notice" class="notice.Notice" scope="page"></jsp:useBean>
<jsp:setProperty name="notice" property="noticeTitle"/>
<jsp:setProperty name="notice" property="noticeContent"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>Dessert cafe</title>
</head>
<body>
    <%
    	String userID = null;
    	if (session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
    	}
    	if (userID == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 하신 후 이용 가능합니다.')");
            script.println("location.href = 'login.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
    	}else{
    		if (notice.getNoticeTitle() == null || notice.getNoticeContent() == null){
        		PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('모든 문항을 입력해주세요.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
        	}else{
        		NoticeDAO noticeDAO = new NoticeDAO();
                int result = noticeDAO.write(notice.getNoticeTitle(), userID, notice.getNoticeContent());
                if (result == -1){ // 글쓰기 실패시
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다.')");
                    script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                    script.println("</script>");
                }else{ // 글쓰기 성공시
                	PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'notice.jsp'");    // 메인 페이지로 이동
                    script.println("</script>");    
                }
        	}	
    	}
    %>
 
</body>
</html>