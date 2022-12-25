<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.Notice" %>
<%@ page import="notice.NoticeDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dessert cafe</title>
    <style>
      	body {
            background-color : white;
            margin: 0;
            padding : 0;
            font-family : 한컴산뜻돋움, serif; 
        }
            header {
            font-weight : normal;
        }

        nav {
            /* border : 1px solid red; */
            width : 1100px;
            margin : auto;                  /* margin 가운데 정렬 */
        }

        nav > div {
            /* border: 1px solid gray; */
            height: 70px;
            line-height: 70px;              /* 글자 가운데 배치 */
        }

        .logo {
            float: left;
            width: 100px;
            line-height: 110px;
            text-align: center;
        }

        .menu {
            display: inline-block;           /* 같은 라인으로 정렬*/
            width: calc(100% - 200px);
            text-align: center;
        }

        .menu a {
            margin: 6%;                   /* 메뉴바 글자간 간격 */
        }

        .menu a:hover {
            color : gray;
        }

        .login {
            float: right;
            width: 100px;
            text-align: center;
        }

        .login a:hover {
            color : gray;
        }

        section {
            position: relative;
        }

    	footer {
            margin-top : 10px;
		    clear:both;
		    width: 100%;
            height : auto;
		    background-color : #EBEBEB;
		    color : gray;	
		    text-align : center;
            position : absolute;
	    }

        footer pre {
            font-family : 한컴산뜻돋움, serif;
        }
    
    	#wrap {
    		width: 1000px;
			margin: auto;
		}
		table{
    		width: 100%;
    		border-collapse: collapse;
    		line-height: 24px;
		}
		table td,th {

    		text-align: center;
    		padding: 10px;
		}
		th {
			background: rgb(204, 204, 204);
		}
		a{
   			text-decoration: none;
    		color: black;
		}
		a:hover{
    		text-decoration: underline;
		}
    </style>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("<script>");
		}
		int noticeID = 0;
		if (request.getParameter("noticeID") != null) {
			noticeID = Integer.parseInt(request.getParameter("noticeID"));
		}
		if (noticeID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='notice.jsp'");
			script.println("<script>");
		}
		Notice notice  = new NoticeDAO().getNotice(noticeID);
		if (!userID.equals(notice.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='notice.jsp'");
			script.println("<script>");
		}
	%>	
    <header>
        <nav>
            <div class="logo">
                <a href="main.jsp"><img src="media/logo1.png" width="100px;" height="50px;" ></a>
            </div>
            <div class="menu">
                <a href="main.jsp">HOME</a>
            	<a href="notice.jsp">공지사항</a>
                <a href="menu.jsp">MENU</a>
                <a href="bbs.jsp">리뷰</a>
            </div>
            
           <%
           	if(userID == null) {
           %>            
            <div class="login">
                <a href="login.jsp">login</a>
                <a>/</a>
                <a href="join.jsp">join</a>
            </div>
                
            <%
            	} else {  
            %>
           <div class="login">
                <a href="logoutAction.jsp">logout</a>
            <%
            	} 
            %>
            </div>
        </nav>
    </header>
    <div id="wrap">
    	<h2>게시판</h2>
    	<form method="post" action="updateAction2.jsp?noticeID=<%= noticeID%>">
    	<table>
    		<thead>
    			<tr>
    				<th colspan="2" style="background-color : #eeeeee; text-align : center;">글 수정</th>
    			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td><input type="text" class="form-control" placeholder="글 제목" name="noticeTitle" maxlength="50" style="width : 100%" value="<%= notice.getNoticeTitle() %>"></td>
    			</tr>
    			<tr>
    				<td><textarea class="form-control" placeholder="글 내용" name="noticeContent" maxlength="2048" style="height : 350px; width : 100%"><%= notice.getNoticeContent()%></textarea></td>
    			</tr>
    		</tbody>
    	</table>
    	<input type="submit" class="btn btn-primary pull-right" value="수정하기">
    	</form>
    </div>
       	<footer>
        <p>
            <strong>CEO</strong><br>Lee Su Min<br><br>
            <strong>Address</strong><br>Incheon, Republic of Korea<br><br>
            <strong>Customer Service</strong><br>1234 - 5678<br><br>
            <strong>Copyright 2022. LEESUMIN All rights reserved.</strong>
        </p>
    </footer>
</body>
</html>