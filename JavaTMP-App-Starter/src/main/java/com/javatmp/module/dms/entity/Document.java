package com.javatmp.module.dms.entity;

import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.Basic;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "document")
public class Document implements Serializable {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long documentId;
    private String documentName;
    private long documentSize;
    private String contentType;
    @Lob
    @Basic(fetch = FetchType.LAZY)
    private byte[] documentContent;
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    private Long randomHash;
    private Short documentType;
    private Long parentDocumentId;
    private Short status;
    private Long createdByUserId;
    @Transient
    private String documentContentTemp;

    public Document() {
    }

    public Document(Long documentId, Long randomHash) {
        this.documentId = documentId;
        this.randomHash = randomHash;
    }

    public Document(Long documentId, String documentName, Long documentSize,
            String contentType, Date creationDate,
            Long randomHash, Short documentType, Long parentDocumentId,
            Short status, Long createdByUserId) {
        this.documentId = documentId;
        this.documentName = documentName;
        this.documentSize = documentSize;
        this.contentType = contentType;
        this.creationDate = creationDate;
        this.randomHash = randomHash;
        this.documentType = documentType;
        this.parentDocumentId = parentDocumentId;
        this.status = status;
        this.createdByUserId = createdByUserId;
    }
}
