<%--
  Created by IntelliJ IDEA.
  User: poles
  Date: 2021. 12. 08.
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Teszt oldal</title>
</head>
<%
    String nev="Ismeretlen";
    String email="Ismeretlen";
    Cookie [] cki =request.getCookies();

    if (cki!=null) {
        for (int i=0; i<cki.length; i++) {
            if (cki[i].getName().equals("nev")) {
                nev=cki[i].getValue();
            } else if (cki[i].getName().equals("email")) {
                email=cki[i].getValue();
            }
        }
    }
%>
<body>
<h1>Tesztoldal</h1>
<h3>Név:  <%= nev %></h3>
<h3>Email:  <%= email %></h3>
</body>
</html>
