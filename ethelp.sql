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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- Name: contribution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contribution (
    id bigint NOT NULL,
    date_created timestamp without time zone,
    message character varying(255),
    help_id integer NOT NULL,
    help_type_id integer NOT NULL,
    member_id integer NOT NULL
);


ALTER TABLE contribution OWNER TO postgres;

--
-- Name: contribution_help_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contribution_help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contribution_help_id_seq OWNER TO postgres;

--
-- Name: contribution_help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contribution_help_id_seq OWNED BY contribution.help_id;


--
-- Name: contribution_help_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contribution_help_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contribution_help_type_id_seq OWNER TO postgres;

--
-- Name: contribution_help_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contribution_help_type_id_seq OWNED BY contribution.help_type_id;


--
-- Name: contribution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contribution_id_seq OWNER TO postgres;

--
-- Name: contribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contribution_id_seq OWNED BY contribution.id;


--
-- Name: contribution_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contribution_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contribution_member_id_seq OWNER TO postgres;

--
-- Name: contribution_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contribution_member_id_seq OWNED BY contribution.member_id;


--
-- Name: deposit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE deposit (
    id bigint NOT NULL,
    date_created timestamp without time zone,
    confirmation_id character varying(255),
    deposit numeric(19,2),
    member_id integer NOT NULL
);


ALTER TABLE deposit OWNER TO postgres;

--
-- Name: deposit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE deposit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deposit_id_seq OWNER TO postgres;

--
-- Name: deposit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE deposit_id_seq OWNED BY deposit.id;


--
-- Name: deposit_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE deposit_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deposit_member_id_seq OWNER TO postgres;

--
-- Name: deposit_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE deposit_member_id_seq OWNED BY deposit.member_id;


--
-- Name: help; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE help (
    id bigint NOT NULL,
    date_created timestamp without time zone,
    message text,
    title character varying(255),
    member_id integer NOT NULL
);


ALTER TABLE help OWNER TO postgres;

