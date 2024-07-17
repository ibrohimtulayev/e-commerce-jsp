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
import java.io.InputStream;
import java.util.UUID;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Part;

@WebServlet("/product/add")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // 10MB max file size
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String priceStr = req.getParameter("price");
        String categoryIdStr = req.getParameter("category");

        CategoryRepo categoryRepo = new CategoryRepo();
        Category category = categoryRepo.findById(UUID.fromString(categoryIdStr));

        ProductRepo productRepo = new ProductRepo();

        // Get the file part from the request
        Part filePart = req.getPart("photo");

        // Get the input stream from the file part
        InputStream fileContent = filePart.getInputStream();

        // Convert the input stream to byte array
        byte[] photoBytes = fileContent.readAllBytes();

        // Convert price String to Integer
        Integer price = null;
        if (priceStr != null && !priceStr.isEmpty()) {
            price = Integer.valueOf(priceStr);
        }

        // Create the Product object with photo bytes
        Product product = Product.builder()
                .name(name)
                .price(price)
                .category(category)
                .photo(photoBytes)
                .build();

        productRepo.save(product);
        resp.sendRedirect("/admin/product/product.jsp");
    }
}
