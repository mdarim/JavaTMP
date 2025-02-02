/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.javatmp.module.user.entity.User;

import java.sql.SQLException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author JavaTMP
 */
public class TestingSelectHibernateJPA {

    public static void main(String[] args) throws SQLException {
        EntityManagerFactory factory = null;
        EntityManager em = null;
        try {
            factory = Persistence.createEntityManagerFactory("AppPU");
            em = factory.createEntityManager();
            User user = em.createQuery(
                    "select new com.javatmp.domain.User(user.id, user.userName, user.firstName, user.lastName, user.status, "
                    + "user.birthDate, user.creationDate, user.email, user.lang, user.theme, user.countryId, user.address, "
                    + "user.timezone, user.profilePicDocumentId, profilePicDocument.randomHash) "
                    + "from User user left join user.profilePicDocument as profilePicDocument "
                    + "where user.userName = :userName", User.class)
                    .setParameter("userName", "user1")
                    .getSingleResult();
            em.close();
            System.out.println((user));
        } catch (PersistenceException e) {
            Throwable t;
            for (t = e.getCause(); t != null; t = t.getCause()) {
                System.out.println("Exception:" + t);
            }
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

}
