package com.javatmp.module.user.entity;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "country")
public class Country implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    @Id
    @Basic(optional = false)
    @Column(name = "countryId")
    private String countryId;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "country")
    private List<Countrytranslation> countrytranslationList;

    public Country() {
    }

    public Country(String countryId) {
        this.countryId = countryId;
    }
}
