<%--
  Created by IntelliJ IDEA.
  User: poles
  Date: 2021. 12. 08.
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><title>Regisztrációs Form</title></head>
<body BGCOLOR="#FDF5E6">
<c:choose>
    <c:when test="${pageContext.request.method eq 'GET'}">
        <h1 ALIGN="CENTER">Regisztrációs Form</h1>
        <form ACTION="regisztracio.jsp" method="post">
            Név:  <INPUT TYPE="TEXT" NAME="nev"><br/>
            Email:  <INPUT TYPE="TEXT" NAME="email"><br/>
            <input type="checkbox" name="tarol"/> Megjegyezze <br/>

            <INPUT TYPE="SUBMIT" VALUE="Elküld">
        </form>
    </c:when>
    <c:otherwise>
        <c:if test="${!empty param.tarol}">
            <% String nev="Ismeretlen";
                String email="Ismeretlen";%>
            <c:if test="${!empty param.nev}">
                <% nev = request.getParameter("nev"); %>
            </c:if>
            <c:if test="${!empty param.email}">
                <% email = request.getParameter("email"); %>
            </c:if>
            <% Cookie c1 = new Cookie("nev", nev);
                c1.setMaxAge(60*60*24*30);
                Cookie c2 = new Cookie("email", email);
                c2.setMaxAge(60*60*24*30);
                response.addCookie(c1);
                response.addCookie(c2);
            %>
        </c:if>
        <h1>Köszönjük, hogy regisztrált. Az eredményt <a href="teszt.jsp"> itt </a> tudja kipróbálni.</h1>
    </c:otherwise>
</c:choose>
</body>
</html>
