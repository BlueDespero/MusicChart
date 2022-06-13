package chart.musicchart;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "acceptvote", value = "/acceptvote")
public class AcceprVoteServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("rated_song_name") != MusicChart.get_latest_entry().name) {
            int rating_given = Integer.parseInt(request.getParameter("song_rating"));
            MusicChart.vote_on_current(rating_given);

            session.setAttribute("rating_given", rating_given);
            session.setAttribute("rated_song_name", MusicChart.get_latest_entry().name);
        }

        request.getRequestDispatcher("/voting").forward(request, response);
    }
}