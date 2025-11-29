package com.javatmp.module.message.entity;

import com.javatmp.module.user.entity.User;
import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "message")
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long messageId;
    private String messageTitle;
    private String messageContentText;
    private Date creationDate;
    private Long fromUserId;
    private Long toUserId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(insertable = false, updatable = false, name = "fromUserId")
    private User fromUser;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(insertable = false, updatable = false, name = "toUserId")
    private User toUser;
    private Short messageStatus;
    @Transient
    private Long[] messageTos;

    public Message() {
    }

    public Message(Long messageId, String messageTitle, String messageContentText, Date creationDate, Long fromUser, Long toUser, Short messageStatus) {
        this.messageId = messageId;
        this.messageTitle = messageTitle;
        this.messageContentText = messageContentText;
        this.creationDate = creationDate;
        this.fromUserId = fromUser;
        this.toUserId = toUser;
        this.messageStatus = messageStatus;
    }
}
