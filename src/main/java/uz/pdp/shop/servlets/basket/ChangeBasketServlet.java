package uz.pdp.shop.servlets.basket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.shop.entity.Basket;
import uz.pdp.shop.entity.Product;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

@WebServlet("/basket/change")
public class ChangeBasketServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UUID productId = UUID.fromString(req.getParameter("id"));
        String sign = req.getParameter("sign");

        Basket basket = (Basket) req.getSession().getAttribute("basket");
        Iterator<Map.Entry<Product, Integer>> iterator = basket.getBasketProduct().entrySet().iterator();

        while (iterator.hasNext()) {
            Map.Entry<Product, Integer> productEntry = iterator.next();
            Product product = productEntry.getKey();
            if (product.getId().equals(productId)) {
                if (sign.equals("plus")) {
                    productEntry.setValue(productEntry.getValue() + 1);
                } else if (sign.equals("minus") && productEntry.getValue() > 1) {
                    productEntry.setValue(productEntry.getValue() - 1);
                } else if (sign.equals("remove")) {
                    iterator.remove(); // Remove the product from the basket
                }
            }
        }

        resp.sendRedirect("/basket.jsp");
    }
}
