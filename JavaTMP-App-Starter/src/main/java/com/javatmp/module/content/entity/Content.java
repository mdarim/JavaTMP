package com.javatmp.module.content.entity;

import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "Content")
public class Content implements Serializable {

    private static final long serialVersionUID = 2L;
    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long contentId;
    private String title;
    private String summaryText;
    private String contentText;
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    private Long createdBy;
    private Short status;

    public Content() {
    }

    public Content(Long contentId) {
        this.contentId = contentId;
    }

    public Content(Long contentId, String title, String summaryText, String contentText,
            Date creationDate, Long createdBy, Short status) {
        this.contentId = contentId;
        this.title = title;
        this.summaryText = summaryText;
        this.contentText = contentText;
        this.creationDate = creationDate;
        this.createdBy = createdBy;
        this.status = status;
    }
}
