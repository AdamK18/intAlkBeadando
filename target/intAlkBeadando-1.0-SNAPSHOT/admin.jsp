<%--
  Created by IntelliJ IDEA.
  User: Tomi
  Date: 2021. 12. 10.
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

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
<h1> Üdv az admin oldalon!</h1>
<c:if test="${! empty param.errorMsg}" >
    <font color="red"> <b> ${param.errorMsg}     </b></font>
</c:if>
<form action="?" method="POST">
    <table>
        <tr>
            <td>Első nyertes szám: <input type="number" name="nyero1" aria-valuemin="0"></td>
        </tr>
        <tr>
            <td>Második nyertes szám: <input type="number" name="nyero2"></td>
        </tr>
        <tr>
            <td>Harmadik nyertes szám: <input type="number" name="nyero3"></td>
        </tr>
        <tr>
            <td>Negyedik nyertes szám: <input type="number" name="nyero4"></td>
        </tr>
        <tr>
            <td>Ötödik nyertes szám: <input type="number" name="nyero5"></td>
        </tr>
        <tr>
            <td><input type="submit" name="elkuld" value="Nyertes szelvények keresése"></td>
        </tr>
    </table>
</form>
<form method="post" action="login.jsp">
    <input type="submit" value="Kijelentkezés">
</form>
    <c:choose>
        <c:when test="${pageContext.request.method eq 'POST'}">
            <c:choose>
                <c:when test="${(empty param.nyero1) || (empty param.nyero2) || (empty param.nyero3) || (empty param.nyero4) || (empty param.nyero5)}">
                    <c:redirect url="/admin.jsp" >
                        <c:param name="errorMsg" value="Minden számot töltsön ki!"/>
                    </c:redirect>
                </c:when>
                <c:otherwise>

                    <sql:update var="nyertes" dataSource="${db}">
                        INSERT INTO LOTTO (SZAM1, SZAM2, SZAM3, SZAM4, SZAM5)
                        VALUES (${param.nyero1}, ${param.nyero2}, ${param.nyero3}, ${param.nyero4}, ${param.nyero5})
                    </sql:update>
                    <p> A nyertes számok: <c:out value="${param.nyero1}"/>, <c:out value="${param.nyero2}"/>, <c:out value="${param.nyero3}"/>, <c:out value="${param.nyero4}"/>, <c:out value="${param.nyero5}"/></p>
                    <%--<sql:query var="nyert" dataSource="${db}">
                        SELECT * FROM LOTTO
                    </sql:query>
                    <p>A nyeretes(ek):</p>
                    <c:forEach var="row" items="${nyert.rows}">
                        <c:choose>
                            <c:when test="${(row.szam1 == param.nyero1 || row.szam2 == param.nyero1 || row.szam3 == param.nyero1 || row.szam4 == param.nyero1 || row.szam5 == param.nyero1) &&
                             (row.szam1 == param.nyero2 || row.szam2 == param.nyero2 || row.szam3 == param.nyero2 || row.szam4 == param.nyero2 || row.szam5 == param.nyero2) &&
                             (row.szam1 == param.nyero3 || row.szam2 == param.nyero3 || row.szam3 == param.nyero3 || row.szam4 == param.nyero3 || row.szam5 == param.nyero3) &&
                             (row.szam1 == param.nyero4 || row.szam2 == param.nyero4 || row.szam3 == param.nyero4 || row.szam4 == param.nyero4 || row.szam5 == param.nyero4) &&
                             (row.szam1 == param.nyero5 || row.szam2 == param.nyero5 || row.szam3 == param.nyero5 || row.szam4 == param.nyero5 || row.szam5 == param.nyero5)}">
                                <sql:query var="szemely" dataSource="${db}">
                                    SELECT * FROM USERS WHERE ID = ${row.user_id}
                                </sql:query>
                                <p><c:out value="${szemely.rows[0].username}"/></p>
                            </c:when>
                        </c:choose>
                    </c:forEach>--%>
                </c:otherwise>
            </c:choose>

        </c:when>
    </c:choose>

</body>
</html>
