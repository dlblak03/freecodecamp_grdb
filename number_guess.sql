--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1726867526023', 1, 0);
INSERT INTO public.users VALUES ('user_1726867628931', 2, 0);
INSERT INTO public.users VALUES ('user_1726867628932', 4, 0);
INSERT INTO public.users VALUES ('user_1726867634416', 2, 0);
INSERT INTO public.users VALUES ('user_1726867634417', 4, 0);
INSERT INTO public.users VALUES ('user_1726867637584', 2, 0);
INSERT INTO public.users VALUES ('user_1726867637585', 4, 0);
INSERT INTO public.users VALUES ('user_1726867646446', 2, 0);
INSERT INTO public.users VALUES ('user_1726867646447', 4, 0);
INSERT INTO public.users VALUES ('user_1726867683627', 2, 0);
INSERT INTO public.users VALUES ('user_1726867683628', 4, 0);
INSERT INTO public.users VALUES ('user_1726867784831', 2, 0);
INSERT INTO public.users VALUES ('user_1726867784832', 4, 0);
INSERT INTO public.users VALUES ('dblake', 3, 9);
INSERT INTO public.users VALUES ('user_1726867915532', 2, 362);
INSERT INTO public.users VALUES ('user_1726867915533', 4, 685);
INSERT INTO public.users VALUES ('user_1726867921963', 2, 198);
INSERT INTO public.users VALUES ('user_1726867921964', 4, 269);
INSERT INTO public.users VALUES ('user_1726867941001', 2, 436);
INSERT INTO public.users VALUES ('user_1726867941002', 4, 397);
INSERT INTO public.users VALUES ('user_1726867944639', 2, 194);
INSERT INTO public.users VALUES ('user_1726867944640', 4, 56);
INSERT INTO public.users VALUES ('user_1726867950573', 2, 387);
INSERT INTO public.users VALUES ('user_1726867950574', 4, 207);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

