--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: flight; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.flight (
    flight_id integer NOT NULL,
    starship_id integer,
    planet_id integer,
    name character varying(16) NOT NULL,
    date date NOT NULL,
    manifest integer NOT NULL
);


ALTER TABLE public.flight OWNER TO freecodecamp;

--
-- Name: flight_flight_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.flight_flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flight_flight_id_seq OWNER TO freecodecamp;

--
-- Name: flight_flight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.flight_flight_id_seq OWNED BY public.flight.flight_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    class character varying(3) NOT NULL,
    spiral boolean
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
    planet_id integer,
    name character varying(32) NOT NULL,
    primary_component character varying(32) NOT NULL,
    mass_kg_e18 numeric(8,4)
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
    star_id integer,
    name character varying(32) NOT NULL,
    habitable boolean NOT NULL,
    no_of_colonies integer
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
    galaxy_id integer,
    name character varying(32) NOT NULL,
    class character(1) NOT NULL,
    temp_in_k integer
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
-- Name: starship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.starship (
    starship_id integer NOT NULL,
    name character varying(32) NOT NULL,
    passengers boolean NOT NULL
);


ALTER TABLE public.starship OWNER TO freecodecamp;

--
-- Name: starship_starship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.starship_starship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.starship_starship_id_seq OWNER TO freecodecamp;

--
-- Name: starship_starship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.starship_starship_id_seq OWNED BY public.starship.starship_id;


--
-- Name: flight flight_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.flight ALTER COLUMN flight_id SET DEFAULT nextval('public.flight_flight_id_seq'::regclass);


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
-- Name: starship starship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starship ALTER COLUMN starship_id SET DEFAULT nextval('public.starship_starship_id_seq'::regclass);


