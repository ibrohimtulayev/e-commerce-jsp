package uz.pdp.shop.servlets.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.shop.entity.Category;
import uz.pdp.shop.repo.CategoryRepo;

import java.io.IOException;
import java.util.UUID;

import static uz.pdp.shop.config.DataLoader.em;

@WebServlet("/category/edit")
public class EditCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryRepo categoryRepo = new CategoryRepo();
        Category category = categoryRepo.findById(UUID.fromString(req.getParameter("id")));
        category.setName(req.getParameter("name"));

        em.getTransaction().begin();
        em.merge(category);
        em.getTransaction().commit();

        resp.sendRedirect("/admin/category/category.jsp");
    }
}
