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
            width : 1100px;
            margin : auto;                  /* margin 가운데 정렬 */
        }

        nav > div {
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


        caption {
            font-family : 휴먼둥근헤드라인, serif;
            font-weight : normal;
            font-size : 2em;
            margin-top : 4%;
            margin-bottom : 1%;
        }

        table {
            font-family : 한컴산뜻돋움, serif;
            margin : auto;
            padding-bottom : 5%;
            border-spacing : 20px;                        /* 셀 사이 공간 여백 */
            
        }

        td {
            text-align : center;
            box-shadow: 0px 0px 5px rgb(195, 195, 195);
        }

        td, th {
            padding : 10px;
        }

        /* td:hover {
            border : 1px solid rgb(228, 223, 223);
        } */

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
                <a href="main.jsp"><img src="media/logo1.png" width="100" height="50"></a>
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
        <table>
            <caption>
            <p>MENU</p>
            </caption>
            <tbody>
                <tr>
                    <td><img src="media/cupcake3.jpg" width="250" height="250"><br><strong>초코컵케익</strong><br>5000원</td>
                    <td><img src="media/brownie.png" width="250" height="250"><br><strong>브라우니</strong><br>4000원</td>
                    <td><img src="media/cookie.png" width="250" height="250"><br><strong>쿠키</strong><br>3000원</td>
                    <td><img src="media/donut.png" width="250" height="250"><br><strong>도넛</strong><br>3200원</td>
                </tr>
                <tr>
                    <td><img src="media/cake.png" width="250" height="250"><br><strong>조각케이크</strong><br>8000원</td>
                    <td><img src="media/pancake.png" width="250" height="250"><br><strong>팬케이크</strong><br>8000원</td>
                    <td><img src="media/bread1.png" width="250" height="250"><br><strong>소금빵</strong><br>5000원</td>
                    <td><img src="media/egg.png" width="250" height="250"><br><strong>에그타르트</strong><br>5000원</td>
                </tr>
                <tr>
                    <td><img src="media/macaroon.png" width="250" height="250"><br><strong>마카롱</strong><br>3000원</td>
                    <td><img src="media/puff.png" width="250" height="250"><br><strong>슈크림</strong><br>3000원</td>
                    <td><img src="media/pudding.png" width="250" height="250"><br><strong>푸딩</strong><br>5000원</td>
                    <td><img src="media/madeleine.png" width="250" height="250"><br><strong>마들렌</strong><br>3000원</td>
                </tr>
            </tbody>
        </table>
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