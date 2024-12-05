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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size numeric(5,2),
    orbit_distance numeric(6,1),
    is_hazardous boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    no_of_stars integer,
    no_of_planets integer,
    radius_in_ly numeric(9,1)
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
    name character varying(60) NOT NULL,
    distance_from_earth_in_lightyears numeric(4,1),
    has_life boolean,
    planet_id integer
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
    name character varying(60) NOT NULL,
    no_of_moons integer,
    has_life boolean,
    description text,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    no_of_planets integer,
    distance_from_earth_in_lightyears numeric(20,1),
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Asteroid Belt', 940.00, 2.7, false);
INSERT INTO public.asteroid VALUES (2, 'Ceres', 940.00, 2.8, true);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 525.00, 2.6, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 1000, 5000, 1100000.0);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 200, 1000, 52850.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 200, 300000.0);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 800, 4000, 26000.0);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 100, 500, 32000.0);
INSERT INTO public.galaxy VALUES (6, 'Magellanic', 30, 150, 7000.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 0.0, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.0, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.0, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 0.0, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 0.0, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 0.0, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 0.0, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 0.1, false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 0.1, false, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 0.1, false, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 0.1, false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 0.1, false, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 0.1, false, 6);
INSERT INTO public.moon VALUES (14, 'Miranda', 0.1, false, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 0.1, false, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 0.1, false, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 0.1, false, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 0.1, false, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 0.2, false, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 0.2, false, 8);
INSERT INTO public.moon VALUES (21, 'Charon', 0.2, false, 9);
INSERT INTO public.moon VALUES (22, 'Sirius B1 Moon', 8.6, false, 10);
INSERT INTO public.moon VALUES (23, 'Sirius B2 Moon', 8.6, false, 11);
INSERT INTO public.moon VALUES (24, 'Gliese Moon 1', 20.3, false, 13);
INSERT INTO public.moon VALUES (25, 'Gliese Moon 2', 20.3, false, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, false, 'Smallest planet in the Solar System, closest to the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, false, 'Similar in size to Earth, but with a thick toxic atmosphere.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 'The only known planet to harbor life.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, false, 'Known as the Red Planet, home to the largest volcano in the Solar System.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, false, 'The largest planet in the Solar System with a massive storm called the Great Red Spot.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, false, 'Famous for its prominent ring system.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, false, 'An ice giant with a tilted rotation axis.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, false, 'The farthest planet from the Sun in the Solar System.', 1);
INSERT INTO public.planet VALUES (9, 'Planet X', 0, false, 'A hypothetical planet beyond Neptune.', 1);
INSERT INTO public.planet VALUES (10, 'Sirius B1', 0, false, 'A small rocky planet orbiting Sirius.', 2);
INSERT INTO public.planet VALUES (11, 'Sirius B2', 1, false, 'A gas giant orbiting Sirius with a single moon.', 2);
INSERT INTO public.planet VALUES (12, 'Sirius B3', 0, false, 'An icy planet orbiting Sirius.', 2);
INSERT INTO public.planet VALUES (13, 'Gliese 581g', 1, true, 'A potentially habitable exoplanet in the Gliese system.', 3);
INSERT INTO public.planet VALUES (14, 'Gliese 581c', 0, false, 'A hot rocky exoplanet in the Gliese system.', 3);
INSERT INTO public.planet VALUES (15, 'Gliese 581d', 0, false, 'A cold exoplanet on the edge of the habitable zone in the Gliese system.', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 0.0, 2);
INSERT INTO public.star VALUES (2, 'Sirius', 0, 8.6, 2);
INSERT INTO public.star VALUES (3, 'Gliese', 4, 20.3, 2);
INSERT INTO public.star VALUES (4, 'Alpha', 6, 2500000.0, 1);
INSERT INTO public.star VALUES (5, 'Beta', 4, 2500100.0, 1);
INSERT INTO public.star VALUES (6, 'Gamma', 5, 2500200.0, 1);
INSERT INTO public.star VALUES (8, 'Triangulum Alpha', 5, 3000000.0, 3);
INSERT INTO public.star VALUES (9, 'Triangulum Beta', 3, 3000100.0, 3);
INSERT INTO public.star VALUES (10, 'Sombrero Beta', 4, 3100100.0, 4);
INSERT INTO public.star VALUES (11, 'Sombrero Alpha', 6, 3100000.0, 4);
INSERT INTO public.star VALUES (12, 'Whirlpool Alpha', 5, 23000000.0, 5);
INSERT INTO public.star VALUES (13, 'Whirlpool Betaa', 2, 23000200.0, 5);
INSERT INTO public.star VALUES (14, 'LMC Beta', 4, 163200.0, 6);
INSERT INTO public.star VALUES (15, 'LMC Alpha', 7, 163000.0, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

