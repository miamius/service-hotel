PGDMP                         y            thn    11.5 (Debian 11.5-3.pgdg90+1)    11.2 K    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ?           1262    16385    thn    DATABASE     s   CREATE DATABASE thn WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE thn;
             root    false                        2615    16855    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             root    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  root    false    7            ?            1259    16856 
   additional    TABLE     ?  CREATE TABLE public.additional (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.132273'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.132273'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.additional;
       public         root    false    7            ?            1259    16866    additional_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.additional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.additional_id_seq;
       public       root    false    7    196            ?           0    0    additional_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.additional_id_seq OWNED BY public.additional.id;
            public       root    false    197            ?            1259    16868    additional_tenant    TABLE     ?  CREATE TABLE public.additional_tenant (
    id integer NOT NULL,
    tenant_id bigint NOT NULL,
    additional_id bigint NOT NULL,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.164739'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.164739'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
 %   DROP TABLE public.additional_tenant;
       public         root    false    7            ?            1259    16875    additional_tenant_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.additional_tenant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.additional_tenant_id_seq;
       public       root    false    198    7            ?           0    0    additional_tenant_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.additional_tenant_id_seq OWNED BY public.additional_tenant.id;
            public       root    false    199            ?            1259    16877    hotel    TABLE     ?  CREATE TABLE public.hotel (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(20),
    email character varying(240),
    check_in time(0) without time zone,
    check_out time(0) without time zone,
    full_address character varying(240) NOT NULL,
    link character varying(255),
    score double precision,
    rating double precision,
    description text,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:16.93887'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:16.93887'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.hotel;
       public         root    false    7            ?            1259    16887    hotel_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.hotel_id_seq;
       public       root    false    7    200            ?           0    0    hotel_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.hotel_id_seq OWNED BY public.hotel.id;
            public       root    false    201            ?            1259    16889 	   migration    TABLE     g   CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);
    DROP TABLE public.migration;
       public         root    false    7            ?            1259    16892    room    TABLE     ?  CREATE TABLE public.room (
    id integer NOT NULL,
    hotel_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    floor smallint,
    capacity smallint,
    port smallint,
    size smallint,
    free_cancellation boolean DEFAULT false,
    single_bed smallint,
    double_bed smallint,
    state_id smallint DEFAULT 1,
    description text,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.021978'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.021978'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.room;
       public         root    false    7            ?           0    0    COLUMN room.state_id    COMMENT     V   COMMENT ON COLUMN public.room.state_id IS '1available, 2offline, 3reserved, 4rented';
            public       root    false    203            ?            1259    16904    room_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.room_id_seq;
       public       root    false    7    203            ?           0    0    room_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.room_id_seq OWNED BY public.room.id;
            public       root    false    204            ?            1259    16906 
   room_photo    TABLE     ?  CREATE TABLE public.room_photo (
    id integer NOT NULL,
    room_id bigint NOT NULL,
    link character varying(255) NOT NULL,
    "order" integer,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.248073'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.248073'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.room_photo;
       public         root    false    7            ?            1259    16913    room_photo_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.room_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.room_photo_id_seq;
       public       root    false    205    7            ?           0    0    room_photo_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.room_photo_id_seq OWNED BY public.room_photo.id;
            public       root    false    206            ?            1259    16915 
   room_state    TABLE     ?   CREATE TABLE public.room_state (
    id integer NOT NULL,
    name character varying(255),
    deleted boolean DEFAULT false
);
    DROP TABLE public.room_state;
       public         root    false    7            ?            1259    16919    room_state_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.room_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.room_state_id_seq;
       public       root    false    207    7            ?           0    0    room_state_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.room_state_id_seq OWNED BY public.room_state.id;
            public       root    false    208            ?            1259    16921    tenant_room    TABLE     G  CREATE TABLE public.tenant_room (
    id integer NOT NULL,
    room_id integer NOT NULL,
    user_id integer NOT NULL,
    price_pay integer,
    amount_people integer,
    check_in date,
    check_out date,
    observations text,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.095633'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.095633'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.tenant_room;
       public         root    false    7            ?            1259    16931    tenant_room_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tenant_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tenant_room_id_seq;
       public       root    false    209    7            ?           0    0    tenant_room_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tenant_room_id_seq OWNED BY public.tenant_room.id;
            public       root    false    210            ?            1259    16933    user    TABLE     ?  CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    last_name character varying(255),
    phone character varying(20),
    country character varying(255),
    email character varying(255) NOT NULL,
    password character varying(255) DEFAULT NULL::character varying,
    observations text,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.060185'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.060185'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public."user";
       public         root    false    7            ?            1259    16944    user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       root    false    7    211            ?           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
            public       root    false    212            ?
           2604    16946    additional id    DEFAULT     n   ALTER TABLE ONLY public.additional ALTER COLUMN id SET DEFAULT nextval('public.additional_id_seq'::regclass);
 <   ALTER TABLE public.additional ALTER COLUMN id DROP DEFAULT;
       public       root    false    197    196            ?
           2604    16947    additional_tenant id    DEFAULT     |   ALTER TABLE ONLY public.additional_tenant ALTER COLUMN id SET DEFAULT nextval('public.additional_tenant_id_seq'::regclass);
 C   ALTER TABLE public.additional_tenant ALTER COLUMN id DROP DEFAULT;
       public       root    false    199    198            ?
           2604    16948    hotel id    DEFAULT     d   ALTER TABLE ONLY public.hotel ALTER COLUMN id SET DEFAULT nextval('public.hotel_id_seq'::regclass);
 7   ALTER TABLE public.hotel ALTER COLUMN id DROP DEFAULT;
       public       root    false    201    200            ?
           2604    16949    room id    DEFAULT     b   ALTER TABLE ONLY public.room ALTER COLUMN id SET DEFAULT nextval('public.room_id_seq'::regclass);
 6   ALTER TABLE public.room ALTER COLUMN id DROP DEFAULT;
       public       root    false    204    203                       2604    16950    room_photo id    DEFAULT     n   ALTER TABLE ONLY public.room_photo ALTER COLUMN id SET DEFAULT nextval('public.room_photo_id_seq'::regclass);
 <   ALTER TABLE public.room_photo ALTER COLUMN id DROP DEFAULT;
       public       root    false    206    205                       2604    16951    room_state id    DEFAULT     n   ALTER TABLE ONLY public.room_state ALTER COLUMN id SET DEFAULT nextval('public.room_state_id_seq'::regclass);
 <   ALTER TABLE public.room_state ALTER COLUMN id DROP DEFAULT;
       public       root    false    208    207                       2604    16952    tenant_room id    DEFAULT     p   ALTER TABLE ONLY public.tenant_room ALTER COLUMN id SET DEFAULT nextval('public.tenant_room_id_seq'::regclass);
 =   ALTER TABLE public.tenant_room ALTER COLUMN id DROP DEFAULT;
       public       root    false    210    209                       2604    16953    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       root    false    212    211            ?          0    16856 
   additional 
   TABLE DATA               a   COPY public.additional (id, name, slug, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    196            ?          0    16868    additional_tenant 
   TABLE DATA               v   COPY public.additional_tenant (id, tenant_id, additional_id, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    198            ?          0    16877    hotel 
   TABLE DATA               ?   COPY public.hotel (id, name, phone, email, check_in, check_out, full_address, link, score, rating, description, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    200            ?          0    16889 	   migration 
   TABLE DATA               8   COPY public.migration (version, apply_time) FROM stdin;
    public       root    false    202            ?          0    16892    room 
   TABLE DATA               ?   COPY public.room (id, hotel_id, name, price, floor, capacity, port, size, free_cancellation, single_bed, double_bed, state_id, description, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    203            ?          0    16906 
   room_photo 
   TABLE DATA               m   COPY public.room_photo (id, room_id, link, "order", created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    205            ?          0    16915 
   room_state 
   TABLE DATA               7   COPY public.room_state (id, name, deleted) FROM stdin;
    public       root    false    207            ?          0    16921    tenant_room 
   TABLE DATA               ?   COPY public.tenant_room (id, room_id, user_id, price_pay, amount_people, check_in, check_out, observations, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    209            ?          0    16933    user 
   TABLE DATA               ?   COPY public."user" (id, name, last_name, phone, country, email, password, observations, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    211            ?           0    0    additional_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.additional_id_seq', 6, true);
            public       root    false    197            ?           0    0    additional_tenant_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.additional_tenant_id_seq', 7, true);
            public       root    false    199            ?           0    0    hotel_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.hotel_id_seq', 4, true);
            public       root    false    201            ?           0    0    room_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.room_id_seq', 14, true);
            public       root    false    204            ?           0    0    room_photo_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.room_photo_id_seq', 19, true);
            public       root    false    206            ?           0    0    room_state_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.room_state_id_seq', 4, true);
            public       root    false    208            ?           0    0    tenant_room_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tenant_room_id_seq', 3, true);
            public       root    false    210            ?           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 6, true);
            public       root    false    212                       2606    16955    additional additional_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.additional
    ADD CONSTRAINT additional_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.additional DROP CONSTRAINT additional_pkey;
       public         root    false    196                       2606    16957 (   additional_tenant additional_tenant_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.additional_tenant
    ADD CONSTRAINT additional_tenant_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.additional_tenant DROP CONSTRAINT additional_tenant_pkey;
       public         root    false    198                       2606    16959    hotel hotel_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.hotel DROP CONSTRAINT hotel_pkey;
       public         root    false    200                       2606    16961    migration migration_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);
 B   ALTER TABLE ONLY public.migration DROP CONSTRAINT migration_pkey;
       public         root    false    202                       2606    16963    room_photo room_photo_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.room_photo
    ADD CONSTRAINT room_photo_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.room_photo DROP CONSTRAINT room_photo_pkey;
       public         root    false    205                       2606    16965    room room_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.room DROP CONSTRAINT room_pkey;
       public         root    false    203                       2606    16967    room_state room_state_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.room_state
    ADD CONSTRAINT room_state_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.room_state DROP CONSTRAINT room_state_name_key;
       public         root    false    207                       2606    16969    room_state room_state_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.room_state
    ADD CONSTRAINT room_state_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.room_state DROP CONSTRAINT room_state_pkey;
       public         root    false    207                        2606    16971    tenant_room tenant_room_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tenant_room
    ADD CONSTRAINT tenant_room_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tenant_room DROP CONSTRAINT tenant_room_pkey;
       public         root    false    209            "           2606    16973    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public         root    false    211            $           2606    16975    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         root    false    211            %           2606    16976 4   additional_tenant fk-additional_tenant-additional_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.additional_tenant
    ADD CONSTRAINT "fk-additional_tenant-additional_id" FOREIGN KEY (additional_id) REFERENCES public.additional(id);
 `   ALTER TABLE ONLY public.additional_tenant DROP CONSTRAINT "fk-additional_tenant-additional_id";
       public       root    false    196    198    2832            &           2606    16981 0   additional_tenant fk-additional_tenant-tenant_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.additional_tenant
    ADD CONSTRAINT "fk-additional_tenant-tenant_id" FOREIGN KEY (tenant_id) REFERENCES public.tenant_room(id);
 \   ALTER TABLE ONLY public.additional_tenant DROP CONSTRAINT "fk-additional_tenant-tenant_id";
       public       root    false    209    2848    198            '           2606    16986    room fk-hotel-hotel_id    FK CONSTRAINT     x   ALTER TABLE ONLY public.room
    ADD CONSTRAINT "fk-hotel-hotel_id" FOREIGN KEY (hotel_id) REFERENCES public.hotel(id);
 B   ALTER TABLE ONLY public.room DROP CONSTRAINT "fk-hotel-hotel_id";
       public       root    false    203    2836    200            (           2606    16991    room fk-room-state_id    FK CONSTRAINT     |   ALTER TABLE ONLY public.room
    ADD CONSTRAINT "fk-room-state_id" FOREIGN KEY (state_id) REFERENCES public.room_state(id);
 A   ALTER TABLE ONLY public.room DROP CONSTRAINT "fk-room-state_id";
       public       root    false    203    207    2846            )           2606    16996     room_photo fk-room_photo-room_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.room_photo
    ADD CONSTRAINT "fk-room_photo-room_id" FOREIGN KEY (room_id) REFERENCES public.room(id);
 L   ALTER TABLE ONLY public.room_photo DROP CONSTRAINT "fk-room_photo-room_id";
       public       root    false    203    2840    205            *           2606    17001 "   tenant_room fk-tenant-room-room_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tenant_room
    ADD CONSTRAINT "fk-tenant-room-room_id" FOREIGN KEY (room_id) REFERENCES public.room(id);
 N   ALTER TABLE ONLY public.tenant_room DROP CONSTRAINT "fk-tenant-room-room_id";
       public       root    false    203    2840    209            +           2606    17006 "   tenant_room fk-tenant-room-user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tenant_room
    ADD CONSTRAINT "fk-tenant-room-user_id" FOREIGN KEY (user_id) REFERENCES public."user"(id);
 N   ALTER TABLE ONLY public.tenant_room DROP CONSTRAINT "fk-tenant-room-user_id";
       public       root    false    2852    211    209            ?   ?   x?3??L??,FF???F?F
??V&fV??X?b?8Ӹ?8??3??9?4Iڍ9C?8K?H?d??Y?????Y ?I?n???Y??????Y???rsbf?.? I?q:?&f?%?p&?Y$???? VbZ{      ?   O   x?3?4B##C]C#]#CC+3+Cs?b1~?i\F ?i1j1&M?	??39?4-f@&?iJq???%F??? ??A?      ?   ?  x???;n1?k??G??ݕ"?J`+@?@??s3?I?X??"mN????2??? ??Tj?C????S?ˆ&oś????~??P/?߭-j#k?Sj6??<?!???kl?w?dAM?>܇???%??60???PL????чş?\?ؤ???`??????)u???#1?>???l????:ZJ}???T'J9 kiu??[?X?wT?6?6'L.w?ts0?t??!?
]k??|̘????{phk???B?yo%?'nE???q?KE98?U`E?kxL?????e?9X+
?R?u????'??o(?3?3ANGeK???<?D??R???Ř"?O(?Y?Z)?a??TqU?A?gj2??=܉U?x?
x????ٓм??o??!4?ƂX/?б???w?';Z&?9?w?CKɴ?.????????,?yi)?????r~^?g^*???ο?O`S]??`s'R?A?z??S??      ?   ?   x????? @??c?¿?4?#q? ????-??/??9??|?????5?:p}'?P?"?V`??=??Kb?#?0????
??~?_F_?2??ںߊ?mV˕e)????
???S??;?6??e??5?????k??8?w??|?      ?   ?   x??ҽ
?0 ???׭Z?S??C??K?RԀ???7jo?X?!仿.O;,z????n??`??0@y?Bh???z??c???H|d??sJ???;?G??גȸ/z7?֡??tnw???? ?l???f.?u˝?????d1?,?^??7$??E?W*????"ZF??&D???t/?????e&ؔ	e%Z??k????<)?^???      ?   ?   x???M
?0???^ ?3M??Cx???Z?b??F???{7Y?[<???A ck#?:K?,?nY?>F??I????9?Wx???JR?R?tJ??g4?????u???#܀?R?/9'{@۠k???\e??dK:??J?h?2Yt?? f?`?1ۓ???r0l9u9?\9?b0?`?} 0ě?      ?   6   x?3?L,K??IL?I?L?2??OK????M8?R?JRS?LcΤ??l03F??? ???      ?   Q   x?3?4BCNcN##C]C#]#?H??P???3?IB?????????Pi?!'?L???Ɯ??Tud	W? ?-      ?   ?   x???1?0Eg??@+?:u?8@JUԒ???\???lYl???}????QV/`?0?????%?-7??'???&??q?=????f[?>??כ"?????????˸	??Ֆ?I?????N7?|??N6???m?7??XT[*?>똝?      K    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ?           1262    16385    thn    DATABASE     s   CREATE DATABASE thn WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE thn;
             root    false                        2615    16855    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             root    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  root    false    7            ?            1259    16856 
   additional    TABLE     ?  CREATE TABLE public.additional (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.132273'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.132273'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.additional;
       public         root    false    7            ?            1259    16866    additional_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.additional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.additional_id_seq;
       public       root    false    7    196            ?           0    0    additional_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.additional_id_seq OWNED BY public.additional.id;
            public       root    false    197            ?            1259    16868    additional_tenant    TABLE     ?  CREATE TABLE public.additional_tenant (
    id integer NOT NULL,
    tenant_id bigint NOT NULL,
    additional_id bigint NOT NULL,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.164739'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.164739'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
 %   DROP TABLE public.additional_tenant;
       public         root    false    7            ?            1259    16875    additional_tenant_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.additional_tenant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.additional_tenant_id_seq;
       public       root    false    198    7            ?           0    0    additional_tenant_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.additional_tenant_id_seq OWNED BY public.additional_tenant.id;
            public       root    false    199            ?            1259    16877    hotel    TABLE     ?  CREATE TABLE public.hotel (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(20),
    email character varying(240),
    check_in time(0) without time zone,
    check_out time(0) without time zone,
    full_address character varying(240) NOT NULL,
    link character varying(255),
    score double precision,
    rating double precision,
    description text,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:16.93887'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:16.93887'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.hotel;
       public         root    false    7            ?            1259    16887    hotel_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.hotel_id_seq;
       public       root    false    7    200            ?           0    0    hotel_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.hotel_id_seq OWNED BY public.hotel.id;
            public       root    false    201            ?            1259    16889 	   migration    TABLE     g   CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);
    DROP TABLE public.migration;
       public         root    false    7            ?            1259    16892    room    TABLE     ?  CREATE TABLE public.room (
    id integer NOT NULL,
    hotel_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    floor smallint,
    capacity smallint,
    port smallint,
    size smallint,
    free_cancellation boolean DEFAULT false,
    single_bed smallint,
    double_bed smallint,
    state_id smallint DEFAULT 1,
    description text,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.021978'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.021978'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.room;
       public         root    false    7            ?           0    0    COLUMN room.state_id    COMMENT     V   COMMENT ON COLUMN public.room.state_id IS '1available, 2offline, 3reserved, 4rented';
            public       root    false    203            ?            1259    16904    room_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.room_id_seq;
       public       root    false    7    203            ?           0    0    room_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.room_id_seq OWNED BY public.room.id;
            public       root    false    204            ?            1259    16906 
   room_photo    TABLE     ?  CREATE TABLE public.room_photo (
    id integer NOT NULL,
    room_id bigint NOT NULL,
    link character varying(255) NOT NULL,
    "order" integer,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.248073'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.248073'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.room_photo;
       public         root    false    7            ?            1259    16913    room_photo_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.room_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.room_photo_id_seq;
       public       root    false    205    7            ?           0    0    room_photo_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.room_photo_id_seq OWNED BY public.room_photo.id;
            public       root    false    206            ?            1259    16915 
   room_state    TABLE     ?   CREATE TABLE public.room_state (
    id integer NOT NULL,
    name character varying(255),
    deleted boolean DEFAULT false
);
    DROP TABLE public.room_state;
       public         root    false    7            ?            1259    16919    room_state_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.room_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.room_state_id_seq;
       public       root    false    207    7            ?           0    0    room_state_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.room_state_id_seq OWNED BY public.room_state.id;
            public       root    false    208            ?            1259    16921    tenant_room    TABLE     G  CREATE TABLE public.tenant_room (
    id integer NOT NULL,
    room_id integer NOT NULL,
    user_id integer NOT NULL,
    price_pay integer,
    amount_people integer,
    check_in date,
    check_out date,
    observations text,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.095633'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.095633'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public.tenant_room;
       public         root    false    7            ?            1259    16931    tenant_room_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tenant_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tenant_room_id_seq;
       public       root    false    209    7            ?           0    0    tenant_room_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tenant_room_id_seq OWNED BY public.tenant_room.id;
            public       root    false    210            ?            1259    16933    user    TABLE     ?  CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    last_name character varying(255),
    phone character varying(20),
    country character varying(255),
    email character varying(255) NOT NULL,
    password character varying(255) DEFAULT NULL::character varying,
    observations text,
    created_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.060185'::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT '2021-12-28 11:46:17.060185'::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted boolean DEFAULT false
);
    DROP TABLE public."user";
       public         root    false    7            ?            1259    16944    user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       root    false    7    211            ?           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
            public       root    false    212            ?
           2604    16946    additional id    DEFAULT     n   ALTER TABLE ONLY public.additional ALTER COLUMN id SET DEFAULT nextval('public.additional_id_seq'::regclass);
 <   ALTER TABLE public.additional ALTER COLUMN id DROP DEFAULT;
       public       root    false    197    196            ?
           2604    16947    additional_tenant id    DEFAULT     |   ALTER TABLE ONLY public.additional_tenant ALTER COLUMN id SET DEFAULT nextval('public.additional_tenant_id_seq'::regclass);
 C   ALTER TABLE public.additional_tenant ALTER COLUMN id DROP DEFAULT;
       public       root    false    199    198            ?
           2604    16948    hotel id    DEFAULT     d   ALTER TABLE ONLY public.hotel ALTER COLUMN id SET DEFAULT nextval('public.hotel_id_seq'::regclass);
 7   ALTER TABLE public.hotel ALTER COLUMN id DROP DEFAULT;
       public       root    false    201    200            ?
           2604    16949    room id    DEFAULT     b   ALTER TABLE ONLY public.room ALTER COLUMN id SET DEFAULT nextval('public.room_id_seq'::regclass);
 6   ALTER TABLE public.room ALTER COLUMN id DROP DEFAULT;
       public       root    false    204    203                       2604    16950    room_photo id    DEFAULT     n   ALTER TABLE ONLY public.room_photo ALTER COLUMN id SET DEFAULT nextval('public.room_photo_id_seq'::regclass);
 <   ALTER TABLE public.room_photo ALTER COLUMN id DROP DEFAULT;
       public       root    false    206    205                       2604    16951    room_state id    DEFAULT     n   ALTER TABLE ONLY public.room_state ALTER COLUMN id SET DEFAULT nextval('public.room_state_id_seq'::regclass);
 <   ALTER TABLE public.room_state ALTER COLUMN id DROP DEFAULT;
       public       root    false    208    207                       2604    16952    tenant_room id    DEFAULT     p   ALTER TABLE ONLY public.tenant_room ALTER COLUMN id SET DEFAULT nextval('public.tenant_room_id_seq'::regclass);
 =   ALTER TABLE public.tenant_room ALTER COLUMN id DROP DEFAULT;
       public       root    false    210    209                       2604    16953    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       root    false    212    211            ?          0    16856 
   additional 
   TABLE DATA               a   COPY public.additional (id, name, slug, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    196   ?       ?          0    16868    additional_tenant 
   TABLE DATA               v   COPY public.additional_tenant (id, tenant_id, additional_id, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    198          ?          0    16877    hotel 
   TABLE DATA               ?   COPY public.hotel (id, name, phone, email, check_in, check_out, full_address, link, score, rating, description, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    200   y       ?          0    16889 	   migration 
   TABLE DATA               8   COPY public.migration (version, apply_time) FROM stdin;
    public       root    false    202   c        ?          0    16892    room 
   TABLE DATA               ?   COPY public.room (id, hotel_id, name, price, floor, capacity, port, size, free_cancellation, single_bed, double_bed, state_id, description, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    203          ?          0    16906 
   room_photo 
   TABLE DATA               m   COPY public.room_photo (id, room_id, link, "order", created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    205   ?       ?          0    16915 
   room_state 
   TABLE DATA               7   COPY public.room_state (id, name, deleted) FROM stdin;
    public       root    false    207   ?       ?          0    16921    tenant_room 
   TABLE DATA               ?   COPY public.tenant_room (id, room_id, user_id, price_pay, amount_people, check_in, check_out, observations, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    209   ?       ?          0    16933    user 
   TABLE DATA               ?   COPY public."user" (id, name, last_name, phone, country, email, password, observations, created_at, updated_at, deleted_at, deleted) FROM stdin;
    public       root    false    211   P       ?           0    0    additional_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.additional_id_seq', 6, true);
            public       root    false    197            ?           0    0    additional_tenant_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.additional_tenant_id_seq', 7, true);
            public       root    false    199            ?           0    0    hotel_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.hotel_id_seq', 4, true);
            public       root    false    201            ?           0    0    room_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.room_id_seq', 14, true);
            public       root    false    204            ?           0    0    room_photo_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.room_photo_id_seq', 19, true);
            public       root    false    206            ?           0    0    room_state_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.room_state_id_seq', 4, true);
            public       root    false    208            ?           0    0    tenant_room_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tenant_room_id_seq', 3, true);
            public       root    false    210            ?           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 6, true);
            public       root    false    212                       2606    16955    additional additional_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.additional
    ADD CONSTRAINT additional_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.additional DROP CONSTRAINT additional_pkey;
       public         root    false    196                       2606    16957 (   additional_tenant additional_tenant_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.additional_tenant
    ADD CONSTRAINT additional_tenant_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.additional_tenant DROP CONSTRAINT additional_tenant_pkey;
       public         root    false    198                       2606    16959    hotel hotel_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.hotel DROP CONSTRAINT hotel_pkey;
       public         root    false    200                       2606    16961    migration migration_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);
 B   ALTER TABLE ONLY public.migration DROP CONSTRAINT migration_pkey;
       public         root    false    202                       2606    16963    room_photo room_photo_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.room_photo
    ADD CONSTRAINT room_photo_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.room_photo DROP CONSTRAINT room_photo_pkey;
       public         root    false    205                       2606    16965    room room_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.room DROP CONSTRAINT room_pkey;
       public         root    false    203                       2606    16967    room_state room_state_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.room_state
    ADD CONSTRAINT room_state_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.room_state DROP CONSTRAINT room_state_name_key;
       public         root    false    207                       2606    16969    room_state room_state_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.room_state
    ADD CONSTRAINT room_state_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.room_state DROP CONSTRAINT room_state_pkey;
       public         root    false    207                        2606    16971    tenant_room tenant_room_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tenant_room
    ADD CONSTRAINT tenant_room_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tenant_room DROP CONSTRAINT tenant_room_pkey;
       public         root    false    209            "           2606    16973    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public         root    false    211            $           2606    16975    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         root    false    211            %           2606    16976 4   additional_tenant fk-additional_tenant-additional_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.additional_tenant
    ADD CONSTRAINT "fk-additional_tenant-additional_id" FOREIGN KEY (additional_id) REFERENCES public.additional(id);
 `   ALTER TABLE ONLY public.additional_tenant DROP CONSTRAINT "fk-additional_tenant-additional_id";
       public       root    false    196    198    2832            &           2606    16981 0   additional_tenant fk-additional_tenant-tenant_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.additional_tenant
    ADD CONSTRAINT "fk-additional_tenant-tenant_id" FOREIGN KEY (tenant_id) REFERENCES public.tenant_room(id);
 \   ALTER TABLE ONLY public.additional_tenant DROP CONSTRAINT "fk-additional_tenant-tenant_id";
       public       root    false    209    2848    198            '           2606    16986    room fk-hotel-hotel_id    FK CONSTRAINT     x   ALTER TABLE ONLY public.room
    ADD CONSTRAINT "fk-hotel-hotel_id" FOREIGN KEY (hotel_id) REFERENCES public.hotel(id);
 B   ALTER TABLE ONLY public.room DROP CONSTRAINT "fk-hotel-hotel_id";
       public       root    false    203    2836    200            (           2606    16991    room fk-room-state_id    FK CONSTRAINT     |   ALTER TABLE ONLY public.room
    ADD CONSTRAINT "fk-room-state_id" FOREIGN KEY (state_id) REFERENCES public.room_state(id);
 A   ALTER TABLE ONLY public.room DROP CONSTRAINT "fk-room-state_id";
       public       root    false    203    207    2846            )           2606    16996     room_photo fk-room_photo-room_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.room_photo
    ADD CONSTRAINT "fk-room_photo-room_id" FOREIGN KEY (room_id) REFERENCES public.room(id);
 L   ALTER TABLE ONLY public.room_photo DROP CONSTRAINT "fk-room_photo-room_id";
       public       root    false    203    2840    205            *           2606    17001 "   tenant_room fk-tenant-room-room_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tenant_room
    ADD CONSTRAINT "fk-tenant-room-room_id" FOREIGN KEY (room_id) REFERENCES public.room(id);
 N   ALTER TABLE ONLY public.tenant_room DROP CONSTRAINT "fk-tenant-room-room_id";
       public       root    false    203    2840    209            +           2606    17006 "   tenant_room fk-tenant-room-user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tenant_room
    ADD CONSTRAINT "fk-tenant-room-user_id" FOREIGN KEY (user_id) REFERENCES public."user"(id);
 N   ALTER TABLE ONLY public.tenant_room DROP CONSTRAINT "fk-tenant-room-user_id";
       public       root    false    2852    211    209           