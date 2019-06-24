CREATE TABLE public.auth_group
(
    id integer NOT NULL DEFAULT nextval('auth_group_id_seq'::regclass),
    name character varying(80) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT auth_group_pkey PRIMARY KEY (id),
    CONSTRAINT auth_group_name_key UNIQUE (name)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.auth_group
    OWNER to postgres;

CREATE INDEX auth_group_name_a6ea08ec_like
    ON public.auth_group USING btree
    (name COLLATE pg_catalog."default" varchar_pattern_ops)
    TABLESPACE pg_default;

CREATE TABLE public.auth_group_permissions
(
    id integer NOT NULL DEFAULT nextval('auth_group_permissions_id_seq'::regclass),
    group_id integer NOT NULL,
    permission_id integer NOT NULL,
    CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id),
    CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id)
,
    CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id)
        REFERENCES public.auth_permission (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id)
        REFERENCES public.auth_group (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.auth_group_permissions
    OWNER to postgres;

-- Index: auth_group_permissions_group_id_b120cbf9

-- DROP INDEX public.auth_group_permissions_group_id_b120cbf9;

CREATE INDEX auth_group_permissions_group_id_b120cbf9
    ON public.auth_group_permissions USING btree
    (group_id)
    TABLESPACE pg_default;

-- Index: auth_group_permissions_permission_id_84c5c92e

-- DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;

CREATE INDEX auth_group_permissions_permission_id_84c5c92e
    ON public.auth_group_permissions USING btree
    (permission_id)
    TABLESPACE pg_default;

CREATE TABLE public.auth_permission
(
    id integer NOT NULL DEFAULT nextval('auth_permission_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT auth_permission_pkey PRIMARY KEY (id),
    CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename)
,
    CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id)
        REFERENCES public.django_content_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.auth_permission
    OWNER to postgres;

-- Index: auth_permission_content_type_id_2f476e4b

-- DROP INDEX public.auth_permission_content_type_id_2f476e4b;

CREATE INDEX auth_permission_content_type_id_2f476e4b
    ON public.auth_permission USING btree
    (content_type_id)
    TABLESPACE pg_default;

CREATE TABLE public.django_admin_log
(
    id integer NOT NULL DEFAULT nextval('django_admin_log_id_seq'::regclass),
    action_time timestamp with time zone NOT NULL,
    object_id text COLLATE pg_catalog."default",
    object_repr character varying(200) COLLATE pg_catalog."default" NOT NULL,
    action_flag smallint NOT NULL,
    change_message text COLLATE pg_catalog."default" NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_pkey PRIMARY KEY (id),
    CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id)
        REFERENCES public.django_content_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "django_admin_log_user_id_c564eba6_fk_gestionPerfil_usuario_id" FOREIGN KEY (user_id)
        REFERENCES public."gestionPerfil_usuario" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT django_admin_log_action_flag_check CHECK (action_flag >= 0)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.django_admin_log
    OWNER to postgres;

-- Index: django_admin_log_content_type_id_c4bce8eb

-- DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;

CREATE INDEX django_admin_log_content_type_id_c4bce8eb
    ON public.django_admin_log USING btree
    (content_type_id)
    TABLESPACE pg_default;

-- Index: django_admin_log_user_id_c564eba6

-- DROP INDEX public.django_admin_log_user_id_c564eba6;

CREATE INDEX django_admin_log_user_id_c564eba6
    ON public.django_admin_log USING btree
    (user_id)
    TABLESPACE pg_default;

CREATE TABLE public.django_content_type
(
    id integer NOT NULL DEFAULT nextval('django_content_type_id_seq'::regclass),
    app_label character varying(100) COLLATE pg_catalog."default" NOT NULL,
    model character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT django_content_type_pkey PRIMARY KEY (id),
    CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.django_content_type
    OWNER to postgres;

CREATE TABLE public.django_migrations
(
    id integer NOT NULL DEFAULT nextval('django_migrations_id_seq'::regclass),
    app character varying(255) COLLATE pg_catalog."default" NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    applied timestamp with time zone NOT NULL,
    CONSTRAINT django_migrations_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.django_migrations
    OWNER to postgres;

CREATE TABLE public.django_session
(
    session_key character varying(40) COLLATE pg_catalog."default" NOT NULL,
    session_data text COLLATE pg_catalog."default" NOT NULL,
    expire_date timestamp with time zone NOT NULL,
    CONSTRAINT django_session_pkey PRIMARY KEY (session_key)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.django_session
    OWNER to postgres;

-- Index: django_session_expire_date_a5c62663

-- DROP INDEX public.django_session_expire_date_a5c62663;

CREATE INDEX django_session_expire_date_a5c62663
    ON public.django_session USING btree
    (expire_date)
    TABLESPACE pg_default;

-- Index: django_session_session_key_c0390e0f_like

-- DROP INDEX public.django_session_session_key_c0390e0f_like;

CREATE INDEX django_session_session_key_c0390e0f_like
    ON public.django_session USING btree
    (session_key COLLATE pg_catalog."default" varchar_pattern_ops)
    TABLESPACE pg_default;

CREATE TABLE public."gestionPerfil_usuario"
(
    id integer NOT NULL DEFAULT nextval('"gestionPerfil_usuario_id_seq"'::regclass),
    password character varying(128) COLLATE pg_catalog."default" NOT NULL,
    last_login timestamp with time zone,
    correo character varying(100) COLLATE pg_catalog."default" NOT NULL,
    nombre character varying(30) COLLATE pg_catalog."default" NOT NULL,
    apellido character varying(30) COLLATE pg_catalog."default" NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    CONSTRAINT "gestionPerfil_usuario_pkey" PRIMARY KEY (id),
    CONSTRAINT "gestionPerfil_usuario_correo_key" UNIQUE (correo)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."gestionPerfil_usuario"
    OWNER to postgres;

-- Index: gestionPerfil_usuario_correo_bed670df_like

-- DROP INDEX public."gestionPerfil_usuario_correo_bed670df_like";

CREATE INDEX "gestionPerfil_usuario_correo_bed670df_like"
    ON public."gestionPerfil_usuario" USING btree
    (correo COLLATE pg_catalog."default" varchar_pattern_ops)
    TABLESPACE pg_default;

CREATE TABLE public."gestionPerfil_usuario_groups"
(
    id integer NOT NULL DEFAULT nextval('"gestionPerfil_usuario_groups_id_seq"'::regclass),
    usuario_id integer NOT NULL,
    group_id integer NOT NULL,
    CONSTRAINT "gestionPerfil_usuario_groups_pkey" PRIMARY KEY (id),
    CONSTRAINT "gestionPerfil_usuario_groups_usuario_id_group_id_7b7f052d_uniq" UNIQUE (usuario_id, group_id)
,
    CONSTRAINT "gestionPerfil_usuari_usuario_id_a1ac5ed8_fk_gestionPe" FOREIGN KEY (usuario_id)
        REFERENCES public."gestionPerfil_usuario" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "gestionPerfil_usuario_groups_group_id_3333c19b_fk_auth_group_id" FOREIGN KEY (group_id)
        REFERENCES public.auth_group (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."gestionPerfil_usuario_groups"
    OWNER to postgres;

-- Index: gestionPerfil_usuario_groups_group_id_3333c19b

-- DROP INDEX public."gestionPerfil_usuario_groups_group_id_3333c19b";

CREATE INDEX "gestionPerfil_usuario_groups_group_id_3333c19b"
    ON public."gestionPerfil_usuario_groups" USING btree
    (group_id)
    TABLESPACE pg_default;

-- Index: gestionPerfil_usuario_groups_usuario_id_a1ac5ed8

-- DROP INDEX public."gestionPerfil_usuario_groups_usuario_id_a1ac5ed8";

CREATE INDEX "gestionPerfil_usuario_groups_usuario_id_a1ac5ed8"
    ON public."gestionPerfil_usuario_groups" USING btree
    (usuario_id)
    TABLESPACE pg_default;

CREATE TABLE public."gestionPerfil_usuario_user_permissions"
(
    id integer NOT NULL DEFAULT nextval('"gestionPerfil_usuario_user_permissions_id_seq"'::regclass),
    usuario_id integer NOT NULL,
    permission_id integer NOT NULL,
    CONSTRAINT "gestionPerfil_usuario_user_permissions_pkey" PRIMARY KEY (id),
    CONSTRAINT "gestionPerfil_usuario_us_usuario_id_permission_id_2d581168_uniq" UNIQUE (usuario_id, permission_id)
,
    CONSTRAINT "gestionPerfil_usuari_permission_id_ff2a809f_fk_auth_perm" FOREIGN KEY (permission_id)
        REFERENCES public.auth_permission (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "gestionPerfil_usuari_usuario_id_0bbaf8c0_fk_gestionPe" FOREIGN KEY (usuario_id)
        REFERENCES public."gestionPerfil_usuario" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."gestionPerfil_usuario_user_permissions"
    OWNER to postgres;

-- Index: gestionPerfil_usuario_user_permissions_permission_id_ff2a809f

-- DROP INDEX public."gestionPerfil_usuario_user_permissions_permission_id_ff2a809f";

CREATE INDEX "gestionPerfil_usuario_user_permissions_permission_id_ff2a809f"
    ON public."gestionPerfil_usuario_user_permissions" USING btree
    (permission_id)
    TABLESPACE pg_default;

-- Index: gestionPerfil_usuario_user_permissions_usuario_id_0bbaf8c0

-- DROP INDEX public."gestionPerfil_usuario_user_permissions_usuario_id_0bbaf8c0";

CREATE INDEX "gestionPerfil_usuario_user_permissions_usuario_id_0bbaf8c0"
    ON public."gestionPerfil_usuario_user_permissions" USING btree
    (usuario_id)
    TABLESPACE pg_default;