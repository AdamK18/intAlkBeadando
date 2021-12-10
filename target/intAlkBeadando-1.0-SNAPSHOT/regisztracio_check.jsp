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
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:setDataSource
        var="users"
        driver="org.apache.derby.jdbc.ClientDriver"
        url="jdbc:derby://localhost:1527/lotto"
        scope="application"
/>
<sql:query var="regisztracio" dataSource="${users}">
    select * from users where username='${param.user}'
</sql:query>
<c:choose>
    <c:when test="${(empty param.user) || (empty param.password) || (empty param.password2)}">
        <c:redirect url="/regisztracio.jsp" >
            <c:param name="errorMsg" value="Adjon meg felhasználónevet!"/>
            <c:param name="errorMsg1" value="A jelszavának legalább 6 karakter hosszúnak kell lenni, továbbá tartalmazzon betűt és minimum egy számjegyet!"/>

        </c:redirect>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${param.password2 eq param.password}">
                <c:choose>
                <c:when test="${regisztracio.rowCount == 0}">
                    <sql:update var="regisztralas" dataSource="${users}">
                        INSERT INTO USERS (USERNAME, PASSWORD) values ('${param.user}', '${param.password}')
                    </sql:update>
                    <c:redirect url="/login.jsp">
                        <c:param name="errorMsg" value="Sikeres Regisztráció"/>
                    </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="/regisztracio.jsp" >
                        <c:param name="errorMsg" value="A megadott felhasználónév már foglalt!"/>
                    </c:redirect>
                </c:otherwise>
                </c:choose>
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

