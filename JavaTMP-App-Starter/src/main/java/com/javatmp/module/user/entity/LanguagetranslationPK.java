package com.javatmp.module.user.entity;

import java.io.Serializable;
import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author JavaTMP
 */
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Embeddable
public class LanguagetranslationPK implements Serializable {

    @EqualsAndHashCode.Include
    @Basic(optional = false)
    @Column(name = "languageId")
    private String languageId;
    @EqualsAndHashCode.Include
    @Basic(optional = false)
    @Column(name = "langId")
    private String langId;

    public LanguagetranslationPK() {
    }

    public LanguagetranslationPK(String languageId, String langId) {
        this.languageId = languageId;
        this.langId = langId;
    }
}
