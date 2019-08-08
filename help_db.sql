use master
go
IF NOT EXISTS (
 SELECT name
 FROM sys.databases
 WHERE name = N'ET_Help'
)

 CREATE DATABASE [ET_Help];
GO
IF SERVERPROPERTY('ProductVersion') > '12'
ALTER DATABASE [ET_Help] SET QUERY_STORE=ON;
GO
--////////////////////////////////////////////////////////

IF OBJECT_ID('dbo.category', 'U') IS NOT NULL
 DROP TABLE dbo.category;
GO

CREATE TABLE category (
id bigint identity(1,1) primary key NOT NULL,
name character varying(255)
);

IF OBJECT_ID('dbo.contribution', 'U') IS NOT NULL
 DROP TABLE dbo.contribution;
GO

CREATE TABLE contribution (
id bigint identity(1,1) primary key NOT NULL,
date_created timestamp ,
message character varying(255),
help_id integer NOT NULL,
help_type_id integer NOT NULL,
member_id integer NOT NULL
);


IF OBJECT_ID('dbo.deposit', 'U') IS NOT NULL
 DROP TABLE dbo.deposit;
GO

CREATE TABLE deposit (
id bigint identity(1,1) primary key NOT NULL,
date_created timestamp,
confirmation_id varchar(255),
deposit money,
--member_id int NOT NULL,
--foreign key (member_id) references member(id)
);


IF OBJECT_ID('dbo.member', 'U') IS NOT NULL
 DROP TABLE dbo.member;
GO

CREATE TABLE member (
    id bigint NOT NULL primary key,
    date_created datetimeoffset,
    date_of_birth date,
    email varchar(255),
    first_name varchar(255),
    last_name varchar(255),
    password_hash varchar(255),
    salt varchar(255)
);


IF OBJECT_ID('dbo.help_category', 'U') IS NOT NULL
 DROP TABLE dbo.help_category;
GO

CREATE TABLE help_category (
help_id bigint NOT NULL,
category_id bigint NOT NULL,
foreign key(help_id) references help(id),
foreign key(category_id) references category(id)
);

CREATE TABLE help_type (
id bigint identity(1,1) primary key NOT NULL,
name varchar(255)
);

CREATE TABLE help_help_type (
help_id bigint NOT NULL,
help_type_id bigint NOT NULL,
foreign key(help_id) references help(id),
foreign key(help_type_id) references help_type(id)
);

CREATE TABLE resource (
id bigint identity(1,1) primary key NOT NULL,
date_created timestamp,
active bit NOT NULL,
blob bit NOT NULL,
deleted bit NOT NULL,
extension varchar(12),
name varchar(255),
path varchar(255),
size real NOT NULL,
type varchar(25)
);

CREATE TABLE help_resource (
id bigint primary key identity(1,1) NOT NULL,
date_created timestamp,
comment varchar(255),
help_id integer NOT NULL,
member_id bigint NOT NULL,
resource_id bigint NOT NULL,
foreign key(member_id) references member(id),
foreign key(resource_id) references resource(id)
);

CREATE TABLE lookup_type (
id bigint identity(1,1) primary key NOT NULL,
name varchar(255)
);

CREATE TABLE role (
id bigint identity(1,1) primary key NOT NULL,
name varchar(20)
);

CREATE TABLE member_roles (
member_id bigint NOT NULL,
roles_id bigint NOT NULL,
foreign key (member_id) references member(id),
foreign key (roles_id) references role(id)
);

CREATE TABLE monetary_donation (
id bigint identity(1,1) primary key NOT NULL,
date_created timestamp,
contribution money,
help_id bigint NOT NULL,
member_id bigint NOT NULL,
foreign key(help_id) references help(id),
foreign key(member_id) references member(id)
);

CREATE TABLE help (
id bigint NOT NULL primary key,
date_created datetimeoffset,
message text,
title varchar(255),
member_id bigint NOT NULL
);
