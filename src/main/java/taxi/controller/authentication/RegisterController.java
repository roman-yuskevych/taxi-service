package taxi.controller.authentication;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import taxi.lib.Injector;
import taxi.model.Driver;
import taxi.service.CryptographicService;
import taxi.service.DriverService;

public class RegisterController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("taxi");
    private final DriverService driverService = (DriverService) injector
            .getInstance(DriverService.class);
    private final CryptographicService cryptographicService =
            (CryptographicService) injector.getInstance(CryptographicService.class);

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        String login = req.getParameter("login");
        if (driverService.findByLogin(login).isEmpty()) {
            String name = req.getParameter("name");
            String licenseNumber = req.getParameter("license_number");
            String encodedPassword = cryptographicService.encode(req.getParameter("password"));
            Driver driver = new Driver(name, licenseNumber, login, encodedPassword);
            driverService.create(driver);
            resp.sendRedirect(req.getContextPath() + "/index");
        } else {
            req.setAttribute("errorMsg",
                    "Username " + login + " is already registered, please choose another.");
            req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
        }
    }
}
