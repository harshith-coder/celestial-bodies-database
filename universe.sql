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

ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_galaxy_id_fkey;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_star_id_fkey;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_planet_id_fkey;
ALTER TABLE IF EXISTS ONLY public.black_hole DROP CONSTRAINT IF EXISTS black_hole_galaxy_id_fkey;
ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_pkey;
ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_name_key;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_pkey;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_name_key;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_pkey;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_name_key;
ALTER TABLE IF EXISTS ONLY public.galaxy DROP CONSTRAINT IF EXISTS galaxy_pkey;
ALTER TABLE IF EXISTS ONLY public.galaxy DROP CONSTRAINT IF EXISTS galaxy_name_key;
ALTER TABLE IF EXISTS ONLY public.black_hole DROP CONSTRAINT IF EXISTS black_hole_pkey;
ALTER TABLE IF EXISTS ONLY public.black_hole DROP CONSTRAINT IF EXISTS black_hole_name_key;
ALTER TABLE IF EXISTS public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.black_hole ALTER COLUMN black_hole_id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.star_star_id_seq;
DROP TABLE IF EXISTS public.star;
DROP SEQUENCE IF EXISTS public.planet_planet_id_seq;
DROP TABLE IF EXISTS public.planet;
DROP SEQUENCE IF EXISTS public.moon_moon_id_seq;
DROP TABLE IF EXISTS public.moon;
DROP SEQUENCE IF EXISTS public.galaxy_galaxy_id_seq;
DROP TABLE IF EXISTS public.galaxy;
DROP SEQUENCE IF EXISTS public.black_hole_black_hole_id_seq;
DROP TABLE IF EXISTS public.black_hole;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_solar integer NOT NULL,
    description text NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    star_count integer NOT NULL,
    distance_from_earth numeric(12,2) NOT NULL,
    description text,
    is_visible boolean DEFAULT true NOT NULL
);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days numeric(8,2) NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL
);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(40) NOT NULL,
    orbital_period_days integer NOT NULL,
    has_atmosphere boolean DEFAULT true NOT NULL
);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying(2) NOT NULL,
    mass_solar numeric(8,3) NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.black_hole (black_hole_id, name, galaxy_id, mass_solar, description, is_active) FROM stdin;
1	Sagittarius A*	1	4300000	The supermassive black hole at the center of the Milky Way.	t
2	M31 Core	2	100000000	The central black hole of the Andromeda galaxy.	t
3	Whirlpool Core	4	70000000	A massive black hole in the Whirlpool galaxy.	t
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.galaxy (galaxy_id, name, galaxy_type, star_count, distance_from_earth, description, is_visible) FROM stdin;
1	Milky Way	Spiral	200000	0.00	Our home galaxy.	t
2	Andromeda	Spiral	1000000	2537000.00	The nearest major galaxy.	t
3	Triangulum	Spiral	40000	2723000.00	A small spiral galaxy in the Local Group.	t
4	Whirlpool	Spiral	100000	23000000.00	A classic interacting spiral galaxy.	f
5	Sombrero	Spiral	100000	29000000.00	A galaxy with a prominent central bulge.	f
6	Large Magellanic Cloud	Irregular	30000	163000.00	A satellite galaxy of the Milky Way.	t
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moon (moon_id, name, planet_id, diameter_km, orbital_period_days, is_spherical) FROM stdin;
1	Moon	3	3475	27.32	t
2	Phobos	4	23	0.32	f
3	Deimos	4	13	1.26	f
4	Io	5	3643	1.77	t
5	Europa	5	3122	3.55	t
6	Ganymede	5	5268	7.15	t
7	Callisto	5	4821	16.69	t
8	Titan	6	5150	15.95	t
9	Rhea	6	1528	4.52	t
10	Iapetus	6	1469	79.33	t
11	Dione	6	1123	2.74	t
12	Tethys	6	1062	1.89	t
13	Enceladus	6	504	1.37	t
14	Mimas	6	396	0.94	t
15	Titania	7	1578	8.71	t
16	Oberon	7	1523	13.46	t
17	Ariel	7	1158	2.52	t
18	Umbriel	7	1169	4.14	t
19	Triton	8	2706	5.88	t
20	Nereid	8	340	360.13	t
21	Sirius Moon	9	1200	30.00	t
22	Vega Moon	12	900	18.50	t
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planet (planet_id, name, star_id, planet_type, orbital_period_days, has_atmosphere) FROM stdin;
1	Mercury	1	Terrestrial	88	f
2	Venus	1	Terrestrial	225	t
3	Earth	1	Terrestrial	365	t
4	Mars	1	Terrestrial	687	t
5	Jupiter	1	Gas giant	4333	t
6	Saturn	1	Gas giant	10759	t
7	Uranus	1	Ice giant	30687	t
8	Neptune	1	Ice giant	60190	t
9	Sirius Prime	2	Terrestrial	410	t
10	Betelgeuse One	3	Gas giant	900	t
11	Proxima b	4	Terrestrial	11	t
12	Vega World	5	Terrestrial	280	t
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.star (star_id, name, galaxy_id, spectral_class, mass_solar, is_active) FROM stdin;
1	Sun	1	G2	1.000	t
2	Sirius	1	A1	2.020	t
3	Betelgeuse	1	M2	16.500	t
4	Proxima Centauri	1	M5	0.123	t
5	Vega	1	A0	2.135	t
6	Rigel	1	B8	21.000	t
7	Andromeda Core Star	2	A2	3.400	t
\.


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

