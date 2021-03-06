PGDMP                     	    y            new_db    12.7    12.6 ?                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            #           1262    19046    new_db    DATABASE     d   CREATE DATABASE new_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE new_db;
                postgres    false            ?            1259    19078 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            ?            1259    19076    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            $           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            ?            1259    19088    auth_group_permissions    TABLE     ?   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            ?            1259    19086    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            %           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            ?            1259    19070    auth_permission    TABLE     ?   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            ?            1259    19068    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            &           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            ?            1259    19209    django_admin_log    TABLE     ?  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            ?            1259    19207    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    223            '           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    222            ?            1259    19060    django_content_type    TABLE     ?   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            ?            1259    19058    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            (           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            ?            1259    19049    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            ?            1259    19047    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            )           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            ?            1259    19259    django_q_ormq    TABLE     ?   CREATE TABLE public.django_q_ormq (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    payload text NOT NULL,
    lock timestamp with time zone
);
 !   DROP TABLE public.django_q_ormq;
       public         heap    postgres    false            ?            1259    19257    django_q_ormq_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_q_ormq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.django_q_ormq_id_seq;
       public          postgres    false    228            *           0    0    django_q_ormq_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.django_q_ormq_id_seq OWNED BY public.django_q_ormq.id;
          public          postgres    false    227            ?            1259    19233    django_q_schedule    TABLE       CREATE TABLE public.django_q_schedule (
    id integer NOT NULL,
    func character varying(256) NOT NULL,
    hook character varying(256),
    args text,
    kwargs text,
    schedule_type character varying(1) NOT NULL,
    repeats integer NOT NULL,
    next_run timestamp with time zone,
    task character varying(100),
    name character varying(100),
    minutes smallint,
    cron character varying(100),
    cluster character varying(100),
    CONSTRAINT django_q_schedule_minutes_check CHECK ((minutes >= 0))
);
 %   DROP TABLE public.django_q_schedule;
       public         heap    postgres    false            ?            1259    19231    django_q_schedule_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_q_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_q_schedule_id_seq;
       public          postgres    false    225            +           0    0    django_q_schedule_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_q_schedule_id_seq OWNED BY public.django_q_schedule.id;
          public          postgres    false    224            ?            1259    19244    django_q_task    TABLE     ?  CREATE TABLE public.django_q_task (
    name character varying(100) NOT NULL,
    func character varying(256) NOT NULL,
    hook character varying(256),
    args text,
    kwargs text,
    result text,
    started timestamp with time zone NOT NULL,
    stopped timestamp with time zone NOT NULL,
    success boolean NOT NULL,
    id character varying(32) NOT NULL,
    "group" character varying(100),
    attempt_count integer NOT NULL
);
 !   DROP TABLE public.django_q_task;
       public         heap    postgres    false            ?            1259    19305    django_session    TABLE     ?   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            ?            1259    19286    plans_customerplan    TABLE     ?   CREATE TABLE public.plans_customerplan (
    id bigint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    amount numeric(9,2) NOT NULL,
    is_active boolean NOT NULL,
    customer_id bigint,
    plan_id bigint
);
 &   DROP TABLE public.plans_customerplan;
       public         heap    postgres    false            ?            1259    19284    plans_customerplan_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.plans_customerplan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.plans_customerplan_id_seq;
       public          postgres    false    232            ,           0    0    plans_customerplan_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.plans_customerplan_id_seq OWNED BY public.plans_customerplan.id;
          public          postgres    false    231            ?            1259    19278 
   plans_plan    TABLE     ?   CREATE TABLE public.plans_plan (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    amount numeric(9,2) NOT NULL,
    payment_cycle integer NOT NULL,
    is_cancellable boolean NOT NULL,
    total_valid_months integer NOT NULL
);
    DROP TABLE public.plans_plan;
       public         heap    postgres    false            ?            1259    19276    plans_plan_id_seq    SEQUENCE     z   CREATE SEQUENCE public.plans_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.plans_plan_id_seq;
       public          postgres    false    230            -           0    0    plans_plan_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.plans_plan_id_seq OWNED BY public.plans_plan.id;
          public          postgres    false    229            ?            1259    19151    users_customerphone    TABLE     ?   CREATE TABLE public.users_customerphone (
    id bigint NOT NULL,
    phone_no character varying(11) NOT NULL,
    verified boolean NOT NULL,
    customer_id bigint
);
 '   DROP TABLE public.users_customerphone;
       public         heap    postgres    false            ?            1259    19149    users_customerphone_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_customerphone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.users_customerphone_id_seq;
       public          postgres    false    219            .           0    0    users_customerphone_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.users_customerphone_id_seq OWNED BY public.users_customerphone.id;
          public          postgres    false    218            ?            1259    19122    users_customuser    TABLE     ?  CREATE TABLE public.users_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254),
    phone character varying(11) NOT NULL
);
 $   DROP TABLE public.users_customuser;
       public         heap    postgres    false            ?            1259    19135    users_customuser_groups    TABLE     ?   CREATE TABLE public.users_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);
 +   DROP TABLE public.users_customuser_groups;
       public         heap    postgres    false            ?            1259    19133    users_customuser_groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.users_customuser_groups_id_seq;
       public          postgres    false    215            /           0    0    users_customuser_groups_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.users_customuser_groups_id_seq OWNED BY public.users_customuser_groups.id;
          public          postgres    false    214            ?            1259    19120    users_customuser_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.users_customuser_id_seq;
       public          postgres    false    213            0           0    0    users_customuser_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.users_customuser_id_seq OWNED BY public.users_customuser.id;
          public          postgres    false    212            ?            1259    19143 !   users_customuser_user_permissions    TABLE     ?   CREATE TABLE public.users_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 5   DROP TABLE public.users_customuser_user_permissions;
       public         heap    postgres    false            ?            1259    19141 (   users_customuser_user_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.users_customuser_user_permissions_id_seq;
       public          postgres    false    217            1           0    0 (   users_customuser_user_permissions_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.users_customuser_user_permissions_id_seq OWNED BY public.users_customuser_user_permissions.id;
          public          postgres    false    216            ?            1259    19159    users_otptoken    TABLE       CREATE TABLE public.users_otptoken (
    id bigint NOT NULL,
    otp integer NOT NULL,
    generated_at timestamp with time zone NOT NULL,
    customer_phone_id bigint,
    used boolean NOT NULL,
    CONSTRAINT users_otptoken_otp_check CHECK ((otp >= 0))
);
 "   DROP TABLE public.users_otptoken;
       public         heap    postgres    false            ?            1259    19157    users_otptoken_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.users_otptoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.users_otptoken_id_seq;
       public          postgres    false    221            2           0    0    users_otptoken_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.users_otptoken_id_seq OWNED BY public.users_otptoken.id;
          public          postgres    false    220            "           2604    19081    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            #           2604    19091    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            !           2604    19073    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            *           2604    19212    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223                        2604    19063    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205                       2604    19052    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            .           2604    19262    django_q_ormq id    DEFAULT     t   ALTER TABLE ONLY public.django_q_ormq ALTER COLUMN id SET DEFAULT nextval('public.django_q_ormq_id_seq'::regclass);
 ?   ALTER TABLE public.django_q_ormq ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            ,           2604    19236    django_q_schedule id    DEFAULT     |   ALTER TABLE ONLY public.django_q_schedule ALTER COLUMN id SET DEFAULT nextval('public.django_q_schedule_id_seq'::regclass);
 C   ALTER TABLE public.django_q_schedule ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            0           2604    19289    plans_customerplan id    DEFAULT     ~   ALTER TABLE ONLY public.plans_customerplan ALTER COLUMN id SET DEFAULT nextval('public.plans_customerplan_id_seq'::regclass);
 D   ALTER TABLE public.plans_customerplan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            /           2604    19281    plans_plan id    DEFAULT     n   ALTER TABLE ONLY public.plans_plan ALTER COLUMN id SET DEFAULT nextval('public.plans_plan_id_seq'::regclass);
 <   ALTER TABLE public.plans_plan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            '           2604    19154    users_customerphone id    DEFAULT     ?   ALTER TABLE ONLY public.users_customerphone ALTER COLUMN id SET DEFAULT nextval('public.users_customerphone_id_seq'::regclass);
 E   ALTER TABLE public.users_customerphone ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            $           2604    19125    users_customuser id    DEFAULT     z   ALTER TABLE ONLY public.users_customuser ALTER COLUMN id SET DEFAULT nextval('public.users_customuser_id_seq'::regclass);
 B   ALTER TABLE public.users_customuser ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            %           2604    19138    users_customuser_groups id    DEFAULT     ?   ALTER TABLE ONLY public.users_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.users_customuser_groups_id_seq'::regclass);
 I   ALTER TABLE public.users_customuser_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            &           2604    19146 $   users_customuser_user_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.users_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_customuser_user_permissions_id_seq'::regclass);
 S   ALTER TABLE public.users_customuser_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            (           2604    19162    users_otptoken id    DEFAULT     v   ALTER TABLE ONLY public.users_otptoken ALTER COLUMN id SET DEFAULT nextval('public.users_otptoken_id_seq'::regclass);
 @   ALTER TABLE public.users_otptoken ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221                      0    19078 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   ??                 0    19088    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   ??                 0    19070    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   ?                 0    19209    django_admin_log 
   TABLE DATA           ?   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    223   ~?                 0    19060    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   ??       ?          0    19049    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   ??                 0    19259    django_q_ormq 
   TABLE DATA           ?   COPY public.django_q_ormq (id, key, payload, lock) FROM stdin;
    public          postgres    false    228   ??                 0    19233    django_q_schedule 
   TABLE DATA           ?   COPY public.django_q_schedule (id, func, hook, args, kwargs, schedule_type, repeats, next_run, task, name, minutes, cron, cluster) FROM stdin;
    public          postgres    false    225   ??                 0    19244    django_q_task 
   TABLE DATA           ?   COPY public.django_q_task (name, func, hook, args, kwargs, result, started, stopped, success, id, "group", attempt_count) FROM stdin;
    public          postgres    false    226   ?                 0    19305    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    233   ,?                 0    19286    plans_customerplan 
   TABLE DATA           o   COPY public.plans_customerplan (id, start_date, end_date, amount, is_active, customer_id, plan_id) FROM stdin;
    public          postgres    false    232   G?                 0    19278 
   plans_plan 
   TABLE DATA           i   COPY public.plans_plan (id, name, amount, payment_cycle, is_cancellable, total_valid_months) FROM stdin;
    public          postgres    false    230   d?                 0    19151    users_customerphone 
   TABLE DATA           R   COPY public.users_customerphone (id, phone_no, verified, customer_id) FROM stdin;
    public          postgres    false    219   ??       	          0    19122    users_customuser 
   TABLE DATA           ?   COPY public.users_customuser (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email, phone) FROM stdin;
    public          postgres    false    213   ??                 0    19135    users_customuser_groups 
   TABLE DATA           N   COPY public.users_customuser_groups (id, customuser_id, group_id) FROM stdin;
    public          postgres    false    215   ??                 0    19143 !   users_customuser_user_permissions 
   TABLE DATA           ]   COPY public.users_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
    public          postgres    false    217   ??                 0    19159    users_otptoken 
   TABLE DATA           X   COPY public.users_otptoken (id, otp, generated_at, customer_phone_id, used) FROM stdin;
    public          postgres    false    221   ??       3           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    208            4           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            5           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);
          public          postgres    false    206            6           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);
          public          postgres    false    222            7           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);
          public          postgres    false    204            8           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 36, true);
          public          postgres    false    202            9           0    0    django_q_ormq_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.django_q_ormq_id_seq', 1, false);
          public          postgres    false    227            :           0    0    django_q_schedule_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_q_schedule_id_seq', 1, true);
          public          postgres    false    224            ;           0    0    plans_customerplan_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.plans_customerplan_id_seq', 1, false);
          public          postgres    false    231            <           0    0    plans_plan_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.plans_plan_id_seq', 3, true);
          public          postgres    false    229            =           0    0    users_customerphone_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.users_customerphone_id_seq', 1, false);
          public          postgres    false    218            >           0    0    users_customuser_groups_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.users_customuser_groups_id_seq', 1, false);
          public          postgres    false    214            ?           0    0    users_customuser_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.users_customuser_id_seq', 1, true);
          public          postgres    false    212            @           0    0 (   users_customuser_user_permissions_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.users_customuser_user_permissions_id_seq', 1, false);
          public          postgres    false    216            A           0    0    users_otptoken_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.users_otptoken_id_seq', 1, false);
          public          postgres    false    220            >           2606    19118    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            C           2606    19104 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            F           2606    19093 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            @           2606    19083    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            9           2606    19095 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            ;           2606    19075 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            `           2606    19218 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    223            4           2606    19067 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            6           2606    19065 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            2           2606    19057 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            h           2606    19267     django_q_ormq django_q_ormq_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.django_q_ormq
    ADD CONSTRAINT django_q_ormq_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.django_q_ormq DROP CONSTRAINT django_q_ormq_pkey;
       public            postgres    false    228            c           2606    19241 (   django_q_schedule django_q_schedule_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_q_schedule
    ADD CONSTRAINT django_q_schedule_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_q_schedule DROP CONSTRAINT django_q_schedule_pkey;
       public            postgres    false    225            f           2606    19254     django_q_task django_q_task_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.django_q_task
    ADD CONSTRAINT django_q_task_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.django_q_task DROP CONSTRAINT django_q_task_pkey;
       public            postgres    false    226            q           2606    19312 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    233            m           2606    19291 *   plans_customerplan plans_customerplan_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.plans_customerplan
    ADD CONSTRAINT plans_customerplan_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.plans_customerplan DROP CONSTRAINT plans_customerplan_pkey;
       public            postgres    false    232            j           2606    19283    plans_plan plans_plan_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.plans_plan
    ADD CONSTRAINT plans_plan_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.plans_plan DROP CONSTRAINT plans_plan_pkey;
       public            postgres    false    230            Z           2606    19156 ,   users_customerphone users_customerphone_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.users_customerphone
    ADD CONSTRAINT users_customerphone_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.users_customerphone DROP CONSTRAINT users_customerphone_pkey;
       public            postgres    false    219            N           2606    19168 T   users_customuser_groups users_customuser_groups_customuser_id_group_id_76b619e3_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.users_customuser_groups
    ADD CONSTRAINT users_customuser_groups_customuser_id_group_id_76b619e3_uniq UNIQUE (customuser_id, group_id);
 ~   ALTER TABLE ONLY public.users_customuser_groups DROP CONSTRAINT users_customuser_groups_customuser_id_group_id_76b619e3_uniq;
       public            postgres    false    215    215            Q           2606    19140 4   users_customuser_groups users_customuser_groups_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.users_customuser_groups
    ADD CONSTRAINT users_customuser_groups_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.users_customuser_groups DROP CONSTRAINT users_customuser_groups_pkey;
       public            postgres    false    215            I           2606    19132 +   users_customuser users_customuser_phone_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.users_customuser
    ADD CONSTRAINT users_customuser_phone_key UNIQUE (phone);
 U   ALTER TABLE ONLY public.users_customuser DROP CONSTRAINT users_customuser_phone_key;
       public            postgres    false    213            K           2606    19130 &   users_customuser users_customuser_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.users_customuser
    ADD CONSTRAINT users_customuser_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.users_customuser DROP CONSTRAINT users_customuser_pkey;
       public            postgres    false    213            S           2606    19182 a   users_customuser_user_permissions users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.users_customuser_user_permissions
    ADD CONSTRAINT users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq UNIQUE (customuser_id, permission_id);
 ?   ALTER TABLE ONLY public.users_customuser_user_permissions DROP CONSTRAINT users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq;
       public            postgres    false    217    217            W           2606    19148 H   users_customuser_user_permissions users_customuser_user_permissions_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.users_customuser_user_permissions
    ADD CONSTRAINT users_customuser_user_permissions_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.users_customuser_user_permissions DROP CONSTRAINT users_customuser_user_permissions_pkey;
       public            postgres    false    217            ]           2606    19165 "   users_otptoken users_otptoken_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.users_otptoken
    ADD CONSTRAINT users_otptoken_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.users_otptoken DROP CONSTRAINT users_otptoken_pkey;
       public            postgres    false    221            <           1259    19119    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            A           1259    19115 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            D           1259    19116 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            7           1259    19101 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            ^           1259    19229 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    223            a           1259    19230 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    223            d           1259    19255    django_q_task_id_32882367_like    INDEX     j   CREATE INDEX django_q_task_id_32882367_like ON public.django_q_task USING btree (id varchar_pattern_ops);
 2   DROP INDEX public.django_q_task_id_32882367_like;
       public            postgres    false    226            o           1259    19314 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    233            r           1259    19313 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    233            k           1259    19302 '   plans_customerplan_customer_id_bd16e5a0    INDEX     m   CREATE INDEX plans_customerplan_customer_id_bd16e5a0 ON public.plans_customerplan USING btree (customer_id);
 ;   DROP INDEX public.plans_customerplan_customer_id_bd16e5a0;
       public            postgres    false    232            n           1259    19303 #   plans_customerplan_plan_id_dae57fae    INDEX     e   CREATE INDEX plans_customerplan_plan_id_dae57fae ON public.plans_customerplan USING btree (plan_id);
 7   DROP INDEX public.plans_customerplan_plan_id_dae57fae;
       public            postgres    false    232            X           1259    19200 (   users_customerphone_customer_id_10b8669f    INDEX     o   CREATE INDEX users_customerphone_customer_id_10b8669f ON public.users_customerphone USING btree (customer_id);
 <   DROP INDEX public.users_customerphone_customer_id_10b8669f;
       public            postgres    false    219            L           1259    19179 .   users_customuser_groups_customuser_id_958147bf    INDEX     {   CREATE INDEX users_customuser_groups_customuser_id_958147bf ON public.users_customuser_groups USING btree (customuser_id);
 B   DROP INDEX public.users_customuser_groups_customuser_id_958147bf;
       public            postgres    false    215            O           1259    19180 )   users_customuser_groups_group_id_01390b14    INDEX     q   CREATE INDEX users_customuser_groups_group_id_01390b14 ON public.users_customuser_groups USING btree (group_id);
 =   DROP INDEX public.users_customuser_groups_group_id_01390b14;
       public            postgres    false    215            G           1259    19166 $   users_customuser_phone_2cdad44c_like    INDEX     v   CREATE INDEX users_customuser_phone_2cdad44c_like ON public.users_customuser USING btree (phone varchar_pattern_ops);
 8   DROP INDEX public.users_customuser_phone_2cdad44c_like;
       public            postgres    false    213            T           1259    19193 8   users_customuser_user_permissions_customuser_id_5771478b    INDEX     ?   CREATE INDEX users_customuser_user_permissions_customuser_id_5771478b ON public.users_customuser_user_permissions USING btree (customuser_id);
 L   DROP INDEX public.users_customuser_user_permissions_customuser_id_5771478b;
       public            postgres    false    217            U           1259    19194 8   users_customuser_user_permissions_permission_id_baaa2f74    INDEX     ?   CREATE INDEX users_customuser_user_permissions_permission_id_baaa2f74 ON public.users_customuser_user_permissions USING btree (permission_id);
 L   DROP INDEX public.users_customuser_user_permissions_permission_id_baaa2f74;
       public            postgres    false    217            [           1259    19206 )   users_otptoken_customer_phone_id_cdfc9ef8    INDEX     q   CREATE INDEX users_otptoken_customer_phone_id_cdfc9ef8 ON public.users_otptoken USING btree (customer_phone_id);
 =   DROP INDEX public.users_otptoken_customer_phone_id_cdfc9ef8;
       public            postgres    false    221            u           2606    19110 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    211    207    3131            t           2606    19105 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3136    211    209            s           2606    19096 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    205    207    3126            |           2606    19219 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    205    3126    223            }           2606    19224 I   django_admin_log django_admin_log_user_id_c564eba6_fk_users_customuser_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_customuser_id FOREIGN KEY (user_id) REFERENCES public.users_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_customuser_id;
       public          postgres    false    223    3147    213            ~           2606    19292 Q   plans_customerplan plans_customerplan_customer_id_bd16e5a0_fk_users_customuser_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.plans_customerplan
    ADD CONSTRAINT plans_customerplan_customer_id_bd16e5a0_fk_users_customuser_id FOREIGN KEY (customer_id) REFERENCES public.users_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.plans_customerplan DROP CONSTRAINT plans_customerplan_customer_id_bd16e5a0_fk_users_customuser_id;
       public          postgres    false    232    3147    213                       2606    19297 G   plans_customerplan plans_customerplan_plan_id_dae57fae_fk_plans_plan_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.plans_customerplan
    ADD CONSTRAINT plans_customerplan_plan_id_dae57fae_fk_plans_plan_id FOREIGN KEY (plan_id) REFERENCES public.plans_plan(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.plans_customerplan DROP CONSTRAINT plans_customerplan_plan_id_dae57fae_fk_plans_plan_id;
       public          postgres    false    3178    230    232            z           2606    19195 S   users_customerphone users_customerphone_customer_id_10b8669f_fk_users_customuser_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_customerphone
    ADD CONSTRAINT users_customerphone_customer_id_10b8669f_fk_users_customuser_id FOREIGN KEY (customer_id) REFERENCES public.users_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.users_customerphone DROP CONSTRAINT users_customerphone_customer_id_10b8669f_fk_users_customuser_id;
       public          postgres    false    213    219    3147            v           2606    19169 P   users_customuser_groups users_customuser_gro_customuser_id_958147bf_fk_users_cus    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_customuser_groups
    ADD CONSTRAINT users_customuser_gro_customuser_id_958147bf_fk_users_cus FOREIGN KEY (customuser_id) REFERENCES public.users_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.users_customuser_groups DROP CONSTRAINT users_customuser_gro_customuser_id_958147bf_fk_users_cus;
       public          postgres    false    213    3147    215            w           2606    19174 R   users_customuser_groups users_customuser_groups_group_id_01390b14_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_customuser_groups
    ADD CONSTRAINT users_customuser_groups_group_id_01390b14_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.users_customuser_groups DROP CONSTRAINT users_customuser_groups_group_id_01390b14_fk_auth_group_id;
       public          postgres    false    209    3136    215            x           2606    19183 Z   users_customuser_user_permissions users_customuser_use_customuser_id_5771478b_fk_users_cus    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_customuser_user_permissions
    ADD CONSTRAINT users_customuser_use_customuser_id_5771478b_fk_users_cus FOREIGN KEY (customuser_id) REFERENCES public.users_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.users_customuser_user_permissions DROP CONSTRAINT users_customuser_use_customuser_id_5771478b_fk_users_cus;
       public          postgres    false    213    217    3147            y           2606    19188 Z   users_customuser_user_permissions users_customuser_use_permission_id_baaa2f74_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_customuser_user_permissions
    ADD CONSTRAINT users_customuser_use_permission_id_baaa2f74_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.users_customuser_user_permissions DROP CONSTRAINT users_customuser_use_permission_id_baaa2f74_fk_auth_perm;
       public          postgres    false    207    3131    217            {           2606    19201 E   users_otptoken users_otptoken_customer_phone_id_cdfc9ef8_fk_users_cus    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_otptoken
    ADD CONSTRAINT users_otptoken_customer_phone_id_cdfc9ef8_fk_users_cus FOREIGN KEY (customer_phone_id) REFERENCES public.users_customerphone(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.users_otptoken DROP CONSTRAINT users_otptoken_customer_phone_id_cdfc9ef8_fk_users_cus;
       public          postgres    false    221    3162    219                  x?????? ? ?            x?????? ? ?         ]  x?m?ˎ?0E??W???U??H??v??tU?)`x???~?vb;?#Ήt?u??????j????????ۤf]?Yװ? ????NQXb0?q??5?% ????¶Ce0??zNӳ?Lj\?g)?@??E?)?{eEE???n??>??`r?o?????'/BR???!$c?m?????y??d??)@?J[Ŧ?ԉ`?R|)?"?fш_?^????nK??M?R???M:2Fz?N??X$F??Fs??[??m????M`*????? AxI?`Ս???;g.?͍P??J???gT"vg?u8#??;!~!???~???t????kX?\Eb?ͤʋ$I?IɁ"S????:s???~?\Ņv?P@?? ?I ??m?y9???SCu??qs???Gnǽ?#qo?#?騵t@?pN?{?p?Һ&???Ӥ??LT????????О???ӞƘ?S? >)۷-T??6?!??	?AB?????r~VO??g?c--????C?N`U""??+2??8N??R????XZB?]??lK?ط??*3?o??E?hl?g9Q????Ç?_m?rQ~? ???~?l?Yd&?p?l??7k??T,?         [   x?3?4202?54?54Q00?20?26?3?0?j?qr?$???$g륤??&??????V????S?bJV
յ???????\1z\\\ ???         ?   x?U???0?ϻc,???bbX?B???x{??e3?ef3
tc???[r1LX?N?O??O?NK?????'??@hi?W??Pȱ$??????(???u?}????:?/???~??*h^ڵ?Aꎚ4?b?QK?괁?6C
9T??ZT??8??D|wb!      ?   ?  x????n?0??????U+???ϲ?e%n?.`
?j?~?&%???$???3?g8?b?B??W?c\?V?????'??H?"?33?q???(?????]p???&l??UVd??1????N?Y!f:_?л.?M5Ulˉ??????????R??(9??5?????J?LQ3E,)?Qʉ]vm1T??D?~H?????c$ZQ f?(???????(???e;?X???}-????٧?Ο?.?}?]??_?N[?3?lƙMk?y??A,$?I??C?4?zB?7
?u???=?1`?????#???????????F9?3gp??k??ږ?\Nm?C?>0?(???h(???j?P????s8)^????S;1?dbA??<s??$̟R???_??-V???qJ??`?p???Kt????/QG???T;2?Lq?@??& ?m?aE????G?M???R:?? ?J'0??	?6h?v?+?\?jf?`?,Jm.	jA0ģ??m??ρ\??}???QdS????̇*?(??=??Pf:T?v&?q??,?&AW?ufI??`" ?@o?ȝJQ?Wɣ=?  ???NƘi??UM?$;?6???~@W!???9?Rh?D?l?A?i??UA????cM_?zh)m?#?W??CW????#h???inM??g[???6y?u???5O?T???Ht1u)?m޹?K?u????????<g|            x?????? ? ?         \   x?3?,?I?+?+I,?.?KIM)M.????K??????2t dHQi*'???!??????????????????????H? ?`????? ?39            x?????? ? ?           x???n?0  ?g???/??`??2?s?b??V,???_?sJfv?X???}[u?Tk7?G?????????{??y?È?.?????&}"'ҥ?=??A????*e?????;20???Ͱ2U??@5=?^KX????v??j9j{W&n?>?2??ψlFA?????=%?u????tF?ļ<??4?8????{?ۢ??A?g~??Tڟ??????[<Y????5?s??? ??`??7?,?Yku?5????R???`z            x?????? ? ?         K   x?3?t??OJ??K-Qp*?ϫJ?450?30?46?L?44?2BR??Y?Z?in???I?{~N
PnD	HA? V?            x?????? ? ?      	   ?   x?]??
?@????S?p?9g.?Т?Y?PP"D&f?E?$??g?~?w?G~+J:?Ց??HC?%?yԾZ?j6???O.?&[?^???j\???
ύ?k??%&?4???2?,?;???`?? %-?O~43?u???B?Ɵ?"?P# y?g???I,?            x?????? ? ?            x?????? ? ?            x?????? ? ?     