package com.javatmp.module.accounting.entity;

import com.javatmp.module.accounting.entity.Account;
import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author JavaTMP
 */
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "accountGroup")
public class AccountGroup implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Transient
    private AccountType type;
    @Column(name = "accountType")
    private Integer accountType;
    @Transient
    private List<Account> accountList;

    public AccountGroup() {
    }

    public AccountGroup(Integer id) {
        this.id = id;
    }

    public AccountGroup(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}
