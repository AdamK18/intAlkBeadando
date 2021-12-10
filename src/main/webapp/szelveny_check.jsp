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
        <form method="post" action="eredmeny.jsp">
            <%
                int szam1 = (int)Math.floor(Math.random() * 100)+1;
                int szam2 = (int)Math.floor(Math.random() * 100+1);
                int szam3 = (int)Math.floor(Math.random() * 100)+1;
                int szam4 = (int)Math.floor(Math.random() * 100)+1;
                int szam5 = (int)Math.floor(Math.random() * 100)+1;
            %>
            Szelvény információk:<br>
            Kitöltés típusa: ${param.type}<br>
            Számai: <br>
            <%= szam1 %>,
            <%= szam2 %>,
            <%= szam3 %>,
            <%= szam4 %>,
            <%= szam5 %>,
            <br>
            <input type="hidden" name="szam1" value="<%=szam1%>">
            <input type="hidden" name="szam2" value="<%=szam2%>">
            <input type="hidden" name="szam3" value="<%=szam3%>">
            <input type="hidden" name="szam4" value="<%=szam4%>">
            <input type="hidden" name="szam5" value="<%=szam5%>">
            <input type="submit" value="Gépi szelvény feladása">
        </form>

    </c:when>
    <c:otherwise>
        <form method="post" action="kezi.jsp">
            Minden sorban válaszzon a számok közül egyet! Összesen 5-t.
            <table>
                <tr>
                    <td>
                        <input type="number" name="szam1" min="0" max="90"><br>
                        <input type="number" name="szam2" min="0" max="90" ><br>
                        <input type="number" name="szam3" min="0" max="90" ><br>
                        <input type="number" name="szam4" min="0" max="90" ><br>
                        <input type="number" name="szam5" min="0" max="90" ><br>
                    </td>
                </tr>
            </table>
            <input type="submit">
        </form>
        <c:if test="${!empty param.errorMsg}">
            ${param.errorMsg}
        </c:if>
    </c:otherwise>
</c:choose>
</body>
</html>
