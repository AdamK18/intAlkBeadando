<%--
  Created by IntelliJ IDEA.
  User: klocz
  Date: 12/10/2021
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:setDataSource
        var="db"
        driver="org.apache.derby.jdbc.ClientDriver"
        url="jdbc:derby://localhost:1527/lotto"
        scope="session"
/>
<sql:query dataSource="${db}" var="lotto">
    SELECT * from LOTTO ORDER BY ID DESC
</sql:query>
<c:choose>
    <c:when test="${lotto.rowCount == 0}">
        Próbléma volt az eredmények Betöltésével. Kérjük próbálja újra!
    </c:when>
    <c:otherwise>
        Az ön számai:<br>
        ${param.szam1},
        ${param.szam2},
        ${param.szam3},
        ${param.szam4},
        ${param.szam5},<br>
        <c:choose>
            <c:when test="${(lotto.rows[0].szam1 eq param.szam1 || lotto.rows[0].szam1 eq param.szam2 || lotto.rows[0].szam1 eq param.szam3 || lotto.rows[0].szam1 eq param.szam4 || lotto.rows[0].szam1 eq param.szam5) &&
            (lotto.rows[0].szam2 eq param.szam1 || lotto.rows[0].szam2 eq param.szam2 || lotto.rows[0].szam2 eq param.szam3 || lotto.rows[0].szam2 eq param.szam4 || lotto.rows[0].szam2 eq param.szam5) &&
            (lotto.rows[0].szam3 eq param.szam1 || lotto.rows[0].szam3 eq param.szam2 || lotto.rows[0].szam3 eq param.szam3 || lotto.rows[0].szam3 eq param.szam4 || lotto.rows[0].szam3 eq param.szam5) &&
            (lotto.rows[0].szam4 eq param.szam1 || lotto.rows[0].szam4 eq param.szam2 || lotto.rows[0].szam4 eq param.szam3 || lotto.rows[0].szam4 eq param.szam4 || lotto.rows[0].szam4 eq param.szam5) &&
            (lotto.rows[0].szam5 eq param.szam1 || lotto.rows[0].szam5 eq param.szam2 || lotto.rows[0].szam5 eq param.szam3 || lotto.rows[0].szam5 eq param.szam4 || lotto.rows[0].szam5 eq param.szam5)}">
                Gratulálok! Ön nyert!
                <br>
            </c:when>
            <c:otherwise>
                Sajnos most nem nyert, de próbálja újra!
                <br>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
<form method="POST" action="feladas.jsp">
    <button type="submit">Vissza a szavazáshoz</button>
</form>
</body>
</html>
