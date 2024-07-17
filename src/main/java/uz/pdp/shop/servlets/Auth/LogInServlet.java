package uz.pdp.shop.servlets.Auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.shop.entity.User;
import uz.pdp.shop.repo.UserRepo;

import java.io.IOException;
import java.util.Objects;

@WebServlet("/auth/login")
public class LogInServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String rememberMe = req.getParameter("rememberMe");

        User user = UserRepo.findByEmail(email);


        if(Objects.equals(rememberMe, "on")){
            Cookie cookie = new Cookie(
                    "userId",
                    user.getId().toString()
            );
            cookie.setSecure(false);
            cookie.setMaxAge(60*60*3);
            cookie.setPath("/");
            resp.addCookie(cookie);
        }

        req.getSession().setAttribute("currentUser", user);
        if (user.getPassword().equals(password)){
            if (user.isAdmin()){
                resp.sendRedirect("/admin/admin.jsp");
            }
            else {
                Object basket = req.getSession().getAttribute("basket");
                if (basket!=null){
                    resp.sendRedirect("/basket.jsp");
                }else {
                    resp.sendRedirect("/showCategoryProduct.jsp");
                }
            }
        }
    }
}
