package com.javatmp.module.user.entity;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "timezone")
public class Timezone implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    @Id
    private String timezoneId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "timezone", fetch = FetchType.LAZY)
    private List<Timezonetranslation> timezonetranslationList;
    @Transient
    private String timezoneName;
    @Transient
    private String timezoneDescription;
    @Transient
    private String idName;

    @Transient
    private String offsetDescription;

    public Timezone() {
    }

    public Timezone(String timezoneId, String idName, String offsetDescription, String timezoneName, String timezoneDescription) {
        this.timezoneId = timezoneId;
        this.idName = idName;
        this.offsetDescription = offsetDescription;
        this.timezoneName = timezoneName;
        this.timezoneDescription = timezoneDescription;
    }
}
