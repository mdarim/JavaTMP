package com.javatmp.module.user.entity;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "theme")
@Inheritance(strategy = InheritanceType.JOINED) //Highly normalized
public class Theme implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    @Id
    @Basic(optional = false)
    @Column(name = "themeId")
    private String themeId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "theme")
    private List<Themetranslation> themetranslationList;

//    private String themeName;
    public Theme() {
    }

    public Theme(String themeId) {
        this.themeId = themeId;
    }

    public Theme(Theme theme) {
        this.themeId = theme.themeId;
//        this.themeName = theme.themeName;
    }
}
