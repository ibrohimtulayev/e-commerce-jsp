package uz.pdp.shop.servlets.basket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.shop.entity.Order;
import uz.pdp.shop.entity.Product;
import uz.pdp.shop.entity.User;
import uz.pdp.shop.repo.OrderRepo;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("currentUser");
        if (user!=null){
            List<Product>products = (List<Product>) req.getSession().getAttribute("products");

            Integer allSum = Integer.valueOf(req.getParameter("allSum"));
            Order order = Order.builder()
                    .products(products)
                    .totalSum(allSum)
                    .userId(user.getId())
                    .time(LocalDateTime.now())
                    .build();
            OrderRepo orderRepo = new OrderRepo();
            orderRepo.save(order);
            HttpSession session = req.getSession();
            session.removeAttribute("basket");
            session.removeAttribute("products");
            resp.sendRedirect("/showCategoryProduct.jsp?");
        }
        else resp.sendRedirect("/login.jsp");

    }
}
