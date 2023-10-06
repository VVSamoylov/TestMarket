--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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

DROP DATABASE IF EXISTS market;
--
-- Name: market; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE market WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru_RU.UTF-8';


ALTER DATABASE market OWNER TO postgres;

\connect market

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
-- Name: pubic; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pubic;


ALTER SCHEMA pubic OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Clothes; Type: TABLE; Schema: pubic; Owner: postgres
--

CREATE TABLE pubic."Clothes" (
    id bigint NOT NULL,
    color bigint,
    typewear bigint,
    name text,
    "shelfId" bigint
);


ALTER TABLE pubic."Clothes" OWNER TO postgres;

--
-- Name: Color; Type: TABLE; Schema: pubic; Owner: postgres
--

CREATE TABLE pubic."Color" (
    color integer,
    id bigint NOT NULL
);


ALTER TABLE pubic."Color" OWNER TO postgres;

--
-- Name: Market; Type: TABLE; Schema: pubic; Owner: postgres
--

CREATE TABLE pubic."Market" (
    id bigint NOT NULL,
    "MarketName" text
);


ALTER TABLE pubic."Market" OWNER TO postgres;

--
-- Name: Shelf; Type: TABLE; Schema: pubic; Owner: postgres
--

CREATE TABLE pubic."Shelf" (
    id bigint NOT NULL,
    "MarketId" bigint
);


ALTER TABLE pubic."Shelf" OWNER TO postgres;

--
-- Name: Typewear; Type: TABLE; Schema: pubic; Owner: postgres
--

CREATE TABLE pubic."Typewear" (
    id bigint NOT NULL,
    "nameWear" text
);


ALTER TABLE pubic."Typewear" OWNER TO postgres;

--
-- Data for Name: Clothes; Type: TABLE DATA; Schema: pubic; Owner: postgres
--

COPY pubic."Clothes" (id, color, typewear, name, "shelfId") FROM stdin;
\.


--
-- Data for Name: Color; Type: TABLE DATA; Schema: pubic; Owner: postgres
--

COPY pubic."Color" (color, id) FROM stdin;
\.


--
-- Data for Name: Market; Type: TABLE DATA; Schema: pubic; Owner: postgres
--

COPY pubic."Market" (id, "MarketName") FROM stdin;
\.


--
-- Data for Name: Shelf; Type: TABLE DATA; Schema: pubic; Owner: postgres
--

COPY pubic."Shelf" (id, "MarketId") FROM stdin;
\.


--
-- Data for Name: Typewear; Type: TABLE DATA; Schema: pubic; Owner: postgres
--

COPY pubic."Typewear" (id, "nameWear") FROM stdin;
\.


--
-- Name: Clothes clothes_pk; Type: CONSTRAINT; Schema: pubic; Owner: postgres
--

ALTER TABLE ONLY pubic."Clothes"
    ADD CONSTRAINT clothes_pk PRIMARY KEY (id);


--
-- Name: Color color_pk; Type: CONSTRAINT; Schema: pubic; Owner: postgres
--

ALTER TABLE ONLY pubic."Color"
    ADD CONSTRAINT color_pk PRIMARY KEY (id);


--
-- Name: Shelf shelf_pk; Type: CONSTRAINT; Schema: pubic; Owner: postgres
--

ALTER TABLE ONLY pubic."Shelf"
    ADD CONSTRAINT shelf_pk PRIMARY KEY (id);


--
-- Name: Market store_pk; Type: CONSTRAINT; Schema: pubic; Owner: postgres
--

ALTER TABLE ONLY pubic."Market"
    ADD CONSTRAINT store_pk PRIMARY KEY (id);


--
-- Name: Typewear typewear_pk; Type: CONSTRAINT; Schema: pubic; Owner: postgres
--

ALTER TABLE ONLY pubic."Typewear"
    ADD CONSTRAINT typewear_pk PRIMARY KEY (id);


--
-- Name: Shelf Market__fk; Type: FK CONSTRAINT; Schema: pubic; Owner: postgres
--

ALTER TABLE ONLY pubic."Shelf"
    ADD CONSTRAINT "Market__fk" FOREIGN KEY ("MarketId") REFERENCES pubic."Market"(id);


--
-- Name: Clothes color___fk; Type: FK CONSTRAINT; Schema: pubic; Owner: postgres
--

ALTER TABLE ONLY pubic."Clothes"
    ADD CONSTRAINT color___fk FOREIGN KEY (id) REFERENCES pubic."Color"(id);


--
-- Name: Clothes shelf__fk; Type: FK CONSTRAINT; Schema: pubic; Owner: postgres
--

ALTER TABLE ONLY pubic."Clothes"
    ADD CONSTRAINT shelf__fk FOREIGN KEY ("shelfId") REFERENCES pubic."Shelf"(id);


--
-- Name: Clothes typewear___fk; Type: FK CONSTRAINT; Schema: pubic; Owner: postgres
--

ALTER TABLE ONLY pubic."Clothes"
    ADD CONSTRAINT typewear___fk FOREIGN KEY (id) REFERENCES pubic."Typewear"(id);


--
-- PostgreSQL database dump complete
--

