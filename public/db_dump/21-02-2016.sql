PGDMP     5                    t            hotel    9.5rc1    9.5rc1 _   :
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ;
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            <
           1262    16393    hotel    DATABASE     �   CREATE DATABASE hotel WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE hotel;
             postgres    false            =
           1262    16393    hotel    COMMENT     t   COMMENT ON DATABASE hotel IS '- how to set autoincrement

SELECT setval(''[TABLE_NAME]_id_seq'',[NEXT_ID],false);';
                  postgres    false    2620                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            >
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            ?
           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6            �            3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            @
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    254            �            1255    16394    hash_pwd_trigg_function()    FUNCTION     �   CREATE FUNCTION hash_pwd_trigg_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	NEW.password = md5(NEW.password);
	RETURN NEW;

END;
$$;
 0   DROP FUNCTION public.hash_pwd_trigg_function();
       public       postgres    false    6    254                        1255    16395    res_num_trigg_func()    FUNCTION     �   CREATE FUNCTION res_num_trigg_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.reservation_id = lpad((SELECT currval('reservations_id_seq'))::text, 10,'0');
RETURN NEW;
END
$$;
 +   DROP FUNCTION public.res_num_trigg_func();
       public       postgres    false    254    6            �            1259    16396 	   attribute    TABLE     L  CREATE TABLE attribute (
    id integer NOT NULL,
    code character varying(20),
    label character varying(50),
    type character varying(20),
    sort_order integer,
    unit character varying(20),
    "unique" boolean DEFAULT false NOT NULL,
    nullable boolean DEFAULT true NOT NULL,
    scope integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.attribute;
       public         postgres    false    6            �            1259    16402    attribute_id_seq    SEQUENCE     r   CREATE SEQUENCE attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.attribute_id_seq;
       public       postgres    false    6    180            A
           0    0    attribute_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE attribute_id_seq OWNED BY attribute.id;
            public       postgres    false    181            �            1259    16404    attribute_option_values    TABLE     �   CREATE TABLE attribute_option_values (
    id integer NOT NULL,
    attribute_id integer,
    value integer,
    text character varying(50)
);
 +   DROP TABLE public.attribute_option_values;
       public         postgres    false    6            �            1259    16407    attribute_option_values_id_seq    SEQUENCE     �   CREATE SEQUENCE attribute_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.attribute_option_values_id_seq;
       public       postgres    false    182    6            B
           0    0    attribute_option_values_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE attribute_option_values_id_seq OWNED BY attribute_option_values.id;
            public       postgres    false    183            �            1259    16409    business    TABLE     >  CREATE TABLE business (
    id integer NOT NULL,
    name character varying(100),
    description text,
    company_name character varying(100),
    address text,
    phone character varying(50),
    email character varying,
    contact_first_name character varying(50),
    contact_last_name character varying(50)
);
    DROP TABLE public.business;
       public         postgres    false    6            �            1259    16415    business_id_seq    SEQUENCE     q   CREATE SEQUENCE business_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.business_id_seq;
       public       postgres    false    6    184            C
           0    0    business_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE business_id_seq OWNED BY business.id;
            public       postgres    false    185            �            1259    16417 
   categories    TABLE     �   CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(100),
    description text,
    parent_id integer
);
    DROP TABLE public.categories;
       public         postgres    false    6            �            1259    16423    categories_id_seq    SEQUENCE     s   CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public       postgres    false    6    186            D
           0    0    categories_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE categories_id_seq OWNED BY categories.id;
            public       postgres    false    187            �            1259    16425    clients    TABLE       CREATE TABLE clients (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100),
    address1 character varying(100),
    address2 character varying(100),
    city character varying(100),
    zipcode character varying(20),
    country character varying(10),
    phone character varying(100),
    mobile character varying(100),
    fax character varying(100),
    email character varying(255),
    title character(4),
    guest_class character varying(10),
    title_id integer
);
    DROP TABLE public.clients;
       public         postgres    false    6            �            1259    16431    clients_id_seq    SEQUENCE     p   CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.clients_id_seq;
       public       postgres    false    188    6            E
           0    0    clients_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE clients_id_seq OWNED BY clients.id;
            public       postgres    false    189            �            1259    16433    entity    TABLE     �   CREATE TABLE entity (
    id integer NOT NULL,
    definition_id integer NOT NULL,
    status character varying,
    guid character varying(10),
    status_id integer
);
    DROP TABLE public.entity;
       public         postgres    false    6            F
           0    0    COLUMN entity.guid    COMMENT     E   COMMENT ON COLUMN entity.guid IS 'ovo neka bude broj sobe, za sada';
            public       postgres    false    190            �            1259    16439    entity_category    TABLE     j   CREATE TABLE entity_category (
    id integer NOT NULL,
    entity_id integer,
    category_id integer
);
 #   DROP TABLE public.entity_category;
       public         postgres    false    6            �            1259    16442    entity_category_id_seq    SEQUENCE     x   CREATE SEQUENCE entity_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.entity_category_id_seq;
       public       postgres    false    191    6            G
           0    0    entity_category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE entity_category_id_seq OWNED BY entity_category.id;
            public       postgres    false    192            �            1259    16444    entity_definition    TABLE     �   CREATE TABLE entity_definition (
    id integer NOT NULL,
    entity_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10),
    description text,
    price numeric(10,2),
    pax smallint DEFAULT 1
);
 %   DROP TABLE public.entity_definition;
       public         postgres    false    6            H
           0    0    TABLE entity_definition    COMMENT     �   COMMENT ON TABLE entity_definition IS ' - za demo verziju ova tabela ce sadrzati samo tip sobe (Single,Double, Suite...)
- kolona price predstavlja cenu na dan';
            public       postgres    false    193            I
           0    0    COLUMN entity_definition.pax    COMMENT     �   COMMENT ON COLUMN entity_definition.pax IS ' - reference for PAX system;
