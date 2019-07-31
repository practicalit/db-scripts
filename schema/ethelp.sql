--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

CREATE TABLE member (
	    id bigint NOT NULL,
	    date_create datetime default current_timestamp,
	    date_of_birth date,
	    email character varying(255),
	    first_name character varying(255),
	    last_name character varying(255),
	    password_hash character varying(255),
	    salt character varying(255)
);

CREATE TABLE help (
	    id bigint NOT NULL,
	    date_created datetime default current_timestamp,
	    message text,
	    title character varying(255),
	    member_id integer NOT NULL
);

CREATE TABLE help_like (id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	member_id BIGINT NOT NULL,
	help_id BIGINT NOT NULL,
	FOREIGN KEY (member_id) REFERENCES member(id),
	FOREIGN KEY (help_id) REFERENCES help(id)
)
