package uz.pdp.shop.repo;

import uz.pdp.shop.entity.User;

import static uz.pdp.shop.config.DataLoader.em;

public class UserRepo extends BaseRepo<User> {
    public static User findByEmail(String email) {
        User user =  em.createQuery("select t from User t where t.email=:email",User.class)
                .setParameter("email", email).getSingleResult();

        if (user!=null){
            return user;
        }
        throw new RuntimeException("@#$%^&");
    }
}
