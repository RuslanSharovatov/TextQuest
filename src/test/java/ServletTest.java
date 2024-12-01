import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;

public class ServletTest {

    @Test
    public void toDoPostTest() throws ServletException, IOException {
        HttpServletResponse response = Mockito.mock(HttpServletResponse.class);
        HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
        HttpSession session = Mockito.mock(HttpSession.class);

        Mockito.when(request.getSession()).thenReturn(session);
        Mockito.when(session.getAttribute("start")).thenReturn(false);
        Mockito.when(session.getAttribute("choice")).thenReturn("");

        StartServlet servlet = new StartServlet();
        servlet.doPost(request, response);

        assertFalse((Boolean) session.getAttribute("start"));
        assertEquals("", session.getAttribute("choice"));
    }
}
