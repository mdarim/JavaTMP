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
public class CountrytranslationPK implements Serializable {

    @EqualsAndHashCode.Include
    @Basic(optional = false)
    @Column(name = "countryId")
    private String countryId;
    @EqualsAndHashCode.Include
    @Basic(optional = false)
    @Column(name = "langId")
    private String langId;

    public CountrytranslationPK() {
    }

    public CountrytranslationPK(String countryId, String langId) {
        this.countryId = countryId;
        this.langId = langId;
    }
}
