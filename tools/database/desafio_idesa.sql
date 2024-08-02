--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-1.pgdg22.04+1)

-- Started on 2024-08-01 22:16:05 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 165767)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    birthdate date NOT NULL,
    nationality character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 165766)
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_id_seq OWNER TO postgres;

--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 225
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- TOC entry 228 (class 1259 OID 165776)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    isbn character varying(255) NOT NULL,
    published_date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    author_id bigint NOT NULL
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 165775)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO postgres;

--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 227
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 222 (class 1259 OID 165743)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 165742)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 221
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 210 (class 1259 OID 165679)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 165678)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 215 (class 1259 OID 165711)
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id bigint,
    client_id bigint NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 165703)
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    client_id bigint NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 165726)
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_clients (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL,
    secret character varying(100),
    provider character varying(255),
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_clients OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 165725)
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oauth_clients_id_seq OWNER TO postgres;

--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 217
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_clients_id_seq OWNED BY public.oauth_clients.id;


--
-- TOC entry 220 (class 1259 OID 165736)
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_personal_access_clients (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 165735)
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNER TO postgres;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 219
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- TOC entry 216 (class 1259 OID 165719)
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 165696)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 165755)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 165754)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 223
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 212 (class 1259 OID 165686)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 165685)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3305 (class 2604 OID 165770)
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- TOC entry 3306 (class 2604 OID 165779)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 165746)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 165682)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 165729)
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_clients_id_seq'::regclass);


--
-- TOC entry 3301 (class 2604 OID 165739)
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- TOC entry 3304 (class 2604 OID 165758)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 165689)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3499 (class 0 OID 165767)
-- Dependencies: 226
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, name, birthdate, nationality, created_at, updated_at) FROM stdin;
3	Verónica Orosco	1990-11-16	Granada	2024-08-02 00:00:00	2024-08-02 00:00:00
4	Luis Deleón	1992-12-30	Uzbekistán	2024-08-02 00:00:00	2024-08-02 00:00:00
5	Leo Díez	1979-04-02	Laos	2024-08-02 00:00:00	2024-08-02 00:00:00
6	Jesús Madrigal	2013-12-22	Chile	2024-08-02 00:00:00	2024-08-02 00:00:00
7	Sra. Laia Nazario	1987-07-29	Surinam	2024-08-02 00:00:00	2024-08-02 00:00:00
8	Lic. Ángeles Montaño	1977-05-09	Suazilandia	2024-08-02 00:00:00	2024-08-02 00:00:00
9	Natalia Osorio	2004-09-28	El Salvador	2024-08-02 00:00:00	2024-08-02 00:00:00
10	Guillermo Carreón Segundo	1976-07-28	Palaos	2024-08-02 00:00:00	2024-08-02 00:00:00
11	Juana Montaño	1988-08-30	Paraguay	2024-08-02 00:00:00	2024-08-02 00:00:00
12	Dr. Erik Ureña Hijo	1989-07-23	Sudán	2024-08-02 00:00:00	2024-08-02 00:00:00
13	Ruth Caceres	1996-02-03	Paraguayan	2024-08-02 02:00:13	2024-08-02 02:00:13
\.


--
-- TOC entry 3501 (class 0 OID 165776)
-- Dependencies: 228
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, title, isbn, published_date, created_at, updated_at, author_id) FROM stdin;
2	Id rerum labore iure.	9792601041728	1972-01-03	2024-08-02 00:00:00	2024-08-02 00:00:00	4
3	Et est et dolore sed nisi.	9787451913745	1997-05-08	2024-08-02 00:00:00	2024-08-02 00:00:00	10
4	Ut et non nemo esse non ut.	9781762639462	2013-07-02	2024-08-02 00:00:00	2024-08-02 00:00:00	9
5	Sed dolor non sed ipsa.	9783573056933	1997-06-05	2024-08-02 00:00:00	2024-08-02 00:00:00	4
6	Veniam quam sed dolor.	9791390304878	1980-11-09	2024-08-02 00:00:00	2024-08-02 00:00:00	11
7	Harum quam ut odit.	9794129796432	1991-06-21	2024-08-02 00:00:00	2024-08-02 00:00:00	8
8	Ea voluptatem officia enim.	9793818868870	1988-03-01	2024-08-02 00:00:00	2024-08-02 00:00:00	10
9	Alias ab vel facere aut.	9781085695367	2017-03-04	2024-08-02 00:00:00	2024-08-02 00:00:00	11
10	Id id esse fuga ut et.	9787437579095	1999-12-11	2024-08-02 00:00:00	2024-08-02 00:00:00	12
11	Quisquam quaerat qui ut.	9797283671942	1986-06-27	2024-08-02 00:00:00	2024-08-02 00:00:00	4
\.


