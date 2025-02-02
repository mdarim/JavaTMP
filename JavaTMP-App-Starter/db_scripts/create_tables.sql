CREATE TABLE `language` (
    languageId varchar(4) NOT NULL,
    isDefaultLang TINYINT,
    CONSTRAINT language_languageId_pk PRIMARY KEY (languageId)
) ENGINE=InnoDB;

CREATE TABLE `languageTranslation` (
    languageId varchar(4) NOT NULL,
    langId varchar(4) NOT NULL,
    languageName varchar(255) NOT NULL,
    CONSTRAINT languageTr_pk PRIMARY KEY (languageId, langId),
    CONSTRAINT languageTr_id_fk FOREIGN KEY (languageId) REFERENCES `language` (languageId),
    CONSTRAINT languageTr_langId_fk FOREIGN KEY (langId) REFERENCES `language` (languageId)
) ENGINE=InnoDB;

CREATE TABLE `theme` (
    themeId varchar(32) NOT NULL,
    CONSTRAINT theme_themeId_pk PRIMARY KEY (themeId)
) ENGINE=InnoDB;

CREATE TABLE `themeTranslation` (
    themeId varchar(32) NOT NULL,
    langId varchar(4) NOT NULL,
    themeName varchar(255) NOT NULL,
    CONSTRAINT themeTr_pk PRIMARY KEY (themeId, langId),
    CONSTRAINT themeTr_themeId_fk FOREIGN KEY (themeId) REFERENCES theme (themeId),
    CONSTRAINT themeTr_langId_fk FOREIGN KEY (langId) REFERENCES `language` (languageId)
) ENGINE=InnoDB;

CREATE TABLE `timezone` (
    timezoneId varchar(64) NOT NULL,
    CONSTRAINT timezone_timezoneId_pk PRIMARY KEY (timezoneId)
) ENGINE=InnoDB;

CREATE TABLE `timezoneTranslation` (
    timezoneId varchar(64) NOT NULL,
    langId varchar(4) NOT NULL,
    timezoneName varchar(255) NOT NULL,
    CONSTRAINT timezoneTr_pk PRIMARY KEY (timezoneId, langId),
    CONSTRAINT timezoneTr_timezoneId_fk FOREIGN KEY (timezoneId) REFERENCES timezone (timezoneId),
    CONSTRAINT timezoneTr_langId_fk FOREIGN KEY (langId) REFERENCES `language` (languageId)
) ENGINE=InnoDB;

CREATE TABLE `country` (
    countryId varchar(4) NOT NULL,
    CONSTRAINT country_countryId_pk PRIMARY KEY (countryId)
) ENGINE=InnoDB;

CREATE TABLE `countryTranslation` (
    countryId varchar(4) NOT NULL,
    langId varchar(4) NOT NULL,
    countryName varchar(255) NOT NULL,
    CONSTRAINT countryTr_pk PRIMARY KEY (countryId, langId),
    CONSTRAINT countryTr_countryId_fk FOREIGN KEY (countryId) REFERENCES country (countryId),
    CONSTRAINT countryTr_langId_fk FOREIGN KEY (langId) REFERENCES `language` (languageId)
) ENGINE=InnoDB;

CREATE TABLE `document` (
    documentId BIGINT NOT NULL AUTO_INCREMENT,
    documentName varchar(255) NOT NULL,
    documentSize BIGINT NOT NULL,
    contentType varchar(255) NOT NULL,
    documentContent MEDIUMBLOB NOT NULL,
    creationDate TIMESTAMP NOT NULL,
    randomHash BIGINT NOT NULL,
    documentType int(1) NOT NULL,
    parentDocumentId BIGINT DEFAULT NULL,
    status TINYINT NOT NULL,
    createdByUserId BIGINT DEFAULT NULL,
    CONSTRAINT document_documentId_pk PRIMARY KEY (documentId),
    CONSTRAINT document_parentDocumentId_fk FOREIGN KEY (parentDocumentId) REFERENCES document (documentId)
) ENGINE=InnoDB;

