package uz.pdp.shop.repo;

import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.UUID;

import static uz.pdp.shop.config.DataLoader.em;

public class BaseRepo<T> {
    private final Class<T> persistenceClass;

    public BaseRepo() {
        persistenceClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    public void begin() {
        em.getTransaction().begin();
    }

    public void commit() {
        em.getTransaction().commit();
    }

    public List<T> findAll() {
        return em.createQuery("from " + persistenceClass.getSimpleName(), persistenceClass).getResultList();
    }

    public void deleteById(UUID id) {
        begin();
        T t = em.find(persistenceClass, id);
        em.remove(t);
        commit();
    }

    public T findById(UUID id) {
        return em.find(persistenceClass, id);
    }

    public void save(T t) {
        begin();
        em.persist(t);
        commit();
    }
}
