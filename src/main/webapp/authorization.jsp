<%@ page import="java.util.Objects" %>
<%@ page import="chart.musicchart.HelloServlet" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.time.Instant" %>
<html>
<head>
    <title>Echoing HTML Request Parameters</title>
</head>
<body>
<form method="post" action = "/MusicChart/authorization">
    <label> Login:
        <input type="text" name="login">
    </label>
    <label> Password:
        <input type="password" name="password">
    </label>
    <input type="submit" value="Authorize">
</form>

<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    if (login != null || password != null) {
        assert login != null;
        if (Objects.equals(login, "login") && Objects.equals(password, "password"))
        {
            HelloServlet.setLast_authorization(Timestamp.from(Instant.now()));
            request.getRequestDispatcher("/addsong").forward(request, response);
        }
        else {
%>
<h3>Authorization failed!</h3>
<%
        }
    }
%>
</body>
</html>