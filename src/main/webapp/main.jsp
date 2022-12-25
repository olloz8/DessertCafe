<%@ page import="java.io.PrintWriter" %>
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
        /* * {
            box-sizing : border-box;
        } */

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

        section {
            position: relative;
        }

        .container {
            background : url("media/cupcake.jpg");
            background-repeat : no-repeat;
            background-position : center center;
            width : 100%;
            height : 800px;
        }

        .content2 p {
            font-family : 휴먼둥근헤드라인, serif;
            font-size : 2em;
            font-weight : normal;
            color : black;
            text-align : center;
	        position: absolute;
	        top: 55%;                                /* 텍스트 배치 */
	        left: 50%;
	        transform: translate( -50%, -50% );

        }

        .content1 p {
            font-family : 휴먼둥근헤드라인, serif;
            font-size : 5em;
            font-weight : 700;
            color : black;
            text-align : center;
	        position: absolute;
	        top: 40%;                               /* 텍스트 배치 */
	        left: 50%;
	        transform: translate( -50%, -50% );

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
	%>
    <header>
        <nav>
            <div class="logo">
                <a href="main.jsp"><img src="media/logo1.png" width="100px" height="50px" ></a>
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
    <section>
        <div class="container">
        
        </div>
        <div class="content2">
            <p>Small but definite happiness</p>
        </div>
        <div class="content1">
            <p>Dessert</p>
        </div>
    </section>
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