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
    <c:when test="${pageContext.request.method eq 'POST'}">
        <h1 ALIGN="CENTER">Regisztrációs Form</h1>
        <form ACTION="regisztracio.jsp" method="post">

            <table>
                <tr>
                    <td>* Email cím: </td>
                    <td> <input type="email" name="email"  size="20" min="5" pattern="^[a-z0-9]+@[a-z0-9.-]+\.[a-z]{2,4}$"> </td><br>
                    <c:if test="${! empty param.errorMsg}" >
                        <font color="red"> <b> ${param.errorMsg}     </b></font>
                    </c:if>
                </tr>
                <tr>
                    <td> *Jelszó: </td>
                    <td> <input type="password" name="password" value="" size="20" pattern="(?=.*\d)(?=.*[a-z]).{6,}"> </td>

                    <td> *Jelszó megerősítése: </td>
                    <td> <input type="password" name="password2" value="" size="20" pattern="(?=.*\d)(?=.*[a-z]).{6,}"> </td>

                    <c:if test="${! empty param.errorMsg1}" >
                        <font color="red"> <b> ${param.errorMsg1}     </b></font>
                    </c:if>
                </tr>

                <tr>
                    <td><input type="checkbox" name="tarol"/> Megjegyezze <br/></td>
                    <td><input type="submit" value="Regisztráció"> </td>
                </tr>
            </table>
        </form>
    </c:when>
    <c:otherwise>
        <c:if test="${!empty param.tarol}">
            <% String nev="Ismeretlen";
                String password="Ismeretlen";%>
            <c:if test="${!empty param.nev}">
                <% nev = request.getParameter("nev"); %>
            </c:if>
            <c:if test="${!empty param.email}">
                <% password = request.getParameter("email"); %>
            </c:if>
            <% Cookie c1 = new Cookie("nev", nev);
                c1.setMaxAge(60*60*24*30);
                Cookie c2 = new Cookie("email", password);
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
