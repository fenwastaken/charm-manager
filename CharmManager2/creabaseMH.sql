--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-10-13 20:01:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 16728)
-- Name: ATHENA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "ATHENA" (
    "ID" integer NOT NULL,
    "ID-SKILLS" integer,
    "NAME-FR" character varying,
    "NAME-EN" character varying
);


ALTER TABLE "ATHENA" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16731)
-- Name: ATHENA_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "ATHENA_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ATHENA_ID_seq" OWNER TO postgres;

--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 188
-- Name: ATHENA_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "ATHENA_ID_seq" OWNED BY "ATHENA"."ID";


--
-- TOC entry 181 (class 1259 OID 16626)
-- Name: CHARM; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "CHARM" (
    "ID" integer NOT NULL,
    "RARITY" integer,
    "SKILL1" integer,
    "VALUE1" integer,
    "SKILL2" integer,
    "VALUE2" integer,
    "SLOTS" integer,
    "FAV" boolean
);


ALTER TABLE "CHARM" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16629)
-- Name: CHARM_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "CHARM_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "CHARM_ID_seq" OWNER TO postgres;

--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 182
-- Name: CHARM_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "CHARM_ID_seq" OWNED BY "CHARM"."ID";


--
-- TOC entry 185 (class 1259 OID 16657)
-- Name: LINE; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "LINE" (
    "ID" integer NOT NULL,
    "SKILL" integer,
    "NAME" character varying,
    "DESCRIPTION" character varying
);


ALTER TABLE "LINE" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16660)
-- Name: LINE_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "LINE_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "LINE_ID_seq" OWNER TO postgres;

--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 186
-- Name: LINE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "LINE_ID_seq" OWNED BY "LINE"."ID";


--
-- TOC entry 183 (class 1259 OID 16640)
-- Name: SKILLS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "SKILLS" (
    "ID" integer NOT NULL,
    "NAME-FR" character varying,
    "NAME-EN" character varying,
    "gameOrder" integer
);


ALTER TABLE "SKILLS" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16643)
-- Name: SKILLS_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "SKILLS_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SKILLS_ID_seq" OWNER TO postgres;

--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 184
-- Name: SKILLS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "SKILLS_ID_seq" OWNED BY "SKILLS"."ID";


--
-- TOC entry 2005 (class 2604 OID 16733)
-- Name: ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ATHENA" ALTER COLUMN "ID" SET DEFAULT nextval('"ATHENA_ID_seq"'::regclass);


--
-- TOC entry 2002 (class 2604 OID 16631)
-- Name: ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "CHARM" ALTER COLUMN "ID" SET DEFAULT nextval('"CHARM_ID_seq"'::regclass);


--
-- TOC entry 2004 (class 2604 OID 16662)
-- Name: ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "LINE" ALTER COLUMN "ID" SET DEFAULT nextval('"LINE_ID_seq"'::regclass);


--
-- TOC entry 2003 (class 2604 OID 16645)
-- Name: ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "SKILLS" ALTER COLUMN "ID" SET DEFAULT nextval('"SKILLS_ID_seq"'::regclass);


