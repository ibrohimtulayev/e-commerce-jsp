package uz.pdp.shop.repo;

import jakarta.persistence.TypedQuery;
import uz.pdp.shop.entity.Product;

import java.util.List;
import java.util.UUID;

import static uz.pdp.shop.config.DataLoader.em;

public class ProductRepo extends BaseRepo<Product>{

    public List<Product> findByCategoryId(UUID categoryId) {
        begin();
        TypedQuery<Product> query = em.createQuery("select t from Product t where category.id=:categoryId", Product.class);
        commit();
       return query.setParameter("categoryId",categoryId).getResultList();

    }
}
