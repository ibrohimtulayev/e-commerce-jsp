package uz.pdp.shop.servlets.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.shop.entity.Category;
import uz.pdp.shop.entity.Product;
import uz.pdp.shop.repo.CategoryRepo;
import uz.pdp.shop.repo.ProductRepo;

import java.io.IOException;
import java.util.UUID;

import static uz.pdp.shop.config.DataLoader.em;

@WebServlet("/product/update")
public class EditProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String categoryId = req.getParameter("category");

        CategoryRepo categoryRepo = new CategoryRepo();
        Category category = categoryRepo.findById(UUID.fromString(categoryId));

        ProductRepo productRepo = new ProductRepo();
        Product product = productRepo.findById(UUID.fromString(req.getParameter("id")));
        product.setName(name);
        product.setPrice(Integer.valueOf(price));
        product.setCategory(category);

        em.getTransaction().begin();
        em.merge(product);
        em.getTransaction().commit();

        resp.sendRedirect("/admin/product/product.jsp");
    }
}