--
-- TOC entry 2139 (class 0 OID 16728)
-- Dependencies: 187
-- Data for Name: ATHENA; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ATHENA" ("ID", "ID-SKILLS", "NAME-FR", "NAME-EN") FROM stdin;
383	\N	Garde auto	Auto-Guard
223	\N	Paladin	Guard Boost
1	118	Poison	Poison
2	112	Paralysie	Paralysis
3	133	Sommeil	Sleep
4	146	Volonté	Stun
5	7	Alpiniste	Mud/Snow
6	17	Assurance	Def Lock
7	23	Biologie	Biology
8	21	Attaque	Attack
9	44	Défense	Defense
10	144	Vie	Health
11	127	Récupérer	Rec Speed
12	122	Protection	Protection
13	128	Rengainage	Sheathing
14	34	Charge	FastCharge
15	60	Expert	Expert
16	137	Supplice	Tenderizer
17	48	Destruction	Destroyer
18	94	KO	KO
19	69	Fatigue	Stam Drain
20	20	Athlète	Constitutn
21	110	Ouïe	Hearing
22	143	Vent	Wind Res
23	12	Anti-séisme	Tremor Res
24	31	Chaleur	Heat Res
25	76	Froid	Cold Res
26	136	Stamina	Stamina
27	145	Vigueur	Stam Recov
28	59	Évasion	Evasion
29	57	Esquive	Evade Dist
30	105	Ninja	Sense
31	81	Garde	Guard
32	111	Paladin	Guard Up
33	3	Affliction	Status
34	55	Élément	Elemental
35	72	Feu	Fire Atk
36	53	Eau	Water Atk
37	74	Foudre	ThunderAtk
38	84	Glace	Ice Atk
39	51	Dragon	Dragon Atk
40	88	Ignifuge	Fire Res
41	58	Étanche	Water Res
42	93	Isolant	ThunderRes
43	11	Antigel	Ice Res
44	50	Draconien	Dragon Res
45	49	Dextérité	Sharpness
46	19	Artisanat	Handicraft
47	5	Aiguiseur	Sharpener
48	125	Punition	PunishDraw
49	45	Dégainage	Crit Draw
50	56	Escrime	Fencing
51	80	Fusilier	Reload Spd
52	16	Armurier	Loading
53	101	Mitrailleur	Rapid Fire
54	139	Tirailleur	Recoil
55	132	Sniper	Precision
56	107	Normal G	Normal Up
57	114	Perçant G	Pierce Up
58	117	Plomb G	Pellet Up
59	106	Normal	Normal S+
60	113	Perçant	Pierce S+
61	85	Grenaille	Pellet S+
62	8	Antiblindage	Crag S+
63	75	Frag	Clust S+
64	141	Tranchant	Slicing S+
65	61	Explosion	Blast S+
66	67	F Poison	Poison C+
67	66	F Paralys	Para C+
68	68	F Sommeil	Sleep C+
69	63	F Énergie	Power C+
70	62	F Combat	C.Range C+
71	65	F Faiblesse	Exhaust C+
72	64	F Explosion	Blast C+
73	103	Musique	Maestro
74	18	Artillerie	Artillery
75	24	Bombe	Bomb Boost
76	130	Restaurer	Rec Level
77	135	Soutien	Wide-Range
78	108	Objets	LastingPwr
79	14	Appétit	Hunger
80	83	Gastronome	Gluttony
81	129	Repas	Eating
82	28	Carnivore	Carnivore
83	91	Inventeur	Combo Rate
84	6	Alchimiste	Combo Plus
85	38	Collecte	Gathering
86	32	Chapardeur	Spd Gather
87	97	Lubie	Whim
88	100	Miel	Honey
89	33	Charme	Charmer
90	47	Destin	Fate
91	46	Dépeçage	Carving
92	27	Capture	Tranquilzr
93	115	Perception	Perception
94	98	Lucidité	Psychic
95	41	Convoyeur	Transportr
96	35	Chasse	Ranger
97	13	Antivol	Anti-Theft
98	116	Piège	SpeedSetup
99	22	Aura de feu	Flame Aura
100	119	Potentiel	Potential
101	138	Survie	Survivor
102	124	Puissance	Gloves Off
103	42	Courage	Spirit
104	92	Invincible	Unscathed
105	29	Catalyste	FreeElemnt
106	25	Bravoure	Guts
107	102	Moral	TeamPlayer
108	96	Leader	TeamLeader
109	82	Garde auto	Auto-Guard
110	73	Fléau	Blight Res
111	126	Pureté	Status Res
112	78	Furie	Fury
113	131	Shogun	Edgemaster
114	70	Fermeté	SteadyHand
115	40	Constance	Unshakable
116	71	Férocité	Ferocity
117	120	Prétorien	Resilience
118	43	Cupidité	Avarice
119	10	Anti-furie	Frenzy Res
120	26	Brutalité	Brutality
121	39	Commandant	Commander
122	37	Chevauchée	Mounting
123	87	Iaido	Readiness
124	4	Agilité	Nimbleness
125	54	Égide	Stalwart
126	123	Prudence	Prudence
127	142	Trésor	Hoarding
128	52	Druide	Amplify
129	86	Hémorragie	Bleeding
130	77	Frugal	LightEater
131	104	Mycologie	Mycology
132	109	Ogre	PowerEater
133	9	Anti-collant	Sticky Res
134	95	Kyudo	Dead Eye
135	79	Furtif	Covert
136	89	Inflexible	Edge Lore
137	36	Châtiment	CritStatus
138	30	Chamanisme	CritElemnt
139	134	Sournois	D. Fencing
140	15	Arcane	Arcana
141	90	Ingénieur	Mechanic
142	99	Mastodonte	Brawn
143	121	Prière	Prayer
144	140	Torse +	Torso Up
145	\N	Antidote	Negate Poison
146	\N	Venin	Double Poison
147	\N	Anti-paralysie	Negate Paralysis
148	\N	Super paralysie	Double Paralysis
149	\N	Noctambule	Negate Sleep
150	\N	Hypersomnie	Double Sleep
151	\N	Crâne de pierre	Halve Stun
152	\N	Crâne de fer	Negate Stun
153	\N	Menton de verre	Double Stun
154	\N	Anti-boue/neige	Negate Mud/Snow
155	\N	Peau d'acier	Iron Skin
156	\N	Chercheur bio	Bio Researcher
157	\N	Maître bio	Bio Master
158	\N	Attaque +1	Attack Up (S)
159	\N	Attaque +2	Attack Up (M)
160	\N	Attaque +3	Attack Up (L)
161	\N	Attaque +4	Attack Up (XL)
162	\N	Attaque -1	Attack Down (S)
163	\N	Attaque -2	Attack Down (M)
164	\N	Attaque -3	Attack Down (L)
165	\N	Défense +1	Defense Up (S)
166	\N	Défense +2	Defense Up (M)
167	\N	Défense +3	Defense Up (L)
168	\N	Défense +4	Defense Up (XL)
169	\N	Défense -1	Defense Down (S)
170	\N	Défense -2	Defense Down (M)
171	\N	Défense -3	Defense Down (L)
172	\N	Vie +20	Health +20
173	\N	Vie +50	Health +50
174	\N	Vie -10	Health -10
175	\N	Vie -30	Health -30
176	\N	Récupération +1	Recovery Spd +1
177	\N	Récupération +2	Recovery Spd +2
178	\N	Récupération -1	Recovery Spd -1
179	\N	Récupération -2	Recovery Spd -2
180	\N	Bénédiction	Divine Blessing
181	\N	Malédiction	Demonic Blessing
182	\N	Lame éclair	Quick Sheath
183	\N	Concentration	Focus
184	\N	Distraction	Distraction
185	\N	Œil critique +1	Critical Eye +1
186	\N	Œil critique +2	Critical Eye +2
187	\N	Œil critique +3	Critical Eye +3
188	\N	Vision critique	Critical God
189	\N	Œil critique -1	Critical Eye -1
190	\N	Œil critique -2	Critical Eye -2
191	\N	Œil critique -3	Critical Eye -3
192	\N	Point faible	Weakness Exploit
193	\N	Destructeur	Partbreaker
194	\N	Roi du KO	Knockout King
195	\N	Vol de stamina	Stamina Thief
196	\N	Athlète +1	Constitution +1
197	\N	Athlète +2	Constitution +2
198	\N	Athlète -1	Constitution -1
199	\N	Athlète -2	Constitution -2
200	\N	Protège-tympan	Earplugs
201	\N	Bouche-oreilles	HG Earplugs
202	\N	Vent +1	Windproof (Lo)
203	\N	Vent +2	Windproof (Hi)
205	\N	Chaleur +	Heat Cancel
206	\N	Chaleur -	Heat Surge
207	\N	Froid +	Cold Cancel
208	\N	Froid -	Cold Surge
209	\N	Marathonien	Marathon Runner
210	\N	Sprinter	Short Sprinter
211	\N	Vigueur +	Stam Recov Up
212	\N	Vigueur -	Stam Recov Down
213	\N	Évasion +1	Evasion +1
214	\N	Évasion +2	Evasion +2
215	\N	Évasion +3	Evasion +3
216	\N	Évasion -	Evasion Down
217	\N	Esquive +	Evade Extender
218	\N	Furtivité	Sneak
219	\N	Provocation	Taunt
220	\N	Garde +1	Guard +1
221	\N	Garde +2	Guard +2
222	\N	Garde -1	Guard -1
224	\N	Affliction +1	Status Atk +1
225	\N	Affliction +2	Status Atk +2
226	\N	Affliction -	Status Atk Down
227	\N	Élémentaire +	Element Atk Up
228	\N	Élémentaire -	Element Atk Down
229	\N	Attaque Feu +1	Fire Atk +1
230	\N	Attaque Feu +2	Fire Atk +2
231	\N	Attaque Feu +3	Fire Atk +3
232	\N	Attaque Feu -	Fire Atk Down
233	\N	Attaque Eau +1	Water Atk +1
234	\N	Attaque Eau +2	Water Atk +2
235	\N	Attaque Eau +3	Water Atk +3
236	\N	Attaque Eau -	Water Atk Down
237	\N	Attaque Foudre +1	Thunder Atk +1
238	\N	Attaque Foudre +2	Thunder Atk +2
239	\N	Attaque Foudre +3	Thunder Atk +3
240	\N	Attaque Foudre -	Thunder Atk Down
241	\N	Attaque Glace +1	Ice Atk +1
242	\N	Attaque Glace +2	Ice Atk +2
243	\N	Attaque Glace +3	Ice Atk +3
244	\N	Attaque Glace -	Ice Atk Down
245	\N	Attaque Dragon +1	Dragon Atk +1
246	\N	Attaque Dragon +2	Dragon Atk +2
247	\N	Attaque Dragon +3	Dragon Atk +3
248	\N	Attaque Dragon -	Dragon Atk Down
249	\N	Feu +15	Fire Res +15
250	\N	Feu +20	Fire Res +20
251	\N	Feu -20	Fire Res -20
252	\N	Eau +15	Water Res +15
253	\N	Eau +20	Water Res +20
254	\N	Eau -20	Water Res -20
255	\N	Foudre +15	Thunder Res +15
256	\N	Foudre +20	Thunder Res +20
257	\N	Foudre -20	Thunder Res -20
258	\N	Glace +15	Ice Res +15
259	\N	Glace +20	Ice Res +20
260	\N	Glace -20	Ice Res -20
261	\N	Dragon +15	Dragon Res +15
262	\N	Dragon +20	Dragon Res +20
263	\N	Dragon -20	Dragon Res -20
264	\N	Samouraï	Razor Sharp
265	\N	Barbare	Blunt Edge
266	\N	Tranchant +1	Sharpness +1
267	\N	Aiguisage rapide	Speed Sharpening
204	\N	Anti-séisme	Tremor Res
268	\N	Aiguisage lent	Slow Sharpening
269	\N	Batto-jutsu	Punishing Draw
270	\N	Dégainage éclair	Critical Draw
271	\N	Œil de l'esprit	Mind's Eye
272	\N	Œil aveugle	Blind Eye
273	\N	Rechargement +1	Reload Speed +1
274	\N	Rechargement +2	Reload Speed +2
275	\N	Rechargement +3	Reload Speed +3
276	\N	Rechargement -1	Reload Speed -1
277	\N	Rechargement -2	Reload Speed -2
278	\N	Rechargement -3	Reload Speed -3
279	\N	Munitions +	Load Up
280	\N	Franc-tireur	Bonus Shot
281	\N	Recul +1	Recoil Down +1
282	\N	Recul +2	Recoil Down +2
283	\N	Recul +3	Recoil Down +3
284	\N	Recul -1	Recoil Down -1
285	\N	Recul -2	Recoil Down -2
286	\N	Recul -3	Recoil Down -3
287	\N	Sniper +1	Steadiness +1
288	\N	Sniper +2	Steadiness +2
289	\N	Sniper -1	Steadiness -1
290	\N	Sniper -2	Steadiness -2
291	\N	Normale/Rapide +	Normal/Rapid Up
292	\N	Perçante/Perç.+	Pierce/Pierce Up
293	\N	Plomb/Dispers. +	Pellet/Spread Up
294	\N	Expert munition	Use Any Normal S
295	\N	Perçant NV1	Use Lv1 Pierce S
296	\N	Expert perçant	Use Any Pierce S
297	\N	Grenaille NV1	Use Lv1 Pellet S
298	\N	Expert grenaille	Use Any Pellet S
299	\N	Antiblindage NV1	Use Lv1 Crag S
300	\N	Expert antiblind.	Use Any Crag S
301	\N	Frag NV 1	Use Lv1 Clust S
302	\N	Expert frag	Use Any Clust S
303	\N	Tranchant +	Use Slicing S
304	\N	Explosion +	Use Blast S
305	\N	Fiole poison +	Use Poison Coat
306	\N	Fiole paralys. +	Use Para Coat
307	\N	Fiole sommeil +	Use Sleep Coat
308	\N	Fiole force +	Use Power Coat
309	\N	Fiole combat +	Use C.Range Coat
310	\N	Fiole faiblesse +	Use Exhaust Coat
311	\N	Fiole explosion +	Use Blast Coat
312	\N	Maestro	Horn Maestro
313	\N	Artilleur novice	Artillery Novice
314	\N	Artilleur expert	Artillery Expert
315	\N	Artilleur champion	Artillery God
316	\N	Bombardier	Bombardier
317	\N	Restauration +	Recovery Up
318	\N	Restauration -	Recovery Down
319	\N	Soutien +1	Wide-Range +1
320	\N	Soutien +2	Wide-Range +2
321	\N	Habile	Item Use Up
322	\N	Maladroit	Item Use Down
323	\N	Ascète	Halve Hunger
324	\N	Spartiate	Negate Hunger
325	\N	Glouton	Raise Hunger
326	\N	Gargantua	Double Hunger
327	\N	Gourmet	Gourmand
328	\N	Goinfre	Scavenger
329	\N	Carnassier +1	Speed Eating +1
330	\N	Carnassier +2	Speed Eating +2
331	\N	Végétarien	Slow Eater
332	\N	Cannibale	Meat Lover
333	\N	Combinaison +20%	Combination +20%
334	\N	Combinaison +45%	Combination +45%
335	\N	Combinaison -10%	Combination -10%
336	\N	Combinaison -20%	Combination -20%
337	\N	Archimage	Combination Pro
338	\N	Collecte +1	Gathering +1
339	\N	Collecte +2	Gathering +2
340	\N	Collecteur expert	Gathering God
341	\N	Collecte -1	Gathering -1
343	\N	Lubie esprit	Spirit's Whim
344	\N	Lubie divine	Divine Whim
345	\N	Lubie du spectre	Spectre's Whim
346	\N	Lubie du démon	Devil's Whim
347	\N	Chasseur de miel	Honey Hunter
348	\N	Collecte-charme	Charm Collector
349	\N	Chasse-charme	Charm Chaser
350	\N	Traque-charme	Charm God
351	\N	Chance	Good Luck
352	\N	Bonne fortune	Great Luck
353	\N	Grande fortune	Miraculous Luck
354	\N	Malchance	Bad Luck
355	\N	Mauvaise fortune	Horrible Luck
356	\N	Expert dépeceur	Carving Pro
357	\N	Savant dépeceur	Carving Celebrity
358	\N	Roi dépeceur	Carving God
359	\N	Maître capture	Capture Expert
360	\N	Expert capture	Capture Master
361	\N	Roi capture	Capture God
362	\N	Gourou	Capture Guru
363	\N	Détection	Detect
364	\N	Psychique	Autotracker
365	\N	Transporteur	Pro Transporter
366	\N	Art de la chasse	Outdoorsman
368	\N	Maître piégeur	Trap Master
370	\N	Adrénaline +1	Adrenaline +1
371	\N	Adrénaline +2	Adrenaline +2
372	\N	Inquiétude	Worrywart
373	\N	Ténacité	Fortify
374	\N	Force latente +1	Latent Power +1
375	\N	Force latente +2	Latent Power +2
376	\N	Challenger +1	Challenger +1
377	\N	Challenger +2	Challenger +2
378	\N	Perfection	Peak Performance
379	\N	Réveil	Awaken
381	\N	Esprit camarade	Palico Rally
382	\N	Bonheur camarade	Palico Cheer
384	\N	Anti-fléau	Blightproof
385	\N	Bien-être	Wellness
386	\N	Courroucé	Wrath Awoken
387	\N	Katana	Honed Blade
388	\N	Balle d'argent	Silver Bullet
389	\N	Stabilisation	Rock Steady
390	\N	Soif de sang	Bloodthirst
391	\N	Mur d'acier	Iron Wall
392	\N	Flibustier	Bounty Hunter
393	\N	Antivirus	Antivirus
394	\N	Sans pitié	Ruthlessness
395	\N	Héros camarade	Palico Hero
396	\N	Maître cavalier	Mounting Master
397	\N	Dieu du rodéo	Rodeo God
380	\N	Bravoure	Guts
369	\N	Aura de feu	Flame Aura
367	\N	Antivol	Anti-Theft
342	\N	Chapardeur	Speed Gatherer
398	\N	Lourdaud	Saddle Sore
399	\N	Iai-jutsu	Sheath Control
400	\N	Acrobate	Acrobat
401	\N	Rempart	Shield Bearer
402	\N	Pieds légers	Fleet Feet
403	\N	Collectionneur	Pack Rat
404	\N	Élémentalité	Elementality
405	\N	Compression	Negate Bleeding
406	\N	Effusion	Double Bleeding
407	\N	Satisfaction	Rationer
408	\N	Mycophile	Mushromancer
409	\N	Gros ventre	Alloy Stomach
410	\N	Fluide	Negate Tar
411	\N	Maîtrise	Trajectory
412	\N	Discrétion	Clandestine
413	\N	Nerfs d'acier	Steady Hand
414	\N	Attaque perfide	Status Crit
415	\N	Rage élémentaire	Elemental Crit
416	\N	Trompe-la-mort	Pro Dirty Fencer
417	\N	Invocation	Enlightened Blade
418	\N	Braconnier	Explosive Trapper
419	\N	Poing de fer	Heavy Hitter
420	\N	Purification	Benediction
\.


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 188
-- Name: ATHENA_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ATHENA_ID_seq"', 420, true);


