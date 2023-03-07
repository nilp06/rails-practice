--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

-- Started on 2023-03-07 19:02:20 IST

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 24658)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24666)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    date_of_birth date,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24689)
-- Name: authors_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors_books (
    book_id bigint NOT NULL,
    author_id bigint NOT NULL
);


ALTER TABLE public.authors_books OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24665)
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 211
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- TOC entry 214 (class 1259 OID 24675)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    name character varying,
    price numeric(6,2),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    author_id bigint NOT NULL
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24674)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 213
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 209 (class 1259 OID 24651)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 3222 (class 2604 OID 24669)
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 24678)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 3375 (class 0 OID 24658)
-- Dependencies: 210
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-03-06 11:40:33.847659	2023-03-06 11:40:33.847659
\.


--
-- TOC entry 3377 (class 0 OID 24666)
-- Dependencies: 212
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, first_name, last_name, date_of_birth, email, created_at, updated_at) FROM stdin;
1	Nil	Patel	1978-08-26	nmp@gmail.com	2023-03-07 04:17:47.896821	2023-03-07 04:17:47.896821
4	auth1	david	2001-07-07	authp1@gmail.com	2023-03-07 07:48:25.501733	2023-03-07 07:48:25.501733
5	auth2	david	2002-07-07	authp2@gmail.com	2023-03-07 07:48:25.50384	2023-03-07 07:48:25.50384
6	auth3	david	2003-07-07	authp3@gmail.com	2023-03-07 07:48:25.507555	2023-03-07 07:48:25.507555
7	auth4	david	2004-07-07	authp4@gmail.com	2023-03-07 07:48:25.510363	2023-03-07 07:48:25.510363
\.


--
-- TOC entry 3380 (class 0 OID 24689)
-- Dependencies: 215
-- Data for Name: authors_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors_books (book_id, author_id) FROM stdin;
\.


