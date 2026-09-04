--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL,
    planet_type_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO postgres;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO postgres;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    temperature numeric NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 10000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy', 8500, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting spiral galaxy', 9000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright galaxy with a large bulge', 13000, true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring-shaped galaxy', 12000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 4500, false, 'Earth natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 4500, false, 'Small moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 4500, false, 'Outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 4500, false, 'Volcanically active moon');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 4500, false, 'Icy moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 4500, false, 'Largest moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 4500, false, 'Heavily cratered moon');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 4500, false, 'Moon with thick atmosphere');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1528, 4500, false, 'Icy moon');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, 4500, false, 'Moon with ice geysers');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1123, 4500, false, 'Icy moon');
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 1062, 4500, false, 'Saturnian moon');
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 396, 4500, false, 'Small icy moon');
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1469, 4500, false, 'Two-toned moon');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 472, 4500, false, 'Small Uranian moon');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1158, 4500, false, 'Uranian moon');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, 4500, false, 'Dark Uranian moon');
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1578, 4500, false, 'Largest Uranian moon');
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1523, 4500, false, 'Outer Uranian moon');
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 340, 4500, false, 'Irregular Neptunian moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4500, 91.7, false, 'Small rocky planet', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4500, 41.4, false, 'Hot rocky planet', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4540, 0, true, 'Our home planet', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 4500, 78.3, false, 'The red planet', 1);
INSERT INTO public.planet VALUES (9, 'Aether', 2, 3000, 8.6, false, 'Fictional rocky planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4600, 628.7, false, 'Largest planet', 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 4590, 1275, false, 'Planet with famous rings', 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 4500, 2724, false, 'Ice giant', 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 4500, 4345, false, 'Distant ice giant', 3);
INSERT INTO public.planet VALUES (10, 'Nova', 3, 2500, 2.9, false, 'Fictional desert planet', 1);
INSERT INTO public.planet VALUES (11, 'Terra Nova', 4, 3200, 25.4, false, 'Fictional ocean planet', 1);
INSERT INTO public.planet VALUES (12, 'Elysia', 5, 4100, 12.7, true, 'Fictional habitable planet', 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet_type VALUES (1, 'Rocky', 'Solid surface planet');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planet composed mostly of gases');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planet dominated by volatile materials');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 9940, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8, 3500, true);
INSERT INTO public.star VALUES (4, 'Vega', 1, 455, 9602, true);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 4850, 3042, true);
INSERT INTO public.star VALUES (6, 'Arcturus', 1, 7100, 4286, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: DATABASE universe; Type: ACL; Schema: -; Owner: postgres
--

GRANT CONNECT ON DATABASE universe TO freecodecamp;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO freecodecamp;


--
-- Name: TABLE galaxy; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.galaxy TO freecodecamp;


--
-- Name: SEQUENCE galaxy_galaxy_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.galaxy_galaxy_id_seq TO freecodecamp;


--
-- Name: TABLE moon; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.moon TO freecodecamp;


--
-- Name: SEQUENCE moon_moon_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.moon_moon_id_seq TO freecodecamp;


--
-- Name: TABLE planet; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.planet TO freecodecamp;


--
-- Name: SEQUENCE planet_planet_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.planet_planet_id_seq TO freecodecamp;


--
-- Name: TABLE planet_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.planet_type TO freecodecamp;


--
-- Name: SEQUENCE planet_type_planet_type_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.planet_type_planet_type_id_seq TO freecodecamp;


--
-- Name: TABLE star; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.star TO freecodecamp;


--
-- Name: SEQUENCE star_star_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.star_star_id_seq TO freecodecamp;


--
-- PostgreSQL database dump complete
--

