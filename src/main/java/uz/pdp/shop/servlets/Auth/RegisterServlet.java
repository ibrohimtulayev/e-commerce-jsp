package uz.pdp.shop.servlets.Auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.shop.entity.User;
import uz.pdp.shop.repo.UserRepo;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = User.builder()
                .firstName(name)
                .email(email)
                .password(password)
                .build();
        UserRepo userRepo = new UserRepo();
        userRepo.save(user);
        resp.sendRedirect("/showCategoryProduct.jsp?");
    }
}
