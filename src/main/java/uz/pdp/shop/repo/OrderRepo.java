package uz.pdp.shop.repo;



import jakarta.persistence.TypedQuery;
import uz.pdp.shop.entity.Order;
import uz.pdp.shop.repo.BaseRepo;

import java.util.List;

import static uz.pdp.shop.config.DataLoader.em;

public class OrderRepo extends BaseRepo<Order> {

    public List<Order> findByUserId(Integer userId) {
      return   em.createQuery("select o from Order o where o.userId = :userId", Order.class)
                .setParameter("userId", userId).getResultList();
    }
}
