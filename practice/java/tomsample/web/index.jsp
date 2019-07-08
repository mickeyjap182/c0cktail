<%@ page import="sample.entrypoint.Hello" %>
<%@ page import="entities.User" %>
<%@ page import="java.util.HashMap" %><%--

  Created by IntelliJ IDEA.
  User: yoshitaka.toyama
  Date: 2019-07-08
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <p><%=Hello.show() %></p>
  <p><%=Hello.tester() %></p>
  <%
    HashMap<String, User> map = Hello.getList();
    StringBuffer users = new StringBuffer("");
    users.append("<ol type='i'>");
    for (User user: map.values()) {
        users.append("<ul>" + (user.id + ":" + user.name  + ":" + user.genderCd) +"</ul>");
    }
    users.append("</ol>");
    request.setAttribute("user_attr", users.toString());
  %>

  <p><%=users %></p>
  <p>${title}</p>
  $END$
  </body>
</html>
