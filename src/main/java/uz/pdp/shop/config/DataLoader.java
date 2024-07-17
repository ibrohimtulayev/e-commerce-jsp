package uz.pdp.shop.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import uz.pdp.shop.entity.User;

@WebListener
public class DataLoader implements ServletContextListener {
    public static EntityManagerFactory emf;
    public static EntityManager em;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        emf = Persistence.createEntityManagerFactory("web-app");

        em = emf.createEntityManager();
    }


}