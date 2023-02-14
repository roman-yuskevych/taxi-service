package taxi.controller.car;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import taxi.lib.Injector;
import taxi.model.Car;
import taxi.model.Driver;
import taxi.service.CarService;
import taxi.service.DriverService;

public class RemoveDriverFromCarController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("taxi");
    private final CarService carService = (CarService) injector.getInstance(CarService.class);
    private final DriverService driverService =
            (DriverService) injector.getInstance(DriverService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Car car = carService.get(Long.valueOf(req.getParameter("car_id")));
        Driver driver = driverService.get(Long.valueOf(req.getParameter("driver_id")));
        carService.removeDriverFromCar(driver, car);
        String sourcePath = req.getParameter("source");
        resp.sendRedirect(req.getContextPath() + sourcePath);
    }
}