--
-- Name: help_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE help_category (
    help_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE help_category OWNER TO postgres;

--
-- Name: help_category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_category_category_id_seq OWNER TO postgres;

--
-- Name: help_category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_category_category_id_seq OWNED BY help_category.category_id;


--
-- Name: help_category_help_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_category_help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_category_help_id_seq OWNER TO postgres;

--
-- Name: help_category_help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_category_help_id_seq OWNED BY help_category.help_id;


--
-- Name: help_help_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE help_help_type (
    help_id integer NOT NULL,
    help_type_id integer NOT NULL
);


ALTER TABLE help_help_type OWNER TO postgres;

--
-- Name: help_help_type_help_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_help_type_help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_help_type_help_id_seq OWNER TO postgres;

--
-- Name: help_help_type_help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_help_type_help_id_seq OWNED BY help_help_type.help_id;


--
-- Name: help_help_type_help_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_help_type_help_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_help_type_help_type_id_seq OWNER TO postgres;

--
-- Name: help_help_type_help_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_help_type_help_type_id_seq OWNED BY help_help_type.help_type_id;


--
-- Name: help_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_id_seq OWNER TO postgres;

--
-- Name: help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_id_seq OWNED BY help.id;


--
-- Name: help_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_member_id_seq OWNER TO postgres;

--
-- Name: help_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_member_id_seq OWNED BY help.member_id;


--
-- Name: help_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE help_resource (
    id bigint NOT NULL,
    date_created timestamp without time zone,
    comment character varying(255),
    help_id integer NOT NULL,
    member_id integer NOT NULL,
    resource_id integer NOT NULL
);


ALTER TABLE help_resource OWNER TO postgres;

--
-- Name: help_resource_help_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_resource_help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_resource_help_id_seq OWNER TO postgres;

--
-- Name: help_resource_help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_resource_help_id_seq OWNED BY help_resource.help_id;


--
-- Name: help_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_resource_id_seq OWNER TO postgres;

--
-- Name: help_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_resource_id_seq OWNED BY help_resource.id;


--
-- Name: help_resource_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_resource_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_resource_member_id_seq OWNER TO postgres;

--
-- Name: help_resource_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_resource_member_id_seq OWNED BY help_resource.member_id;


--
-- Name: help_resource_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_resource_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_resource_resource_id_seq OWNER TO postgres;

--
-- Name: help_resource_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_resource_resource_id_seq OWNED BY help_resource.resource_id;


--
-- Name: help_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE help_type (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE help_type OWNER TO postgres;

--
-- Name: help_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE help_type_id_seq OWNER TO postgres;

--
-- Name: help_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_type_id_seq OWNED BY help_type.id;


--
-- Name: lookup_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lookup_type (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE lookup_type OWNER TO postgres;

--
-- Name: lookup_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lookup_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lookup_type_id_seq OWNER TO postgres;

--
-- Name: lookup_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lookup_type_id_seq OWNED BY lookup_type.id;


--
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE member (
    id bigint NOT NULL,
    date_created timestamp without time zone,
    date_of_birth date,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password_hash character varying(255),
    salt character varying(255)
);


ALTER TABLE member OWNER TO postgres;

--
-- Name: member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE member_id_seq OWNER TO postgres;

--
-- Name: member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE member_id_seq OWNED BY member.id;


--
-- Name: member_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE member_roles (
    member_id integer NOT NULL,
    roles_id integer NOT NULL
);


ALTER TABLE member_roles OWNER TO postgres;

--
-- Name: member_roles_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE member_roles_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE member_roles_member_id_seq OWNER TO postgres;

--
-- Name: member_roles_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE member_roles_member_id_seq OWNED BY member_roles.member_id;


--
-- Name: member_roles_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE member_roles_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE member_roles_roles_id_seq OWNER TO postgres;

--
-- Name: member_roles_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE member_roles_roles_id_seq OWNED BY member_roles.roles_id;


--
-- Name: monetary_donation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE monetary_donation (
    id bigint NOT NULL,
    date_created timestamp without time zone,
    contribution double precision,
    help_id integer NOT NULL,
    member_id integer NOT NULL
);


ALTER TABLE monetary_donation OWNER TO postgres;

--
-- Name: monetary_donation_help_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE monetary_donation_help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE monetary_donation_help_id_seq OWNER TO postgres;

--
-- Name: monetary_donation_help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE monetary_donation_help_id_seq OWNED BY monetary_donation.help_id;


--
-- Name: monetary_donation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE monetary_donation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE monetary_donation_id_seq OWNER TO postgres;

--
-- Name: monetary_donation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE monetary_donation_id_seq OWNED BY monetary_donation.id;


--
-- Name: monetary_donation_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE monetary_donation_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE monetary_donation_member_id_seq OWNER TO postgres;

--
-- Name: monetary_donation_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE monetary_donation_member_id_seq OWNED BY monetary_donation.member_id;


--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres
--

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


ALTER TABLE resource OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resource_id_seq OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resource_id_seq OWNED BY resource.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE role (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- Name: contribution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contribution ALTER COLUMN id SET DEFAULT nextval('contribution_id_seq'::regclass);


--
-- Name: contribution help_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contribution ALTER COLUMN help_id SET DEFAULT nextval('contribution_help_id_seq'::regclass);


--
-- Name: contribution help_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contribution ALTER COLUMN help_type_id SET DEFAULT nextval('contribution_help_type_id_seq'::regclass);


--
-- Name: contribution member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contribution ALTER COLUMN member_id SET DEFAULT nextval('contribution_member_id_seq'::regclass);


--
-- Name: deposit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deposit ALTER COLUMN id SET DEFAULT nextval('deposit_id_seq'::regclass);


--
-- Name: deposit member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deposit ALTER COLUMN member_id SET DEFAULT nextval('deposit_member_id_seq'::regclass);


--
-- Name: help id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help ALTER COLUMN id SET DEFAULT nextval('help_id_seq'::regclass);


--
-- Name: help member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help ALTER COLUMN member_id SET DEFAULT nextval('help_member_id_seq'::regclass);


--
-- Name: help_category help_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_category ALTER COLUMN help_id SET DEFAULT nextval('help_category_help_id_seq'::regclass);


--
-- Name: help_category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_category ALTER COLUMN category_id SET DEFAULT nextval('help_category_category_id_seq'::regclass);


--
-- Name: help_help_type help_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_help_type ALTER COLUMN help_id SET DEFAULT nextval('help_help_type_help_id_seq'::regclass);


--
-- Name: help_help_type help_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_help_type ALTER COLUMN help_type_id SET DEFAULT nextval('help_help_type_help_type_id_seq'::regclass);


--
-- Name: help_resource id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_resource ALTER COLUMN id SET DEFAULT nextval('help_resource_id_seq'::regclass);


--
-- Name: help_resource help_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_resource ALTER COLUMN help_id SET DEFAULT nextval('help_resource_help_id_seq'::regclass);


--
-- Name: help_resource member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_resource ALTER COLUMN member_id SET DEFAULT nextval('help_resource_member_id_seq'::regclass);


--
-- Name: help_resource resource_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_resource ALTER COLUMN resource_id SET DEFAULT nextval('help_resource_resource_id_seq'::regclass);


--
-- Name: help_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_type ALTER COLUMN id SET DEFAULT nextval('help_type_id_seq'::regclass);


--
-- Name: lookup_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lookup_type ALTER COLUMN id SET DEFAULT nextval('lookup_type_id_seq'::regclass);


--
-- Name: member id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY member ALTER COLUMN id SET DEFAULT nextval('member_id_seq'::regclass);


--
-- Name: member_roles member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY member_roles ALTER COLUMN member_id SET DEFAULT nextval('member_roles_member_id_seq'::regclass);


--
-- Name: member_roles roles_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY member_roles ALTER COLUMN roles_id SET DEFAULT nextval('member_roles_roles_id_seq'::regclass);


--
-- Name: monetary_donation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY monetary_donation ALTER COLUMN id SET DEFAULT nextval('monetary_donation_id_seq'::regclass);


--
-- Name: monetary_donation help_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY monetary_donation ALTER COLUMN help_id SET DEFAULT nextval('monetary_donation_help_id_seq'::regclass);


--
-- Name: monetary_donation member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY monetary_donation ALTER COLUMN member_id SET DEFAULT nextval('monetary_donation_member_id_seq'::regclass);


--
-- Name: resource id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource ALTER COLUMN id SET DEFAULT nextval('resource_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category (id, name) FROM stdin;
1	Education
2	Family
3	Auto
4	Relation
5	Adjusting
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_id_seq', 5, true);


--
-- Data for Name: contribution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contribution (id, date_created, message, help_id, help_type_id, member_id) FROM stdin;
\.


--
-- Name: contribution_help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contribution_help_id_seq', 1, false);


--
-- Name: contribution_help_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contribution_help_type_id_seq', 1, false);


--
-- Name: contribution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contribution_id_seq', 1, false);


--
-- Name: contribution_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contribution_member_id_seq', 1, false);


--
-- Data for Name: deposit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY deposit (id, date_created, confirmation_id, deposit, member_id) FROM stdin;
\.


--
-- Name: deposit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('deposit_id_seq', 1, false);


--
-- Name: deposit_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('deposit_member_id_seq', 1, false);


--
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY help (id, date_created, message, title, member_id) FROM stdin;
\.


--
-- Data for Name: help_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY help_category (help_id, category_id) FROM stdin;
\.


--
-- Name: help_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_category_category_id_seq', 1, false);


--
-- Name: help_category_help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_category_help_id_seq', 1, false);


--
-- Data for Name: help_help_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY help_help_type (help_id, help_type_id) FROM stdin;
\.


--
-- Name: help_help_type_help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_help_type_help_id_seq', 1, false);


--
-- Name: help_help_type_help_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_help_type_help_type_id_seq', 1, false);


--
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_id_seq', 1, false);


--
-- Name: help_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_member_id_seq', 1, false);


--
-- Data for Name: help_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY help_resource (id, date_created, comment, help_id, member_id, resource_id) FROM stdin;
\.


--
-- Name: help_resource_help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_resource_help_id_seq', 1, false);


--
-- Name: help_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_resource_id_seq', 1, false);


--
-- Name: help_resource_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_resource_member_id_seq', 1, false);


--
-- Name: help_resource_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_resource_resource_id_seq', 1, false);


--
-- Data for Name: help_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY help_type (id, name) FROM stdin;
1	Monetary
2	Professional Advice
3	Consultation
\.


--
-- Name: help_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_type_id_seq', 3, true);


--
-- Data for Name: lookup_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lookup_type (id, name) FROM stdin;
\.


--
-- Name: lookup_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lookup_type_id_seq', 1, false);


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY member (id, date_created, date_of_birth, email, first_name, last_name, password_hash, salt) FROM stdin;
1	2019-07-21 00:00:00	1991-05-12	test@tester.com	test	testlast	$2a$12$OlB5ID4Q5RjLKCDeseoMCeS.7JM.gtFQz6atTlZUw2ZsjNX1ZmcO.	
\.


--
-- Name: member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('member_id_seq', 1, true);


--
-- Data for Name: member_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY member_roles (member_id, roles_id) FROM stdin;
1	1
1	2
\.


--
-- Name: member_roles_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('member_roles_member_id_seq', 1, false);


--
-- Name: member_roles_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('member_roles_roles_id_seq', 1, false);


--
-- Data for Name: monetary_donation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY monetary_donation (id, date_created, contribution, help_id, member_id) FROM stdin;
\.


--
-- Name: monetary_donation_help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('monetary_donation_help_id_seq', 1, false);


--
-- Name: monetary_donation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('monetary_donation_id_seq', 1, false);


--
-- Name: monetary_donation_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('monetary_donation_member_id_seq', 1, false);


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource (id, date_created, active, blob, deleted, extension, name, path, size, type) FROM stdin;
\.


--
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_id_seq', 1, false);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role (id, name) FROM stdin;
1	ROLE_ADMINISTRATOR
2	ROLE_USER
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_id_seq', 2, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: contribution contribution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contribution
    ADD CONSTRAINT contribution_pkey PRIMARY KEY (id);


--
-- Name: deposit deposit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (id);


--
-- Name: help help_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);


--
-- Name: help_resource help_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_resource
    ADD CONSTRAINT help_resource_pkey PRIMARY KEY (id);


--
-- Name: help_type help_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_type
    ADD CONSTRAINT help_type_pkey PRIMARY KEY (id);


--
-- Name: lookup_type lookup_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lookup_type
    ADD CONSTRAINT lookup_type_pkey PRIMARY KEY (id);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- Name: monetary_donation monetary_donation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY monetary_donation
    ADD CONSTRAINT monetary_donation_pkey PRIMARY KEY (id);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: member uk_mbmcqelty0fbrvxp1q58dn57t; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY member
    ADD CONSTRAINT uk_mbmcqelty0fbrvxp1q58dn57t UNIQUE (email);


--
-- Name: help_resource fk1nx23ud3pbnnxsd7g7doj498l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_resource
    ADD CONSTRAINT fk1nx23ud3pbnnxsd7g7doj498l FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: member_roles fk2tjitfwusgpe5i0qlgwjbhgjk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY member_roles
    ADD CONSTRAINT fk2tjitfwusgpe5i0qlgwjbhgjk FOREIGN KEY (roles_id) REFERENCES role(id);


--
-- Name: contribution fk3bwri1qscu1rc863ywedsje5v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contribution
    ADD CONSTRAINT fk3bwri1qscu1rc863ywedsje5v FOREIGN KEY (help_id) REFERENCES help(id);


--
-- Name: help_resource fk4ufqy196tb15q6ql58t4ixpio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_resource
    ADD CONSTRAINT fk4ufqy196tb15q6ql58t4ixpio FOREIGN KEY (help_id) REFERENCES help(id);


--
-- Name: deposit fk7h5frkxrylxkuxsntsppq52xr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deposit
    ADD CONSTRAINT fk7h5frkxrylxkuxsntsppq52xr FOREIGN KEY (member_id) REFERENCES member(id);


--
-- Name: monetary_donation fkavnioqbmeoigi4ts45iabnoto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY monetary_donation
    ADD CONSTRAINT fkavnioqbmeoigi4ts45iabnoto FOREIGN KEY (member_id) REFERENCES member(id);


--
-- Name: contribution fkbwc4wddf378n8b89a8ljmmmou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contribution
    ADD CONSTRAINT fkbwc4wddf378n8b89a8ljmmmou FOREIGN KEY (member_id) REFERENCES member(id);


--
-- Name: help_help_type fke91xy2sn9d2b3fxakwxqgw15b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_help_type
    ADD CONSTRAINT fke91xy2sn9d2b3fxakwxqgw15b FOREIGN KEY (help_type_id) REFERENCES help_type(id);


--
-- Name: member_roles fket63dfllh4o5qa9qwm7f5kx9x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY member_roles
    ADD CONSTRAINT fket63dfllh4o5qa9qwm7f5kx9x FOREIGN KEY (member_id) REFERENCES member(id);


--
-- Name: help_category fkjnp30tc72p6p9e57r6gxlal0u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_category
    ADD CONSTRAINT fkjnp30tc72p6p9e57r6gxlal0u FOREIGN KEY (help_id) REFERENCES help(id);


--
-- Name: contribution fklmfn9h2iyg4ouhyuub9skjvou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contribution
    ADD CONSTRAINT fklmfn9h2iyg4ouhyuub9skjvou FOREIGN KEY (help_type_id) REFERENCES help_type(id);


--
-- Name: help_resource fknrcs6ocquak0nionlxgykmp79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_resource
    ADD CONSTRAINT fknrcs6ocquak0nionlxgykmp79 FOREIGN KEY (member_id) REFERENCES member(id);


--
-- Name: monetary_donation fkphljxeear7o1os608oa8q5jr4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY monetary_donation
    ADD CONSTRAINT fkphljxeear7o1os608oa8q5jr4 FOREIGN KEY (help_id) REFERENCES help(id);


--
-- Name: help_category fkrawuq9rhotvw2040eiruvfqlx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_category
    ADD CONSTRAINT fkrawuq9rhotvw2040eiruvfqlx FOREIGN KEY (category_id) REFERENCES category(id);


--
-- Name: help_help_type fkrw3fpyw8b4n49sl7pfxtluwy3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help_help_type
    ADD CONSTRAINT fkrw3fpyw8b4n49sl7pfxtluwy3 FOREIGN KEY (help_id) REFERENCES help(id);


--
-- Name: help fks2dnutn3egkkl9qarx1m8ld4o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help
    ADD CONSTRAINT fks2dnutn3egkkl9qarx1m8ld4o FOREIGN KEY (member_id) REFERENCES member(id);


--
-- PostgreSQL database dump complete
--

