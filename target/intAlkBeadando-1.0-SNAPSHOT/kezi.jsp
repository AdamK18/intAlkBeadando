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
    <c:when test="${empty param.elso || empty param.masodik || empty param.harmadik || empty param.negyedik || empty param.otodik }">
        <jsp:forward page="szelveny_check.jsp">
            <jsp:param name="errorMsg" value="Minden sorban válassz számot"/>
        </jsp:forward>
    </c:when>
    <c:otherwise>
        <form action="feladas.jsp" method="post">
            Szelvény információk:<br>
            Kitöltés típusa: ${cookie.ck.value}<br>
            Szelvény érvényessége: ${cookie.ckvalid.value} hetes<br><hr>
            Számai: <br>
                ${param.elso},
                ${param.masodik},
                ${param.harmadik},
                ${param.negyedik},
                ${param.otodik},<br>

            <input type="submit" value="Kézi szelvény feladása">
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
