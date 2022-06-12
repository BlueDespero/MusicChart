package chart.musicchart;


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

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if ( (Timestamp.from(Instant.now()).getTime() - last_authorization.getTime())/(60 * 1000) >= 5)
            this.do_authorization();
        else
            this.do_voting();
    }

    private void do_voting() {
    }

    private void do_authorization() {
    }

    public void destroy() {
    }
}