<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에서 사용하는 meta tag -->
<title>Dessert cafe</title>
<link rel="stylesheet" type="text/css" href="test.css"/>
<style>
        body {
            /*background-color : white;
            margin: 0;
            padding : 0;
            font-family : 한컴산뜻돋움, serif; */
            
            
			font-family : 한컴산뜻돋움, serif;
			font-size : 1em;
    		background-repeat: no-repeat;
    		background-attachment: fixed;
		    background-position:15% 95%;
    		background-size: 200px;
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
            margin-top : 450px;
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
            margin-top : 7%;
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

   .form-group {
      text-align : center;
      }
      
   .button {
      text-align : center;
      margin-bottom : 5%;
      }
      
</style>
</head>
<body>
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
            <div class="login">
                <a href="login.jsp">login</a>
                <a>/</a>
                <a href="join.jsp">join</a>
            </div>
        </nav>
    </header>
     <div class="login-wrapper">
        <h3 style="text-align:center;">LOGIN</h3>
        <form method="post" action="loginAction.jsp" id="login-form">
                <input type ="text" class="form-control" placeholder="아이디" name ="userID" maxlength='20'>
                <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20'>
    

            <input type="submit"  value="Login">
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