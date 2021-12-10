<%--
  Created by IntelliJ IDEA.
  User: poles
  Date: 2021. 12. 07.
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Kézi lottószelvény</title>
</head>
<body>
<c:choose>
    <c:when test="${empty param.szam1 || empty param.szam2 || empty param.szam3 || empty param.szam4 || empty param.szam5 }">
        <c:redirect url="/szelveny_check.jsp">
            <c:param name="errorMsg" value="Minden sorban válassz számot"/>
        </c:redirect>
    </c:when>
    <c:otherwise>
        <form action="eredmeny.jsp" method="post">
            Szelvény információk:<br>
            Kitöltés típusa: ${cookie.ck.value}<br>
            Számai: <br>
                ${param.szam1},
                ${param.szam2},
                ${param.szam3},
                ${param.szam4},
                ${param.szam5},<br>

            <input type="hidden" name="szam1" value="${param.szam1}">
            <input type="hidden" name="szam2" value="${param.szam2}">
            <input type="hidden" name="szam3" value="${param.szam3}">
            <input type="hidden" name="szam4" value="${param.szam4}>">
            <input type="hidden" name="szam5" value="${param.szam5}">
            <input type="submit" value="Kézi szelvény feladása">
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