CREATE TABLE `user` (
    id BIGINT NOT NULL AUTO_INCREMENT,
    userName varchar(48) NOT NULL,
    password varchar(48) NOT NULL,
    firstName varchar(30) NOT NULL,
    lastName varchar(30) NOT NULL,
    status TINYINT NOT NULL,
    gender TINYINT UNSIGNED,
    birthDate DATE NOT NULL,
    countryId varchar(4) NOT NULL,
    address TEXT,
    email varchar(45) NOT NULL,
    lang varchar(4) NOT NULL,
    theme varchar(48) NOT NULL,
    timezone varchar(64) NOT NULL,
    lastAccessTime TIMESTAMP NULL DEFAULT NULL, -- https://dev.mysql.com/doc/refman/5.5/en/timestamp-initialization.html
    profilePicDocumentId BIGINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT user_id_pk PRIMARY KEY (id),
    CONSTRAINT user_userName_uni UNIQUE(userName),
    CONSTRAINT user_profilePicDocumentId_fk FOREIGN KEY (profilePicDocumentId) REFERENCES document (documentId),
    CONSTRAINT user_countryId_fk FOREIGN KEY (countryId) REFERENCES country (countryId),
    CONSTRAINT user_lang_fk FOREIGN KEY (lang) REFERENCES `language` (languageId),
    CONSTRAINT user_theme_fk FOREIGN KEY (theme) REFERENCES theme (themeId),
    CONSTRAINT user_timezone_fk FOREIGN KEY (timezone) REFERENCES timezone (timezoneId)
) ENGINE=InnoDB;

-- Add cons CONSTRAINT on document for user id:
ALTER TABLE document ADD CONSTRAINT document_createdByUserId_fk FOREIGN KEY (createdByUserId) REFERENCES `user` (id);

CREATE TABLE `activity` (
    id BIGINT NOT NULL AUTO_INCREMENT,
    creationDate TIMESTAMP NOT NULL,
    userId BIGINT,
    sessionId varchar(128),
    IPaddress varchar(48),
    timeLast int unsigned,
    actionType varchar(128),
    actionId varchar(255),
    parentActId BIGINT,
    CONSTRAINT activity_id_pk PRIMARY KEY (id),
    CONSTRAINT activity_userId_fk FOREIGN KEY (userId) REFERENCES `user` (id),
    CONSTRAINT activity_parentActId_fk FOREIGN KEY (parentActId) REFERENCES `activity` (id)
) ENGINE=InnoDB;


CREATE TABLE `event` (
    id BIGINT NOT NULL AUTO_INCREMENT,
    creationDate TIMESTAMP NOT NULL,
    createdBy BIGINT,
    title varchar(255),
    description TEXT,
    startDate DATETIME,
    endDate  DATETIME,
    status TINYINT NOT NULL,
    CONSTRAINT event_id_pk PRIMARY KEY (id),
    CONSTRAINT event_createdBy_fk FOREIGN KEY (createdBy) REFERENCES `user` (id)
) ENGINE=InnoDB;

CREATE TABLE `message` (
    messageId BIGINT NOT NULL AUTO_INCREMENT,
    messageTitle varchar(255),
    messageContentText TEXT,
    creationDate TIMESTAMP NOT NULL,
    fromUserId BIGINT,
    toUserId BIGINT,
    messageStatus TINYINT NOT NULL,
    CONSTRAINT message_id_pk PRIMARY KEY (messageId),
    CONSTRAINT message_fromUserId_fk FOREIGN KEY (fromUserId) REFERENCES `user` (id),
    CONSTRAINT message_toUserId_fk FOREIGN KEY (toUserId) REFERENCES `user` (id)
) ENGINE=InnoDB;

CREATE TABLE `Content` (
    contentId BIGINT NOT NULL AUTO_INCREMENT,
    title varchar(255),
    summaryText TEXT,
    contentText TEXT,
    creationDate TIMESTAMP NOT NULL,
    createdBy BIGINT not null,
    status TINYINT NOT NULL,
    CONSTRAINT content_contentId_pk PRIMARY KEY (contentId),
    CONSTRAINT content_createdBy_fk FOREIGN KEY (createdBy) REFERENCES `user` (id)
) ENGINE=InnoDB;