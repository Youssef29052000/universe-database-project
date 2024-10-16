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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    type text NOT NULL,
    distance_from_earth numeric,
    number_of_stars bigint,
    has_black_hole boolean,
    is_active boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    type text NOT NULL,
    radius numeric,
    is_spherical boolean,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    type text NOT NULL,
    mass numeric,
    radius numeric,
    number_of_moons integer,
    has_life boolean,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying NOT NULL,
    country text NOT NULL,
    capacity integer,
    is_operational boolean
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    type text NOT NULL,
    mass numeric,
    age bigint,
    is_visible boolean,
    is_main_sequence boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Voie Lactée', 'Spirale', 0, 250000000000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromède', 'Spirale', 2537000, 1000000000000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Galaxie du Triangle', 'Spirale', 3000000, 40000000000, true, false);
INSERT INTO public.galaxy VALUES (4, 'Galaxie du Sombrero', 'Spirale', 29000000, NULL, true, false);
INSERT INTO public.galaxy VALUES (5, 'Galaxie du Tourbillon', 'Spirale', 23000000, 160000000000, true, true);
INSERT INTO public.galaxy VALUES (6, 'Grand Nuage de Magellan', 'Irrégulière', 163000, 10000000, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lune', 3, 'Satellite naturel', 1737.1, true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Satellite naturel', 11.2667, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Satellite naturel', 6.2, false, false);
INSERT INTO public.moon VALUES (4, 'Europe', 5, 'Satellite naturel', 1560.8, true, true);
INSERT INTO public.moon VALUES (5, 'Ganymède', 5, 'Satellite naturel', 2634.1, true, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 'Satellite naturel', 2410.3, true, NULL);
INSERT INTO public.moon VALUES (7, 'Io', 5, 'Satellite naturel', 1821.6, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Satellite naturel', 2574.7, true, true);
INSERT INTO public.moon VALUES (9, 'Encelade', 6, 'Satellite naturel', 252.1, true, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Satellite naturel', 198.2, true, NULL);
INSERT INTO public.moon VALUES (11, 'Téthys', 6, 'Satellite naturel', 531.1, true, NULL);
INSERT INTO public.moon VALUES (12, 'Dioné', 6, 'Satellite naturel', 561.4, true, NULL);
INSERT INTO public.moon VALUES (13, 'Rhéa', 6, 'Satellite naturel', 763.8, true, NULL);
INSERT INTO public.moon VALUES (14, 'Japet', 6, 'Satellite naturel', 734.5, true, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 'Satellite naturel', 235.8, true, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Satellite naturel', 578.9, true, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 'Satellite naturel', 584.7, true, NULL);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 'Satellite naturel', 788.9, true, NULL);
INSERT INTO public.moon VALUES (19, 'Obéron', 7, 'Satellite naturel', 761.4, true, NULL);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 'Satellite naturel', 1353.4, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercure', 1, 'Tellurique', 0.055, 2439.7, 0, false, false);
INSERT INTO public.planet VALUES (2, 'Vénus', 1, 'Tellurique', 0.815, 6051.8, 0, false, false);
INSERT INTO public.planet VALUES (3, 'Terre', 1, 'Tellurique', 1.0, 6371, 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Tellurique', 0.107, 3389.5, 2, false, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Géante gazeuse', 317.8, 69911, 79, false, false);
INSERT INTO public.planet VALUES (6, 'Saturne', 1, 'Géante gazeuse', 95.2, 58232, 82, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Géante glacée', 14.5, 25362, 27, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Géante glacée', 17.1, 24622, 14, false, false);
INSERT INTO public.planet VALUES (9, 'Pluton', 1, 'Planète naine', 0.00218, 1188.3, 5, false, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 5, 'Tellurique', NULL, NULL, 0, NULL, true);
INSERT INTO public.planet VALUES (11, 'Proxima b', 4, 'Tellurique', NULL, NULL, 0, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 6, 'Jupiter chaud', NULL, NULL, 0, false, false);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'Station spatiale internationale', 'International', 6, true);
INSERT INTO public.space_station VALUES (2, 'Tiangong', 'Chine', 3, true);
INSERT INTO public.space_station VALUES (3, 'Mir', 'Russie', 6, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Soleil', 1, 'G-type', 1.0, 4600000000, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 2.1, 242000000, true, true);
INSERT INTO public.star VALUES (3, 'Bételgeuse', 1, 'Supergéante rouge', 20.0, 8000000, true, false);
INSERT INTO public.star VALUES (4, 'Proxima du Centaure', 1, 'Naine rouge', 0.123, 4500000000, false, true);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 'Supergéante bleue', 18.0, 8000000, true, false);
INSERT INTO public.star VALUES (6, 'Vega', 2, 'A-type', 2.1, 455000000, true, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

