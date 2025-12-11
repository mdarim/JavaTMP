/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.javatmp.fw.data.jpa.util.JpaUtil;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.entity.User_;
import com.javatmp.module.user.service.UserService;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceException;
import jakarta.persistence.Query;
import jakarta.persistence.Tuple;
import jakarta.persistence.TupleElement;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.JoinType;
import jakarta.persistence.criteria.Path;
import jakarta.persistence.criteria.Root;

/**
 *
 * @author JavaTMP
 */
public class TestConvertPath {

    UserService userService;
    EntityManager em;

    public void main() {

        try {

            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<User> cq = cb.createQuery(User.class);
            CriteriaQuery<Tuple> cq = cb.createTupleQuery();
            Root<User> from = cq.from(User.class);
            from.join(User_.profilePicDocument, JoinType.LEFT);

            cq.multiselect(JpaUtil.convertArrToPaths(from, new String[]{
                "id", "userName", "firstName", "lastName",
                "profilePicDocument.documentId", "profilePicDocument.randomHash"}));
            Path<?> sortPath = JpaUtil.convertStringToPath(from, "id");
            String sortOrder = "asc";
            if (sortOrder.equals("asc")) {
                cq.orderBy(cb.asc(sortPath));
            } else {
                cq.orderBy(cb.desc(sortPath));
            }

            Query query = em.createQuery(cq);
            query.setFirstResult(0);
            query.setMaxResults(1);
            List<Tuple> retList = query.getResultList();
            for (Tuple tuple : retList) {
                for (TupleElement<?> e : tuple.getElements()) {
                    System.out.println(tuple.get(e));
                }

            }
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t != null) {
                System.out.println("type [" + e.getClass().getName() + "]");
                System.out.println("e [" + e.getMessage() + "]");
                t = t.getCause();
            }
        }

    }

}