--
-- TOC entry 2133 (class 0 OID 16626)
-- Dependencies: 181
-- Data for Name: CHARM; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "CHARM" ("ID", "RARITY", "SKILL1", "VALUE1", "SKILL2", "VALUE2", "SLOTS", "FAV") FROM stdin;
16	10	121	5	139	2	0	f
144	10	53	8	74	11	1	f
21	10	89	3	34	5	0	f
46	10	82	10	0	0	0	f
23	10	77	8	130	5	0	f
28	10	104	6	51	7	1	f
30	10	104	4	92	3	1	f
32	10	104	4	96	8	3	f
34	10	95	4	16	5	0	f
35	10	36	5	93	1	1	f
37	10	30	5	48	3	1	f
79	10	15	4	46	1	0	f
158	10	141	6	0	0	0	f
159	10	108	7	0	0	1	f
160	10	17	7	0	0	0	f
82	10	7	7	0	0	0	f
48	10	105	8	0	0	0	f
101	10	35	7	0	0	0	f
83	10	146	8	0	0	0	f
85	10	41	8	0	0	0	f
86	10	14	8	0	0	0	f
47	10	22	7	0	0	3	f
80	10	37	7	137	-1	3	f
81	10	12	2	67	7	0	f
132	10	51	6	136	1	2	f
84	10	116	7	91	4	0	f
42	10	37	8	98	12	0	f
87	10	122	6	111	1	3	f
88	10	122	6	21	7	0	f
89	10	122	5	11	12	0	f
145	10	53	6	68	10	0	f
163	10	94	6	116	8	0	f
164	10	117	5	135	10	0	f
102	10	6	6	0	0	1	f
117	10	83	9	0	0	0	f
139	10	74	8	0	0	3	f
146	10	72	7	0	0	0	f
151	10	64	6	0	0	0	f
152	10	65	7	0	0	0	f
153	10	62	8	0	0	0	f
154	10	63	5	0	0	0	f
155	10	68	7	0	0	0	f
156	10	66	7	0	0	0	f
171	10	92	5	0	0	2	f
180	10	128	5	0	0	3	f
187	10	48	6	0	0	3	f
206	10	49	5	0	0	3	f
209	10	144	8	0	0	0	f
217	10	38	9	0	0	0	f
222	10	137	6	0	0	2	f
38	10	30	4	96	8	0	f
238	10	45	5	0	0	1	f
244	10	56	5	0	0	1	f
245	10	29	4	0	0	1	f
246	10	29	3	0	0	2	f
92	10	127	6	144	10	0	f
93	10	127	6	83	12	0	f
94	10	96	7	5	-3	3	f
96	10	96	2	13	9	0	f
98	10	102	6	116	7	0	f
99	10	102	2	105	9	0	f
100	10	102	1	11	11	2	f
103	10	129	6	69	-1	1	f
104	10	129	4	72	12	0	f
105	10	129	2	88	12	0	f
106	10	143	6	122	7	1	f
107	10	143	5	16	5	1	f
108	10	143	5	50	6	3	f
110	10	145	6	47	1	3	f
111	10	145	6	124	5	1	f
112	10	145	6	53	12	1	f
114	10	145	3	104	5	2	f
115	10	20	6	14	2	3	f
116	10	20	5	124	3	3	f
118	10	135	8	63	6	0	f
119	10	135	4	63	10	0	f
121	10	130	8	138	-1	0	f
122	10	130	7	102	6	0	f
123	10	130	6	137	10	2	f
124	10	130	6	74	2	2	f
125	10	130	5	58	8	3	f
126	10	130	5	22	4	2	f
127	10	130	3	18	9	3	f
128	10	130	10	33	6	1	f
129	10	58	6	41	10	0	f
130	10	55	5	129	2	0	f
131	10	55	3	46	7	0	f
133	10	51	6	58	4	0	f
134	10	51	4	21	10	0	f
136	10	51	3	146	10	0	f
137	10	84	7	5	3	3	f
138	10	84	4	21	8	0	f
140	10	74	8	94	2	0	f
141	10	74	7	133	5	0	f
142	10	74	6	50	2	2	f
143	10	53	8	96	7	0	f
147	10	72	7	115	10	0	f
148	10	72	5	84	13	0	f
149	10	72	3	51	12	2	f
150	10	72	10	128	4	2	f
157	10	61	6	8	-6	0	f
165	10	117	5	74	11	0	f
166	10	117	4	93	13	0	f
167	10	107	6	47	6	1	f
168	10	16	4	144	9	0	f
169	10	16	3	19	4	2	f
172	10	92	3	72	12	0	f
173	10	92	2	60	10	0	f
175	10	69	8	102	9	0	f
176	10	69	4	67	7	0	f
177	10	34	6	48	3	0	f
178	10	34	4	146	12	0	f
183	10	57	6	102	1	2	f
184	10	136	6	116	7	0	f
170	10	25	5	0	0	3	t
41	10	37	8	95	2	1	t
182	10	57	8	21	7	0	t
174	10	69	8	103	6	0	t
161	10	94	8	0	0	3	t
162	10	94	7	59	9	0	t
95	10	96	5	103	10	0	t
91	10	97	10	0	0	0	t
97	10	102	7	135	12	2	t
26	10	104	8	20	6	0	t
208	10	110	5	0	0	2	t
90	10	122	1	5	8	3	t
179	10	128	8	119	1	0	t
181	10	128	2	50	12	3	t
120	10	135	1	38	10	1	t
109	10	145	7	0	0	3	t
186	10	136	6	0	0	1	f
113	10	145	4	24	10	0	t
226	10	33	7	0	0	1	f
188	10	136	3	57	3	2	f
192	10	3	6	146	6	3	f
193	10	3	4	84	12	0	f
194	10	3	4	125	7	0	f
195	10	3	4	11	12	0	f
197	10	119	8	102	10	0	f
198	10	119	7	53	12	0	f
200	10	111	4	21	9	0	f
201	10	111	1	32	9	0	f
203	10	81	6	94	3	0	f
204	10	81	3	96	9	1	f
210	10	144	2	14	10	0	f
211	10	144	2	108	8	2	f
212	10	59	6	102	4	0	f
213	10	27	5	128	4	0	f
214	10	27	2	135	11	0	f
215	10	47	5	69	-1	0	f
216	10	47	4	128	4	0	f
218	10	73	5	72	9	0	f
219	10	73	5	51	7	0	f
221	10	73	3	102	8	3	f
223	10	137	3	56	7	1	f
225	10	137	3	84	10	0	f
227	10	42	5	57	3	0	f
228	10	42	5	36	5	0	f
229	10	42	3	96	8	0	f
230	10	42	3	111	4	2	f
232	10	124	6	138	2	3	f
233	10	124	5	93	12	0	f
234	10	139	5	146	13	0	f
235	10	80	6	102	10	0	f
236	10	80	6	18	7	0	f
237	10	125	4	98	4	3	f
239	10	45	4	30	6	0	f
241	10	19	4	51	9	0	f
242	10	19	2	18	13	2	f
243	10	56	5	116	8	0	f
248	10	120	4	34	4	1	f
250	10	4	2	79	1	1	f
247	10	43	5	130	5	2	f
256	1	3	6	111	4	0	f
261	10	10	4	11	13	0	f
262	10	138	5	42	-1	3	f
240	10	19	4	16	7	1	t
231	10	42	3	127	10	1	t
205	10	49	6	59	7	0	t
135	10	51	3	5	8	1	t
263	10	77	5	118	10	0	t
202	10	81	6	50	2	1	t
207	10	110	6	44	-3	1	t
199	10	111	8	72	8	1	t
196	10	119	8	20	6	0	t
249	10	120	1	21	12	2	t
185	10	136	6	125	7	0	t
224	10	137	3	33	7	1	t
258	10	3	8	\N	0	0	f
189	10	3	8	50	3	2	f
264	10	128	8	28	4	0	f
265	10	57	5	56	7	0	f
266	10	33	7	60	-7	3	f
267	10	59	6	93	7	0	f
268	10	29	4	144	5	3	f
269	10	136	4	127	10	0	f
270	10	110	3	33	6	0	f
271	10	4	3	55	1	3	f
\.


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 182
-- Name: CHARM_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"CHARM_ID_seq"', 271, true);


