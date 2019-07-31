
CREATE DATABASE [Ethelp];
GO

USE Ethelp;
GO


CREATE TABLE category (
    category_id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
    name varchar(255)
);


CREATE TABLE role (
    role_id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
    name varchar(255)
);

CREATE TABLE member (
	    member_id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
        date_create DATETIME NOT NULL
                DEFAULT CURRENT_TIMESTAMP, 
	    date_of_birth date,
	    email varchar(255),
	    first_name varchar(255),
	    last_name varchar(255),
	    password_hash varchar(255)
);
Go

CREATE TABLE help (
	    help_id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
	    date_created datetime default current_timestamp,
	    message text,
	    title character varying(255),
	    member_id bigint NOT NULL,
        CONSTRAINT fk_help_member_id FOREIGN KEY (member_id)
        REFERENCES member(member_id)
);
GO



CREATE TABLE help_help_type (
    help_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    help_type_id integer NOT NULL
);
GO

CREATE TABLE help_like (
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	member_id BIGINT NOT NULL,
	help_id BIGINT NOT NULL,
	FOREIGN KEY (member_id) REFERENCES member(id),
	FOREIGN KEY (help_id) REFERENCES help(id)
)
GO

CREATE TABLE contribution (
    id bigint NOT NULL,
    date_created datetimeoffset,
    message character varying(255),
    help_id integer NOT NULL,
    help_type_id integer NOT NULL,
    member_id integer NOT NULL
);

CREATE TABLE deposit (
    id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,,
    date_created timestamp without time zone,
    confirmation_id character varying(255),
    deposit numeric(19,2),
    member_id integer NOT NULL
);

CREATE TABLE help_resource (
    id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
    date_created datetimeoffset,
    comment character varying(255),
    help_id integer NOT NULL,
    member_id integer NOT NULL,
    resource_id integer NOT NULL
);

CREATE TABLE monetary_donation (
    id bigint NOT NULL,
    date_created datetimeoffset,
    contribution double precision,
    help_id integer NOT NULL,
    member_id integer NOT NULL
);

CREATE TABLE resource (
    id bigint NOT NULL,
    date_created timestamp without time zone,
    active boolean NOT NULL,
    blob boolean NOT NULL,
    deleted boolean NOT NULL,
    extension character varying(255),
    name character varying(255),
    path character varying(255),
    size real NOT NULL,
    type character varying(255)
);


--
--USE Ethelp; 
--SELECT column_name, data_type, character_maximum_length, is_nullable 
--FROM Ethelp.INFORMATION_SCHEMA.COLUMNS;
--GO
--