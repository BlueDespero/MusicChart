<%@ page import="java.util.Objects" %>
<%@ page import="org.apache.commons.validator.routines.UrlValidator" %>
<%@ page import="chart.musicchart.MusicChart" %>
<html>
<head>
    <title>Echoing HTML Request Parameters</title>
</head>
<body>

<%@include file="/WEB-INF/jspf/chart.jspf" %>


<form method="get" action="/MusicChart/addsong">
    <label> Song name:
        <input type="text" name="song_name">
    </label>
    <br>
    <label> Song url:
        <input type="url" name="song_url">
    </label>
    <br>
    <input type="submit" value="Authorize">
</form>

<%
    String song_name = request.getParameter("song_name");
    String song_url = request.getParameter("song_url");
    if (song_name != null && !song_name.equals("") && song_url != null && !song_url.equals("")) {
        UrlValidator urlValidator = new UrlValidator();
        if (urlValidator.isValid(song_url)) {
            MusicChart.add_entry(song_name, song_url);
            request.getRequestDispatcher("/voting").forward(request, response);
        } else {
%>
<h3> Provided URL is invalid!</h3>
<%
    }
} else if (Objects.equals(song_name, "") || Objects.equals(song_url, "")) {
%>
<h3>Please provide a name and an url of the song you want users to vote on!</h3>
<%
    }
%>
</body>
</html>