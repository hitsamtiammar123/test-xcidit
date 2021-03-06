toc.dat                                                                                             0000600 0004000 0002000 00000047772 14126330067 0014462 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                       	    y            fatbellies-xcidic    12.1    12.1 C    `           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         a           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         b           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         c           1262    25745    fatbellies-xcidic    DATABASE     ?   CREATE DATABASE "fatbellies-xcidic" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 #   DROP DATABASE "fatbellies-xcidic";
                postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false         d           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3         ?           1247    25768    enum_MealMasters_day    TYPE     ?   CREATE TYPE public."enum_MealMasters_day" AS ENUM (
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday'
);
 )   DROP TYPE public."enum_MealMasters_day";
       public          postgres    false    3         ?           1247    26168    enum_Users_role    TYPE     J   CREATE TYPE public."enum_Users_role" AS ENUM (
    'user',
    'admin'
);
 $   DROP TYPE public."enum_Users_role";
       public          postgres    false    3         ?            1259    26806    Branches    TABLE     +  CREATE TABLE public."Branches" (
    id integer NOT NULL,
    name character varying(255),
    latitude double precision,
    longitude double precision,
    openinghours time without time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Branches";
       public         heap    postgres    false    3         ?            1259    26804    Branches_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Branches_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Branches_id_seq";
       public          postgres    false    204    3         e           0    0    Branches_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Branches_id_seq" OWNED BY public."Branches".id;
          public          postgres    false    203         ?            1259    26889    MealMasterExtras    TABLE     :  CREATE TABLE public."MealMasterExtras" (
    id integer NOT NULL,
    mealmasterid integer,
    maxcapacity integer,
    starttime time without time zone,
    endtime time without time zone,
    price numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public."MealMasterExtras";
       public         heap    postgres    false    3         ?            1259    26887    MealMasterExtras_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."MealMasterExtras_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."MealMasterExtras_id_seq";
       public          postgres    false    216    3         f           0    0    MealMasterExtras_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."MealMasterExtras_id_seq" OWNED BY public."MealMasterExtras".id;
          public          postgres    false    215         ?            1259    26822    MealMasters    TABLE     ?   CREATE TABLE public."MealMasters" (
    id integer NOT NULL,
    day public."enum_MealMasters_day",
    "branchId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."MealMasters";
       public         heap    postgres    false    3    646         ?            1259    26820    MealMasters_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."MealMasters_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."MealMasters_id_seq";
       public          postgres    false    208    3         g           0    0    MealMasters_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."MealMasters_id_seq" OWNED BY public."MealMasters".id;
          public          postgres    false    207         ?            1259    26814 	   MealPlans    TABLE     ?   CREATE TABLE public."MealPlans" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."MealPlans";
       public         heap    postgres    false    3         ?            1259    26812    MealPlans_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."MealPlans_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."MealPlans_id_seq";
       public          postgres    false    3    206         h           0    0    MealPlans_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."MealPlans_id_seq" OWNED BY public."MealPlans".id;
          public          postgres    false    205         ?            1259    26858 	   MealTimes    TABLE     O  CREATE TABLE public."MealTimes" (
    id integer NOT NULL,
    price numeric,
    maxcapacity integer,
    starttime time without time zone,
    endtime time without time zone,
    "mealMasterId" integer,
    "mealPlanId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."MealTimes";
       public         heap    postgres    false    3         ?            1259    26856    MealTimes_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."MealTimes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."MealTimes_id_seq";
       public          postgres    false    3    214         i           0    0    MealTimes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."MealTimes_id_seq" OWNED BY public."MealTimes".id;
          public          postgres    false    213         ?            1259    26847    Reservations    TABLE     F  CREATE TABLE public."Reservations" (
    id integer NOT NULL,
    reservationtime timestamp with time zone,
    capacity integer,
    paidprice numeric,
    mealmasterid integer,
    userid integer,
    "isExtra" boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."Reservations";
       public         heap    postgres    false    3         ?            1259    26845    Reservations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Reservations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Reservations_id_seq";
       public          postgres    false    3    212         j           0    0    Reservations_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Reservations_id_seq" OWNED BY public."Reservations".id;
          public          postgres    false    211         ?            1259    25746    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false    3         ?            1259    26835    Users    TABLE     S  CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(255),
    role public."enum_Users_role" DEFAULT 'user'::public."enum_Users_role",
    name character varying(255),
    password character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false    673    3    673         ?            1259    26833    Users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public          postgres    false    3    210         k           0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
          public          postgres    false    209         ?
           2604    26809    Branches id    DEFAULT     n   ALTER TABLE ONLY public."Branches" ALTER COLUMN id SET DEFAULT nextval('public."Branches_id_seq"'::regclass);
 <   ALTER TABLE public."Branches" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    204    204         ?
           2604    26892    MealMasterExtras id    DEFAULT     ~   ALTER TABLE ONLY public."MealMasterExtras" ALTER COLUMN id SET DEFAULT nextval('public."MealMasterExtras_id_seq"'::regclass);
 D   ALTER TABLE public."MealMasterExtras" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216         ?
           2604    26825    MealMasters id    DEFAULT     t   ALTER TABLE ONLY public."MealMasters" ALTER COLUMN id SET DEFAULT nextval('public."MealMasters_id_seq"'::regclass);
 ?   ALTER TABLE public."MealMasters" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207    208         ?
           2604    26817    MealPlans id    DEFAULT     p   ALTER TABLE ONLY public."MealPlans" ALTER COLUMN id SET DEFAULT nextval('public."MealPlans_id_seq"'::regclass);
 =   ALTER TABLE public."MealPlans" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206         ?
           2604    26861    MealTimes id    DEFAULT     p   ALTER TABLE ONLY public."MealTimes" ALTER COLUMN id SET DEFAULT nextval('public."MealTimes_id_seq"'::regclass);
 =   ALTER TABLE public."MealTimes" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214         ?
           2604    26850    Reservations id    DEFAULT     v   ALTER TABLE ONLY public."Reservations" ALTER COLUMN id SET DEFAULT nextval('public."Reservations_id_seq"'::regclass);
 @   ALTER TABLE public."Reservations" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212         ?
           2604    26838    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210         Q          0    26806    Branches 
   TABLE DATA           k   COPY public."Branches" (id, name, latitude, longitude, openinghours, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    204       2897.dat ]          0    26889    MealMasterExtras 
   TABLE DATA           ?   COPY public."MealMasterExtras" (id, mealmasterid, maxcapacity, starttime, endtime, price, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216       2909.dat U          0    26822    MealMasters 
   TABLE DATA           V   COPY public."MealMasters" (id, day, "branchId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    208       2901.dat S          0    26814 	   MealPlans 
   TABLE DATA           I   COPY public."MealPlans" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    206       2899.dat [          0    26858 	   MealTimes 
   TABLE DATA           ?   COPY public."MealTimes" (id, price, maxcapacity, starttime, endtime, "mealMasterId", "mealPlanId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    214       2907.dat Y          0    26847    Reservations 
   TABLE DATA           ?   COPY public."Reservations" (id, reservationtime, capacity, paidprice, mealmasterid, userid, "isExtra", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    212       2905.dat O          0    25746    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    202       2895.dat W          0    26835    Users 
   TABLE DATA           \   COPY public."Users" (id, email, role, name, password, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    210       2903.dat l           0    0    Branches_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Branches_id_seq"', 1, true);
          public          postgres    false    203         m           0    0    MealMasterExtras_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."MealMasterExtras_id_seq"', 2, true);
          public          postgres    false    215         n           0    0    MealMasters_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."MealMasters_id_seq"', 17, true);
          public          postgres    false    207         o           0    0    MealPlans_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."MealPlans_id_seq"', 7, true);
          public          postgres    false    205         p           0    0    MealTimes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."MealTimes_id_seq"', 33, true);
          public          postgres    false    213         q           0    0    Reservations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Reservations_id_seq"', 12, true);
          public          postgres    false    211         r           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 5, true);
          public          postgres    false    209         ?
           2606    26811    Branches Branches_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Branches"
    ADD CONSTRAINT "Branches_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Branches" DROP CONSTRAINT "Branches_pkey";
       public            postgres    false    204         ?
           2606    26897 &   MealMasterExtras MealMasterExtras_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."MealMasterExtras"
    ADD CONSTRAINT "MealMasterExtras_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."MealMasterExtras" DROP CONSTRAINT "MealMasterExtras_pkey";
       public            postgres    false    216         ?
           2606    26827    MealMasters MealMasters_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."MealMasters"
    ADD CONSTRAINT "MealMasters_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."MealMasters" DROP CONSTRAINT "MealMasters_pkey";
       public            postgres    false    208         ?
           2606    26819    MealPlans MealPlans_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."MealPlans"
    ADD CONSTRAINT "MealPlans_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."MealPlans" DROP CONSTRAINT "MealPlans_pkey";
       public            postgres    false    206         ?
           2606    26866    MealTimes MealTimes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."MealTimes"
    ADD CONSTRAINT "MealTimes_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."MealTimes" DROP CONSTRAINT "MealTimes_pkey";
       public            postgres    false    214         ?
           2606    26855    Reservations Reservations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT "Reservations_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Reservations" DROP CONSTRAINT "Reservations_pkey";
       public            postgres    false    212         ?
           2606    25750     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    202         ?
           2606    26844    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    210         ?
           2606    26904    Users email_unique 
   CONSTRAINT     P   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT email_unique UNIQUE (email);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique;
       public            postgres    false    210         ?
           2606    26898 3   MealMasterExtras MealMasterExtras_mealmasterid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MealMasterExtras"
    ADD CONSTRAINT "MealMasterExtras_mealmasterid_fkey" FOREIGN KEY (mealmasterid) REFERENCES public."MealMasters"(id);
 a   ALTER TABLE ONLY public."MealMasterExtras" DROP CONSTRAINT "MealMasterExtras_mealmasterid_fkey";
       public          postgres    false    208    216    2752         ?
           2606    26867 %   MealTimes MealTimes_mealMasterId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MealTimes"
    ADD CONSTRAINT "MealTimes_mealMasterId_fkey" FOREIGN KEY ("mealMasterId") REFERENCES public."MealMasters"(id);
 S   ALTER TABLE ONLY public."MealTimes" DROP CONSTRAINT "MealTimes_mealMasterId_fkey";
       public          postgres    false    2752    214    208         ?
           2606    26872 #   MealTimes MealTimes_mealPlanId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MealTimes"
    ADD CONSTRAINT "MealTimes_mealPlanId_fkey" FOREIGN KEY ("mealPlanId") REFERENCES public."MealPlans"(id);
 Q   ALTER TABLE ONLY public."MealTimes" DROP CONSTRAINT "MealTimes_mealPlanId_fkey";
       public          postgres    false    206    2750    214         ?
           2606    26828     MealMasters branchId_foreign_key    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MealMasters"
    ADD CONSTRAINT "branchId_foreign_key" FOREIGN KEY ("branchId") REFERENCES public."Branches"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."MealMasters" DROP CONSTRAINT "branchId_foreign_key";
       public          postgres    false    204    208    2748         ?
           2606    26877 %   Reservations mealmasterid_foreign_key    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT mealmasterid_foreign_key FOREIGN KEY (mealmasterid) REFERENCES public."MealMasters"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."Reservations" DROP CONSTRAINT mealmasterid_foreign_key;
       public          postgres    false    2752    212    208         ?
           2606    26882    Reservations userid_foreign_key    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT userid_foreign_key FOREIGN KEY (userid) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Reservations" DROP CONSTRAINT userid_foreign_key;
       public          postgres    false    210    2754    212              2897.dat                                                                                            0000600 0004000 0002000 00000000137 14126330067 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Branch A	2.00101	1.23431	09:00:00	2021-10-03 04:21:33.532+07	2021-10-03 04:21:33.532+07
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                 2909.dat                                                                                            0000600 0004000 0002000 00000000130 14126330067 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	10	25	07:00:00	10:00:00	24	2021-10-03 18:40:27.392+07	2021-10-03 20:18:26.094+07
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                        2901.dat                                                                                            0000600 0004000 0002000 00000000731 14126330067 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        10	monday	1	2021-10-03 04:31:37.453+07	2021-10-03 04:31:37.453+07
11	tuesday	1	2021-10-03 04:36:16.63+07	2021-10-03 04:36:16.63+07
12	wednesday	1	2021-10-03 04:36:37.212+07	2021-10-03 04:36:37.212+07
13	thursday	1	2021-10-03 05:10:54.173+07	2021-10-03 05:10:54.173+07
14	friday	1	2021-10-03 05:15:22.558+07	2021-10-03 05:15:22.558+07
15	saturday	1	2021-10-03 05:29:53.339+07	2021-10-03 05:29:53.339+07
16	sunday	1	2021-10-03 05:33:11.675+07	2021-10-03 05:33:11.675+07
\.


                                       2899.dat                                                                                            0000600 0004000 0002000 00000000411 14126330067 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	Buffet A	2021-10-03 04:21:33.529+07	2021-10-03 04:21:33.529+07
5	Buffet B	2021-10-03 04:21:33.529+07	2021-10-03 04:21:33.529+07
6	Buffet C	2021-10-03 04:21:33.529+07	2021-10-03 04:21:33.529+07
7	Buffet E	2021-10-03 05:10:06.592+07	2021-10-03 14:41:04.388+07
\.


                                                                                                                                                                                                                                                       2907.dat                                                                                            0000600 0004000 0002000 00000003666 14126330067 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        8	11	14	13:00:00	17:00:00	10	4	2021-10-03 06:35:46.319+07	2021-10-03 06:35:46.319+07
9	11	14	17:00:00	21:00:00	10	5	2021-10-03 06:35:53.288+07	2021-10-03 06:35:53.288+07
10	11	14	07:00:00	14:00:00	11	4	2021-10-03 06:36:43.286+07	2021-10-03 06:36:43.286+07
11	11	14	14:00:00	17:00:00	11	4	2021-10-03 06:36:56.738+07	2021-10-03 06:36:56.738+07
12	11	14	17:00:00	22:00:00	11	5	2021-10-03 06:37:15.189+07	2021-10-03 06:37:15.189+07
14	11	20	07:00:00	12:00:00	12	4	2021-10-03 14:25:17.007+07	2021-10-03 14:25:17.007+07
15	11	20	12:00:00	15:00:00	12	6	2021-10-03 14:32:34.282+07	2021-10-03 14:32:34.282+07
16	20	20	15:00:00	21:00:00	12	5	2021-10-03 14:33:11.051+07	2021-10-03 14:33:11.051+07
17	12	20	07:00:00	12:00:00	13	4	2021-10-03 14:36:18.192+07	2021-10-03 14:36:18.192+07
18	12	20	12:00:00	17:00:00	13	4	2021-10-03 14:36:24.219+07	2021-10-03 14:36:24.219+07
19	12	20	17:00:00	22:00:00	13	5	2021-10-03 14:36:32.14+07	2021-10-03 14:36:32.14+07
20	12	20	07:00:00	12:00:00	14	4	2021-10-03 14:36:44.94+07	2021-10-03 14:36:44.94+07
21	12	20	12:00:00	15:00:00	14	5	2021-10-03 14:36:51.89+07	2021-10-03 14:36:51.89+07
22	12	20	15:00:00	17:00:00	14	5	2021-10-03 14:37:00.607+07	2021-10-03 14:37:00.607+07
23	12	20	17:00:00	22:00:00	14	6	2021-10-03 14:37:11.327+07	2021-10-03 14:37:11.327+07
24	12	20	07:00:00	12:00:00	15	4	2021-10-03 14:37:42.724+07	2021-10-03 14:37:42.724+07
25	12	20	12:00:00	15:00:00	15	5	2021-10-03 14:37:49.211+07	2021-10-03 14:37:49.211+07
26	12	20	15:00:00	17:00:00	15	6	2021-10-03 14:38:10.305+07	2021-10-03 14:38:10.305+07
27	12	20	17:00:00	22:00:00	15	7	2021-10-03 14:38:58.645+07	2021-10-03 14:38:58.645+07
28	12	20	07:00:00	12:00:00	16	4	2021-10-03 14:39:18.863+07	2021-10-03 14:39:18.863+07
29	12	20	12:00:00	16:00:00	16	5	2021-10-03 14:39:31.945+07	2021-10-03 14:39:31.945+07
30	12	20	16:00:00	20:00:00	16	6	2021-10-03 14:39:39.775+07	2021-10-03 14:39:39.775+07
7	12	20	07:00:00	13:00:00	10	6	2021-10-03 06:35:35.238+07	2021-10-03 15:42:52.592+07
\.


                                                                          2905.dat                                                                                            0000600 0004000 0002000 00000000430 14126330067 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        8	2021-10-10 13:00:00+07	5	11	10	5	f	2021-10-03 17:40:19.122+07	2021-10-03 17:40:19.122+07
9	2021-10-10 08:00:00+07	5	24	10	5	t	2021-10-03 18:47:40.789+07	2021-10-03 18:47:40.789+07
12	2021-10-04 16:30:00+07	12	11	10	5	f	2021-10-03 19:06:39.776+07	2021-10-03 19:06:39.776+07
\.


                                                                                                                                                                                                                                        2895.dat                                                                                            0000600 0004000 0002000 00000000572 14126330067 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        20211002150016-create-branch.js
20211002150706-create-meal-plan.js
20211002152107-create-meal-master.js
20211002152210-add-meal-master-foreign.js
20211002154137-create-user.js
20211002154444-create-reservation.js
20211002154500-create-meal-time.js
20211002154539-create-reservation-foreign.js
20211002160449-create-meal-master-extra.js
20211002162248-add-unique-on-user.js
\.


                                                                                                                                      2903.dat                                                                                            0000600 0004000 0002000 00000000471 14126330067 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	admin@admin.com	admin	Admin Fatbellies	$2a$10$x1zBGeP3xL6P0ZDncI/LFuN4UZ8xXuc4N7LxdcGe/9u83n3acUZum	2021-10-03 04:21:33.454+07	2021-10-03 04:21:33.454+07
5	user@gmail.com	user	Hitsam Tiammar	$2a$10$YISYCqaEZE0jl.sy1.7yGeNrVjNMhbsQ/5sXg7zzRF5pFxKpzPCDS	2021-10-03 04:21:33.521+07	2021-10-03 04:21:33.521+07
\.


                                                                                                                                                                                                       restore.sql                                                                                         0000600 0004000 0002000 00000040567 14126330067 0015402 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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

DROP DATABASE "fatbellies-xcidic";
--
-- Name: fatbellies-xcidic; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "fatbellies-xcidic" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "fatbellies-xcidic" OWNER TO postgres;

\connect -reuse-previous=on "dbname='fatbellies-xcidic'"

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: enum_MealMasters_day; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_MealMasters_day" AS ENUM (
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday'
);


ALTER TYPE public."enum_MealMasters_day" OWNER TO postgres;

--
-- Name: enum_Users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Users_role" AS ENUM (
    'user',
    'admin'
);


ALTER TYPE public."enum_Users_role" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Branches" (
    id integer NOT NULL,
    name character varying(255),
    latitude double precision,
    longitude double precision,
    openinghours time without time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Branches" OWNER TO postgres;

--
-- Name: Branches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Branches_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Branches_id_seq" OWNER TO postgres;

--
-- Name: Branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Branches_id_seq" OWNED BY public."Branches".id;


--
-- Name: MealMasterExtras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MealMasterExtras" (
    id integer NOT NULL,
    mealmasterid integer,
    maxcapacity integer,
    starttime time without time zone,
    endtime time without time zone,
    price numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."MealMasterExtras" OWNER TO postgres;

--
-- Name: MealMasterExtras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MealMasterExtras_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MealMasterExtras_id_seq" OWNER TO postgres;

--
-- Name: MealMasterExtras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MealMasterExtras_id_seq" OWNED BY public."MealMasterExtras".id;


--
-- Name: MealMasters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MealMasters" (
    id integer NOT NULL,
    day public."enum_MealMasters_day",
    "branchId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."MealMasters" OWNER TO postgres;

--
-- Name: MealMasters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MealMasters_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MealMasters_id_seq" OWNER TO postgres;

--
-- Name: MealMasters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MealMasters_id_seq" OWNED BY public."MealMasters".id;


--
-- Name: MealPlans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MealPlans" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."MealPlans" OWNER TO postgres;

--
-- Name: MealPlans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MealPlans_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MealPlans_id_seq" OWNER TO postgres;

--
-- Name: MealPlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MealPlans_id_seq" OWNED BY public."MealPlans".id;


--
-- Name: MealTimes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MealTimes" (
    id integer NOT NULL,
    price numeric,
    maxcapacity integer,
    starttime time without time zone,
    endtime time without time zone,
    "mealMasterId" integer,
    "mealPlanId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."MealTimes" OWNER TO postgres;

--
-- Name: MealTimes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MealTimes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MealTimes_id_seq" OWNER TO postgres;

--
-- Name: MealTimes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MealTimes_id_seq" OWNED BY public."MealTimes".id;


--
-- Name: Reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Reservations" (
    id integer NOT NULL,
    reservationtime timestamp with time zone,
    capacity integer,
    paidprice numeric,
    mealmasterid integer,
    userid integer,
    "isExtra" boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Reservations" OWNER TO postgres;

--
-- Name: Reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Reservations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Reservations_id_seq" OWNER TO postgres;

--
-- Name: Reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Reservations_id_seq" OWNED BY public."Reservations".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(255),
    role public."enum_Users_role" DEFAULT 'user'::public."enum_Users_role",
    name character varying(255),
    password character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: Branches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Branches" ALTER COLUMN id SET DEFAULT nextval('public."Branches_id_seq"'::regclass);


--
-- Name: MealMasterExtras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealMasterExtras" ALTER COLUMN id SET DEFAULT nextval('public."MealMasterExtras_id_seq"'::regclass);


--
-- Name: MealMasters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealMasters" ALTER COLUMN id SET DEFAULT nextval('public."MealMasters_id_seq"'::regclass);


--
-- Name: MealPlans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealPlans" ALTER COLUMN id SET DEFAULT nextval('public."MealPlans_id_seq"'::regclass);


--
-- Name: MealTimes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealTimes" ALTER COLUMN id SET DEFAULT nextval('public."MealTimes_id_seq"'::regclass);


--
-- Name: Reservations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reservations" ALTER COLUMN id SET DEFAULT nextval('public."Reservations_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: Branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Branches" (id, name, latitude, longitude, openinghours, "createdAt", "updatedAt") FROM stdin;
\.
COPY public."Branches" (id, name, latitude, longitude, openinghours, "createdAt", "updatedAt") FROM '$$PATH$$/2897.dat';

--
-- Data for Name: MealMasterExtras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MealMasterExtras" (id, mealmasterid, maxcapacity, starttime, endtime, price, "createdAt", "updatedAt") FROM stdin;
\.
COPY public."MealMasterExtras" (id, mealmasterid, maxcapacity, starttime, endtime, price, "createdAt", "updatedAt") FROM '$$PATH$$/2909.dat';

--
-- Data for Name: MealMasters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MealMasters" (id, day, "branchId", "createdAt", "updatedAt") FROM stdin;
\.
COPY public."MealMasters" (id, day, "branchId", "createdAt", "updatedAt") FROM '$$PATH$$/2901.dat';

--
-- Data for Name: MealPlans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MealPlans" (id, name, "createdAt", "updatedAt") FROM stdin;
\.
COPY public."MealPlans" (id, name, "createdAt", "updatedAt") FROM '$$PATH$$/2899.dat';

--
-- Data for Name: MealTimes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MealTimes" (id, price, maxcapacity, starttime, endtime, "mealMasterId", "mealPlanId", "createdAt", "updatedAt") FROM stdin;
\.
COPY public."MealTimes" (id, price, maxcapacity, starttime, endtime, "mealMasterId", "mealPlanId", "createdAt", "updatedAt") FROM '$$PATH$$/2907.dat';

--
-- Data for Name: Reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Reservations" (id, reservationtime, capacity, paidprice, mealmasterid, userid, "isExtra", "createdAt", "updatedAt") FROM stdin;
\.
COPY public."Reservations" (id, reservationtime, capacity, paidprice, mealmasterid, userid, "isExtra", "createdAt", "updatedAt") FROM '$$PATH$$/2905.dat';

--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
\.
COPY public."SequelizeMeta" (name) FROM '$$PATH$$/2895.dat';

--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, email, role, name, password, "createdAt", "updatedAt") FROM stdin;
\.
COPY public."Users" (id, email, role, name, password, "createdAt", "updatedAt") FROM '$$PATH$$/2903.dat';

--
-- Name: Branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Branches_id_seq"', 1, true);


--
-- Name: MealMasterExtras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MealMasterExtras_id_seq"', 2, true);


--
-- Name: MealMasters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MealMasters_id_seq"', 17, true);


--
-- Name: MealPlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MealPlans_id_seq"', 7, true);


--
-- Name: MealTimes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MealTimes_id_seq"', 33, true);


--
-- Name: Reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Reservations_id_seq"', 12, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 5, true);


--
-- Name: Branches Branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Branches"
    ADD CONSTRAINT "Branches_pkey" PRIMARY KEY (id);


--
-- Name: MealMasterExtras MealMasterExtras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealMasterExtras"
    ADD CONSTRAINT "MealMasterExtras_pkey" PRIMARY KEY (id);


--
-- Name: MealMasters MealMasters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealMasters"
    ADD CONSTRAINT "MealMasters_pkey" PRIMARY KEY (id);


--
-- Name: MealPlans MealPlans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealPlans"
    ADD CONSTRAINT "MealPlans_pkey" PRIMARY KEY (id);


--
-- Name: MealTimes MealTimes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealTimes"
    ADD CONSTRAINT "MealTimes_pkey" PRIMARY KEY (id);


--
-- Name: Reservations Reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT "Reservations_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Users email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT email_unique UNIQUE (email);


--
-- Name: MealMasterExtras MealMasterExtras_mealmasterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealMasterExtras"
    ADD CONSTRAINT "MealMasterExtras_mealmasterid_fkey" FOREIGN KEY (mealmasterid) REFERENCES public."MealMasters"(id);


--
-- Name: MealTimes MealTimes_mealMasterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealTimes"
    ADD CONSTRAINT "MealTimes_mealMasterId_fkey" FOREIGN KEY ("mealMasterId") REFERENCES public."MealMasters"(id);


--
-- Name: MealTimes MealTimes_mealPlanId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealTimes"
    ADD CONSTRAINT "MealTimes_mealPlanId_fkey" FOREIGN KEY ("mealPlanId") REFERENCES public."MealPlans"(id);


--
-- Name: MealMasters branchId_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealMasters"
    ADD CONSTRAINT "branchId_foreign_key" FOREIGN KEY ("branchId") REFERENCES public."Branches"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Reservations mealmasterid_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT mealmasterid_foreign_key FOREIGN KEY (mealmasterid) REFERENCES public."MealMasters"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Reservations userid_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT userid_foreign_key FOREIGN KEY (userid) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         