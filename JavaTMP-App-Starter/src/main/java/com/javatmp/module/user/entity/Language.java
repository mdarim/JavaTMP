package com.javatmp.module.user.entity;

import com.javatmp.module.user.entity.Themetranslation;
import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "language")
public class Language implements Serializable {

    private static final long serialVersionUID = 1L;
    @EqualsAndHashCode.Include
    @Id
    @Basic(optional = false)
    @Column(name = "languageId")
    private String languageId;
    @Column(name = "isDefaultLang")
    private Short isDefaultLang;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language", fetch = FetchType.LAZY)
    private List<Languagetranslation> languagetranslationList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language", fetch = FetchType.LAZY)
    private List<Timezonetranslation> timezonetranslationList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language")
    private List<Countrytranslation> countrytranslationList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language")
    private List<Themetranslation> themetranslationList;

    public Language() {
    }

    public Language(String languageId) {
        this.languageId = languageId;
    }
}