--
-- Data for Name: flight; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.flight VALUES (1, 1, 10, '01-10-780101', '2078-01-01', 1014);
INSERT INTO public.flight VALUES (2, 1, 13, '01-13-780103', '2078-01-03', 925);
INSERT INTO public.flight VALUES (3, 1, 19, '01-19-780117', '2078-01-17', 1235);
INSERT INTO public.flight VALUES (4, 1, 2, '01-02-780204', '2078-02-04', 1157);
INSERT INTO public.flight VALUES (5, 2, 15, '02-15-780101', '2078-01-01', 604);
INSERT INTO public.flight VALUES (6, 2, 3, '02-03-780401', '2078-04-01', 604);
INSERT INTO public.flight VALUES (7, 3, 2, '03-02-780101', '2078-01-01', 436);
INSERT INTO public.flight VALUES (8, 3, 5, '03-05-780102', '2078-01-02', 436);
INSERT INTO public.flight VALUES (9, 3, 6, '03-06-780103', '2078-01-03', 436);
INSERT INTO public.flight VALUES (10, 3, 9, '03-09-780105', '2078-01-05', 436);
INSERT INTO public.flight VALUES (11, 3, 11, '03-11-780108', '2078-01-08', 436);
INSERT INTO public.flight VALUES (12, 3, 13, '03-13-780113', '2078-01-13', 436);
INSERT INTO public.flight VALUES (13, 3, 14, '03-14-780121', '2078-01-21', 435);
INSERT INTO public.flight VALUES (14, 3, 18, '03-18-780203', '2078-02-03', 437);
INSERT INTO public.flight VALUES (15, 3, 20, '03-20-780224', '2078-02-24', 436);
INSERT INTO public.flight VALUES (16, 3, 21, '03-21-780330', '2078-03-30', 436);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Kara-Mel Cluster', 'Located in the Delta Quadrant, this galaxy is known for its rich resources. As such, its territories are often the subject of intense negotiation', 'E5', false);
INSERT INTO public.galaxy VALUES (2, 'Munchie Way', 'Located in the Beta Quadrant, this enormous galaxy has a reputation for near endless possibilities. Much of it still has yet to be charted', 'E7', false);
INSERT INTO public.galaxy VALUES (35, 'Serena T Spiral', 'Located in the Gamma Quadrant, this remote galaxy has largely been colonized refugees and hermits looking to find peace', 'Sb', true);
INSERT INTO public.galaxy VALUES (36, 'Scrambled E.G. Galaxy', 'Located in the Beta Quadrant, it is said that ships that fly too close to the center of this galaxy would suddenly disappear, only to find themselves in orbit around one of the outer planets within thirty-two Earth hours after communication failure. There is currently no explanation for this phenomenon', 'SBc', true);
INSERT INTO public.galaxy VALUES (37, 'Frute-Barri Twist', 'Located in the Gamma Quadrant, this adventurous galaxy is well known for attracting colonizers to even its least habitable, or completely uninhabitable, planets', 'S0', true);
INSERT INTO public.galaxy VALUES (38, 'Derry Quiin', 'Located in the Delta Quatrant, this galaxy known for its ice-cold temperatures and rich resources, inspiring in even its most inhospitable locations', 'SBc', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'CHOK_7', 'latite', 64.9710);
INSERT INTO public.moon VALUES (2, 1, 'KARA_9', 'melite', 75.2851);
INSERT INTO public.moon VALUES (3, 1, 'MARSH_0', 'malite', 295.1746);
INSERT INTO public.moon VALUES (4, 2, 'Pin-Aht', 'bahtrite', 409.5825);
INSERT INTO public.moon VALUES (5, 2, 'Gran-Laht', 'sugrite', 17.0372);
INSERT INTO public.moon VALUES (6, 2, 'Chak-Lit', 'starite', 124.7572);
INSERT INTO public.moon VALUES (7, 3, 'Mutzha', 'relite', 58.2017);
INSERT INTO public.moon VALUES (8, 3, 'T-Oh', 'matite', 37.4198);
INSERT INTO public.moon VALUES (9, 3, 'Pepper', 'onite', 17.0462);
INSERT INTO public.moon VALUES (10, 3, 'Be-Gal', 'byite', 104.7286);
INSERT INTO public.moon VALUES (11, 4, 'Maielde', 'chedarite', 287.2619);
INSERT INTO public.moon VALUES (12, 4, 'L-Bo', 'macronite', 104.2956);
INSERT INTO public.moon VALUES (13, 4, 'Frank', 'furtite', 67.2956);
INSERT INTO public.moon VALUES (14, 5, 'Nuggis', 'chimkenite', 295.2047);
INSERT INTO public.moon VALUES (15, 12, 'Chak-Litt', 'chepite', 49.5719);
INSERT INTO public.moon VALUES (16, 12, 'B-Na', 'nannite', 285.2963);
INSERT INTO public.moon VALUES (17, 12, 'Creespi', 'baconite', 75.2951);
INSERT INTO public.moon VALUES (18, 13, 'Wip-D', 'kremite', 39.5829);
INSERT INTO public.moon VALUES (19, 13, 'May_Pole', 'seripite', 185.5925);
INSERT INTO public.moon VALUES (20, 14, 'BIS', 'quitite', 2057.3715);
INSERT INTO public.moon VALUES (21, 14, 'Chek-N', 'egite', 3861.5826);
INSERT INTO public.moon VALUES (22, 14, 'SAS-AGE', 'porcite', 2819.5629);
INSERT INTO public.moon VALUES (23, 14, 'Ch-Da', 'chiisite', 1056.2848);
INSERT INTO public.moon VALUES (24, 15, 'PRNE', 'jucite', 673.6927);
INSERT INTO public.moon VALUES (25, 16, 'CRN', 'ap-l-jucite', 2583.5927);
INSERT INTO public.moon VALUES (26, 17, 'PNE', 'apal-jucite', 503.1957);
INSERT INTO public.moon VALUES (27, 17, 'GRP', 'frt-jucite', 509.3618);
INSERT INTO public.moon VALUES (28, 18, 'Chok-Lat', 'kakite', 2905.7275);
INSERT INTO public.moon VALUES (29, 19, 'Ch-Ok', 'klatite', 482.5926);
INSERT INTO public.moon VALUES (30, 19, 'Ha-Zil', 'nootite', 174.2162);
INSERT INTO public.moon VALUES (31, 20, 'Choko', 'chepite', 572.4962);
INSERT INTO public.moon VALUES (32, 20, 'Kookie', 'dohite', 1784.9256);
INSERT INTO public.moon VALUES (33, 21, 'Chokl-At', 'cookite', 852.5926);
INSERT INTO public.moon VALUES (34, 21, 'Kreme', 'stufite', 572.2836);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'CHP_CC', true, 189);
INSERT INTO public.planet VALUES (2, 1, 'PB_CC', true, 124);
INSERT INTO public.planet VALUES (3, 2, 'Dischus Deep', false, 17);
INSERT INTO public.planet VALUES (4, 3, 'Chii-Snudals', true, 62);
INSERT INTO public.planet VALUES (5, 4, 'D-No Nuggii', true, 37);
INSERT INTO public.planet VALUES (6, 5, 'Umbra', false, 2);
INSERT INTO public.planet VALUES (7, 5, 'Flos', true, 17);
INSERT INTO public.planet VALUES (8, 6, '00-LONG', false, 0);
INSERT INTO public.planet VALUES (9, 7, 'Viridis', true, 58);
INSERT INTO public.planet VALUES (10, 8, 'Flavus', true, 43);
INSERT INTO public.planet VALUES (11, 9, 'Album', false, 0);
INSERT INTO public.planet VALUES (12, 10, 'Galette', true, 89);
INSERT INTO public.planet VALUES (13, 11, 'Wawful Gud', false, 6);
INSERT INTO public.planet VALUES (14, 12, 'Samich', true, 62);
INSERT INTO public.planet VALUES (15, 13, 'Warrior-9', false, 3);
INSERT INTO public.planet VALUES (16, 13, 'Warrior-8', true, 5);
INSERT INTO public.planet VALUES (17, 13, 'Punch', true, 15);
INSERT INTO public.planet VALUES (18, 14, 'CHOK-K', true, 92);
INSERT INTO public.planet VALUES (19, 14, 'Noot', true, 73);
INSERT INTO public.planet VALUES (20, 14, 'D-Oh', false, 5);
INSERT INTO public.planet VALUES (21, 14, 'Kuki', true, 54);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'KUKI_EE', 'O', 35000);
INSERT INTO public.star VALUES (2, 2, 'ZZA_Stn', 'O', 40000);
INSERT INTO public.star VALUES (3, 2, 'BG_P_0_T', 'B', 30000);
INSERT INTO public.star VALUES (4, 2, 'FRI_Deep', 'O', 32500);
INSERT INTO public.star VALUES (5, 35, 'Ket-L_1', 'A', 9990);
INSERT INTO public.star VALUES (6, 35, 'Ket-L_2', 'A', 8200);
INSERT INTO public.star VALUES (7, 35, 'Ket-L_3', 'A', 7700);
INSERT INTO public.star VALUES (8, 35, 'Ket-L_4', 'F', 7500);
INSERT INTO public.star VALUES (9, 35, 'Ket-L_5', 'F', 6800);
INSERT INTO public.star VALUES (10, 36, 'Gr-Dahl', 'O', 37500);
INSERT INTO public.star VALUES (11, 36, 'Iorn', 'O', 37500);
INSERT INTO public.star VALUES (12, 36, 'Microv-N', 'B', 11000);
INSERT INTO public.star VALUES (13, 37, 'Dri-ink', 'G', 5500);
INSERT INTO public.star VALUES (14, 38, 'Melk Sh-K', 'M', 2500);


--
-- Data for Name: starship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.starship VALUES (1, 'USS Applepies', true);
INSERT INTO public.starship VALUES (2, 'Deep Dish 9', false);
INSERT INTO public.starship VALUES (3, 'Starship Delivery', false);


--
-- Name: flight_flight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.flight_flight_id_seq', 16, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 38, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 42, true);


--
-- Name: starship_starship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.starship_starship_id_seq', 3, true);


--
-- Name: flight flight_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_name_key UNIQUE (name);


--
-- Name: flight flight_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_pkey PRIMARY KEY (flight_id);


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
-- Name: starship starship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starship
    ADD CONSTRAINT starship_name_key UNIQUE (name);


--
-- Name: starship starship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starship
    ADD CONSTRAINT starship_pkey PRIMARY KEY (starship_id);


--
-- Name: flight flight_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: flight flight_starship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_starship_id_fkey FOREIGN KEY (starship_id) REFERENCES public.starship(starship_id);


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

