package uz.pdp.shop.servlets.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.shop.entity.Category;
import uz.pdp.shop.repo.CategoryRepo;

import java.io.IOException;

@WebServlet("/category/add")
public class AddCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");

        Category category = Category.builder()
                .name(name)
                .build();
        CategoryRepo categoryRepo = new CategoryRepo();
        categoryRepo.save(category);
        resp.sendRedirect("/admin/category/category.jsp");
    }
}