- for now it will represent maximum number of persons for this type';
            public       postgres    false    193            �            1259    16451    entity_definition_id_seq    SEQUENCE     z   CREATE SEQUENCE entity_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.entity_definition_id_seq;
       public       postgres    false    193    6            J
           0    0    entity_definition_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE entity_definition_id_seq OWNED BY entity_definition.id;
            public       postgres    false    194            �            1259    16453    entity_definition_value_boolean    TABLE     �   CREATE TABLE entity_definition_value_boolean (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value boolean
);
 3   DROP TABLE public.entity_definition_value_boolean;
       public         postgres    false    6            �            1259    16456 !   entity_definition_value_character    TABLE     �   CREATE TABLE entity_definition_value_character (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value character varying(255)
);
 5   DROP TABLE public.entity_definition_value_character;
       public         postgres    false    6            �            1259    16459 (   entity_definition_value_character_id_seq    SEQUENCE     �   CREATE SEQUENCE entity_definition_value_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.entity_definition_value_character_id_seq;
       public       postgres    false    6    196            K
           0    0 (   entity_definition_value_character_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE entity_definition_value_character_id_seq OWNED BY entity_definition_value_character.id;
            public       postgres    false    197            �            1259    16461    entity_value_boolean_id_seq    SEQUENCE     }   CREATE SEQUENCE entity_value_boolean_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.entity_value_boolean_id_seq;
       public       postgres    false    6    195            L
           0    0    entity_value_boolean_id_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE entity_value_boolean_id_seq OWNED BY entity_definition_value_boolean.id;
            public       postgres    false    198            �            1259    16463    entity_definition_value_double    TABLE     �   CREATE TABLE entity_definition_value_double (
    id integer DEFAULT nextval('entity_value_boolean_id_seq'::regclass) NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value double precision
);
 2   DROP TABLE public.entity_definition_value_double;
       public         postgres    false    198    6            �            1259    16467    entity_definition_value_integer    TABLE     �   CREATE TABLE entity_definition_value_integer (
    id integer DEFAULT nextval('entity_value_boolean_id_seq'::regclass) NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value integer
);
 3   DROP TABLE public.entity_definition_value_integer;
       public         postgres    false    198    6            �            1259    16471    entity_definition_value_select    TABLE     �   CREATE TABLE entity_definition_value_select (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value integer
);
 2   DROP TABLE public.entity_definition_value_select;
       public         postgres    false    6            �            1259    16474 %   entity_definition_value_select_id_seq    SEQUENCE     �   CREATE SEQUENCE entity_definition_value_select_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.entity_definition_value_select_id_seq;
       public       postgres    false    6    201            M
           0    0 %   entity_definition_value_select_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE entity_definition_value_select_id_seq OWNED BY entity_definition_value_select.id;
            public       postgres    false    202            �            1259    16476    entity_definition_value_text    TABLE     �   CREATE TABLE entity_definition_value_text (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value text
);
 0   DROP TABLE public.entity_definition_value_text;
       public         postgres    false    6            �            1259    16482 #   entity_definition_value_text_id_seq    SEQUENCE     �   CREATE SEQUENCE entity_definition_value_text_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.entity_definition_value_text_id_seq;
       public       postgres    false    6    203            N
           0    0 #   entity_definition_value_text_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE entity_definition_value_text_id_seq OWNED BY entity_definition_value_text.id;
            public       postgres    false    204            �            1259    16484 !   entity_definition_value_timestamp    TABLE     �   CREATE TABLE entity_definition_value_timestamp (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value timestamp without time zone
);
 5   DROP TABLE public.entity_definition_value_timestamp;
       public         postgres    false    6            �            1259    16487    entity_id_seq    SEQUENCE     o   CREATE SEQUENCE entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.entity_id_seq;
       public       postgres    false    190    6            O
           0    0    entity_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE entity_id_seq OWNED BY entity.id;
            public       postgres    false    206            �            1259    16489    entity_type    TABLE     �   CREATE TABLE entity_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    time_resolution integer DEFAULT 0
);
    DROP TABLE public.entity_type;
       public         postgres    false    6            P
           0    0    TABLE entity_type    COMMENT     6   COMMENT ON TABLE entity_type IS '- komentar ovde...';
            public       postgres    false    207            �            1259    16496    entity_type_attribute    TABLE     �   CREATE TABLE entity_type_attribute (
    id integer NOT NULL,
    entity_type_id integer NOT NULL,
    attribute_id integer NOT NULL
);
 )   DROP TABLE public.entity_type_attribute;
       public         postgres    false    6            �            1259    16499    entity_type_attribute_id_seq    SEQUENCE     ~   CREATE SEQUENCE entity_type_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.entity_type_attribute_id_seq;
       public       postgres    false    6    208            Q
           0    0    entity_type_attribute_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE entity_type_attribute_id_seq OWNED BY entity_type_attribute.id;
            public       postgres    false    209            �            1259    16501    entity_type_id_seq    SEQUENCE     t   CREATE SEQUENCE entity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.entity_type_id_seq;
       public       postgres    false    207    6            R
           0    0    entity_type_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE entity_type_id_seq OWNED BY entity_type.id;
            public       postgres    false    210            �            1259    16503    entity_value_boolean    TABLE     �   CREATE TABLE entity_value_boolean (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value boolean
);
 (   DROP TABLE public.entity_value_boolean;
       public         postgres    false    6            �            1259    16506    entity_value_boolean_id_seq1    SEQUENCE     ~   CREATE SEQUENCE entity_value_boolean_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.entity_value_boolean_id_seq1;
       public       postgres    false    211    6            S
           0    0    entity_value_boolean_id_seq1    SEQUENCE OWNED BY     N   ALTER SEQUENCE entity_value_boolean_id_seq1 OWNED BY entity_value_boolean.id;
            public       postgres    false    212            �            1259    16508    entity_value_character    TABLE     �   CREATE TABLE entity_value_character (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value character varying(100)
);
 *   DROP TABLE public.entity_value_character;
       public         postgres    false    6            �            1259    16511    entity_value_character_id_seq    SEQUENCE        CREATE SEQUENCE entity_value_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.entity_value_character_id_seq;
       public       postgres    false    213    6            T
           0    0    entity_value_character_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE entity_value_character_id_seq OWNED BY entity_value_character.id;
            public       postgres    false    214            �            1259    16513    entity_value_double    TABLE     �   CREATE TABLE entity_value_double (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value double precision
);
 '   DROP TABLE public.entity_value_double;
       public         postgres    false    6            �            1259    16516    entity_value_double_id_seq    SEQUENCE     |   CREATE SEQUENCE entity_value_double_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.entity_value_double_id_seq;
       public       postgres    false    215    6            U
           0    0    entity_value_double_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE entity_value_double_id_seq OWNED BY entity_value_double.id;
            public       postgres    false    216            �            1259    16518    entity_value_integer    TABLE     �   CREATE TABLE entity_value_integer (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value integer
);
 (   DROP TABLE public.entity_value_integer;
       public         postgres    false    6            �            1259    16521    entity_value_integer_id_seq    SEQUENCE     }   CREATE SEQUENCE entity_value_integer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.entity_value_integer_id_seq;
       public       postgres    false    6    217            V
           0    0    entity_value_integer_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE entity_value_integer_id_seq OWNED BY entity_value_integer.id;
            public       postgres    false    218            �            1259    16523    entity_value_select    TABLE     �   CREATE TABLE entity_value_select (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value integer
);
 '   DROP TABLE public.entity_value_select;
       public         postgres    false    6            W
           0    0 '   COLUMN entity_value_select.attribute_id    COMMENT     ;   COMMENT ON COLUMN entity_value_select.attribute_id IS '
';
            public       postgres    false    219            �            1259    16526    entity_value_select_id_seq    SEQUENCE     |   CREATE SEQUENCE entity_value_select_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.entity_value_select_id_seq;
       public       postgres    false    6    219            X
           0    0    entity_value_select_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE entity_value_select_id_seq OWNED BY entity_value_select.id;
            public       postgres    false    220            �            1259    16528    entity_value_text    TABLE     }   CREATE TABLE entity_value_text (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value text
);
 %   DROP TABLE public.entity_value_text;
       public         postgres    false    6            Y
           0    0 %   COLUMN entity_value_text.attribute_id    COMMENT     9   COMMENT ON COLUMN entity_value_text.attribute_id IS ' ';
            public       postgres    false    221            �            1259    16534    entity_value_text_id_seq    SEQUENCE     z   CREATE SEQUENCE entity_value_text_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.entity_value_text_id_seq;
       public       postgres    false    221    6            Z
           0    0    entity_value_text_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE entity_value_text_id_seq OWNED BY entity_value_text.id;
            public       postgres    false    222            �            1259    16536    entity_value_timestamp    TABLE     �   CREATE TABLE entity_value_timestamp (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value timestamp without time zone
);
 *   DROP TABLE public.entity_value_timestamp;
       public         postgres    false    6            �            1259    16539    entity_value_timestamp_id_seq    SEQUENCE        CREATE SEQUENCE entity_value_timestamp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.entity_value_timestamp_id_seq;
       public       postgres    false    223    6            [
           0    0    entity_value_timestamp_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE entity_value_timestamp_id_seq OWNED BY entity_value_timestamp.id;
            public       postgres    false    224            �            1259    16541    features    TABLE     l   CREATE TABLE features (
    id integer NOT NULL,
    name character varying(100)[],
    description text
);
    DROP TABLE public.features;
       public         postgres    false    6            �            1259    16547    features_entity_definitions    TABLE     �   CREATE TABLE features_entity_definitions (
    id integer NOT NULL,
    feature_id integer,
    entity_definition_id integer
);
 /   DROP TABLE public.features_entity_definitions;
       public         postgres    false    6            �            1259    16550 "   features_entity_definitions_id_seq    SEQUENCE     �   CREATE SEQUENCE features_entity_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.features_entity_definitions_id_seq;
       public       postgres    false    226    6            \
           0    0 "   features_entity_definitions_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE features_entity_definitions_id_seq OWNED BY features_entity_definitions.id;
            public       postgres    false    227            �            1259    16552    features_id_seq    SEQUENCE     q   CREATE SEQUENCE features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.features_id_seq;
       public       postgres    false    6    225            ]
           0    0    features_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE features_id_seq OWNED BY features.id;
            public       postgres    false    228            �            1259    16554    financial_plan    TABLE     o   CREATE TABLE financial_plan (
    id integer NOT NULL,
    name character varying(50),
    description text
);
 "   DROP TABLE public.financial_plan;
       public         postgres    false    6            �            1259    16560 &   financial_plan_entity_definition_price    TABLE     �   CREATE TABLE financial_plan_entity_definition_price (
    id integer NOT NULL,
    financial_plan_id integer,
    entity_definition_id integer,
    price_id integer
);
 :   DROP TABLE public.financial_plan_entity_definition_price;
       public         postgres    false    6            �            1259    16563 -   financial_plan_entity_definition_price_id_seq    SEQUENCE     �   CREATE SEQUENCE financial_plan_entity_definition_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.financial_plan_entity_definition_price_id_seq;
       public       postgres    false    230    6            ^
           0    0 -   financial_plan_entity_definition_price_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE financial_plan_entity_definition_price_id_seq OWNED BY financial_plan_entity_definition_price.id;
            public       postgres    false    231            �            1259    16565    financial_plan_id_seq    SEQUENCE     w   CREATE SEQUENCE financial_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.financial_plan_id_seq;
       public       postgres    false    229    6            _
           0    0    financial_plan_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE financial_plan_id_seq OWNED BY financial_plan.id;
            public       postgres    false    232            �            1259    16567    price    TABLE     �   CREATE TABLE price (
    id integer NOT NULL,
    value double precision,
    currency character varying(3),
    description character varying(50)
);
    DROP TABLE public.price;
       public         postgres    false    6            �            1259    16570    price_id_seq    SEQUENCE     n   CREATE SEQUENCE price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.price_id_seq;
       public       postgres    false    6    233            `
           0    0    price_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE price_id_seq OWNED BY price.id;
            public       postgres    false    234            �            1259    16572    reservation_entity    TABLE     �   CREATE TABLE reservation_entity (
    id integer NOT NULL,
    guest_id integer,
    entity_id integer NOT NULL,
    reservation_id integer NOT NULL,
    date_from timestamp without time zone,
    date_to timestamp without time zone
);
 &   DROP TABLE public.reservation_entity;
       public         postgres    false    6            �            1259    16575    reservation_entity_id_seq    SEQUENCE     {   CREATE SEQUENCE reservation_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.reservation_entity_id_seq;
       public       postgres    false    6    235            a
           0    0    reservation_entity_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE reservation_entity_id_seq OWNED BY reservation_entity.id;
            public       postgres    false    236            �            1259    16577    reservation_status    TABLE     �   CREATE TABLE reservation_status (
    id integer NOT NULL,
    statustext character varying(50),
    statusvalue character varying(20)
);
 &   DROP TABLE public.reservation_status;
       public         postgres    false    6            �            1259    16580    reservations    TABLE     �  CREATE TABLE reservations (
    id integer NOT NULL,
    reservation_id character varying(100) NOT NULL,
    status character varying(100),
    created_at timestamp(0) without time zone NOT NULL,
    modified_at timestamp(0) without time zone DEFAULT now(),
    client_id integer NOT NULL,
    pax_a smallint DEFAULT 0,
    pax_y smallint DEFAULT 0,
    pax_c smallint DEFAULT 0,
    comment text,
    status_id integer
);
     DROP TABLE public.reservations;
       public         postgres    false    6            b
           0    0    TABLE reservations    COMMENT     �  COMMENT ON TABLE reservations IS '2015-10-12 12:00:00 = 1444644000
2015-10-13 12:00:00 = 1444730400
2015-10-14 12:00:00 = 1444816800
2015-10-15 12:00:00 = 1444903200
2015-10-16 12:00:00 = 1444989600
2015-10-17 12:00:00 = 1445076000
2015-10-18 12:00:00 = 1445162400
2015-10-19 12:00:00 = 1445248800
2015-10-25 12:00:00 = 1445770800
2015-10-26 12:00:00 = 1445857200
2015-10-27 12:00:00 = 1445943600';
            public       postgres    false    238            c
           0    0 "   COLUMN reservations.reservation_id    COMMENT     ^   COMMENT ON COLUMN reservations.reservation_id IS ' - id rezervacije za prikaz na front-endu';
            public       postgres    false    238            d
           0    0    COLUMN reservations.status    COMMENT     q   COMMENT ON COLUMN reservations.status IS '- treba da bude enum, za sada je varchar, zbog jednostavnije izzmene';
            public       postgres    false    238            e
           0    0    COLUMN reservations.comment    COMMENT     Z   COMMENT ON COLUMN reservations.comment IS '- comment - free entry, optional at check-in';
            public       postgres    false    238            �            1259    16590    reservations_id_seq    SEQUENCE     u   CREATE SEQUENCE reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.reservations_id_seq;
       public       postgres    false    238    6            f
           0    0    reservations_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE reservations_id_seq OWNED BY reservations.id;
            public       postgres    false    239            g
           0    0    SEQUENCE reservations_id_seq    COMMENT     {   COMMENT ON SEQUENCE reservations_id_seq IS ' - reset auto increment to 1;
SELECT setval(''reservation_id_seq'',1,false);';
            public       postgres    false    239            �            1259    16592    rezervation_status_id_seq    SEQUENCE     {   CREATE SEQUENCE rezervation_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.rezervation_status_id_seq;
       public       postgres    false    6    237            h
           0    0    rezervation_status_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE rezervation_status_id_seq OWNED BY reservation_status.id;
            public       postgres    false    240            �            1259    16594    role    TABLE     n   CREATE TABLE role (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);
    DROP TABLE public.role;
       public         postgres    false    6            i
           0    0 
   TABLE role    COMMENT     :   COMMENT ON TABLE role IS 'Table of possible user roles.';
            public       postgres    false    241            �            1259    16600    role_id_seq    SEQUENCE     m   CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public       postgres    false    241    6            j
           0    0    role_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE role_id_seq OWNED BY role.id;
            public       postgres    false    242            �            1259    16602 	   role_task    TABLE     g   CREATE TABLE role_task (
    id integer NOT NULL,
    role_id integer NOT NULL,
    task_id integer
);
    DROP TABLE public.role_task;
       public         postgres    false    6            k
           0    0    TABLE role_task    COMMENT     G   COMMENT ON TABLE role_task IS 'Table which connects roles and tasks.';
            public       postgres    false    243            l
           0    0    COLUMN role_task.role_id    COMMENT     A   COMMENT ON COLUMN role_task.role_id IS 'Reference to the role.';
            public       postgres    false    243            m
           0    0    COLUMN role_task.task_id    COMMENT     F   COMMENT ON COLUMN role_task.task_id IS 'Reference to the user task.';
            public       postgres    false    243            �            1259    16605    role_task_id_seq    SEQUENCE     r   CREATE SEQUENCE role_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.role_task_id_seq;
       public       postgres    false    243    6            n
           0    0    role_task_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE role_task_id_seq OWNED BY role_task.id;
            public       postgres    false    244            �            1259    16607    roomlist    VIEW     �   CREATE VIEW roomlist AS
 SELECT e.guid,
    eavi.value
   FROM entity e,
    attribute a,
    entity_value_integer eavi
  WHERE ((eavi.entity_id = e.id) AND (eavi.attribute_id = a.id));
    DROP VIEW public.roomlist;
       public       postgres    false    217    217    190    180    190    217    6            �            1259    16611    status    TABLE     R   CREATE TABLE status (
    id integer NOT NULL,
    value character varying(50)
);
    DROP TABLE public.status;
       public         postgres    false    6            �            1259    16614    status_id_seq    SEQUENCE     o   CREATE SEQUENCE status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public       postgres    false    246    6            o
           0    0    status_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE status_id_seq OWNED BY status.id;
            public       postgres    false    247            �            1259    16616    task    TABLE     n   CREATE TABLE task (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);
    DROP TABLE public.task;
       public         postgres    false    6            p
           0    0 
   TABLE task    COMMENT     :   COMMENT ON TABLE task IS 'Table of possible user tasks.';
            public       postgres    false    248            �            1259    16622    task_id_seq    SEQUENCE     m   CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.task_id_seq;
       public       postgres    false    248    6            q
           0    0    task_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE task_id_seq OWNED BY task.id;
            public       postgres    false    249            �            1259    16624    title    TABLE     Q   CREATE TABLE title (
    id integer NOT NULL,
    title character varying(20)
);
    DROP TABLE public.title;
       public         postgres    false    6            �            1259    16627    title_id_seq    SEQUENCE     n   CREATE SEQUENCE title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.title_id_seq;
       public       postgres    false    6    250            r
           0    0    title_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE title_id_seq OWNED BY title.id;
            public       postgres    false    251            �            1259    16629    user    TABLE     �   CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(255),
    role_id integer DEFAULT 1
);
    DROP TABLE public."user";
       public         postgres    false    6            s
           0    0    TABLE "user"    COMMENT     ,   COMMENT ON TABLE "user" IS 'System users.';
            public       postgres    false    252            �            1259    16633    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    252    6            t
           0    0    users_id_seq    SEQUENCE OWNED BY     0   ALTER SEQUENCE users_id_seq OWNED BY "user".id;
            public       postgres    false    253            �           2604    16635    id    DEFAULT     ^   ALTER TABLE ONLY attribute ALTER COLUMN id SET DEFAULT nextval('attribute_id_seq'::regclass);
 ;   ALTER TABLE public.attribute ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    181    180            �           2604    16636    id    DEFAULT     z   ALTER TABLE ONLY attribute_option_values ALTER COLUMN id SET DEFAULT nextval('attribute_option_values_id_seq'::regclass);
 I   ALTER TABLE public.attribute_option_values ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    183    182            �           2604    16637    id    DEFAULT     \   ALTER TABLE ONLY business ALTER COLUMN id SET DEFAULT nextval('business_id_seq'::regclass);
 :   ALTER TABLE public.business ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    184            �           2604    16638    id    DEFAULT     `   ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186            �           2604    16639    id    DEFAULT     Z   ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188            �           2604    16640    id    DEFAULT     X   ALTER TABLE ONLY entity ALTER COLUMN id SET DEFAULT nextval('entity_id_seq'::regclass);
 8   ALTER TABLE public.entity ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    190            �           2604    16641    id    DEFAULT     j   ALTER TABLE ONLY entity_category ALTER COLUMN id SET DEFAULT nextval('entity_category_id_seq'::regclass);
 A   ALTER TABLE public.entity_category ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    191            �           2604    16642    id    DEFAULT     n   ALTER TABLE ONLY entity_definition ALTER COLUMN id SET DEFAULT nextval('entity_definition_id_seq'::regclass);
 C   ALTER TABLE public.entity_definition ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    193            �           2604    16643    id    DEFAULT        ALTER TABLE ONLY entity_definition_value_boolean ALTER COLUMN id SET DEFAULT nextval('entity_value_boolean_id_seq'::regclass);
 Q   ALTER TABLE public.entity_definition_value_boolean ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    195            �           2604    16644    id    DEFAULT     �   ALTER TABLE ONLY entity_definition_value_character ALTER COLUMN id SET DEFAULT nextval('entity_definition_value_character_id_seq'::regclass);
 S   ALTER TABLE public.entity_definition_value_character ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �           2604    16645    id    DEFAULT     �   ALTER TABLE ONLY entity_definition_value_select ALTER COLUMN id SET DEFAULT nextval('entity_definition_value_select_id_seq'::regclass);
 P   ALTER TABLE public.entity_definition_value_select ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            �           2604    16646    id    DEFAULT     �   ALTER TABLE ONLY entity_definition_value_text ALTER COLUMN id SET DEFAULT nextval('entity_definition_value_text_id_seq'::regclass);
 N   ALTER TABLE public.entity_definition_value_text ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            �           2604    16647    id    DEFAULT     b   ALTER TABLE ONLY entity_type ALTER COLUMN id SET DEFAULT nextval('entity_type_id_seq'::regclass);
 =   ALTER TABLE public.entity_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    207            �           2604    16648    id    DEFAULT     v   ALTER TABLE ONLY entity_type_attribute ALTER COLUMN id SET DEFAULT nextval('entity_type_attribute_id_seq'::regclass);
 G   ALTER TABLE public.entity_type_attribute ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            �           2604    16649    id    DEFAULT     u   ALTER TABLE ONLY entity_value_boolean ALTER COLUMN id SET DEFAULT nextval('entity_value_boolean_id_seq1'::regclass);
 F   ALTER TABLE public.entity_value_boolean ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    211            �           2604    16650    id    DEFAULT     x   ALTER TABLE ONLY entity_value_character ALTER COLUMN id SET DEFAULT nextval('entity_value_character_id_seq'::regclass);
 H   ALTER TABLE public.entity_value_character ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    213            �           2604    16651    id    DEFAULT     r   ALTER TABLE ONLY entity_value_double ALTER COLUMN id SET DEFAULT nextval('entity_value_double_id_seq'::regclass);
 E   ALTER TABLE public.entity_value_double ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    215            �           2604    16652    id    DEFAULT     t   ALTER TABLE ONLY entity_value_integer ALTER COLUMN id SET DEFAULT nextval('entity_value_integer_id_seq'::regclass);
 F   ALTER TABLE public.entity_value_integer ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    218    217            �           2604    16653    id    DEFAULT     r   ALTER TABLE ONLY entity_value_select ALTER COLUMN id SET DEFAULT nextval('entity_value_select_id_seq'::regclass);
 E   ALTER TABLE public.entity_value_select ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    219            �           2604    16654    id    DEFAULT     n   ALTER TABLE ONLY entity_value_text ALTER COLUMN id SET DEFAULT nextval('entity_value_text_id_seq'::regclass);
 C   ALTER TABLE public.entity_value_text ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    221            �           2604    16655    id    DEFAULT     x   ALTER TABLE ONLY entity_value_timestamp ALTER COLUMN id SET DEFAULT nextval('entity_value_timestamp_id_seq'::regclass);
 H   ALTER TABLE public.entity_value_timestamp ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    224    223            �           2604    16656    id    DEFAULT     \   ALTER TABLE ONLY features ALTER COLUMN id SET DEFAULT nextval('features_id_seq'::regclass);
 :   ALTER TABLE public.features ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    228    225            �           2604    16657    id    DEFAULT     �   ALTER TABLE ONLY features_entity_definitions ALTER COLUMN id SET DEFAULT nextval('features_entity_definitions_id_seq'::regclass);
 M   ALTER TABLE public.features_entity_definitions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226            �           2604    16658    id    DEFAULT     h   ALTER TABLE ONLY financial_plan ALTER COLUMN id SET DEFAULT nextval('financial_plan_id_seq'::regclass);
 @   ALTER TABLE public.financial_plan ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    232    229            �           2604    16659    id    DEFAULT     �   ALTER TABLE ONLY financial_plan_entity_definition_price ALTER COLUMN id SET DEFAULT nextval('financial_plan_entity_definition_price_id_seq'::regclass);
 X   ALTER TABLE public.financial_plan_entity_definition_price ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    230            �           2604    16660    id    DEFAULT     V   ALTER TABLE ONLY price ALTER COLUMN id SET DEFAULT nextval('price_id_seq'::regclass);
 7   ALTER TABLE public.price ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    234    233            �           2604    16661    id    DEFAULT     p   ALTER TABLE ONLY reservation_entity ALTER COLUMN id SET DEFAULT nextval('reservation_entity_id_seq'::regclass);
 D   ALTER TABLE public.reservation_entity ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    236    235            �           2604    16662    id    DEFAULT     p   ALTER TABLE ONLY reservation_status ALTER COLUMN id SET DEFAULT nextval('rezervation_status_id_seq'::regclass);
 D   ALTER TABLE public.reservation_status ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    240    237            �           2604    16663    id    DEFAULT     d   ALTER TABLE ONLY reservations ALTER COLUMN id SET DEFAULT nextval('reservations_id_seq'::regclass);
 >   ALTER TABLE public.reservations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    239    238            �           2604    16664    id    DEFAULT     T   ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    242    241            �           2604    16665    id    DEFAULT     ^   ALTER TABLE ONLY role_task ALTER COLUMN id SET DEFAULT nextval('role_task_id_seq'::regclass);
 ;   ALTER TABLE public.role_task ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    244    243            �           2604    16666    id    DEFAULT     X   ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);
 8   ALTER TABLE public.status ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    247    246            �           2604    16667    id    DEFAULT     T   ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);
 6   ALTER TABLE public.task ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    249    248            �           2604    16668    id    DEFAULT     V   ALTER TABLE ONLY title ALTER COLUMN id SET DEFAULT nextval('title_id_seq'::regclass);
 7   ALTER TABLE public.title ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    251    250            �           2604    16669    id    DEFAULT     W   ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    253    252            �	          0    16396 	   attribute 
   TABLE DATA               `   COPY attribute (id, code, label, type, sort_order, unit, "unique", nullable, scope) FROM stdin;
    public       postgres    false    180   ��      u
           0    0    attribute_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('attribute_id_seq', 82, true);
            public       postgres    false    181            �	          0    16404    attribute_option_values 
   TABLE DATA               I   COPY attribute_option_values (id, attribute_id, value, text) FROM stdin;
    public       postgres    false    182   ��      v
           0    0    attribute_option_values_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('attribute_option_values_id_seq', 84, true);
            public       postgres    false    183            �	          0    16409    business 
   TABLE DATA               ~   COPY business (id, name, description, company_name, address, phone, email, contact_first_name, contact_last_name) FROM stdin;
    public       postgres    false    184   ��      w
           0    0    business_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('business_id_seq', 1, true);
            public       postgres    false    185            �	          0    16417 
   categories 
   TABLE DATA               ?   COPY categories (id, name, description, parent_id) FROM stdin;
    public       postgres    false    186   o�      x
           0    0    categories_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('categories_id_seq', 1, false);
            public       postgres    false    187            �	          0    16425    clients 
   TABLE DATA               �   COPY clients (id, first_name, last_name, address1, address2, city, zipcode, country, phone, mobile, fax, email, title, guest_class, title_id) FROM stdin;
    public       postgres    false    188   �      y
           0    0    clients_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('clients_id_seq', 43, true);
            public       postgres    false    189            �	          0    16433    entity 
   TABLE DATA               E   COPY entity (id, definition_id, status, guid, status_id) FROM stdin;
    public       postgres    false    190   .�      �	          0    16439    entity_category 
   TABLE DATA               >   COPY entity_category (id, entity_id, category_id) FROM stdin;
    public       postgres    false    191   K�      z
           0    0    entity_category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('entity_category_id_seq', 1, false);
            public       postgres    false    192            �	          0    16444    entity_definition 
   TABLE DATA               ]   COPY entity_definition (id, entity_type_id, name, code, description, price, pax) FROM stdin;
    public       postgres    false    193   h�      {
           0    0    entity_definition_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('entity_definition_id_seq', 53, true);
            public       postgres    false    194            �	          0    16453    entity_definition_value_boolean 
   TABLE DATA               a   COPY entity_definition_value_boolean (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    195   ��      �	          0    16456 !   entity_definition_value_character 
   TABLE DATA               c   COPY entity_definition_value_character (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    196   ��      |
           0    0 (   entity_definition_value_character_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('entity_definition_value_character_id_seq', 11, true);
            public       postgres    false    197            
          0    16463    entity_definition_value_double 
   TABLE DATA               `   COPY entity_definition_value_double (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    199   ��      
          0    16467    entity_definition_value_integer 
   TABLE DATA               a   COPY entity_definition_value_integer (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    200   ܖ      
          0    16471    entity_definition_value_select 
   TABLE DATA               `   COPY entity_definition_value_select (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    201   ��      }
           0    0 %   entity_definition_value_select_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('entity_definition_value_select_id_seq', 32, true);
            public       postgres    false    202            
          0    16476    entity_definition_value_text 
   TABLE DATA               ^   COPY entity_definition_value_text (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    203   �      ~
           0    0 #   entity_definition_value_text_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('entity_definition_value_text_id_seq', 17, true);
            public       postgres    false    204            
          0    16484 !   entity_definition_value_timestamp 
   TABLE DATA               c   COPY entity_definition_value_timestamp (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    205   3�      
           0    0    entity_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('entity_id_seq', 76, true);
            public       postgres    false    206            

          0    16489    entity_type 
   TABLE DATA               F   COPY entity_type (id, name, description, time_resolution) FROM stdin;
    public       postgres    false    207   P�      
          0    16496    entity_type_attribute 
   TABLE DATA               J   COPY entity_type_attribute (id, entity_type_id, attribute_id) FROM stdin;
    public       postgres    false    208   m�      �
           0    0    entity_type_attribute_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('entity_type_attribute_id_seq', 73, true);
            public       postgres    false    209            �
           0    0    entity_type_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('entity_type_id_seq', 26, true);
            public       postgres    false    210            
          0    16503    entity_value_boolean 
   TABLE DATA               K   COPY entity_value_boolean (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    211   ��      �
           0    0    entity_value_boolean_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('entity_value_boolean_id_seq', 186, true);
            public       postgres    false    198            �
           0    0    entity_value_boolean_id_seq1    SEQUENCE SET     C   SELECT pg_catalog.setval('entity_value_boolean_id_seq1', 6, true);
            public       postgres    false    212            
          0    16508    entity_value_character 
   TABLE DATA               M   COPY entity_value_character (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    213   ��      �
           0    0    entity_value_character_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('entity_value_character_id_seq', 21, true);
            public       postgres    false    214            
          0    16513    entity_value_double 
   TABLE DATA               J   COPY entity_value_double (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    215   ė      �
           0    0    entity_value_double_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('entity_value_double_id_seq', 2, true);
            public       postgres    false    216            
          0    16518    entity_value_integer 
   TABLE DATA               K   COPY entity_value_integer (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    217   �      �
           0    0    entity_value_integer_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('entity_value_integer_id_seq', 1, false);
            public       postgres    false    218            
          0    16523    entity_value_select 
   TABLE DATA               J   COPY entity_value_select (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    219   ��      �
           0    0    entity_value_select_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('entity_value_select_id_seq', 70, true);
            public       postgres    false    220            
          0    16528    entity_value_text 
   TABLE DATA               H   COPY entity_value_text (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    221   �      �
           0    0    entity_value_text_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('entity_value_text_id_seq', 1, false);
            public       postgres    false    222            
          0    16536    entity_value_timestamp 
   TABLE DATA               M   COPY entity_value_timestamp (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    223   8�      �
           0    0    entity_value_timestamp_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('entity_value_timestamp_id_seq', 1, false);
            public       postgres    false    224            
          0    16541    features 
   TABLE DATA               2   COPY features (id, name, description) FROM stdin;
    public       postgres    false    225   U�      
          0    16547    features_entity_definitions 
   TABLE DATA               T   COPY features_entity_definitions (id, feature_id, entity_definition_id) FROM stdin;
    public       postgres    false    226   r�      �
           0    0 "   features_entity_definitions_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('features_entity_definitions_id_seq', 1, false);
            public       postgres    false    227            �
           0    0    features_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('features_id_seq', 1, false);
            public       postgres    false    228             
          0    16554    financial_plan 
   TABLE DATA               8   COPY financial_plan (id, name, description) FROM stdin;
    public       postgres    false    229   ��      !
          0    16560 &   financial_plan_entity_definition_price 
   TABLE DATA               p   COPY financial_plan_entity_definition_price (id, financial_plan_id, entity_definition_id, price_id) FROM stdin;
    public       postgres    false    230   ��      �
           0    0 -   financial_plan_entity_definition_price_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('financial_plan_entity_definition_price_id_seq', 1, false);
            public       postgres    false    231            �
           0    0    financial_plan_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('financial_plan_id_seq', 1, false);
            public       postgres    false    232            $
          0    16567    price 
   TABLE DATA               :   COPY price (id, value, currency, description) FROM stdin;
    public       postgres    false    233   ɘ      �
           0    0    price_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('price_id_seq', 1, false);
            public       postgres    false    234            &
          0    16572    reservation_entity 
   TABLE DATA               b   COPY reservation_entity (id, guest_id, entity_id, reservation_id, date_from, date_to) FROM stdin;
    public       postgres    false    235   �      �
           0    0    reservation_entity_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('reservation_entity_id_seq', 160, true);
            public       postgres    false    236            (
          0    16577    reservation_status 
   TABLE DATA               B   COPY reservation_status (id, statustext, statusvalue) FROM stdin;
    public       postgres    false    237   �      )
          0    16580    reservations 
   TABLE DATA               �   COPY reservations (id, reservation_id, status, created_at, modified_at, client_id, pax_a, pax_y, pax_c, comment, status_id) FROM stdin;
    public       postgres    false    238   ��      �
           0    0    reservations_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('reservations_id_seq', 183, true);
            public       postgres    false    239            �
           0    0    rezervation_status_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('rezervation_status_id_seq', 7, true);
            public       postgres    false    240            ,
          0    16594    role 
   TABLE DATA               .   COPY role (id, name, description) FROM stdin;
    public       postgres    false    241   ��      �
           0    0    role_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('role_id_seq', 1, false);
            public       postgres    false    242            .
          0    16602 	   role_task 
   TABLE DATA               2   COPY role_task (id, role_id, task_id) FROM stdin;
    public       postgres    false    243   0�      �
           0    0    role_task_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('role_task_id_seq', 1, true);
            public       postgres    false    244            0
          0    16611    status 
   TABLE DATA               $   COPY status (id, value) FROM stdin;
    public       postgres    false    246   s�      �
           0    0    status_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('status_id_seq', 5, true);
            public       postgres    false    247            2
          0    16616    task 
   TABLE DATA               .   COPY task (id, name, description) FROM stdin;
    public       postgres    false    248   ͚      �
           0    0    task_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('task_id_seq', 1, false);
            public       postgres    false    249            4
          0    16624    title 
   TABLE DATA               #   COPY title (id, title) FROM stdin;
    public       postgres    false    250   W�      �
           0    0    title_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('title_id_seq', 3, true);
            public       postgres    false    251            6
          0    16629    user 
   TABLE DATA               A   COPY "user" (id, username, password, email, role_id) FROM stdin;
    public       postgres    false    252   ��      �
           0    0    users_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('users_id_seq', 16, true);
            public       postgres    false    253            �           2606    16671    attribute_option_value_pk 
   CONSTRAINT     h   ALTER TABLE ONLY attribute_option_values
    ADD CONSTRAINT attribute_option_value_pk PRIMARY KEY (id);
 [   ALTER TABLE ONLY public.attribute_option_values DROP CONSTRAINT attribute_option_value_pk;
       public         postgres    false    182    182            �           2606    16673    attribute_option_value_uk 
   CONSTRAINT     t   ALTER TABLE ONLY attribute_option_values
    ADD CONSTRAINT attribute_option_value_uk UNIQUE (attribute_id, value);
 [   ALTER TABLE ONLY public.attribute_option_values DROP CONSTRAINT attribute_option_value_uk;
       public         postgres    false    182    182    182            �           2606    16675    attribute_pk 
   CONSTRAINT     M   ALTER TABLE ONLY attribute
    ADD CONSTRAINT attribute_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.attribute DROP CONSTRAINT attribute_pk;
       public         postgres    false    180    180            �           2606    16677    business_pk 
   CONSTRAINT     K   ALTER TABLE ONLY business
    ADD CONSTRAINT business_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.business DROP CONSTRAINT business_pk;
       public         postgres    false    184    184            �           2606    16679    categories_pk 
   CONSTRAINT     O   ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pk;
       public         postgres    false    186    186            �           2606    16681 
   clients_pk 
   CONSTRAINT     I   ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pk;
       public         postgres    false    188    188            �           2606    16683    entity_category_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY entity_category
    ADD CONSTRAINT entity_category_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.entity_category DROP CONSTRAINT entity_category_pk;
       public         postgres    false    191    191            �           2606    16685 $   entity_definition_value_character_pk 
   CONSTRAINT     }   ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT entity_definition_value_character_pk PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.entity_definition_value_character DROP CONSTRAINT entity_definition_value_character_pk;
       public         postgres    false    196    196            �           2606    16687 $   entity_definition_value_character_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT entity_definition_value_character_uk UNIQUE (entity_definition_id, attribute_id);
 p   ALTER TABLE ONLY public.entity_definition_value_character DROP CONSTRAINT entity_definition_value_character_uk;
       public         postgres    false    196    196    196            �           2606    16689 !   entity_definition_value_double_pk 
   CONSTRAINT     w   ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT entity_definition_value_double_pk PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.entity_definition_value_double DROP CONSTRAINT entity_definition_value_double_pk;
       public         postgres    false    199    199            �           2606    16691 !   entity_definition_value_double_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT entity_definition_value_double_uk UNIQUE (entity_definition_id, attribute_id);
 j   ALTER TABLE ONLY public.entity_definition_value_double DROP CONSTRAINT entity_definition_value_double_uk;
       public         postgres    false    199    199    199            �           2606    16693 "   entity_definition_value_integer_pk 
   CONSTRAINT     y   ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT entity_definition_value_integer_pk PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.entity_definition_value_integer DROP CONSTRAINT entity_definition_value_integer_pk;
       public         postgres    false    200    200            �           2606    16695 "   entity_definition_value_integer_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT entity_definition_value_integer_uk UNIQUE (entity_definition_id, attribute_id);
 l   ALTER TABLE ONLY public.entity_definition_value_integer DROP CONSTRAINT entity_definition_value_integer_uk;
       public         postgres    false    200    200    200            �           2606    16697    entity_definition_value_pk 
   CONSTRAINT     q   ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT entity_definition_value_pk PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.entity_definition_value_boolean DROP CONSTRAINT entity_definition_value_pk;
       public         postgres    false    195    195            	           2606    16699 !   entity_definition_value_select_pk 
   CONSTRAINT     w   ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT entity_definition_value_select_pk PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.entity_definition_value_select DROP CONSTRAINT entity_definition_value_select_pk;
       public         postgres    false    201    201            	           2606    16701 !   entity_definition_value_select_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT entity_definition_value_select_uk UNIQUE (entity_definition_id, attribute_id);
 j   ALTER TABLE ONLY public.entity_definition_value_select DROP CONSTRAINT entity_definition_value_select_uk;
       public         postgres    false    201    201    201            	           2606    16703    entity_definition_value_text_pk 
   CONSTRAINT     s   ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT entity_definition_value_text_pk PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.entity_definition_value_text DROP CONSTRAINT entity_definition_value_text_pk;
       public         postgres    false    203    203            		           2606    16705    entity_definition_value_text_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT entity_definition_value_text_uk UNIQUE (entity_definition_id, attribute_id);
 f   ALTER TABLE ONLY public.entity_definition_value_text DROP CONSTRAINT entity_definition_value_text_uk;
       public         postgres    false    203    203    203            	           2606    16707 $   entity_definition_value_timestamp_pk 
   CONSTRAINT     }   ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT entity_definition_value_timestamp_pk PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.entity_definition_value_timestamp DROP CONSTRAINT entity_definition_value_timestamp_pk;
       public         postgres    false    205    205            	           2606    16709 $   entity_definition_value_timestamp_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT entity_definition_value_timestamp_uk UNIQUE (entity_definition_id, attribute_id);
 p   ALTER TABLE ONLY public.entity_definition_value_timestamp DROP CONSTRAINT entity_definition_value_timestamp_uk;
       public         postgres    false    205    205    205            �           2606    16711    entity_definition_value_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT entity_definition_value_uk UNIQUE (entity_definition_id, attribute_id);
 d   ALTER TABLE ONLY public.entity_definition_value_boolean DROP CONSTRAINT entity_definition_value_uk;
       public         postgres    false    195    195    195            �           2606    16713    entity_definiton_pk 
   CONSTRAINT     \   ALTER TABLE ONLY entity_definition
    ADD CONSTRAINT entity_definiton_pk PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.entity_definition DROP CONSTRAINT entity_definiton_pk;
       public         postgres    false    193    193            �           2606    16715 	   entity_pk 
   CONSTRAINT     G   ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_pk;
       public         postgres    false    190    190            	           2606    16717    entity_type_attribute_pk 
   CONSTRAINT     e   ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT entity_type_attribute_pk PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.entity_type_attribute DROP CONSTRAINT entity_type_attribute_pk;
       public         postgres    false    208    208            	           2606    16719    entity_type_attribute_uk 
   CONSTRAINT     z   ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT entity_type_attribute_uk UNIQUE (entity_type_id, attribute_id);
 X   ALTER TABLE ONLY public.entity_type_attribute DROP CONSTRAINT entity_type_attribute_uk;
       public         postgres    false    208    208    208            	           2606    16721    entity_type_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY entity_type
    ADD CONSTRAINT entity_type_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.entity_type DROP CONSTRAINT entity_type_pk;
       public         postgres    false    207    207            �           2606    16723 	   entity_uk 
   CONSTRAINT     D   ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_uk UNIQUE (guid);
 :   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_uk;
       public         postgres    false    190    190            	           2606    16725    evb_pk 
   CONSTRAINT     R   ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_pk PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.entity_value_boolean DROP CONSTRAINT evb_pk;
       public         postgres    false    211    211            	           2606    16727    evb_uk 
   CONSTRAINT     b   ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_uk UNIQUE (attribute_id, entity_id);
 E   ALTER TABLE ONLY public.entity_value_boolean DROP CONSTRAINT evb_uk;
       public         postgres    false    211    211    211            	           2606    16729    evc_pk 
   CONSTRAINT     T   ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.entity_value_character DROP CONSTRAINT evc_pk;
       public         postgres    false    213    213            	           2606    16731    evc_uk 
   CONSTRAINT     d   ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_uk UNIQUE (attribute_id, entity_id);
 G   ALTER TABLE ONLY public.entity_value_character DROP CONSTRAINT evc_uk;
       public         postgres    false    213    213    213             	           2606    16733    evd_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.entity_value_double DROP CONSTRAINT evd_pk;
       public         postgres    false    215    215            "	           2606    16735    evd_uk 
   CONSTRAINT     a   ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_uk UNIQUE (attribute_id, entity_id);
 D   ALTER TABLE ONLY public.entity_value_double DROP CONSTRAINT evd_uk;
       public         postgres    false    215    215    215            $	           2606    16737    evi_pk 
   CONSTRAINT     R   ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT evi_pk PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.entity_value_integer DROP CONSTRAINT evi_pk;
       public         postgres    false    217    217            &	           2606    16739    evi_uk 
   CONSTRAINT     b   ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT evi_uk UNIQUE (attribute_id, entity_id);
 E   ALTER TABLE ONLY public.entity_value_integer DROP CONSTRAINT evi_uk;
       public         postgres    false    217    217    217            (	           2606    16741    evs_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.entity_value_select DROP CONSTRAINT evs_pk;
       public         postgres    false    219    219            *	           2606    16743    evs_uk 
   CONSTRAINT     a   ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_uk UNIQUE (attribute_id, entity_id);
 D   ALTER TABLE ONLY public.entity_value_select DROP CONSTRAINT evs_uk;
       public         postgres    false    219    219    219            0	           2606    16745    evtm_pk 
   CONSTRAINT     U   ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.entity_value_timestamp DROP CONSTRAINT evtm_pk;
       public         postgres    false    223    223            2	           2606    16747    evtm_uk 
   CONSTRAINT     e   ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_uk UNIQUE (attribute_id, entity_id);
 H   ALTER TABLE ONLY public.entity_value_timestamp DROP CONSTRAINT evtm_uk;
       public         postgres    false    223    223    223            ,	           2606    16749    evtxt_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.entity_value_text DROP CONSTRAINT evtxt_pk;
       public         postgres    false    221    221            .	           2606    16751    evtxt_uk 
   CONSTRAINT     a   ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_uk UNIQUE (attribute_id, entity_id);
 D   ALTER TABLE ONLY public.entity_value_text DROP CONSTRAINT evtxt_uk;
       public         postgres    false    221    221    221            6	           2606    16753    features_entity_definitions_pk 
   CONSTRAINT     q   ALTER TABLE ONLY features_entity_definitions
    ADD CONSTRAINT features_entity_definitions_pk PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.features_entity_definitions DROP CONSTRAINT features_entity_definitions_pk;
       public         postgres    false    226    226            4	           2606    16755    features_pk 
   CONSTRAINT     K   ALTER TABLE ONLY features
    ADD CONSTRAINT features_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.features DROP CONSTRAINT features_pk;
       public         postgres    false    225    225            ;	           2606    16757 )   financial_plan_entity_definition_price_pk 
   CONSTRAINT     �   ALTER TABLE ONLY financial_plan_entity_definition_price
    ADD CONSTRAINT financial_plan_entity_definition_price_pk PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.financial_plan_entity_definition_price DROP CONSTRAINT financial_plan_entity_definition_price_pk;
       public         postgres    false    230    230            =	           2606    16759 )   financial_plan_entity_definition_price_uk 
   CONSTRAINT     �   ALTER TABLE ONLY financial_plan_entity_definition_price
    ADD CONSTRAINT financial_plan_entity_definition_price_uk UNIQUE (financial_plan_id, entity_definition_id, price_id);
 z   ALTER TABLE ONLY public.financial_plan_entity_definition_price DROP CONSTRAINT financial_plan_entity_definition_price_uk;
       public         postgres    false    230    230    230    230            9	           2606    16761    financial_plan_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY financial_plan
    ADD CONSTRAINT financial_plan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.financial_plan DROP CONSTRAINT financial_plan_pkey;
       public         postgres    false    229    229            ?	           2606    16763    price pk 
   CONSTRAINT     G   ALTER TABLE ONLY price
    ADD CONSTRAINT "price pk" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.price DROP CONSTRAINT "price pk";
       public         postgres    false    233    233            C	           2606    16765    reservation_entity_pk 
   CONSTRAINT     _   ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT reservation_entity_pk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.reservation_entity DROP CONSTRAINT reservation_entity_pk;
       public         postgres    false    235    235            E	           2606    16767    reservation_entity_uk 
   CONSTRAINT     {   ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT reservation_entity_uk UNIQUE (guest_id, reservation_id, entity_id);
 R   ALTER TABLE ONLY public.reservation_entity DROP CONSTRAINT reservation_entity_uk;
       public         postgres    false    235    235    235    235            I	           2606    16769    reservation_pk 
   CONSTRAINT     R   ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservation_pk PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservation_pk;
       public         postgres    false    238    238            G	           2606    16771    rezervation_status_pk 
   CONSTRAINT     _   ALTER TABLE ONLY reservation_status
    ADD CONSTRAINT rezervation_status_pk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.reservation_status DROP CONSTRAINT rezervation_status_pk;
       public         postgres    false    237    237            K	           2606    16773    role_pk 
   CONSTRAINT     C   ALTER TABLE ONLY role
    ADD CONSTRAINT role_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pk;
       public         postgres    false    241    241            M	           2606    16775    role_task_pk 
   CONSTRAINT     M   ALTER TABLE ONLY role_task
    ADD CONSTRAINT role_task_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.role_task DROP CONSTRAINT role_task_pk;
       public         postgres    false    243    243            O	           2606    16777    role_task_uk 
   CONSTRAINT     V   ALTER TABLE ONLY role_task
    ADD CONSTRAINT role_task_uk UNIQUE (role_id, task_id);
 @   ALTER TABLE ONLY public.role_task DROP CONSTRAINT role_task_uk;
       public         postgres    false    243    243    243            Q	           2606    16779 	   status_pk 
   CONSTRAINT     G   ALTER TABLE ONLY status
    ADD CONSTRAINT status_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pk;
       public         postgres    false    246    246            S	           2606    16781    task_pk 
   CONSTRAINT     C   ALTER TABLE ONLY task
    ADD CONSTRAINT task_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pk;
       public         postgres    false    248    248            U	           2606    16783    title_pk 
   CONSTRAINT     E   ALTER TABLE ONLY title
    ADD CONSTRAINT title_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.title DROP CONSTRAINT title_pk;
       public         postgres    false    250    250            W	           2606    16785    users_pk 
   CONSTRAINT     F   ALTER TABLE ONLY "user"
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 9   ALTER TABLE ONLY public."user" DROP CONSTRAINT users_pk;
       public         postgres    false    252    252            �           1259    16953    fki_edvc_att_fk    INDEX     ^   CREATE INDEX fki_edvc_att_fk ON entity_definition_value_character USING btree (attribute_id);
 #   DROP INDEX public.fki_edvc_att_fk;
       public         postgres    false    196            �           1259    16959    fki_edvd_att_fk    INDEX     [   CREATE INDEX fki_edvd_att_fk ON entity_definition_value_double USING btree (attribute_id);
 #   DROP INDEX public.fki_edvd_att_fk;
       public         postgres    false    199             	           1259    16965    fki_edvi_att_fk    INDEX     \   CREATE INDEX fki_edvi_att_fk ON entity_definition_value_integer USING btree (attribute_id);
 #   DROP INDEX public.fki_edvi_att_fk;
       public         postgres    false    200            	           1259    16971    fki_edvs_att_fk    INDEX     [   CREATE INDEX fki_edvs_att_fk ON entity_definition_value_select USING btree (attribute_id);
 #   DROP INDEX public.fki_edvs_att_fk;
       public         postgres    false    201            	           1259    16983    fki_edvtime_att_fk    INDEX     a   CREATE INDEX fki_edvtime_att_fk ON entity_definition_value_timestamp USING btree (attribute_id);
 &   DROP INDEX public.fki_edvtime_att_fk;
       public         postgres    false    205            
	           1259    16977    fki_edvtxt_att_fk    INDEX     [   CREATE INDEX fki_edvtxt_att_fk ON entity_definition_value_text USING btree (attribute_id);
 %   DROP INDEX public.fki_edvtxt_att_fk;
       public         postgres    false    203            �           1259    16786    fki_entity_definition_fk    INDEX     Y   CREATE INDEX fki_entity_definition_fk ON entity_definition USING btree (entity_type_id);
 ,   DROP INDEX public.fki_entity_definition_fk;
       public         postgres    false    193            �           1259    16787    fki_entity_entity_definition_fk    INDEX     T   CREATE INDEX fki_entity_entity_definition_fk ON entity USING btree (definition_id);
 3   DROP INDEX public.fki_entity_entity_definition_fk;
       public         postgres    false    190            	           1259    16788    fki_eta_at_fk    INDEX     P   CREATE INDEX fki_eta_at_fk ON entity_type_attribute USING btree (attribute_id);
 !   DROP INDEX public.fki_eta_at_fk;
       public         postgres    false    208            7	           1259    16789    fki_fed_features_fk    INDEX     Z   CREATE INDEX fki_fed_features_fk ON features_entity_definitions USING btree (feature_id);
 '   DROP INDEX public.fki_fed_features_fk;
       public         postgres    false    226            @	           1259    16790    fki_re_entity_fk    INDEX     M   CREATE INDEX fki_re_entity_fk ON reservation_entity USING btree (entity_id);
 $   DROP INDEX public.fki_re_entity_fk;
       public         postgres    false    235            A	           1259    16791 %   fki_reservation_entity_reservation_fk    INDEX     g   CREATE INDEX fki_reservation_entity_reservation_fk ON reservation_entity USING btree (reservation_id);
 9   DROP INDEX public.fki_reservation_entity_reservation_fk;
       public         postgres    false    235            {	           2620    16792    res_num_trigg    TRIGGER     p   CREATE TRIGGER res_num_trigg BEFORE INSERT ON reservations FOR EACH ROW EXECUTE PROCEDURE res_num_trigg_func();
 3   DROP TRIGGER res_num_trigg ON public.reservations;
       public       postgres    false    238    256            X	           2606    16793    aov_fk    FK CONSTRAINT     �   ALTER TABLE ONLY attribute_option_values
    ADD CONSTRAINT aov_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.attribute_option_values DROP CONSTRAINT aov_fk;
       public       postgres    false    180    182    2265            \	           2606    16943    edvb_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT edvb_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.entity_definition_value_boolean DROP CONSTRAINT edvb_att_fk;
       public       postgres    false    195    180    2265            [	           2606    16798 
   edvb_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT edvb_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_boolean DROP CONSTRAINT edvb_ed_fk;
       public       postgres    false    2284    195    193            ^	           2606    16948    edvc_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT edvc_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.entity_definition_value_character DROP CONSTRAINT edvc_att_fk;
       public       postgres    false    196    2265    180            ]	           2606    16803 
   edvc_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT edvc_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.entity_definition_value_character DROP CONSTRAINT edvc_ed_fk;
       public       postgres    false    193    196    2284            `	           2606    16954    edvd_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT edvd_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_double DROP CONSTRAINT edvd_att_fk;
       public       postgres    false    180    199    2265            _	           2606    16808 
   edvd_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT edvd_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.entity_definition_value_double DROP CONSTRAINT edvd_ed_fk;
       public       postgres    false    2284    193    199            b	           2606    16960    edvi_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT edvi_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.entity_definition_value_integer DROP CONSTRAINT edvi_att_fk;
       public       postgres    false    180    2265    200            a	           2606    16813 
   edvi_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT edvi_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_integer DROP CONSTRAINT edvi_ed_fk;
       public       postgres    false    200    193    2284            d	           2606    16966    edvs_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT edvs_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_select DROP CONSTRAINT edvs_att_fk;
       public       postgres    false    201    2265    180            h	           2606    16978    edvtime_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT edvtime_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.entity_definition_value_timestamp DROP CONSTRAINT edvtime_att_fk;
       public       postgres    false    180    2265    205            g	           2606    16818    edvts_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT edvts_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.entity_definition_value_timestamp DROP CONSTRAINT edvts_ed_fk;
       public       postgres    false    193    2284    205            e	           2606    16823    edvtx_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT edvtx_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.entity_definition_value_text DROP CONSTRAINT edvtx_ed_fk;
       public       postgres    false    2284    193    203            f	           2606    16972    edvtxt_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT edvtxt_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_text DROP CONSTRAINT edvtxt_att_fk;
       public       postgres    false    2265    180    203            Z	           2606    16828    entity_definition_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition
    ADD CONSTRAINT entity_definition_fk FOREIGN KEY (entity_type_id) REFERENCES entity_type(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.entity_definition DROP CONSTRAINT entity_definition_fk;
       public       postgres    false    2321    207    193            c	           2606    16833 !   entity_definition_value_select_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT entity_definition_value_select_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON UPDATE CASCADE ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.entity_definition_value_select DROP CONSTRAINT entity_definition_value_select_fk;
       public       postgres    false    193    2284    201            Y	           2606    16838 	   entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_fk FOREIGN KEY (definition_id) REFERENCES entity_definition(id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_fk;
       public       postgres    false    193    2284    190            i	           2606    16843 	   eta_at_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT eta_at_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.entity_type_attribute DROP CONSTRAINT eta_at_fk;
       public       postgres    false    208    2265    180            j	           2606    16848 	   eta_et_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT eta_et_fk FOREIGN KEY (entity_type_id) REFERENCES entity_type(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.entity_type_attribute DROP CONSTRAINT eta_et_fk;
       public       postgres    false    207    208    2321            k	           2606    16853    evb_attributes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_attributes_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.entity_value_boolean DROP CONSTRAINT evb_attributes_fk;
       public       postgres    false    180    2265    211            l	           2606    16938    evb_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.entity_value_boolean DROP CONSTRAINT evb_entity_fk;
       public       postgres    false    190    211    2277            m	           2606    16863    evc_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.entity_value_character DROP CONSTRAINT evc_attribute_fk;
       public       postgres    false    180    2265    213            n	           2606    16868    evc_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.entity_value_character DROP CONSTRAINT evc_entity_fk;
       public       postgres    false    2277    190    213            o	           2606    16873    evd_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.entity_value_double DROP CONSTRAINT evd_attribute_fk;
       public       postgres    false    2265    180    215            p	           2606    16878    evd_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.entity_value_double DROP CONSTRAINT evd_entity_fk;
       public       postgres    false    215    2277    190            q	           2606    16883    evi_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT "evi_entity_fk" FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.entity_value_integer DROP CONSTRAINT "evi_entity_fk";
       public       postgres    false    190    2277    217            r	           2606    16888    evi_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT evi_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.entity_value_integer DROP CONSTRAINT evi_attribute_fk;
       public       postgres    false    180    2265    217            s	           2606    16893    evs_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.entity_value_select DROP CONSTRAINT evs_attribute_fk;
       public       postgres    false    219    2265    180            t	           2606    16898    evs_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.entity_value_select DROP CONSTRAINT evs_entity_fk;
       public       postgres    false    2277    190    219            w	           2606    16903    evtm_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.entity_value_timestamp DROP CONSTRAINT evtm_attribute_fk;
       public       postgres    false    223    2265    180            x	           2606    16908    evtm_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.entity_value_timestamp DROP CONSTRAINT evtm_entity_fk;
       public       postgres    false    223    2277    190            u	           2606    16913    evtxt_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.entity_value_text DROP CONSTRAINT evtxt_attribute_fk;
       public       postgres    false    180    2265    221            v	           2606    16918    evtxt_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.entity_value_text DROP CONSTRAINT evtxt_entity_fk;
       public       postgres    false    221    190    2277            y	           2606    16923    re_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT re_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.reservation_entity DROP CONSTRAINT re_entity_fk;
       public       postgres    false    190    2277    235            z	           2606    16928 !   reservation_entity_reservation_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT reservation_entity_reservation_fk FOREIGN KEY (reservation_id) REFERENCES reservations(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.reservation_entity DROP CONSTRAINT reservation_entity_reservation_fk;
       public       postgres    false    2377    238    235            �	      x������ � �      �	      x������ � �      �	   �   x�5���0���)nr����.��q�ѥ�kR�'m�����7|�]%��qGN���:2+n���瀸Av�
dK��	�|B`�"�����i�R�w�y��}2�gGoT��u��-p��?�Q�
M�@k�����!�3[/N�S��RJ��C>       �	   �   x�M���0Dg�+�T-
031 $$&�Z%�M�$��������;�j���<�Bo�hf
Nll��4�E���2Ը���>Nl���b��*
����S'�E9N/w�2M�K��-V�>��s�B_��Q��W�$�rQF�R�Q!�,s@�      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      

      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �       
      x������ � �      !
      x������ � �      $
      x������ � �      &
      x������ � �      (
   n   x�3���+,�L-��̄2��8����2�rSS8�a,.cN�ļ�Ԝ�(��e��X���Y�ʙ��L8C�3�ҁ�e��r�q�e�eg��h8g�&g痖hr&CY\1z\\\ �s,d      )
      x������ � �      ,
   �   x�]�M
�@�דS� 2���nݤM��#IJ��ێq���{�9�j�%��\ͥ`�\ɛF�QEnH9G��O[Dg�����F����&�< U�q��ދI�i ����J�k�{�B�O��?�� �[;       .
   3   x�ȹ 0���&�-��%��5�I�BV�mf�ϲb����6o Ҩ      0
   J   x�3��M��+I�K�KN�2��/-Q�OS�/JI-�2�t�IM���K�2�t,K��IL�I�2���S-N����� �~y      2
   z   x�E�M�@�5�bN@��z7n�03�N�mT���i��{$|!��^V���Fz�*�|��{z�6�71�=Ԭ�N��ٶ����Ο���������Q`����������!�}�7�      4
      x�3��-��2��z\Ɯ�@2F��� ?��      6
   �   x�=�1�  ��<&�@�l�*u��"5�J���f�~�n���v���~��4s[�c!��sVsJ.F����V�{:N@��6Q �Ds`eEKH^�2�YRL�h�~��u<T�3Z����f�.#�G�z�6	3���ڗWzmo��1�sB7�     