--
-- TOC entry 3495 (class 0 OID 165743)
-- Dependencies: 222
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 3483 (class 0 OID 165679)
-- Dependencies: 210
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_reset_tokens_table	1
3	2016_06_01_000001_create_oauth_auth_codes_table	1
4	2016_06_01_000002_create_oauth_access_tokens_table	1
5	2016_06_01_000003_create_oauth_refresh_tokens_table	1
6	2016_06_01_000004_create_oauth_clients_table	1
7	2016_06_01_000005_create_oauth_personal_access_clients_table	1
8	2019_08_19_000000_create_failed_jobs_table	1
9	2019_12_14_000001_create_personal_access_tokens_table	1
10	2024_07_26_014032_create_authors_table	1
11	2024_07_26_024628_create_books_table	1
\.


--
-- TOC entry 3488 (class 0 OID 165711)
-- Dependencies: 215
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
9f5af93e3d39b06293e4cb389c349399c9d52e4c8de3a0f7c5fab24c3bb411baa87f5a553ca8bbac	3	1	Personal Access Token	[]	f	2024-08-02 01:58:45	2024-08-02 01:58:45	2024-08-09 01:58:45
\.


--
-- TOC entry 3487 (class 0 OID 165703)
-- Dependencies: 214
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- TOC entry 3491 (class 0 OID 165726)
-- Dependencies: 218
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_clients (id, user_id, name, secret, provider, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
1	\N	Laravel Personal Access Client	1CtOuMYzqNnUD1tIzCJUWyDZ4N3izJhrAbO35vmB	\N	http://localhost	t	f	f	2024-08-02 01:58:29	2024-08-02 01:58:29
2	\N	Laravel Password Grant Client	79cWieDkW1yZGQPd4WLEYW2VXSyFPehH5F2DcJ6x	users	http://localhost	f	t	f	2024-08-02 01:58:30	2024-08-02 01:58:30
\.


--
-- TOC entry 3493 (class 0 OID 165736)
-- Dependencies: 220
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	1	2024-08-02 01:58:30	2024-08-02 01:58:30
\.


--
-- TOC entry 3489 (class 0 OID 165719)
-- Dependencies: 216
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
\.


--
-- TOC entry 3486 (class 0 OID 165696)
-- Dependencies: 213
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3497 (class 0 OID 165755)
-- Dependencies: 224
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3485 (class 0 OID 165686)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
3	Usuario de prueba	correo1@gmail.com	\N	$2y$12$vqUCx5Vigq8HsAqpNCgdSupE6afzTuZK/eusNj94tfDDQr1s3sRZO	\N	2024-08-02 01:56:31	2024-08-02 01:56:31
\.


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 225
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_id_seq', 13, true);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 227
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 11, true);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 221
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 217
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 2, true);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 219
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 1, true);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 223
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 3339 (class 2606 OID 165774)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- TOC entry 3341 (class 2606 OID 165783)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 165751)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 165753)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3308 (class 2606 OID 165684)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 165717)
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 165709)
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 165733)
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 165741)
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 165723)
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 165702)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3334 (class 2606 OID 165762)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 165765)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3310 (class 2606 OID 165695)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3312 (class 2606 OID 165693)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 1259 OID 165718)
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


--
-- TOC entry 3317 (class 1259 OID 165710)
-- Name: oauth_auth_codes_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_auth_codes_user_id_index ON public.oauth_auth_codes USING btree (user_id);


--
-- TOC entry 3326 (class 1259 OID 165734)
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


--
-- TOC entry 3321 (class 1259 OID 165724)
-- Name: oauth_refresh_tokens_access_token_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_refresh_tokens_access_token_id_index ON public.oauth_refresh_tokens USING btree (access_token_id);


--
-- TOC entry 3337 (class 1259 OID 165763)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3342 (class 2606 OID 165784)
-- Name: books books_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_foreign FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-08-01 22:16:07 -04

--
-- PostgreSQL database dump complete
--

