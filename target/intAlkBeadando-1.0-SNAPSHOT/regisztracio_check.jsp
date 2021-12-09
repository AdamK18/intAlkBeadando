<%--
  Created by IntelliJ IDEA.
  User: poles
  Date: 2021. 12. 08.
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:choose>
    <c:when test="${(empty param.email) || (empty param.password) || (empty param.password2)}">
        <c:redirect url="/regisztracio.jsp" >
            <c:param name="errorMsg" value="Felhazsnálónévként adjon meg egy érvényes e-mail címet!"/>

            <jsp:param name="errorMsg1" value="A jelszavának legalább 6 karakter hosszúnak kell lenni, továbbá tartalmazzon betűt és minimum egy számjegyet!"/>

        </c:redirect>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${param.password2 eq param.password}">
                <c:redirect url="/login.jsp" />
            </c:when>
            <c:otherwise>
                <c:redirect url="/regisztracio.jsp" >
                    <c:param name="errorMsg" value="A 2 jelszónak egyeznie kell!"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
</body>
</html>

