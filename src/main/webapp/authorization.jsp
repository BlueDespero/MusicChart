<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.time.Instant" %>
<%@ page import="chart.musicchart.HelloServlet" %>
<html>
<head>
    <title>Echoing HTML Request Parameters</title>
    <link href="${pageContext.request.contextPath}/style/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="content">

    <div class="form-center">
        <form class="input" method="post" action="/MusicChart/authorization">
            <label> Login:
                <input type="text" name="login">
            </label>
            <br>
            <label> Password:
                <input type="password" name="password">
            </label>
            <br>
            <input class="buttonHolder" type="submit" value="Authorize">
        </form>
    </div>

    <%
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        if (login != null || password != null) {
            assert login != null;
            if (Objects.equals(login, "login") && Objects.equals(password, "password")) {
                HelloServlet.setLast_authorization(Timestamp.from(Instant.now()));
                request.getRequestDispatcher("/addsong").forward(request, response);
            } else {
    %>
    <h3>Authorization failed!</h3>
    <%
            }
        }
    %>
</div>
</body>
</html>