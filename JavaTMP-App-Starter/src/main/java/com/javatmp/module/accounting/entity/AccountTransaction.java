package com.javatmp.module.accounting.entity;

import com.javatmp.module.accounting.entity.Transaction;
import com.javatmp.module.accounting.entity.Account;
import java.io.Serializable;
import java.math.BigDecimal;
import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
@Table(name = "accountTransaction")
public class AccountTransaction implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
// @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "amount")
    private BigDecimal amount;
    @Column(name = "accountId")
    private Long accountId;
    @Column(name = "transactionId")
    private Long transactionId;
    @Column(name = "description")
    private String description;
    @Column(name = "status")
    private Short status;
    @Transient
    private BigDecimal debit;
    @Transient
    private BigDecimal credit;
    @Transient
    private Account account;
    @Transient
    private Transaction transaction;

    public AccountTransaction() {
    }

    public AccountTransaction(Long id) {
        this.id = id;
    }

    public AccountTransaction(Long id, BigDecimal amount, Long accountId, Long transactionId, String description, Short status) {
        this.id = id;
        this.amount = amount;
        this.accountId = accountId;
        this.transactionId = transactionId;
        this.description = description;
        this.status = status;
    }
}
