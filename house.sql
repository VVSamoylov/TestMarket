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

DROP DATABASE IF EXISTS home;
--
-- Name: home; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE home WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru_RU.UTF-8';


ALTER DATABASE home OWNER TO postgres;

\connect home

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
-- Name: Dog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Dog" (
    id bigint NOT NULL,
    "dogName" text NOT NULL
);


ALTER TABLE public."Dog" OWNER TO postgres;

--
-- Name: Flat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Flat" (
    id bigint NOT NULL,
    owner bigint,
    "flatName" integer,
    house_id bigint
);


ALTER TABLE public."Flat" OWNER TO postgres;

--
-- Name: House; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."House" (
    id bigint NOT NULL,
    street text NOT NULL
);


ALTER TABLE public."House" OWNER TO postgres;

--
-- Name: Resident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Resident" (
    id bigint NOT NULL,
    "firstName" text NOT NULL,
    "midleName" text,
    "lastName" text,
    pensioner boolean DEFAULT false,
    dog bigint,
    "resiteFlat" bigint
);


ALTER TABLE public."Resident" OWNER TO postgres;

--
-- Data for Name: Dog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Dog" (id, "dogName") FROM stdin;
\.


--
-- Data for Name: Flat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Flat" (id, owner, "flatName", house_id) FROM stdin;
\.


--
-- Data for Name: House; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."House" (id, street) FROM stdin;
\.


--
-- Data for Name: Resident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Resident" (id, "firstName", "midleName", "lastName", pensioner, dog, "resiteFlat") FROM stdin;
\.


--
-- Name: Dog dog_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dog"
    ADD CONSTRAINT dog_pk PRIMARY KEY (id);


--
-- Name: Flat flat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Flat"
    ADD CONSTRAINT flat_pk PRIMARY KEY (id);


--
-- Name: House house_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."House"
    ADD CONSTRAINT house_pk PRIMARY KEY (id);


--
-- Name: Resident resident_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Resident"
    ADD CONSTRAINT resident_pk PRIMARY KEY (id);


--
-- Name: Resident dog___fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Resident"
    ADD CONSTRAINT dog___fk FOREIGN KEY (dog) REFERENCES public."Dog"(id);


--
-- Name: Flat houseId__fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Flat"
    ADD CONSTRAINT "houseId__fk" FOREIGN KEY (house_id) REFERENCES public."House"(id);


--
-- Name: Flat owner___fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Flat"
    ADD CONSTRAINT owner___fk FOREIGN KEY (owner) REFERENCES public."Resident"(id);


--
-- Name: Resident residentFlat___fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Resident"
    ADD CONSTRAINT "residentFlat___fk" FOREIGN KEY ("resiteFlat") REFERENCES public."Flat"(id);


--
-- PostgreSQL database dump complete
--