--
-- TOC entry 2137 (class 0 OID 16657)
-- Dependencies: 185
-- Data for Name: LINE; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "LINE" ("ID", "SKILL", "NAME", "DESCRIPTION") FROM stdin;
2	3	Affliction +2 (+15)	Multiplie par 1,225 les attaques avec les statuts Poison Poison, Paralysie Paralysie, Sommeil Sommeil et Tranquilisant.
76	44	Défense +4 (+25)	Augmente massivement la défense.
112	57	Esquive + (+10)	Augmente la distance d'évasion de 50%.
171	85	Grenaille NV1 (+10)	Vous pouvez utiliser la grenaille de NV1.
3	3	Affliction +1 (+10)	Multiplie par 1,125 les attaques avec les statuts Poison Poison, Paralysie Paralysie, Sommeil Sommeil et Tranquilisant.
4	3	Affliction - (-10)	Multiplie par 0,9 les attaques avec les statuts Poison Poison, Paralysie Paralysie, Sommeil Sommeil et Tranquilisant.
5	4	Acrobate (+10)	Ralentit la diminution de stamina en cas de blocage, d'évasion ou d'esquive.Prolonge l'invincibilité en cas d'évasion.
6	5	Aiguisage rapide (+10)	Vous aiguisez votre arme plus vite.
7	5	Aiguisage lent (-10)	Vous aiguisez votre arme moins vite.
8	6	Archimage (+10)	Garantit des résultats maximaux avec les combinaisons qui créent plusieurs objets en même temps.
9	7	Anti-boue/neige (+10)	Empêche d'être couvert de neige ou de boue.
10	8	Expert antiblind. (+15)	Vous pouvez utiliser tous les niveaux d'antiblindage.
11	8	Antiblindage NV1 (+10)	Vous pouvez utiliser l'antiblindage de NV1.
12	9	Fluide (+10)	Annule les effets incapacitants des statuts Cocon et Goudron.
13	10	Antivirus (+10)	Réduit les risques d'attraper la furie et améliore les avantages reçus une fois la furie vaincue.Increases the chance of curing the Frenzy Virus, and gains 30% increase in affinity instead of 15% upon curing.
14	11	Glace +20 (+15)	Augmente la résistance au Status Glace de 20, immunise contre le Fléau-Glace et le Fléau-Glace sévère.
15	11	Glace +15 (+10)	Augmente la résistance au Status Glace de 15, immunise contre le Fléau-Glace.
16	11	Glace -20 (-10)	Diminue la résistance au Status Glace de 20 et change le Fléau-Glace en Fléau-Glace sévère.
17	12	Anti-séisme (+10)	Empêche de vaciller à cause des secousses créées par les grands monstres.
18	13	Antivol (+10)	Empêche le vol d'objets.
19	14	Spartiate (+15)	La jauge de stamina ne diminue plus avec la faim.
20	14	Ascète (+10)	La jauge de stamina diminue deux fois moins rapidement avec la faim.
21	14	Glouton (-10)	La jauge de stamina diminue plus vite avec la faim.
22	14	Gargantua (-15)	La jauge de stamina diminue deux fois plus vite avec la faim.
23	15	Invocation (+10)	Débloque les éléments latents des armes et renforce les attaques élémentaires et à statut anormal.Same effects as Awaken, Element Atk Up, and Status Atk +1.
24	16	Munitions + (+10)	Augm.capacité des mun.fusarbalètes et lancecanons, fioles volto-haches et attaques chargées des arcs.
25	17	Peau d'acier (+10)	Annule les effets de Défense -.
26	18	Artilleur champion (+20)	Augm.grandement la puissance de : baliste, canon, lnccanon, feu wyv., mn antibl.et fioles v.-hch impact.
27	18	Artilleur expert (+15)	Augmente la puissance de : baliste, canon, lancecanon, feu wyverne, mn antibl.et fioles v.-hch impact.
28	18	Artilleur novice (+10)	Augm.légèrement la puissance de : baliste, canon, lnccanon, feu wyv., mn antibl.et fioles v.-hch impact.
29	19	Tranchant +1 (+10)	Augmente le tranchant de votre arme.
30	20	Athlète +2 (+15)	En cas d'évasion et de blocage, la perte de stamina est réduite de moitié.Permet d'esquiver dans toutes directions.
31	20	Athlète +1 (+10)	En cas d'évasion et de blocage, la perte de stamina est réduite de 25%.Permet d'esquiver dans toutes les directions.
32	20	Athlète -1 (-10)	En cas d'évasion et de blocage, la perte de stamina est augmentée de 20%.
33	20	Athlète -2 (-15)	En cas d'évasion et de blocage, la perte de stamina est augmentée de 35%.
34	21	Attaque +4 (+25)	Augmente de 25 la vraie attaque.
35	21	Attaque +3 (+20)	Augmente de 20 la vraie attaque.
36	21	Attaque +2 (+15)	Augmente de 15 la vraie attaque.
37	21	Attaque +1 (+10)	Augmente de 10 la vraie attaque.
38	21	Attaque -1 (-10)	Diminue de 5 la vraie attaque.
39	21	Attaque -2 (-15)	Diminue de 10 la vraie attaque.
40	21	Attaque -3 (-20)	Diminue de 15 la vraie attaque.
41	22	Aura de feu (+10)	Réaction des monstres comme si vous portiez une torche, même si ce n'est pas le cas.
42	23	Maître bio (+15)	Augmente l'efficacité des Bombes de Bouse.Empêche le blocage des objets et le Fléau-Poisse Fléau-Poisse.Retarde la furie.
43	23	Chercheur bio (+10)	Augmente l'efficacité des Bombes de Bouse.Empêche le blocage des objets et le Fléau-Poisse Fléau-Poisse.
44	24	Bombardier (+10)	Augmente de 30% les dégâts des bombes et passe à 100% les chances de combinaison des bombes.Augmente le Fléau-Poisse Fléau-Poisse de 20% (25% avec l'effet Felyne Pyro cooking).
45	25	Bravoure (+10)	Évite un évanouissement quand vous subissez un coup fatal et qu'il vous reste au moins 64 de vie.
46	26	Sans pitié (+10)	Augmente les dégâts des attaques lancées contre les points faibles des ennemis et l'affinité de 15%.Effets cumulés des talents Point faible et Œil critique +2.
270	144	Vie +50 (+15)	Augmente de 50 la vie maximale.
47	27	Roi capture (+20)	Vous recevez toujours le maximum de récompenses de capture.
48	27	Expert capture (+15)	Augmente beaucoup la probabilité d'obtenir plus de récompenses pour les captures.Augmente le nombre de récompenses de capture de 2 ou 3 à 3 ou 4.
49	27	Maître capture (+10)	Augmente la probabilité d'obtenir plus de récompenses pour les captures.Augmente le nombre de récompenses de capture de 2 ou 3 à 3.
50	28	Cannibale (+10)	La Viande Crue devient consommable, +50 points d'endurance.Les Steaks Saignants et à Point rendent l'endurance illimimitée pour une minute.
51	29	Réveil (+10)	Libère les propriétés élémentaires latentes dans certaines armes n'ayant pas d'élément.
52	30	Rage élémentaire (+10)	Accroît les dégâts élémentaires (Status Feu, Status Eau, Status Foudre, Status Glace, Status Dragon) des coups critiques.
53	31	Chaleur + (+10)	Annule les dégâts infligés par la chaleur et la lave.
54	31	Chaleur - (-10)	Augmente les dégâts infligés par la chaleur et la lave.
55	32	Chapardeur (+10)	Augmente la vitesse de dépeçage, collecte, ramassage d'insectes et minage.
56	33	Traque-charme (+20)	Permet d'extraire deux charmes en même temps, 50% de chance que cela arrive.
57	33	Chasse-charme (+15)	Permet d'extraire deux charmes en même temps, 30% de chance que cela arrive.
58	33	Collecte-charme (+10)	Permet d'extraire deux charmes en même temps, 20% de chance que cela arrive.
59	34	Concentration (+10)	Accélère de 20% le chargement des jauges épées longues, morpho-haches, doubles lames, grande épée, marteau, volto-haches et arc.
60	34	Distraction (-10)	Ralentit de 20% le charment des jauges jauges épées longues, morpho-haches, doubles lames, grande épée, marteau, volto-haches et arc.
61	35	Art de la chasse (+10)	Améliore les résultats de pêche et de cuisine durant les quêtes et affiche toujours la carte.
62	36	Attaque Perfide (+10)	Accroît la puissance des attaques à statut anormal (Sommeil Sommeil, Poison Poison, Paralysie Paralysie, Poisse Poisse) des coups critiques.
63	37	Dieu du rodéo (+15)	Chevaucher un monstre et le renverser devient beaucoup plus facile.
64	37	Maitre cavalier (+10)	Chevaucher un monstre et le renverser devient plus facile.
65	37	Lourdaud (-10)	Chevaucher un monstre et le renverser devient plus difficile.
66	38	Collecteur expert (+20)	Augmente très souvent le nombre d'utilisations des points de collecte.
67	38	Collecte +2 (+15)	Augmente souvent le nombre d'utilisations des points de collecte.
68	38	Collecte +1 (+10)	Augmente parfois le nombre d'utilisations des points de collecte.
69	38	Collecte -1 (-10)	Réduit parfois le nombre d'utilisations des points de collecte.
70	39	Héros camarade (+10)	Vous pouvez rappeler vos camarades et ils ont plus d'attaque, de défense et recouvre plus vite leur stamina.Effets cumulés de Bonheur camarade et Esprit camarade.
71	40	Stabilisation (+10)	Permet de récupérer plus vite des attaques qui gênent les déplacements.Effets cumulés de Vent +1, Protège-tympan et knockdown.
72	41	Transporteur (+10)	Augmente la vitesse lors du transport d'objets lourds et réduit le risque qu'ils tombent.
73	42	Challenger +2 (+15)	Augmente de 25 la Vraie attaque et l'affinité de 20% si un grand monstre dans la même zone s'énerve.
74	42	Challenger +1 (+10)	Augmente de 10 la Vraie attaque et l'affinité de 10% si un grand monstre dans la même zone s'énerve.
75	43	Flibustier (+10)	Augmente la probabilité d'obtenir plus de récompenses pour les quêtes et les captures.Effets cumulés des talents Bonne fortune et Expert capture
77	44	Défense +3 (+20)	Augmente grandement la défense.
78	44	Défense +2 (+15)	Augmente la défense.
79	44	Défense +1 (+10)	Augmente de 15 la défense.
80	44	Défense -1 (-10)	Diminue de 10 la défense.
81	44	Défense -2 (-15)	Diminue la défense.
82	44	Défense -3 (-20)	Diminue grandement la défense.
83	45	Dégainage éclair (+10)	L'affinité est augmentée de 100% lorsque vous attaquez en dégainant.
84	46	Roi dépeceur (+20)	Augmente de 1 ou 2 le nombre de dépeçage et empêche d'être renversé en dépeçant.
85	46	Savant dépeceur (+15)	Augmente d'un le nombre de dépeçage et empêche d'être touché en dépeçant.
86	46	Expert dépeceur (+10)	Empêche de tomber à la renverse à cause des attaques lorsque vous dépecez.
87	47	Grande fortune (+20)	Le nombre d'objets reçu en récompense à la fin d'une quête est toujours maximum.
88	47	Bonne fortune (+15)	Augmente souvent le nombre de récompenses reçues à la fin d'une quête.
89	47	Chance (+10)	Augmente parfois le nombre de récompenses reçues à la fin d'une quête.La probabilité normale est 22/32 et elle passe à 26/32.
90	47	Malchance (-10)	Réduit parfois le nombre de récompenses reçues à la fin d'une quête.La probabilité normale est 22/32 et elle diminue à 16/32.
91	47	Mauvaise fortune (-15)	Réduit souvent le nombre de récompenses reçues à la fin d'une quête.La chance d'en recevoir passe de 22/32 à 8/32.
92	48	Destructeur (+10)	Vous brisez ou coupez plus facilement les parties faibles des grands monstres (30% plus vite pour briser).
93	49	Samouraï (+10)	Votre arme perd de son tranchant deux fois moins vite.
94	49	Barbare (-10)	Votre arme perd de son tranchant deux fois plus vite.
95	50	Dragon +20 (+15)	Augmente la résistance à l'élément Status Dragon de 20, annule les statuts Fléau-Dragon Fléau-Dragon et Fléau-Dragon Fléau-Dragon sévère.
96	50	Dragon +15 (+10)	Augmente la résistance à l'élément Status Dragon de 15, annule le statut Fléau-Dragon Fléau-Dragon.
97	50	Dragon -20 (-10)	Diminue la résistance à l'élément Status Dragon de 20, convertie le statut Fléau-Dragon Fléau-Dragon en Fléau-Dragon Fléau-Dragon sévère.
98	51	Attaque Dragon +3 (+20)	La puissance des attaques de Status Dragon et munitions anti-dragon est multipliée par 1,15; plus 90.
99	51	Attaque Dragon +2 (+15)	La puissance des attaques de Status Dragon et munitions anti-dragon est multipliée par 1,1; plus 60.
100	51	Attaque Dragon +1 (+10)	La puissance des attaques de Status Dragon et munitions anti-dragon est multipliée par 1,05; plus 40.
101	51	Attaque Dragon - (-10)	La puissance des attaques de Status Dragon et munitions anti-dragon est multipliée par 0,75.
102	52	Élémentalité (+10)	Augmente la puissance des attaques élémentaires et la durée d'effet de certains objets.Effets cumulés des talents Élémentaire + et Habile.
103	53	Attaque Eau +3 (+20)	La puissance des attaques d'Status Eau et les Munitions aquatiques voient leurs puissance multipliées par 1,15; le tout plus 90.
104	53	Attaque Eau +2 (+15)	La puissance des attaques d'Status Eau et les Munitions aquatiques voient leurs puissance multipliées par 1,1; le tout plus 60.
105	53	Attaque Eau +1 (+10)	La puissance des attaques d'Status Eau et les Munitions aquatiques voient leurs puissance multipliées par 1,05; le tout plus 40.
260	139	Recul +2 (+15)	Réduit le recul du fusarbalète.
106	53	Attaque Eau -1 (-10)	La puissance des attaques d'Status Eau et les Munitions aquatiques voient leurs puissance multipliées par 0,75; baisse l'attaque avec l'Status Eau.
107	54	Rempart (+10)	Vous pouvez maintenant bloquer les attaques imparables.Accélère la récupération de stamina.Effets cumulés de Paladin et Vigueur +.
108	55	Élémentaire + (+10)	Augmente la puissance des attaques élémentaires (attaques Status Feu, Status Eau, Status Foudre, Status Dragon, et Status Glace multipliées par 1,1)
109	55	Élémentaire - (-10)	Réduit la puissance des attaques élémentairesattaques Status Feu, Status Eau, Status Foudre, Status Dragon, et Status Glace multipliées par 0,9).
110	56	Œil de l'esprit (+10)	Empêche vos attaques d'être détournées.
111	56	Œil aveugle (-10)	Vos attaques sont détournées plus facilement.
113	58	Eau +20 (+15)	Augmente la résistance à l'Status Eau de 20, annule le Fléau-Eau Fléau-Eau et le Fléau-Eau sévère Fléau-Eau sévère.
114	58	Eau +15 (+10)	Augmente la résistance à l'Status Eau de 15, annule le Fléau-Eau Fléau-Eau.
115	58	Eau -20 (-10)	Diminue la résistance à l'Status Eau de 20, transforme le Fléau-Eau Fléau-Eau en Fléau-Eau sévère Fléau-Eau sévère.
116	59	Évasion +3 (+20)	Prolonge grandement la durée d'invincibilité en cas d'évasion (la durée passe de 0,2 secondes à 0,6).
117	59	Évasion +2 (+15)	Prolonge la durée d'invincibilité en cas d'évasion (la durée passe de 0,2 secondes à 0,4).
118	59	Évasion +1 (+10)	Prolonge légèrement la durée d'invincibilité en cas d'évasion (la durée passe de 0,2 secondes à 0,33).
119	59	Évasion -1 (-10)	Diminue la durée d'invincibilité en cas d'évasion.
120	60	Vision critique (+30)	Augmente l'affinité de 30%.
121	60	Œil critique +3 (+20)	Augmente l'affinité de 20%.
122	60	Œil critique +2 (+15)	Augmente l'affinité de 15%.
123	60	Œil critique +1 (+10)	Augmente l'affinité de 10%.
124	60	Œil critique -1 (-10)	Diminue l'affinité de 5%.
125	60	Œil critique -2 (-15)	Diminue l'affinité de 10%.
126	60	Œil critique -3 (-20)	Diminue l'affinité de 15%.
127	61	Explosion + (+10)	Vous pouvez utiliser les munitions explosives.
128	62	Fiole combat + (+10)	Vous pouvez utiliser les fioles de combat avec votre arc.
129	63	Fiole force + (+10)	Vous pouvez utiliser les fioles de force avec votre arc.
130	64	Fiole explosion + (+10)	Vous pouvez utiliser les fioles explosives avec votre arc.
131	65	Fiole faiblesse + (+10)	Vous pouvez utiliser les fioles de faiblesse avec votre arc.
132	66	Fiole paralys.+ (+10)	Vous pouvez utiliser les fioles de paralysie avec votre arc.
133	67	Fiole poison + (+10)	Vous pouvez utiliser les fioles de poison avec votre arc.
134	68	Fiole sommeil + (+10)	Vous pouvez utiliser les fioles de sommeil avec votre arc.
135	69	Vol de stamina (+10)	Augmente votre capacité à épuiser les monstres.
136	70	Balle d'argent (+10)	Augmente la puissance des munitions normales/perçantes/grenailles, flèche rapide/perçant/dispersée.Effets cumulés de Normal/Rapid Up, Pierce/Pierce Up, and Pellet/Spread Up.
137	71	Soif de sang (+10)	Accélère les att.chargées/à jauge.Viande crue consommable.Steaks : stamina momentanément illimitée.
138	72	Attaque Feu +3 (+20)	Augmente massivement la puissance des attaques de feu et munitions de feu.
139	72	Attaque Feu +2 (+15)	Augmente beaucoup la puissance des attaques de feu et munitions de feu.
140	72	Attaque Feu +1 (+10)	Augmente la puissance des attaques de feu et munitions de feu.
141	72	Attaque Feu - (-10)	Diminue la puissance des attaques de feu et munitions de feu.
142	73	Anti-fléau (+10)	Annule tous les fléaux élémentaires (Fléau-Feu Fléau-Feu, Fléau-Eau Fléau-Eau, Fléau-Foudre Fléau-Foudre, Fléau-Glace Fléau-Glace, et Fléau-Dragon / Fléau-Dragon sévère Fléau-Dragon, (fléaux sévères?) ).
143	74	Attaque Foudre +3 (+20)	Augmente massivement la puissance des attaques de foudre et munitions de foudre.
144	74	Attaque Foudre +2 (+15)	Augmente beaucoup la puissance des attaques de foudre et munitions de foudre.
145	74	Attaque Foudre +1 (+10)	Augmente la puissance des attaques de foudre et munitions de foudre.
146	74	Attaque Foudre - (-10)	Diminue la puissance des attaques de foudre et munitions de foudre.
147	75	Expert frag (+15)	Vous pouvez utiliser tous les niveaux de fragmentation.
148	75	Frag NV 1 (+10)	Vous pouvez utiliser la fragmentation de NV1.
149	76	Froid + (+10)	Annule les dégâts subis par le froid.
150	76	Froid - (-10)	La jauge de stamina diminue plus vite à cause du froid.
151	77	Satisfaction (+10)	Permet occasionnellement de réutiliser des objets après les avoir mangés ou bus.
152	78	Courroucé (+10)	Vie élevée : Effet Bravoure.Vie basse : Augmente l'attaque et la défense.Effets cumulés de Bravoure et Adrénaline +2.
153	79	Discrétion (+10)	Capacité de munitions, taux de réussite des combinaisons et probabilité de ne pas être ciblé accrus.Effets cumulés de Load Up, Combination +20%, and Sneak.
154	80	Rechargement +3 (+20)	Accélère grandement le rechargement du fusarbalète et charge auto.les fioles.
155	80	Rechargement +2 (+15)	Accélère le rechargement du fusarbalète et charge automatiquement les fioles.
156	80	Rechargement +1 (+10)	Accélère légèrement le rechargement du fusarbalète et le chargement des fioles.
157	80	Rechargement -1 (-10)	Ralentit légèrement le rechargement du fusarbalète et le chargement des fioles.
158	80	Rechargement -2 (-15)	Ralentit le rechargement du fusarbalète et le chargement des fioles.
159	80	Rechargement -3 (-20)	Ralentit beaucoup le rechargement du fusarbalète et le chargement des fioles.
160	81	Garde +2 (+15)	Augmente grandement la probabilité de rester debout en bloquant une attaque.Decreases knockback and stamina loss when blocking, as well as reducing the damage you receive while blocking by 20.
261	139	Recul +1 (+10)	Réduit légèrement le recul du fusarbalète.
161	81	Garde +1 (+10)	Augmente la probabilité de rester debout en bloquant une attaque.Decreases knockback and stamina loss when blocking, as well as reducing the damage you receive while blocking by 10.
162	81	Garde -1 (-10)	Réduit la probabilité de rester debout en bloquant une attaque.Increases knockback and stamina loss when blocking, as well as increasing the damage you receive while blocking by 10.
163	82	Garde auto (+10)	Bloque automatiquement les attaques (quand le blocage est possible et l'arme dégainée).
164	83	Goinfre (+15)	Tous les objets que vous mangez ou buvez augmentent la jauge de stamina.33% chance of extra effect from increase-Stamina items.Health recovery items sometimes increase Stamina.
165	83	Gourmet (+10)	Les viandes qui augmentent la jauge de stamina sont plus efficaces.25% chance of extra effect from increase-Stamina items.
166	84	Attaque Glace +3 (+20)	Augmente massivement la puissance des attaques de Status Glace et munitions de glace.
167	84	Attaque Glace +2 (+15)	Augmente beaucoup la puissance des attaques de Status Glace et munitions de glace.
168	84	Attaque Glace +1 (+10)	Augmente la puissance des attaques de Status Glace et munitions de glace.
169	84	Attaque Glace - (-10)	Diminue la puissance des attaques de Status Glace et munitions de glace.
170	85	Expert grenaille (+15)	Vous pouvez utiliser tous les niveaux de grenaille.
172	86	Compression (+10)	Empêche le saignement.
173	86	Effusion (-10)	Double les dégâts infligés (la durée?) par le saignement.
174	87	Iai-jutsu (+10)	Permet d'étourdir des monstres en dégainant une lame et de rengainer plus vite, etc.Effets cumulés de Punishing Draw and Quick Sheath.
175	88	Feu +20 (+15)	Augmente la résistance au Status Feu de 20, annule le Fléau-Feu Fléau-Feu et le Fléau-Feu sévère Fléau-Feu sévère.
176	88	Feu +15 (+10)	Augmente la résistance au Status Feu de 15, annule le Fléau-Feu Fléau-Feu.
177	88	Feu -20 (-10)	Diminue la résistance au Status Feu de 20, convertie le Fléau-Feu Fléau-Feu en Fléau-Feu sévère Fléau-Feu sévère.
178	89	Nerfs d'acier (+10)	Empêche les attaques d'être déviées et réduit de moitié la baisse de tranchant.Effets cumulés de Mind's Eye and Razor Sharp.
179	90	Braconnier (+10)	Dégâts des bombes/expl., vitesse de pose des bombes/pièges et taux de réussite des combin.accrus.pour certains objets.Effets cumulés de Bombardier and Trap Master.
180	91	Combinaison +45% (+15)	Les chances de succès lorsque vous combinez des objets sont augmentées de 45%.
181	91	Combinaison +20% (+10)	Les chances de succès lorsque vous combinez des objets sont augmentées de 20%.
182	91	Combinaison -10% (-10)	Les chances de succès lorsque vous combinez des objets sont réduites de 10%.
183	91	Combinaison -20% (-15)	Les chances de succès lorsque vous combinez des objets sont réduites de 20%.
184	92	Perfection (+10)	Augmente l'attaque quand votre jauge de vie est pleine (vraie attaque +20).
185	93	Foudre +20 (+15)	Augmente la résistance au Status Foudre de 20, annule le Fléau-Foudre Fléau-Foudre et le Fléau-Foudre sévère Fléau-Foudre sévère.
186	93	Foudre +15 (+10)	Augmente la résistance au Status Foudre de 15, annule le Fléau-Foudre Fléau-Foudre.
187	93	Foudre -20 (-10)	Diminue la résistance au Status Foudre de 20, convertie le Fléau-Foudre Fléau-Foudre en Fléau-Foudre sévère Fléau-Foudre sévère.
188	94	Roi du KO (+10)	Augmente la probabilité d'étourdir les monstres.Increases blunt attack's stun value by 10% (applies to all blunt attacks, except the Insect Glaive's insect attack).
189	95	Maîtrise (+10)	Prolonge la période d'utilisation à puissance maximale de certaines munitions et flèches.
190	96	Bonheur camarade (+10)	L'émote "Victoire !" (le signalement?) rappelle les camarades en cas d'évanouissement ou de récupération une fois toute les dix minutes.
191	97	Lubie divine (+15)	Réduit beaucoup la probabilité que les pioches, filinsectes, boomerangs et cornes cassent.
192	97	Lubie esprit (+10)	Réduit la probabilité que les pioches, filinsectes, boomerangs et cornes cassent.
193	97	Lubie du spectre (-10)	Augmente la probabilité que les pioches, filinsectes, boomerangs et cornes cassent.
194	97	Lubie du démon (-15)	Augmente beaucoup la probabilité que les pioches, filinsectes, boomerangs et cornes cassent.
195	98	Psychique (+15)	Affiche toujours les grands monstres sur la carte, comme s'ils étaient marqués.
196	98	Détection (+10)	Augmente les infos affichées sur la carte quand de grands monstres sont marqués.Vous avez 2 chances sur 3 que les grands monstres s'affichent sur la carte chaque 5 minutes, vous obtenez plus d'informations en les touchant avec un Marqueur.
197	99	Poing de fer (+10)	Augmente l'efficacité des attaques qui épuisent et étourdissent les monstres.Effets cumulés des talents Roi du KO et Vol de stamina.
198	100	Chasseur de miel (+10)	Vous permet de collecter deux doses de Miel en même temps.
199	101	Franc-tireur (+10)	Donne 1 tir supplémentaire lorsque vous tirez en rafale.
200	102	Esprit camarade (+10)	Augmente l'attaque et la défense et le recouvrement d'endurance des camarades.
201	103	Maestro (+10)	Rend les cornes et flûtes moins cassables et augmente la durée d'effet de une minute des Cornes de chasse.
202	104	Mycophile (+10)	Permet la consommation de champignons afin d'en tirer certains bénéfices.Les Champignon Bleu donnent Potion, Champinitro donne Potion du démon, Champaralysie Armorskin, Champi Vénéneux Nutriments, Mopeshroom = Dash Juice, Champi Dragon Potion secrète, Champi Parfait Potion Ancestrale.
203	105	Furtivité (+10)	Réduit la probabilité d'être repéré par les monstres.
204	105	Provocation (-10)	Augmente la probabilité d'être repéré par les monstres.
205	106	Expert munition (+10)	Vous pouvez utiliser tous les niveaux de munition normale.
206	107	Normale/Rapide + (+10)	Augmente la puissance des munitions normales (Mn Normales) et des flèches rapides.
207	108	Habile (+10)	Augmente de 50% la durée d'effet des herbes, des boissons, des graines et pilules.
208	108	Maladroit (-10)	Réduit de 33% la durée d'effet des herbes, des boissons, des graines et pilules.
209	109	Gros ventre (+10)	Consommez des champignons ou de la viande (même Crue) pour en tirer des bénéfices, vous mangez plus vite.Effets cumulés des talents Cannibale, Carnassier +2 et Mycophile
210	110	Bouche-oreilles (+15)	Annule les effets des rugissements de tous les grands monstres.
211	110	Protège-tympan (+10)	Annule les effets des rugissements de certains grands monstres.
212	111	Paladin (+10)	Vous pouvez maintenant bloquer les attaques imparables.
213	112	Anti-paralysie (+10)	Empêche la Paralysie Paralysie.
214	112	Super paralysie (-10)	Double la durée de la Paralysie Paralysie.
215	113	Expert perçant (+15)	Vous pouvez utiliser tous les niveaux de balle perçante.
216	113	Perçant NV1 (+10)	Vous pouvez utiliser les balles perçantes de NV1.
217	114	Perçante/Perç.+ (+10)	Augmente la puissance de 10% des munitions perçantes (Mn Perçantes) et des flèches perçantes.
218	115	Gourou (+10)	Indique quand un grand monstre marqué peut être capturé (en clignotant).
219	116	Maître piégeur (+10)	Vous combinez les pièges à 100%, et vous posez les pièges et les bombes plus rapidement.
220	117	Plomb/Dispers.+ (+10)	Augmente la puissance des munitions de plomb (Mn Plomb) et des flèches dispersées.
221	118	Antidote (+10)	Empêche d'être empoisonné (vous n'êtes plus affecté par le satut Poison Poison).
222	118	Venin (-10)	Double les dégâts infligés par le Poison Poison.
223	119	Adrénaline +2 (+15)	Augmente grandement l'attaque et la défense quand la vie est inférieure à 40% du maximum.Bonus de 45 en défense et plus 30% de dommages bruts.
224	119	Adrénaline +1 (+10)	Augmente la défense de 40 quand la vie est inférieure à 40% du maximum.
225	119	Inquiétude (-10)	Réduit la défense de 21 et les dommages bruts de 30% quand la vie est inférieure à 40% du maximum.
226	120	Mur d'acier (+10)	Augmente la défense et annule les effets de Défense Basse Défense Basse.Effets cumulés des talents Peau d'acier et Défense +3.
227	121	Purification (+10)	Augmente l'efficacité des objets de récupération de vie et réduit parfois les dégâts subis.
228	122	Bénédiction (+10)	Vous avez 25% de chance de voir vos dégâts réduits de 30%.
229	122	Malédiction (-10)	Vous avez 25% de chance de voir vos dégâts agmentés de 30%.
230	123	Pieds légers (+10)	Augmente la distance d'évasion, mais aussi l'attaque quand votre jauge de vie est pleine.Effets cumulés des talents
231	124	Force latente +2 (+15)	Après avoir combattu cinq minutes un grand monstre, ou avoir reçu plus de 180 dégâts, vous obtenez plus 50% d'affinité et la diminution de l'endurance diminue de 70% pendant une minute et trente secondes.
232	124	Force latente +1 (+10)	Après avoir combattu cinq minutes un grand monstre, ou avoir reçu plus de 180 dégâts, vous obtenez plus 30% d'affinité et la diminution de l'endurance diminue de 50% pendant une minute et trente secondes.
233	125	Batto-jutsu (+10)	Étourdit et épuise les monstres quand vous le frappez en dégainant une lame et augmente la vraie attaque de 5.
234	126	Bien-être (+10)	Annule le Poison Poison, la Paralysie Paralysie, le Sommeil Sommeil et l'Etourdissement Etourdissement.
235	127	Récupération +2 (+15)	Récupération bien plus rapide des dégâts temporaires (zone rouge de la jauge de vie).
236	127	Récupération +1 (+10)	Récupération plus rapide des dégâts temporaires (zone rouge de la jauge de vie).
237	127	Récupération -1 (-10)	Récupération moins rapide des dégâts temporaires (zone rouge de la jauge de vie).
238	127	Récupération -2 (-15)	Récupération bien moins rapide des dégâts temporaires (zone rouge de la jauge de vie).
239	128	Lame éclair (+10)	Augmente la vitesse de rengainage des armes.
240	129	Carnassier +2 (+15)	Augmente la vitesse de consommation de viande et d'objets.
241	129	Carnassier +1 (+10)	Augmente la vitesse de consommation de viande.
242	129	Végétarien (-10)	Réduit la vitesse de consommation de viande.
243	130	Restauration + (+10)	Augmente l'efficacité des objets permettant de récupérer de la vie, qui donnent désormais 25 vie en plus.
244	130	Restauration - (-10)	Réduit l'efficacité des objets permettant de récupérer de la vie, qui voient leur efficacité réduite de 25 en vie.
245	131	Katana (+10)	Augmente beaucoup l'attaque et augmente le tranchant de votre arme.Effets cumulés de Attaque +3 et Tranchant +1
246	132	Sniper +2 (+15)	Réduit la déviation du projectile au moment du tir de deux niveaux.
247	132	Sniper +1 (+10)	Réduit la déviation du projectile au moment du tir de un niveau.
248	132	Sniper -1 (-10)	Augmente la déviation du projectile au moment du tir de un niveau.
249	132	Sniper -2 (-15)	Augmente grandement la déviation du projectile au moment du tir de deux niveau.
250	133	Noctambule (+10)	Empêche le sommeil.
251	133	Hypersomnie (-10)	Double la durée du sommeil.
252	134	Trompe-la-mort (+10)	Votre jauge d'endurance diminue deux fois moins vite, vous épuisez plus vite les monstres, et vous êtes plus fort après chaque évanouissement.Effets cumulés de Marathonien, Vol de stamina et Ténacité.
253	135	Soutien +2 (+15)	Transfère les effets des Herbes, des Potions, des Antidotes, des Graines Armure, des Graines Pouvoir et des Baies-soin aux amis dans la même zone.
254	135	Soutien +1 (+10)	Transfère la moitié des effets des Herbes, des Potions, des Antidotes, des Graines Armure, des Graines Pouvoir et des Baies-soin aux amis dans la même zone.
255	136	Marathonien (+10)	La stamina diminue moins vite durant les actions utilisant progressivement de la stamina (diminution divisée par deux).
256	136	Sprinter (-10)	La stamina diminue plus vite durant les actions utilisant progressivement de la stamina (perte de stamina doublée).
257	137	Point faible (+10)	Augmente les dégâts de 5% quand vous frappez des parties du corps où vos attaques sont très efficaces (efficacité brute de 45 ou plus).
258	138	Ténacité (+10)	Augmente l'attaque et la défense chaque fois que vous tombez au combat.Multiplie l'attaque par 1,1 et défense +15% après le premier évanouissement.Attaque fois 1,2 et défense +30% après le deuxième.
259	139	Recul +3 (+20)	Réduit grandement le recul du fusarbalète.
262	139	Recul -1 (-10)	Augmente légèrement le recul du fusarbalète.
263	139	Recul -2 (-15)	Augmente le recul du fusarbalète.
264	139	Recul -3 (-20)	Augmente grandement le recul du fusarbalète.
265	140	Torse + (+1)	Double les points de talent du torse (armure)
266	141	Tranchant + (+10)	Vous pouvez utiliser les munitions tranchantes.
267	142	Collectionneur (+10)	Augm.le nb d'obj.ramassés aux pts de collecte.Permet d'extraire deux charmes en même temps...Peut-être.Effets cumulés de Gathering +2 et Charm Chaser.
268	143	Vent +2 (+15)	Annule la pression du vent de presque tous les monstres.
269	143	Vent +1 (+10)	Réduit la quasi-totalité de la pression du vent.
271	144	Vie +20 (+10)	Augmente de 20 la vie maximale.
272	144	Vie -10 (-10)	Réduit de 10 la vie maximale.
273	144	Vie -30 (-15)	Réduit de 30 la vie maximale.
274	145	Vigueur + (+10)	Double la vitesse de récupération de la stamina.
275	145	Vigueur - (-10)	Diminue de moitié la vitesse de récupération de la stamina.
276	146	Crâne de fer (+15)	Empêche d'être étourdi (statut Etourdissement Etourdissement).
277	146	Crâne de pierre (+10)	Réduit de 50% la probabilité d'être étourdi (statut Etourdissement Etourdissement).
278	146	Menton de verre (-10)	Rend la récupération suite à un Etourdissement Etourdissement plus difficile.
\.


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 186
-- Name: LINE_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"LINE_ID_seq"', 278, true);


--
-- TOC entry 2135 (class 0 OID 16640)
-- Dependencies: 183
-- Data for Name: SKILLS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "SKILLS" ("ID", "NAME-FR", "NAME-EN", "gameOrder") FROM stdin;
15	Arcane	Arcana	5
9	Anti-collant	Sticky Res	9
36	Châtiment	CritStatus	14
30	Chamanisme	CritElemnt	15
10	Anti-furie	Frenzy Res	17
22	Aura de feu	Flame Aura	19
13	Antivol	Anti-Theft	21
12	Anti-séisme	Tremor Res	22
7	Alpiniste	Mud/Snow	23
14	Appétit	Hunger	31
31	Chaleur	Heat Res	39
35	Chasse	Ranger	40
6	Alchimiste	Combo Plus	41
20	Athlète	Constitutn	46
28	Carnivore	Carnivore	48
32	Chapardeur	Spd Gather	55
11	Antigel	Ice Res	57
17	Assurance	Def Lock	83
16	Armurier	Loading	88
25	Bravoure	Guts	89
34	Charge	FastCharge	92
24	Bombe	Bomb Boost	98
5	Aiguiseur	Sharpener	100
18	Artillerie	Artillery	107
27	Capture	Tranquilzr	109
21	Attaque	Attack	114
33	Charme	Charmer	117
19	Artisanat	Handicraft	126
29	Catalyste	FreeElemnt	128
26	Brutalité	Brutality	135
4	Agilité	Nimbleness	138
23	Biologie	Biology	139
80	Fusilier	Reload Spd	123
122	Protection	Protection	32
0	\N	\N	\N
89	Inflexible	Edge Lore	8
86	Hémorragie	Bleeding	10
77	Frugal	LightEater	11
104	Mycologie	Mycology	12
95	Kyudo	Dead Eye	13
37	Chevauchée	Mounting	16
105	Ninja	Sense	20
146	Volonté	Stun	24
133	Sommeil	Sleep	25
112	Paralysie	Paralysis	26
118	Poison	Poison	27
100	Miel	Honey	28
116	Piège	SpeedSetup	29
97	Lubie	Whim	33
127	Récupérer	Rec Speed	34
96	Leader	TeamLeader	35
102	Moral	TeamPlayer	36
39	Commandant	Commander	37
76	Froid	Cold Res	38
91	Inventeur	Combo Rate	42
129	Repas	Eating	43
143	Vent	Wind Res	44
145	Vigueur	Stam Recov	45
83	Gastronome	Gluttony	47
138	Survie	Survivor	49
103	Musique	Maestro	50
135	Soutien	Wide-Range	51
130	Restaurer	Rec Level	52
115	Perception	Perception	53
98	Lucidité	Psychic	54
50	Draconien	Dragon Res	56
93	Isolant	ThunderRes	58
58	Étanche	Water Res	59
88	Ignifuge	Fire Res	60
55	Élément	Elemental	61
51	Dragon	Dragon Atk	62
84	Glace	Ice Atk	63
74	Foudre	ThunderAtk	64
53	Eau	Water Atk	65
72	Feu	Fire Atk	66
132	Sniper	Precision	67
64	F Explosion	Blast C+	68
65	F Faiblesse	Exhaust C+	69
62	F Combat	C.Range C+	70
63	F Énergie	Power C+	71
68	F Sommeil	Sleep C+	72
66	F Paralys	Para C+	73
67	F Poison	Poison C+	74
61	Explosion	Blast S+	75
141	Tranchant	Slicing S+	76
75	Frag	Clust S+	77
8	Antiblindage	Crag S+	78
85	Grenaille	Pellet S+	79
113	Perçant	Pierce S+	80
106	Normal	Normal S+	81
108	Objets	LastingPwr	82
94	KO	KO	84
114	Perçant G	Pierce Up	86
107	Normal G	Normal Up	87
92	Invincible	Unscathed	90
69	Fatigue	Stam Drain	91
128	Rengainage	Sheathing	93
57	Esquive	Evade Dist	94
48	Destruction	Destroyer	95
136	Stamina	Stamina	96
3	Affliction	Status	97
119	Potentiel	Potential	99
111	Paladin	Guard Up	101
81	Garde	Guard	102
49	Dextérité	Sharpness	103
110	Ouïe	Hearing	104
144	Vie	Health	105
59	Évasion	Evasion	106
60	Expert	Expert	108
47	Destin	Fate	110
46	Dépeçage	Carving	111
38	Collecte	Gathering	112
44	Défense	Defense	113
73	Fléau	Blight Res	115
137	Supplice	Tenderizer	116
40	Constance	Unshakable	118
42	Courage	Spirit	119
124	Puissance	Gloves Off	120
101	Mitrailleur	Rapid Fire	121
139	Tirailleur	Recoil	122
125	Punition	PunishDraw	124
45	Dégainage	Crit Draw	125
56	Escrime	Fencing	127
43	Cupidité	Avarice	129
142	Trésor	Hoarding	130
52	Druide	Amplify	131
123	Prudence	Prudence	132
54	Égide	Stalwart	133
71	Férocité	Ferocity	134
120	Prétorien	Resilience	136
87	Iaido	Readiness	137
78	Furie	Fury	140
126	Pureté	Status Res	141
70	Fermeté	SteadyHand	142
131	Shogun	Edgemaster	143
140	Torse +	Torso Up	144
79	Furtif	Covert	1
121	Prière	Prayer	2
99	Mastodonte	Brawn	3
90	Ingénieur	Mechanic	4
134	Sournois	D. Fencing	6
109	Ogre	PowerEater	7
82	Garde auto	Auto-Guard	18
41	Convoyeur	Transportr	30
117	Plomb G	Pellet Up	85
\.


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 184
-- Name: SKILLS_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"SKILLS_ID_seq"', 147, true);


--
-- TOC entry 2017 (class 2606 OID 16738)
-- Name: ATHENA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ATHENA"
    ADD CONSTRAINT "ATHENA_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2007 (class 2606 OID 16636)
-- Name: CHARM_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "CHARM"
    ADD CONSTRAINT "CHARM_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2013 (class 2606 OID 16670)
-- Name: LINE_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "LINE"
    ADD CONSTRAINT "LINE_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2009 (class 2606 OID 16678)
-- Name: SKILLS_NAME-FR_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "SKILLS"
    ADD CONSTRAINT "SKILLS_NAME-FR_key" UNIQUE ("NAME-FR");


--
-- TOC entry 2011 (class 2606 OID 16650)
-- Name: SKILLS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "SKILLS"
    ADD CONSTRAINT "SKILLS_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2014 (class 1259 OID 16687)
-- Name: fki_nom du skill; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_nom du skill" ON "LINE" USING btree ("SKILL");


--
-- TOC entry 2015 (class 1259 OID 16701)
-- Name: fki_skillID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_skillID" ON "LINE" USING btree ("SKILL");


--
-- TOC entry 2018 (class 2606 OID 16696)
-- Name: skillID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "LINE"
    ADD CONSTRAINT "skillID" FOREIGN KEY ("SKILL") REFERENCES "SKILLS"("ID");


--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-10-13 20:01:44

--
-- PostgreSQL database dump complete
--