--
-- TOC entry 3379 (class 0 OID 24675)
-- Dependencies: 214
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, name, price, created_at, updated_at, author_id) FROM stdin;
4	Miss Fortunate	1300.00	2023-03-07 06:21:51.694984	2023-03-07 06:21:51.694984	1
6	Book1	100.00	2023-03-07 07:48:25.530586	2023-03-07 07:48:25.530586	1
7	Book2	200.00	2023-03-07 07:48:25.533009	2023-03-07 07:48:25.533009	1
8	Book3	300.00	2023-03-07 07:48:25.53537	2023-03-07 07:48:25.53537	1
9	Book4	400.00	2023-03-07 07:48:25.537907	2023-03-07 07:48:25.537907	1
10	Book0	0.00	2023-03-07 07:52:52.480738	2023-03-07 07:52:52.480738	1
11	Book1	100.00	2023-03-07 07:52:52.483637	2023-03-07 07:52:52.483637	1
12	Book2	200.00	2023-03-07 07:52:52.486527	2023-03-07 07:52:52.486527	1
13	Book3	300.00	2023-03-07 07:52:52.496095	2023-03-07 07:52:52.496095	1
14	Book4	400.00	2023-03-07 07:52:52.498569	2023-03-07 07:52:52.498569	1
15	Book0	0.00	2023-03-07 08:03:29.085514	2023-03-07 08:03:29.085514	1
16	Book1	100.00	2023-03-07 08:03:29.088379	2023-03-07 08:03:29.088379	1
17	Book2	200.00	2023-03-07 08:03:29.090557	2023-03-07 08:03:29.090557	1
18	Book3	300.00	2023-03-07 08:03:29.100665	2023-03-07 08:03:29.100665	1
19	Book4	400.00	2023-03-07 08:03:29.103176	2023-03-07 08:03:29.103176	1
20	book0	0.00	2023-03-07 09:39:13.247263	2023-03-07 09:39:13.247263	1
21	book1	150.00	2023-03-07 09:39:13.251876	2023-03-07 09:39:13.251876	1
22	book2	300.00	2023-03-07 09:39:13.256291	2023-03-07 09:39:13.256291	1
23	book3	450.00	2023-03-07 09:39:13.260353	2023-03-07 09:39:13.260353	1
24	book4	600.00	2023-03-07 09:39:13.270885	2023-03-07 09:39:13.270885	1
25	book5	750.00	2023-03-07 09:39:13.275375	2023-03-07 09:39:13.275375	1
26	book6	900.00	2023-03-07 09:39:13.279903	2023-03-07 09:39:13.279903	1
28	book8	1200.00	2023-03-07 09:39:13.288293	2023-03-07 09:39:13.288293	1
29	book9	1350.00	2023-03-07 09:39:13.29234	2023-03-07 09:39:13.29234	1
30	book0	0.00	2023-03-07 09:40:28.323821	2023-03-07 09:40:28.323821	1
31	book1	150.00	2023-03-07 09:40:28.328503	2023-03-07 09:40:28.328503	1
32	book2	300.00	2023-03-07 09:40:28.332828	2023-03-07 09:40:28.332828	1
33	book3	450.00	2023-03-07 09:40:28.33703	2023-03-07 09:40:28.33703	1
34	book4	600.00	2023-03-07 09:40:28.34769	2023-03-07 09:40:28.34769	1
35	book5	750.00	2023-03-07 09:40:28.35213	2023-03-07 09:40:28.35213	1
36	book6	900.00	2023-03-07 09:40:28.356666	2023-03-07 09:40:28.356666	1
37	book7	1050.00	2023-03-07 09:40:28.360719	2023-03-07 09:40:28.360719	1
38	book8	1200.00	2023-03-07 09:40:28.36462	2023-03-07 09:40:28.36462	1
39	book9	1350.00	2023-03-07 09:40:28.36898	2023-03-07 09:40:28.36898	1
40	book0	0.00	2023-03-07 09:50:20.250484	2023-03-07 09:50:20.250484	1
41	book1	150.00	2023-03-07 09:50:20.257071	2023-03-07 09:50:20.257071	1
42	book2	300.00	2023-03-07 09:50:20.261265	2023-03-07 09:50:20.261265	1
43	book3	450.00	2023-03-07 09:50:20.265656	2023-03-07 09:50:20.265656	1
44	book4	600.00	2023-03-07 09:50:20.276252	2023-03-07 09:50:20.276252	1
45	book5	750.00	2023-03-07 09:50:20.280997	2023-03-07 09:50:20.280997	1
46	book6	900.00	2023-03-07 09:50:20.28542	2023-03-07 09:50:20.28542	1
47	book7	1050.00	2023-03-07 09:50:20.28994	2023-03-07 09:50:20.28994	1
48	book8	1200.00	2023-03-07 09:50:20.294335	2023-03-07 09:50:20.294335	1
3	Fight With Destiny	200.00	2023-03-07 06:04:56.148993	2023-03-07 12:39:03.225586	1
60	Mybook	410.00	2023-03-07 12:39:44.829017	2023-03-07 12:39:44.829017	1
\.


--
-- TOC entry 3374 (class 0 OID 24651)
-- Dependencies: 209
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20230306095417
20230307044954
20230307045958
20230307053514
20230307054707
20230307073932
20230307081530
20230307090204
20230307125224
\.


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 211
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_id_seq', 8, true);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 213
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 60, true);


--
-- TOC entry 3227 (class 2606 OID 24664)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 3229 (class 2606 OID 24673)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 24682)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 24657)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3230 (class 1259 OID 24693)
-- Name: index_authors_on_first_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_authors_on_first_name ON public.authors USING btree (first_name);


--
-- TOC entry 3233 (class 1259 OID 24683)
-- Name: index_books_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_books_on_author_id ON public.books USING btree (author_id);


--
-- TOC entry 3234 (class 2606 OID 24684)
-- Name: books fk_rails_53d51ce16a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_rails_53d51ce16a FOREIGN KEY (author_id) REFERENCES public.authors(id);


-- Completed on 2023-03-07 19:02:20 IST

--
-- PostgreSQL database dump complete
--

