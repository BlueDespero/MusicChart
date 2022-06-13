<%@ page import="chart.musicchart.MusicChart" %>
<html>
<head>
    <title>Vote for a song!</title>
    <link href="${pageContext.request.contextPath}/style/star_rating.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/style/main.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="content">
    <%@include file="/WEB-INF/jspf/chart.jspf" %>
    <div style="text-align: center;">

        <h1>Current vote: <%=MusicChart.get_latest_entry().name%>
        </h1>

        <%@include file="/WEB-INF/jspf/countdown.jspf" %>
    </div>
    <p align="center">
    <iframe width="420" height="315"
            src=<%=MusicChart.get_latest_entry().url%>>
    </iframe>
    </p>
    <br>

    <%
        if (session.getAttribute("rated_song_name") != MusicChart.get_latest_entry().name) {
    %>

    <form method="get" action="/MusicChart/acceptvote">
        <fieldset class="rating">
            <legend>rating</legend>

            <input id="demo-1" type="radio" name="song_rating" value="-5">
            <label for="demo-1">1 star</label>
            <input id="demo-2" type="radio" name="song_rating" value="-4">
            <label for="demo-2">2 stars</label>
            <input id="demo-3" type="radio" name="song_rating" value="-3">
            <label for="demo-3">3 stars</label>
            <input id="demo-4" type="radio" name="song_rating" value="-2">
            <label for="demo-4">4 stars</label>
            <input id="demo-5" type="radio" name="song_rating" value="-1">
            <label for="demo-5">5 stars</label>


            <input id="demo-6" type="radio" name="song_rating" value="0">
            <label for="demo-6">1 star</label>

            <input id="demo-7" type="radio" name="song_rating" value="2">
            <label for="demo-7">2 stars</label>
            <input id="demo-8" type="radio" name="song_rating" value="3">
            <label for="demo-8">3 stars</label>
            <input id="demo-9" type="radio" name="song_rating" value="4">
            <label for="demo-9">4 stars</label>
            <input id="demo-10" type="radio" name="song_rating" value="5">
            <label for="demo-10">5 stars</label>
            <input id="demo-11" type="radio" name="song_rating" value="5">
            <label for="demo-11">5 stars</label>


            <div class="stars">
                <label for="demo-1" aria-label="-1 star" title="1 star"></label>
                <label for="demo-2" aria-label="-2 stars" title="2 stars"></label>
                <label for="demo-3" aria-label="-3 stars" title="3 stars"></label>
                <label for="demo-4" aria-label="-4 stars" title="4 stars"></label>
                <label for="demo-5" aria-label="-5 stars" title="5 stars"></label>

                <label for="demo-6" aria-label="0 stars" title="0 stars"></label>

                <label for="demo-7" aria-label="1 star" title="1 star"></label>
                <label for="demo-8" aria-label="2 stars" title="2 stars"></label>
                <label for="demo-9" aria-label="3 stars" title="3 stars"></label>
                <label for="demo-10" aria-label="4 stars" title="4 stars"></label>
                <label for="demo-11" aria-label="5 stars" title="5 stars"></label>
            </div>

            <input type="submit" value="Rate song!">
        </fieldset>
    </form>
    <%
    } else {
    %>
    <div style="text-align: center;">
        <h1>
            Thank you for voting!
            <br>
            Your score for this song is <%=session.getAttribute("rating_given")%> stars!
        </h1>
    </div>
    <%
        }
    %>
</div>
</body>
</html>