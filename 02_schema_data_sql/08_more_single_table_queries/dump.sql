--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Homebrew)
-- Dumped by pg_dump version 14.6 (Homebrew)

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
-- Name: weather; Type: TABLE; Schema: public; Owner: vincentsijssens
--

CREATE TABLE public.weather (
    low integer NOT NULL,
    high integer NOT NULL,
    date date NOT NULL,
    rainfall numeric(6,3) DEFAULT 0
);


ALTER TABLE public.weather OWNER TO vincentsijssens;

--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: vincentsijssens
--

INSERT INTO public.weather VALUES (29, 32, '2016-03-07', 0.000);
INSERT INTO public.weather VALUES (23, 31, '2016-03-08', 0.000);
INSERT INTO public.weather VALUES (17, 28, '2016-03-09', 0.000);
INSERT INTO public.weather VALUES (34, 43, '2016-03-01', 0.117);
INSERT INTO public.weather VALUES (32, 44, '2016-03-02', 0.117);
INSERT INTO public.weather VALUES (31, 47, '2016-03-03', 0.156);
INSERT INTO public.weather VALUES (33, 42, '2016-03-04', 0.078);
INSERT INTO public.weather VALUES (39, 46, '2016-03-05', 0.273);
INSERT INTO public.weather VALUES (32, 43, '2016-03-06', 0.078);


--
-- PostgreSQL database dump complete
--

