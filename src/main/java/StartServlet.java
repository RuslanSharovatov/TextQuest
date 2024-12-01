import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "StartServlet", value = "/start")
public class StartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        if(session.getAttribute("start") == null) {
            session.setAttribute("start", false);
            session.setAttribute("choice", "");
        }

        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
            if(action != null) {
                switch (action) {
                    case "start": session.setAttribute("start", true);
                    break;
                    case "brave": session.setAttribute("choice", "brave");
                    break;
                    case "noBrave": session.setAttribute("choice", "coward");
                    break;
                    case "directly": session.setAttribute("choice", "directly");
                    break;
                    case "left": session.setAttribute("choice", "left");
                    break;
                    case "right": session.setAttribute("choice", "right");
                    break;
                    case "drop": session.setAttribute("choice", "brave");
                    break;
                    case "exit": session.setAttribute("choice", "exit");
                    break;
                    case "run": session.setAttribute("choice", "brave");
                    break;
                    case "search": session.setAttribute("choice", "search");
                    break;
                    case "fight": session.setAttribute("choice", "fight");
                    break;
                    case "escape": session.setAttribute("choice", "escape");
                    break;
                }
            }
        resp.sendRedirect("/index.jsp");
    }
}
