package uz.pdp.shop.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.shop.entity.Basket;
import uz.pdp.shop.entity.Product;
import uz.pdp.shop.repo.ProductRepo;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/basket/add")
public class AddToBasketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UUID productId = UUID.fromString(req.getParameter("productId"));
        ProductRepo productRepo = new ProductRepo();
        Product product = productRepo.findById(productId);
        HttpSession session = req.getSession();
        Object object = session.getAttribute("basket");
        if (object==null){
            Basket basket = new Basket();
            basket.getBasketProduct().put(product,1);
            session.setAttribute("basket",basket);
        }
        else {
            Basket basket = (Basket) object;
            basket.getBasketProduct().put(product,1);
            session.setAttribute("basket",basket);

        }
        resp.sendRedirect("/showCategoryProduct.jsp?id="+product.getCategory().getId());
    }
}
