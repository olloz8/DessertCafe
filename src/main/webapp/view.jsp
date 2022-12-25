<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
        a {

            text-decoration : none;
            color : black;
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

    </style>
</head>
<body>
		<% 
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("<script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
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
    	<h2>리뷰</h2>
    	<table>
    		<thead>
    			<tr>
    				<th colspan="3" style="background-color : #eeeeee; text-align : center;">글 보기</th>
    			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td style="width: 20%;">글 제목</td>
    				<td colspan="2"><%= bbs.getBbsTitle() %></td>
    			</tr>
    			<tr>
    				<td>작성자</td>
    				<td colspan="2"><%= bbs.getUserID() %></td>
    			</tr>
    			<tr>
    				<td>작성일</td>
    				<td colspan="2"><%= bbs.getBbsDate() %></td>
    			</tr>
    			<tr>
    				<td>내용</td>
    				<td colspan="2" style="min-height: 200px; text-align: left"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
    			</tr>
    		</tbody>
    	</table>
    	<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<%
                if(userID != null && userID.equals(bbs.getUserID()))
                {
            %>
                <a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>
                <a onclick="return confirm('삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">삭제</a>
                
            <%     
                }
            %>
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