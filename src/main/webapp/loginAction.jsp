<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>						
<%@ page import = "java.io.PrintWriter" %>		
<% request.setCharacterEncoding("UTF-8"); %>	
 
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>Dessert cafe</title>
</head>
<body>
    <% // 자바 코드 삽입 
    	String userID = null;
    	if(session.getAttribute("userID") != null) {
    		userID = (String) session.getAttribute("userID");
    	}
    	if (userID != null) {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
            script.println("alert('이미 로그인이 되어있습니다.')");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
    	}
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUserID(), user.getUserPassword());
        if (result ==1){	//로그인 성공
        	session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        else if (result == 0){	//비밀번호 틀림
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");   //이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -1){	//아이디 없음
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");    //이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -2){	//db오류
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('DB 오류가 발생했습니다.')");
            script.println("history.back()");    //이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
    %>
 
</body>
</html>
