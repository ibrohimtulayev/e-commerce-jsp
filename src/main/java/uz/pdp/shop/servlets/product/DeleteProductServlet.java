package uz.pdp.shop.servlets.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.shop.repo.ProductRepo;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/product/delete")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ProductRepo productRepo = new ProductRepo();
        productRepo.deleteById(UUID.fromString(req.getParameter("id")));
        resp.sendRedirect("/admin/product/product.jsp");
    }
}
