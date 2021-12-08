<%--
  Created by IntelliJ IDEA.
  User: poles
  Date: 2021. 12. 07.
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Szelvények</title>
</head>
<body>

<c:choose>
    <c:when test="${param.type eq \"gepi\"}">
        <form method="post" action="feladas.jsp">
            <% double elso = Math.floor(Math.random() * 100)+1;
                double masodik = Math.floor(Math.random() * 100+1);
                double harmadik = Math.floor(Math.random() * 100)+1;
                double negyedik = Math.floor(Math.random() * 100)+1;
                double otodik = Math.floor(Math.random() * 100)+1;

                Cookie ck = new Cookie("ck","gepi");
                ck.setMaxAge(24*60*60*7);
                response.addCookie(ck);
            %>

            Szelvény információk:<br>
            Kitöltés típusa: ${param.type}<br>
            Szelvény érvényessége: ${param.valid} hetes<br><hr>
            Számai: <br>

            <%= elso %>,
            <%= masodik %>,
            <%= harmadik %>,
            <%= negyedik %>,
            <%= otodik %>,<br>

            <input type="submit" value="Gépi szelvény feladása">
        </form>

    </c:when>
    <c:otherwise>
        <%
            Cookie ck = new Cookie("ck","kezi");
            ck.setMaxAge(24*60*60*7);
            response.addCookie(ck);%>
        <c:choose>
            <c:when test="${param.valid eq \"1\"}">
                <%
                    Cookie ckvalid = new Cookie("ckvalid","1");
                    ck.setMaxAge(24*60*60*7);
                    response.addCookie(ckvalid);%>
            </c:when>
            <c:otherwise>
                <%
                    Cookie ckvalid = new Cookie("ckvalid","5");
                    ck.setMaxAge(24*60*60*7);
                    response.addCookie(ckvalid);%>
            </c:otherwise>
        </c:choose>
        <form method="post" action="kezi.jsp">
            Minden sorban válaszzon a számok közül egyet! Összesen 5-t.
            <table>
                <tr>
                    <td>
                        <input type="number" name="elso"  min="0" max="90" > <br>
                        <input type="number" name="masodik" min="0" max="90" ><br>
                        <input type="number" name="harmadik" min="0" max="90" ><br>
                        <input type="number" name="negyedik" min="0" max="90" ><br>
                        <input type="number" name="otodik" min="0" max="90" ><br>
                    </td>
                </tr>
            </table>


            <input type="submit" value="Szelvény feladása">
        </form>
        <c:if test="${!empty param.errorMsg}">

            ${param.errorMsg}

        </c:if>


    </c:otherwise>
</c:choose>
</body>
</html>
