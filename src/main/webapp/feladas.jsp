<%--
  Created by IntelliJ IDEA.
  User: poles
  Date: 2021. 12. 08.
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Bejelentkezés ellenőrzése</title>
    <style type="text/css">
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<h3 align=center> Üdvözlöm <i> <%=session.getAttribute("validUser") %> </i>!</h3>

<form method="post" action="szelveny_check.jsp">
    Kitöltés típusa:
    <table>
        <tr>
            <td>
                Kézi<input type="radio" name="type" value="kezi"> <br><hr>
            </td>
            <td>
                Gépi <input type="radio" name="type" value="gepi"><br><hr>
            </td>
        </tr>
    </table>
    <input type="submit" value="Választ">
</form>

<form method="post" action="login.jsp">
    <input type="submit" value="Kijelentkezés">
</form>


</body>
</html>
