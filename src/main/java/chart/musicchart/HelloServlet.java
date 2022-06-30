package chart.musicchart;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

@WebServlet(name = "hello", value = "/hello")
public class HelloServlet extends HttpServlet {
    private static Timestamp last_authorization;

    static {
        last_authorization = new Timestamp(0);
    }

    public static void setLast_authorization(Timestamp last_authorization) {
        HelloServlet.last_authorization = last_authorization;
    }

    public static long getLast_authorization() {
        return last_authorization.getTime();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ((Timestamp.from(Instant.now()).getTime() - last_authorization.getTime()) / (60 * 1000) >= 5)
            request.getRequestDispatcher("/authorization").forward(request, response);
        else
            request.getRequestDispatcher("/voting").forward(request, response);
    }
}