<%--
  Created by IntelliJ IDEA.
  User: poles
  Date: 2021. 12. 08.
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<sql:query dataSource="${db}" var="user">
    SELECT * from USERS where USERNAME='${param.userName}' and PASSWORD='${param.password}'
</sql:query>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>Bejelentkezés ellenőrzése</title>
    <style type="text/css">
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<% session.removeAttribute("validUser"); %>

<c:choose>
    <c:when test="${(empty param.userName) || (empty param.password)}">
        <c:redirect url="/login.jsp" >
            <c:param name="errorMsg1" value="Valós felhasznalói név és jelszó megadása kötelező."/>
        </c:redirect>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${user.rowCount ne 0}">
                <% session.setAttribute("validUser", request.getParameter("userName"));%>
                <c:redirect url="/feladas.jsp" />
            </c:when>
            <c:otherwise>
                <c:redirect url="/login.jsp" >
                    <c:param name="errorMsg" value="A megadott adatokkal nincsen egyezés. Kérem regisztráljon!"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>

</body>
</html>
