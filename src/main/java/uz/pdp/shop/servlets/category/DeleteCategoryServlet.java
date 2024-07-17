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

@WebServlet("/category/delete")
public class DeleteCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UUID id = UUID.fromString(req.getParameter("id"));
        CategoryRepo categoryRepo = new CategoryRepo();

        categoryRepo.deleteById(id);
        resp.sendRedirect("/admin/category/category.jsp");

    }


}
