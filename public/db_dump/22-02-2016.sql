PGDMP     3                    t            hotel_cloud    9.5rc1    9.5rc1 f   B
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            C
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            D
           1262    17565    hotel_cloud    DATABASE     �   CREATE DATABASE hotel_cloud WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE hotel_cloud;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            E
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            F
           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6            �            3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            G
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    254            �            1255    17566    hash_pwd_trigg_function()    FUNCTION     �   CREATE FUNCTION hash_pwd_trigg_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	NEW.password = md5(NEW.password);
	RETURN NEW;

END;
$$;
 0   DROP FUNCTION public.hash_pwd_trigg_function();
       public       postgres    false    254    6                        1255    17567    res_num_trigg_func()    FUNCTION     �   CREATE FUNCTION res_num_trigg_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.reservation_id = lpad((SELECT currval('reservations_id_seq'))::text, 10,'0');
RETURN NEW;
END
$$;
 +   DROP FUNCTION public.res_num_trigg_func();
       public       postgres    false    254    6            �            1259    17568 	   attribute    TABLE     L  CREATE TABLE attribute (
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
       public         postgres    false    6            �            1259    17574    attribute_id_seq    SEQUENCE     r   CREATE SEQUENCE attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.attribute_id_seq;
       public       postgres    false    6    180            H
           0    0    attribute_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE attribute_id_seq OWNED BY attribute.id;
            public       postgres    false    181            �            1259    17576    attribute_option_values    TABLE     �   CREATE TABLE attribute_option_values (
    id integer NOT NULL,
    attribute_id integer,
    value integer,
    text character varying(50)
);
 +   DROP TABLE public.attribute_option_values;
       public         postgres    false    6            �            1259    17579    attribute_option_values_id_seq    SEQUENCE     �   CREATE SEQUENCE attribute_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.attribute_option_values_id_seq;
       public       postgres    false    6    182            I
           0    0    attribute_option_values_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE attribute_option_values_id_seq OWNED BY attribute_option_values.id;
            public       postgres    false    183            �            1259    17581    business    TABLE     S  CREATE TABLE business (
    id integer NOT NULL,
    name character varying(100),
    description text,
    company_name character varying(100),
    address text,
    phone character varying(50),
    email character varying,
    contact_first_name character varying(50),
    contact_last_name character varying(50),
    user_id integer
);
    DROP TABLE public.business;
       public         postgres    false    6            �            1259    17587    business_id_seq    SEQUENCE     q   CREATE SEQUENCE business_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.business_id_seq;
       public       postgres    false    6    184            J
           0    0    business_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE business_id_seq OWNED BY business.id;
            public       postgres    false    185            �            1259    17589 
   categories    TABLE     �   CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(100),
    description text,
    parent_id integer
);
    DROP TABLE public.categories;
       public         postgres    false    6            �            1259    17595    categories_id_seq    SEQUENCE     s   CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public       postgres    false    6    186            K
           0    0    categories_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE categories_id_seq OWNED BY categories.id;
            public       postgres    false    187            �            1259    17597    clients    TABLE     *  CREATE TABLE clients (
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
    title_id integer,
    user_id integer
);
    DROP TABLE public.clients;
       public         postgres    false    6            �            1259    17603    clients_id_seq    SEQUENCE     p   CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.clients_id_seq;
       public       postgres    false    6    188            L
           0    0    clients_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE clients_id_seq OWNED BY clients.id;
            public       postgres    false    189            �            1259    17605    entity    TABLE     �   CREATE TABLE entity (
    id integer NOT NULL,
    definition_id integer NOT NULL,
    status character varying,
    guid character varying(10),
    status_id integer
);
    DROP TABLE public.entity;
       public         postgres    false    6            M
           0    0    COLUMN entity.guid    COMMENT     E   COMMENT ON COLUMN entity.guid IS 'ovo neka bude broj sobe, za sada';
            public       postgres    false    190            �            1259    17611    entity_category    TABLE     j   CREATE TABLE entity_category (
    id integer NOT NULL,
    entity_id integer,
    category_id integer
);
 #   DROP TABLE public.entity_category;
       public         postgres    false    6            �            1259    17614    entity_category_id_seq    SEQUENCE     x   CREATE SEQUENCE entity_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.entity_category_id_seq;
       public       postgres    false    6    191            N
           0    0    entity_category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE entity_category_id_seq OWNED BY entity_category.id;
            public       postgres    false    192            �            1259    17616    entity_definition    TABLE     �   CREATE TABLE entity_definition (
    id integer NOT NULL,
    entity_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10),
    description text,
    price numeric(10,2),
    pax smallint DEFAULT 1
);
 %   DROP TABLE public.entity_definition;
       public         postgres    false    6            O
           0    0    TABLE entity_definition    COMMENT     �   COMMENT ON TABLE entity_definition IS ' - za demo verziju ova tabela ce sadrzati samo tip sobe (Single,Double, Suite...)
- kolona price predstavlja cenu na dan';
            public       postgres    false    193            P
           0    0    COLUMN entity_definition.pax    COMMENT     �   COMMENT ON COLUMN entity_definition.pax IS ' - reference for PAX system;
- for now it will represent maximum number of persons for this type';
            public       postgres    false    193            �            1259    17623    entity_definition_id_seq    SEQUENCE     z   CREATE SEQUENCE entity_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.entity_definition_id_seq;
       public       postgres    false    6    193            Q
           0    0    entity_definition_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE entity_definition_id_seq OWNED BY entity_definition.id;
            public       postgres    false    194            �            1259    17625    entity_definition_value_boolean    TABLE     �   CREATE TABLE entity_definition_value_boolean (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value boolean
);
 3   DROP TABLE public.entity_definition_value_boolean;
       public         postgres    false    6            �            1259    17628 !   entity_definition_value_character    TABLE     �   CREATE TABLE entity_definition_value_character (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value character varying(255)
);
 5   DROP TABLE public.entity_definition_value_character;
       public         postgres    false    6            �            1259    17631 (   entity_definition_value_character_id_seq    SEQUENCE     �   CREATE SEQUENCE entity_definition_value_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.entity_definition_value_character_id_seq;
       public       postgres    false    6    196            R
           0    0 (   entity_definition_value_character_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE entity_definition_value_character_id_seq OWNED BY entity_definition_value_character.id;
            public       postgres    false    197            �            1259    17633    entity_value_boolean_id_seq    SEQUENCE     }   CREATE SEQUENCE entity_value_boolean_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.entity_value_boolean_id_seq;
       public       postgres    false    6    195            S
           0    0    entity_value_boolean_id_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE entity_value_boolean_id_seq OWNED BY entity_definition_value_boolean.id;
            public       postgres    false    198            �            1259    17635    entity_definition_value_double    TABLE     �   CREATE TABLE entity_definition_value_double (
    id integer DEFAULT nextval('entity_value_boolean_id_seq'::regclass) NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value double precision
);
 2   DROP TABLE public.entity_definition_value_double;
       public         postgres    false    198    6            �            1259    17639    entity_definition_value_integer    TABLE     �   CREATE TABLE entity_definition_value_integer (
    id integer DEFAULT nextval('entity_value_boolean_id_seq'::regclass) NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value integer
);
 3   DROP TABLE public.entity_definition_value_integer;
       public         postgres    false    198    6            �            1259    17643    entity_definition_value_select    TABLE     �   CREATE TABLE entity_definition_value_select (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value integer
);
 2   DROP TABLE public.entity_definition_value_select;
       public         postgres    false    6            �            1259    17646 %   entity_definition_value_select_id_seq    SEQUENCE     �   CREATE SEQUENCE entity_definition_value_select_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.entity_definition_value_select_id_seq;
       public       postgres    false    6    201            T
           0    0 %   entity_definition_value_select_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE entity_definition_value_select_id_seq OWNED BY entity_definition_value_select.id;
            public       postgres    false    202            �            1259    17648    entity_definition_value_text    TABLE     �   CREATE TABLE entity_definition_value_text (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value text
);
 0   DROP TABLE public.entity_definition_value_text;
       public         postgres    false    6            �            1259    17654 #   entity_definition_value_text_id_seq    SEQUENCE     �   CREATE SEQUENCE entity_definition_value_text_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.entity_definition_value_text_id_seq;
       public       postgres    false    6    203            U
           0    0 #   entity_definition_value_text_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE entity_definition_value_text_id_seq OWNED BY entity_definition_value_text.id;
            public       postgres    false    204            �            1259    17656 !   entity_definition_value_timestamp    TABLE     �   CREATE TABLE entity_definition_value_timestamp (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value timestamp without time zone
);
 5   DROP TABLE public.entity_definition_value_timestamp;
       public         postgres    false    6            �            1259    17659    entity_id_seq    SEQUENCE     o   CREATE SEQUENCE entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.entity_id_seq;
       public       postgres    false    190    6            V
           0    0    entity_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE entity_id_seq OWNED BY entity.id;
            public       postgres    false    206            �            1259    17661    entity_type    TABLE     �   CREATE TABLE entity_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    time_resolution integer DEFAULT 0,
    user_id integer
);
    DROP TABLE public.entity_type;
       public         postgres    false    6            W
           0    0    TABLE entity_type    COMMENT     6   COMMENT ON TABLE entity_type IS '- komentar ovde...';
            public       postgres    false    207            �            1259    17668    entity_type_attribute    TABLE     �   CREATE TABLE entity_type_attribute (
    id integer NOT NULL,
    entity_type_id integer NOT NULL,
    attribute_id integer NOT NULL
);
 )   DROP TABLE public.entity_type_attribute;
       public         postgres    false    6            �            1259    17671    entity_type_attribute_id_seq    SEQUENCE     ~   CREATE SEQUENCE entity_type_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.entity_type_attribute_id_seq;
       public       postgres    false    208    6            X
           0    0    entity_type_attribute_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE entity_type_attribute_id_seq OWNED BY entity_type_attribute.id;
            public       postgres    false    209            �            1259    17673    entity_type_id_seq    SEQUENCE     t   CREATE SEQUENCE entity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.entity_type_id_seq;
       public       postgres    false    6    207            Y
           0    0    entity_type_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE entity_type_id_seq OWNED BY entity_type.id;
            public       postgres    false    210            �            1259    17675    entity_value_boolean    TABLE     �   CREATE TABLE entity_value_boolean (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value boolean
);
 (   DROP TABLE public.entity_value_boolean;
       public         postgres    false    6            �            1259    17678    entity_value_boolean_id_seq1    SEQUENCE     ~   CREATE SEQUENCE entity_value_boolean_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.entity_value_boolean_id_seq1;
       public       postgres    false    6    211            Z
           0    0    entity_value_boolean_id_seq1    SEQUENCE OWNED BY     N   ALTER SEQUENCE entity_value_boolean_id_seq1 OWNED BY entity_value_boolean.id;
            public       postgres    false    212            �            1259    17680    entity_value_character    TABLE     �   CREATE TABLE entity_value_character (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value character varying(100)
);
 *   DROP TABLE public.entity_value_character;
       public         postgres    false    6            �            1259    17683    entity_value_character_id_seq    SEQUENCE        CREATE SEQUENCE entity_value_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.entity_value_character_id_seq;
       public       postgres    false    6    213            [
           0    0    entity_value_character_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE entity_value_character_id_seq OWNED BY entity_value_character.id;
            public       postgres    false    214            �            1259    17685    entity_value_double    TABLE     �   CREATE TABLE entity_value_double (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value double precision
);
 '   DROP TABLE public.entity_value_double;
       public         postgres    false    6            �            1259    17688    entity_value_double_id_seq    SEQUENCE     |   CREATE SEQUENCE entity_value_double_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.entity_value_double_id_seq;
       public       postgres    false    6    215            \
           0    0    entity_value_double_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE entity_value_double_id_seq OWNED BY entity_value_double.id;
            public       postgres    false    216            �            1259    17690    entity_value_integer    TABLE     �   CREATE TABLE entity_value_integer (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value integer
);
 (   DROP TABLE public.entity_value_integer;
       public         postgres    false    6            �            1259    17693    entity_value_integer_id_seq    SEQUENCE     }   CREATE SEQUENCE entity_value_integer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.entity_value_integer_id_seq;
       public       postgres    false    6    217            ]
           0    0    entity_value_integer_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE entity_value_integer_id_seq OWNED BY entity_value_integer.id;
            public       postgres    false    218            �            1259    17695    entity_value_select    TABLE     �   CREATE TABLE entity_value_select (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value integer
);
 '   DROP TABLE public.entity_value_select;
       public         postgres    false    6            ^
           0    0 '   COLUMN entity_value_select.attribute_id    COMMENT     ;   COMMENT ON COLUMN entity_value_select.attribute_id IS '
';
            public       postgres    false    219            �            1259    17698    entity_value_select_id_seq    SEQUENCE     |   CREATE SEQUENCE entity_value_select_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.entity_value_select_id_seq;
       public       postgres    false    6    219            _
           0    0    entity_value_select_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE entity_value_select_id_seq OWNED BY entity_value_select.id;
            public       postgres    false    220            �            1259    17700    entity_value_text    TABLE     }   CREATE TABLE entity_value_text (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value text
);
 %   DROP TABLE public.entity_value_text;
       public         postgres    false    6            `
           0    0 %   COLUMN entity_value_text.attribute_id    COMMENT     9   COMMENT ON COLUMN entity_value_text.attribute_id IS ' ';
            public       postgres    false    221            �            1259    17706    entity_value_text_id_seq    SEQUENCE     z   CREATE SEQUENCE entity_value_text_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.entity_value_text_id_seq;
       public       postgres    false    221    6            a
           0    0    entity_value_text_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE entity_value_text_id_seq OWNED BY entity_value_text.id;
            public       postgres    false    222            �            1259    17708    entity_value_timestamp    TABLE     �   CREATE TABLE entity_value_timestamp (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value timestamp without time zone
);
 *   DROP TABLE public.entity_value_timestamp;
       public         postgres    false    6            �            1259    17711    entity_value_timestamp_id_seq    SEQUENCE        CREATE SEQUENCE entity_value_timestamp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.entity_value_timestamp_id_seq;
       public       postgres    false    6    223            b
           0    0    entity_value_timestamp_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE entity_value_timestamp_id_seq OWNED BY entity_value_timestamp.id;
            public       postgres    false    224            �            1259    17713    features    TABLE     l   CREATE TABLE features (
    id integer NOT NULL,
    name character varying(100)[],
    description text
);
    DROP TABLE public.features;
       public         postgres    false    6            �            1259    17719    features_entity_definitions    TABLE     �   CREATE TABLE features_entity_definitions (
    id integer NOT NULL,
    feature_id integer,
    entity_definition_id integer
);
 /   DROP TABLE public.features_entity_definitions;
       public         postgres    false    6            �            1259    17722 "   features_entity_definitions_id_seq    SEQUENCE     �   CREATE SEQUENCE features_entity_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.features_entity_definitions_id_seq;
       public       postgres    false    226    6            c
           0    0 "   features_entity_definitions_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE features_entity_definitions_id_seq OWNED BY features_entity_definitions.id;
            public       postgres    false    227            �            1259    17724    features_id_seq    SEQUENCE     q   CREATE SEQUENCE features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.features_id_seq;
       public       postgres    false    6    225            d
           0    0    features_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE features_id_seq OWNED BY features.id;
            public       postgres    false    228            �            1259    17726    financial_plan    TABLE     o   CREATE TABLE financial_plan (
    id integer NOT NULL,
    name character varying(50),
    description text
);
 "   DROP TABLE public.financial_plan;
       public         postgres    false    6            �            1259    17732 &   financial_plan_entity_definition_price    TABLE     �   CREATE TABLE financial_plan_entity_definition_price (
    id integer NOT NULL,
    financial_plan_id integer,
    entity_definition_id integer,
    price_id integer
);
 :   DROP TABLE public.financial_plan_entity_definition_price;
       public         postgres    false    6            �            1259    17735 -   financial_plan_entity_definition_price_id_seq    SEQUENCE     �   CREATE SEQUENCE financial_plan_entity_definition_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.financial_plan_entity_definition_price_id_seq;
       public       postgres    false    6    230            e
           0    0 -   financial_plan_entity_definition_price_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE financial_plan_entity_definition_price_id_seq OWNED BY financial_plan_entity_definition_price.id;
            public       postgres    false    231            �            1259    17737    financial_plan_id_seq    SEQUENCE     w   CREATE SEQUENCE financial_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.financial_plan_id_seq;
       public       postgres    false    6    229            f
           0    0    financial_plan_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE financial_plan_id_seq OWNED BY financial_plan.id;
            public       postgres    false    232            �            1259    17739    price    TABLE     �   CREATE TABLE price (
    id integer NOT NULL,
    value double precision,
    currency character varying(3),
    description character varying(50)
);
    DROP TABLE public.price;
       public         postgres    false    6            �            1259    17742    price_id_seq    SEQUENCE     n   CREATE SEQUENCE price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.price_id_seq;
       public       postgres    false    6    233            g
           0    0    price_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE price_id_seq OWNED BY price.id;
            public       postgres    false    234            �            1259    17744    reservation_entity    TABLE     �   CREATE TABLE reservation_entity (
    id integer NOT NULL,
    guest_id integer,
    entity_id integer NOT NULL,
    reservation_id integer NOT NULL,
    date_from timestamp without time zone,
    date_to timestamp without time zone
);
 &   DROP TABLE public.reservation_entity;
       public         postgres    false    6            �            1259    17747    reservation_entity_id_seq    SEQUENCE     {   CREATE SEQUENCE reservation_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.reservation_entity_id_seq;
       public       postgres    false    6    235            h
           0    0    reservation_entity_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE reservation_entity_id_seq OWNED BY reservation_entity.id;
            public       postgres    false    236            �            1259    17749    reservation_status    TABLE     �   CREATE TABLE reservation_status (
    id integer NOT NULL,
    statustext character varying(50),
    statusvalue character varying(20),
    user_id integer
);
 &   DROP TABLE public.reservation_status;
       public         postgres    false    6            �            1259    17752    reservations    TABLE     �  CREATE TABLE reservations (
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
    status_id integer,
    user_id integer
);
     DROP TABLE public.reservations;
       public         postgres    false    6            i
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
            public       postgres    false    238            j
           0    0 "   COLUMN reservations.reservation_id    COMMENT     ^   COMMENT ON COLUMN reservations.reservation_id IS ' - id rezervacije za prikaz na front-endu';
            public       postgres    false    238            k
           0    0    COLUMN reservations.status    COMMENT     q   COMMENT ON COLUMN reservations.status IS '- treba da bude enum, za sada je varchar, zbog jednostavnije izzmene';
            public       postgres    false    238            l
           0    0    COLUMN reservations.comment    COMMENT     Z   COMMENT ON COLUMN reservations.comment IS '- comment - free entry, optional at check-in';
            public       postgres    false    238            �            1259    17762    reservations_id_seq    SEQUENCE     u   CREATE SEQUENCE reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.reservations_id_seq;
       public       postgres    false    6    238            m
           0    0    reservations_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE reservations_id_seq OWNED BY reservations.id;
            public       postgres    false    239            n
           0    0    SEQUENCE reservations_id_seq    COMMENT     {   COMMENT ON SEQUENCE reservations_id_seq IS ' - reset auto increment to 1;
SELECT setval(''reservation_id_seq'',1,false);';
            public       postgres    false    239            �            1259    17764    rezervation_status_id_seq    SEQUENCE     {   CREATE SEQUENCE rezervation_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.rezervation_status_id_seq;
       public       postgres    false    237    6            o
           0    0    rezervation_status_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE rezervation_status_id_seq OWNED BY reservation_status.id;
            public       postgres    false    240            �            1259    17766    role    TABLE     n   CREATE TABLE role (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);
    DROP TABLE public.role;
       public         postgres    false    6            p
           0    0 
   TABLE role    COMMENT     :   COMMENT ON TABLE role IS 'Table of possible user roles.';
            public       postgres    false    241            �            1259    17772    role_id_seq    SEQUENCE     m   CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public       postgres    false    6    241            q
           0    0    role_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE role_id_seq OWNED BY role.id;
            public       postgres    false    242            �            1259    17774 	   role_task    TABLE     g   CREATE TABLE role_task (
    id integer NOT NULL,
    role_id integer NOT NULL,
    task_id integer
);
    DROP TABLE public.role_task;
       public         postgres    false    6            r
           0    0    TABLE role_task    COMMENT     G   COMMENT ON TABLE role_task IS 'Table which connects roles and tasks.';
            public       postgres    false    243            s
           0    0    COLUMN role_task.role_id    COMMENT     A   COMMENT ON COLUMN role_task.role_id IS 'Reference to the role.';
            public       postgres    false    243            t
           0    0    COLUMN role_task.task_id    COMMENT     F   COMMENT ON COLUMN role_task.task_id IS 'Reference to the user task.';
            public       postgres    false    243            �            1259    17777    role_task_id_seq    SEQUENCE     r   CREATE SEQUENCE role_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.role_task_id_seq;
       public       postgres    false    243    6            u
           0    0    role_task_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE role_task_id_seq OWNED BY role_task.id;
            public       postgres    false    244            �            1259    17779    roomlist    VIEW     �   CREATE VIEW roomlist AS
 SELECT e.guid,
    eavi.value
   FROM entity e,
    attribute a,
    entity_value_integer eavi
  WHERE ((eavi.entity_id = e.id) AND (eavi.attribute_id = a.id));
    DROP VIEW public.roomlist;
       public       postgres    false    180    217    217    190    190    217    6            �            1259    17783    status    TABLE     R   CREATE TABLE status (
    id integer NOT NULL,
    value character varying(50)
);
    DROP TABLE public.status;
       public         postgres    false    6            �            1259    17786    status_id_seq    SEQUENCE     o   CREATE SEQUENCE status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public       postgres    false    246    6            v
           0    0    status_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE status_id_seq OWNED BY status.id;
            public       postgres    false    247            �            1259    17788    task    TABLE     n   CREATE TABLE task (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);
    DROP TABLE public.task;
       public         postgres    false    6            w
           0    0 
   TABLE task    COMMENT     :   COMMENT ON TABLE task IS 'Table of possible user tasks.';
            public       postgres    false    248            �            1259    17794    task_id_seq    SEQUENCE     m   CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.task_id_seq;
       public       postgres    false    6    248            x
           0    0    task_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE task_id_seq OWNED BY task.id;
            public       postgres    false    249            �            1259    17796    title    TABLE     Q   CREATE TABLE title (
    id integer NOT NULL,
    title character varying(20)
);
    DROP TABLE public.title;
       public         postgres    false    6            �            1259    17799    title_id_seq    SEQUENCE     n   CREATE SEQUENCE title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.title_id_seq;
       public       postgres    false    250    6            y
           0    0    title_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE title_id_seq OWNED BY title.id;
            public       postgres    false    251            �            1259    17801    user    TABLE     �  CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(255),
    role_id integer DEFAULT 1,
    first_name character varying(50),
    last_name character varying(50),
    address text,
    city character varying(25),
    country character varying(25),
    pcode character varying(10),
    phone character varying(25),
    approved boolean
);
    DROP TABLE public."user";
       public         postgres    false    6            z
           0    0    TABLE "user"    COMMENT     ,   COMMENT ON TABLE "user" IS 'System users.';
            public       postgres    false    252            �            1259    17805    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    6    252            {
           0    0    users_id_seq    SEQUENCE OWNED BY     0   ALTER SEQUENCE users_id_seq OWNED BY "user".id;
            public       postgres    false    253            �           2604    17807    id    DEFAULT     ^   ALTER TABLE ONLY attribute ALTER COLUMN id SET DEFAULT nextval('attribute_id_seq'::regclass);
 ;   ALTER TABLE public.attribute ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    181    180            �           2604    17808    id    DEFAULT     z   ALTER TABLE ONLY attribute_option_values ALTER COLUMN id SET DEFAULT nextval('attribute_option_values_id_seq'::regclass);
 I   ALTER TABLE public.attribute_option_values ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    183    182            �           2604    17809    id    DEFAULT     \   ALTER TABLE ONLY business ALTER COLUMN id SET DEFAULT nextval('business_id_seq'::regclass);
 :   ALTER TABLE public.business ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    184            �           2604    17810    id    DEFAULT     `   ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186            �           2604    17811    id    DEFAULT     Z   ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188            �           2604    17812    id    DEFAULT     X   ALTER TABLE ONLY entity ALTER COLUMN id SET DEFAULT nextval('entity_id_seq'::regclass);
 8   ALTER TABLE public.entity ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    190            �           2604    17813    id    DEFAULT     j   ALTER TABLE ONLY entity_category ALTER COLUMN id SET DEFAULT nextval('entity_category_id_seq'::regclass);
 A   ALTER TABLE public.entity_category ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    191            �           2604    17814    id    DEFAULT     n   ALTER TABLE ONLY entity_definition ALTER COLUMN id SET DEFAULT nextval('entity_definition_id_seq'::regclass);
 C   ALTER TABLE public.entity_definition ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    193            �           2604    17815    id    DEFAULT        ALTER TABLE ONLY entity_definition_value_boolean ALTER COLUMN id SET DEFAULT nextval('entity_value_boolean_id_seq'::regclass);
 Q   ALTER TABLE public.entity_definition_value_boolean ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    195            �           2604    17816    id    DEFAULT     �   ALTER TABLE ONLY entity_definition_value_character ALTER COLUMN id SET DEFAULT nextval('entity_definition_value_character_id_seq'::regclass);
 S   ALTER TABLE public.entity_definition_value_character ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �           2604    17817    id    DEFAULT     �   ALTER TABLE ONLY entity_definition_value_select ALTER COLUMN id SET DEFAULT nextval('entity_definition_value_select_id_seq'::regclass);
 P   ALTER TABLE public.entity_definition_value_select ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            �           2604    17818    id    DEFAULT     �   ALTER TABLE ONLY entity_definition_value_text ALTER COLUMN id SET DEFAULT nextval('entity_definition_value_text_id_seq'::regclass);
 N   ALTER TABLE public.entity_definition_value_text ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            �           2604    17819    id    DEFAULT     b   ALTER TABLE ONLY entity_type ALTER COLUMN id SET DEFAULT nextval('entity_type_id_seq'::regclass);
 =   ALTER TABLE public.entity_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    207            �           2604    17820    id    DEFAULT     v   ALTER TABLE ONLY entity_type_attribute ALTER COLUMN id SET DEFAULT nextval('entity_type_attribute_id_seq'::regclass);
 G   ALTER TABLE public.entity_type_attribute ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            �           2604    17821    id    DEFAULT     u   ALTER TABLE ONLY entity_value_boolean ALTER COLUMN id SET DEFAULT nextval('entity_value_boolean_id_seq1'::regclass);
 F   ALTER TABLE public.entity_value_boolean ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    211            �           2604    17822    id    DEFAULT     x   ALTER TABLE ONLY entity_value_character ALTER COLUMN id SET DEFAULT nextval('entity_value_character_id_seq'::regclass);
 H   ALTER TABLE public.entity_value_character ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    213            �           2604    17823    id    DEFAULT     r   ALTER TABLE ONLY entity_value_double ALTER COLUMN id SET DEFAULT nextval('entity_value_double_id_seq'::regclass);
 E   ALTER TABLE public.entity_value_double ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    215            �           2604    17824    id    DEFAULT     t   ALTER TABLE ONLY entity_value_integer ALTER COLUMN id SET DEFAULT nextval('entity_value_integer_id_seq'::regclass);
 F   ALTER TABLE public.entity_value_integer ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    218    217            �           2604    17825    id    DEFAULT     r   ALTER TABLE ONLY entity_value_select ALTER COLUMN id SET DEFAULT nextval('entity_value_select_id_seq'::regclass);
 E   ALTER TABLE public.entity_value_select ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    219            �           2604    17826    id    DEFAULT     n   ALTER TABLE ONLY entity_value_text ALTER COLUMN id SET DEFAULT nextval('entity_value_text_id_seq'::regclass);
 C   ALTER TABLE public.entity_value_text ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    221            �           2604    17827    id    DEFAULT     x   ALTER TABLE ONLY entity_value_timestamp ALTER COLUMN id SET DEFAULT nextval('entity_value_timestamp_id_seq'::regclass);
 H   ALTER TABLE public.entity_value_timestamp ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    224    223            �           2604    17828    id    DEFAULT     \   ALTER TABLE ONLY features ALTER COLUMN id SET DEFAULT nextval('features_id_seq'::regclass);
 :   ALTER TABLE public.features ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    228    225            �           2604    17829    id    DEFAULT     �   ALTER TABLE ONLY features_entity_definitions ALTER COLUMN id SET DEFAULT nextval('features_entity_definitions_id_seq'::regclass);
 M   ALTER TABLE public.features_entity_definitions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226            �           2604    17830    id    DEFAULT     h   ALTER TABLE ONLY financial_plan ALTER COLUMN id SET DEFAULT nextval('financial_plan_id_seq'::regclass);
 @   ALTER TABLE public.financial_plan ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    232    229            �           2604    17831    id    DEFAULT     �   ALTER TABLE ONLY financial_plan_entity_definition_price ALTER COLUMN id SET DEFAULT nextval('financial_plan_entity_definition_price_id_seq'::regclass);
 X   ALTER TABLE public.financial_plan_entity_definition_price ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    230            �           2604    17832    id    DEFAULT     V   ALTER TABLE ONLY price ALTER COLUMN id SET DEFAULT nextval('price_id_seq'::regclass);
 7   ALTER TABLE public.price ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    234    233            �           2604    17833    id    DEFAULT     p   ALTER TABLE ONLY reservation_entity ALTER COLUMN id SET DEFAULT nextval('reservation_entity_id_seq'::regclass);
 D   ALTER TABLE public.reservation_entity ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    236    235            �           2604    17834    id    DEFAULT     p   ALTER TABLE ONLY reservation_status ALTER COLUMN id SET DEFAULT nextval('rezervation_status_id_seq'::regclass);
 D   ALTER TABLE public.reservation_status ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    240    237            �           2604    17835    id    DEFAULT     d   ALTER TABLE ONLY reservations ALTER COLUMN id SET DEFAULT nextval('reservations_id_seq'::regclass);
 >   ALTER TABLE public.reservations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    239    238            �           2604    17836    id    DEFAULT     T   ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    242    241            �           2604    17837    id    DEFAULT     ^   ALTER TABLE ONLY role_task ALTER COLUMN id SET DEFAULT nextval('role_task_id_seq'::regclass);
 ;   ALTER TABLE public.role_task ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    244    243            �           2604    17838    id    DEFAULT     X   ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);
 8   ALTER TABLE public.status ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    247    246            �           2604    17839    id    DEFAULT     T   ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);
 6   ALTER TABLE public.task ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    249    248            �           2604    17840    id    DEFAULT     V   ALTER TABLE ONLY title ALTER COLUMN id SET DEFAULT nextval('title_id_seq'::regclass);
 7   ALTER TABLE public.title ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    251    250            �           2604    17841    id    DEFAULT     W   ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    253    252            �	          0    17568 	   attribute 
   TABLE DATA               `   COPY attribute (id, code, label, type, sort_order, unit, "unique", nullable, scope) FROM stdin;
    public       postgres    false    180   ��      |
           0    0    attribute_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('attribute_id_seq', 88, true);
            public       postgres    false    181            �	          0    17576    attribute_option_values 
   TABLE DATA               I   COPY attribute_option_values (id, attribute_id, value, text) FROM stdin;
    public       postgres    false    182   [�      }
           0    0    attribute_option_values_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('attribute_option_values_id_seq', 87, true);
            public       postgres    false    183            �	          0    17581    business 
   TABLE DATA               �   COPY business (id, name, description, company_name, address, phone, email, contact_first_name, contact_last_name, user_id) FROM stdin;
    public       postgres    false    184   ��      ~
           0    0    business_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('business_id_seq', 6, true);
            public       postgres    false    185            �	          0    17589 
   categories 
   TABLE DATA               ?   COPY categories (id, name, description, parent_id) FROM stdin;
    public       postgres    false    186   ��      
           0    0    categories_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('categories_id_seq', 1, false);
            public       postgres    false    187            �	          0    17597    clients 
   TABLE DATA               �   COPY clients (id, first_name, last_name, address1, address2, city, zipcode, country, phone, mobile, fax, email, title, guest_class, title_id, user_id) FROM stdin;
    public       postgres    false    188   5�      �
           0    0    clients_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('clients_id_seq', 47, true);
            public       postgres    false    189            
          0    17605    entity 
   TABLE DATA               E   COPY entity (id, definition_id, status, guid, status_id) FROM stdin;
    public       postgres    false    190   %�      
          0    17611    entity_category 
   TABLE DATA               >   COPY entity_category (id, entity_id, category_id) FROM stdin;
    public       postgres    false    191   }�      �
           0    0    entity_category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('entity_category_id_seq', 1, false);
            public       postgres    false    192            
          0    17616    entity_definition 
   TABLE DATA               ]   COPY entity_definition (id, entity_type_id, name, code, description, price, pax) FROM stdin;
    public       postgres    false    193   ��      �
           0    0    entity_definition_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('entity_definition_id_seq', 56, true);
            public       postgres    false    194            
          0    17625    entity_definition_value_boolean 
   TABLE DATA               a   COPY entity_definition_value_boolean (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    195   �      
          0    17628 !   entity_definition_value_character 
   TABLE DATA               c   COPY entity_definition_value_character (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    196   =�      �
           0    0 (   entity_definition_value_character_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('entity_definition_value_character_id_seq', 11, true);
            public       postgres    false    197            

          0    17635    entity_definition_value_double 
   TABLE DATA               `   COPY entity_definition_value_double (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    199   Z�      
          0    17639    entity_definition_value_integer 
   TABLE DATA               a   COPY entity_definition_value_integer (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    200   ��      
          0    17643    entity_definition_value_select 
   TABLE DATA               `   COPY entity_definition_value_select (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    201   ��      �
           0    0 %   entity_definition_value_select_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('entity_definition_value_select_id_seq', 32, true);
            public       postgres    false    202            
          0    17648    entity_definition_value_text 
   TABLE DATA               ^   COPY entity_definition_value_text (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    203   ��      �
           0    0 #   entity_definition_value_text_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('entity_definition_value_text_id_seq', 17, true);
            public       postgres    false    204            
          0    17656 !   entity_definition_value_timestamp 
   TABLE DATA               c   COPY entity_definition_value_timestamp (id, entity_definition_id, attribute_id, value) FROM stdin;
    public       postgres    false    205   ܣ      �
           0    0    entity_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('entity_id_seq', 82, true);
            public       postgres    false    206            
          0    17661    entity_type 
   TABLE DATA               O   COPY entity_type (id, name, description, time_resolution, user_id) FROM stdin;
    public       postgres    false    207   ��      
          0    17668    entity_type_attribute 
   TABLE DATA               J   COPY entity_type_attribute (id, entity_type_id, attribute_id) FROM stdin;
    public       postgres    false    208   G�      �
           0    0    entity_type_attribute_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('entity_type_attribute_id_seq', 79, true);
            public       postgres    false    209            �
           0    0    entity_type_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('entity_type_id_seq', 31, true);
            public       postgres    false    210            
          0    17675    entity_value_boolean 
   TABLE DATA               K   COPY entity_value_boolean (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    211   v�      �
           0    0    entity_value_boolean_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('entity_value_boolean_id_seq', 189, true);
            public       postgres    false    198            �
           0    0    entity_value_boolean_id_seq1    SEQUENCE SET     C   SELECT pg_catalog.setval('entity_value_boolean_id_seq1', 6, true);
            public       postgres    false    212            
          0    17680    entity_value_character 
   TABLE DATA               M   COPY entity_value_character (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    213   ��      �
           0    0    entity_value_character_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('entity_value_character_id_seq', 21, true);
            public       postgres    false    214            
          0    17685    entity_value_double 
   TABLE DATA               J   COPY entity_value_double (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    215   ��      �
           0    0    entity_value_double_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('entity_value_double_id_seq', 2, true);
            public       postgres    false    216            
          0    17690    entity_value_integer 
   TABLE DATA               K   COPY entity_value_integer (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    217   ͤ      �
           0    0    entity_value_integer_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('entity_value_integer_id_seq', 1, false);
            public       postgres    false    218            
          0    17695    entity_value_select 
   TABLE DATA               J   COPY entity_value_select (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    219   �      �
           0    0    entity_value_select_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('entity_value_select_id_seq', 70, true);
            public       postgres    false    220             
          0    17700    entity_value_text 
   TABLE DATA               H   COPY entity_value_text (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    221   �      �
           0    0    entity_value_text_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('entity_value_text_id_seq', 1, false);
            public       postgres    false    222            "
          0    17708    entity_value_timestamp 
   TABLE DATA               M   COPY entity_value_timestamp (id, attribute_id, entity_id, value) FROM stdin;
    public       postgres    false    223   $�      �
           0    0    entity_value_timestamp_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('entity_value_timestamp_id_seq', 1, false);
            public       postgres    false    224            $
          0    17713    features 
   TABLE DATA               2   COPY features (id, name, description) FROM stdin;
    public       postgres    false    225   A�      %
          0    17719    features_entity_definitions 
   TABLE DATA               T   COPY features_entity_definitions (id, feature_id, entity_definition_id) FROM stdin;
    public       postgres    false    226   ^�      �
           0    0 "   features_entity_definitions_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('features_entity_definitions_id_seq', 1, false);
            public       postgres    false    227            �
           0    0    features_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('features_id_seq', 1, false);
            public       postgres    false    228            (
          0    17726    financial_plan 
   TABLE DATA               8   COPY financial_plan (id, name, description) FROM stdin;
    public       postgres    false    229   {�      )
          0    17732 &   financial_plan_entity_definition_price 
   TABLE DATA               p   COPY financial_plan_entity_definition_price (id, financial_plan_id, entity_definition_id, price_id) FROM stdin;
    public       postgres    false    230   ��      �
           0    0 -   financial_plan_entity_definition_price_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('financial_plan_entity_definition_price_id_seq', 1, false);
            public       postgres    false    231            �
           0    0    financial_plan_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('financial_plan_id_seq', 1, false);
            public       postgres    false    232            ,
          0    17739    price 
   TABLE DATA               :   COPY price (id, value, currency, description) FROM stdin;
    public       postgres    false    233   ��      �
           0    0    price_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('price_id_seq', 1, false);
            public       postgres    false    234            .
          0    17744    reservation_entity 
   TABLE DATA               b   COPY reservation_entity (id, guest_id, entity_id, reservation_id, date_from, date_to) FROM stdin;
    public       postgres    false    235   ҥ      �
           0    0    reservation_entity_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('reservation_entity_id_seq', 163, true);
            public       postgres    false    236            0
          0    17749    reservation_status 
   TABLE DATA               K   COPY reservation_status (id, statustext, statusvalue, user_id) FROM stdin;
    public       postgres    false    237   (�      1
          0    17752    reservations 
   TABLE DATA               �   COPY reservations (id, reservation_id, status, created_at, modified_at, client_id, pax_a, pax_y, pax_c, comment, status_id, user_id) FROM stdin;
    public       postgres    false    238   ��      �
           0    0    reservations_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('reservations_id_seq', 188, true);
            public       postgres    false    239            �
           0    0    rezervation_status_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('rezervation_status_id_seq', 7, true);
            public       postgres    false    240            4
          0    17766    role 
   TABLE DATA               .   COPY role (id, name, description) FROM stdin;
    public       postgres    false    241   �      �
           0    0    role_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('role_id_seq', 1, false);
            public       postgres    false    242            6
          0    17774 	   role_task 
   TABLE DATA               2   COPY role_task (id, role_id, task_id) FROM stdin;
    public       postgres    false    243   ��      �
           0    0    role_task_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('role_task_id_seq', 1, true);
            public       postgres    false    244            8
          0    17783    status 
   TABLE DATA               $   COPY status (id, value) FROM stdin;
    public       postgres    false    246   �      �
           0    0    status_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('status_id_seq', 5, true);
            public       postgres    false    247            :
          0    17788    task 
   TABLE DATA               .   COPY task (id, name, description) FROM stdin;
    public       postgres    false    248   B�      �
           0    0    task_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('task_id_seq', 1, false);
            public       postgres    false    249            <
          0    17796    title 
   TABLE DATA               #   COPY title (id, title) FROM stdin;
    public       postgres    false    250   ̨      �
           0    0    title_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('title_id_seq', 3, true);
            public       postgres    false    251            >
          0    17801    user 
   TABLE DATA               �   COPY "user" (id, username, password, email, role_id, first_name, last_name, address, city, country, pcode, phone, approved) FROM stdin;
    public       postgres    false    252   ��      �
           0    0    users_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('users_id_seq', 16, true);
            public       postgres    false    253            �           2606    17843    attribute_option_value_pk 
   CONSTRAINT     h   ALTER TABLE ONLY attribute_option_values
    ADD CONSTRAINT attribute_option_value_pk PRIMARY KEY (id);
 [   ALTER TABLE ONLY public.attribute_option_values DROP CONSTRAINT attribute_option_value_pk;
       public         postgres    false    182    182            �           2606    17845    attribute_option_value_uk 
   CONSTRAINT     t   ALTER TABLE ONLY attribute_option_values
    ADD CONSTRAINT attribute_option_value_uk UNIQUE (attribute_id, value);
 [   ALTER TABLE ONLY public.attribute_option_values DROP CONSTRAINT attribute_option_value_uk;
       public         postgres    false    182    182    182            �           2606    17847    attribute_pk 
   CONSTRAINT     M   ALTER TABLE ONLY attribute
    ADD CONSTRAINT attribute_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.attribute DROP CONSTRAINT attribute_pk;
       public         postgres    false    180    180            �           2606    17849    business_pk 
   CONSTRAINT     K   ALTER TABLE ONLY business
    ADD CONSTRAINT business_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.business DROP CONSTRAINT business_pk;
       public         postgres    false    184    184            �           2606    17851    categories_pk 
   CONSTRAINT     O   ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pk;
       public         postgres    false    186    186            �           2606    17853 
   clients_pk 
   CONSTRAINT     I   ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pk;
       public         postgres    false    188    188            �           2606    17855    entity_category_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY entity_category
    ADD CONSTRAINT entity_category_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.entity_category DROP CONSTRAINT entity_category_pk;
       public         postgres    false    191    191            �           2606    17857 $   entity_definition_value_character_pk 
   CONSTRAINT     }   ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT entity_definition_value_character_pk PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.entity_definition_value_character DROP CONSTRAINT entity_definition_value_character_pk;
       public         postgres    false    196    196            �           2606    17859 $   entity_definition_value_character_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT entity_definition_value_character_uk UNIQUE (entity_definition_id, attribute_id);
 p   ALTER TABLE ONLY public.entity_definition_value_character DROP CONSTRAINT entity_definition_value_character_uk;
       public         postgres    false    196    196    196            �           2606    17861 !   entity_definition_value_double_pk 
   CONSTRAINT     w   ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT entity_definition_value_double_pk PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.entity_definition_value_double DROP CONSTRAINT entity_definition_value_double_pk;
       public         postgres    false    199    199            �           2606    17863 !   entity_definition_value_double_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT entity_definition_value_double_uk UNIQUE (entity_definition_id, attribute_id);
 j   ALTER TABLE ONLY public.entity_definition_value_double DROP CONSTRAINT entity_definition_value_double_uk;
       public         postgres    false    199    199    199            �           2606    17865 "   entity_definition_value_integer_pk 
   CONSTRAINT     y   ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT entity_definition_value_integer_pk PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.entity_definition_value_integer DROP CONSTRAINT entity_definition_value_integer_pk;
       public         postgres    false    200    200            	           2606    17867 "   entity_definition_value_integer_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT entity_definition_value_integer_uk UNIQUE (entity_definition_id, attribute_id);
 l   ALTER TABLE ONLY public.entity_definition_value_integer DROP CONSTRAINT entity_definition_value_integer_uk;
       public         postgres    false    200    200    200            �           2606    17869    entity_definition_value_pk 
   CONSTRAINT     q   ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT entity_definition_value_pk PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.entity_definition_value_boolean DROP CONSTRAINT entity_definition_value_pk;
       public         postgres    false    195    195            	           2606    17871 !   entity_definition_value_select_pk 
   CONSTRAINT     w   ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT entity_definition_value_select_pk PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.entity_definition_value_select DROP CONSTRAINT entity_definition_value_select_pk;
       public         postgres    false    201    201            	           2606    17873 !   entity_definition_value_select_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT entity_definition_value_select_uk UNIQUE (entity_definition_id, attribute_id);
 j   ALTER TABLE ONLY public.entity_definition_value_select DROP CONSTRAINT entity_definition_value_select_uk;
       public         postgres    false    201    201    201            		           2606    17875    entity_definition_value_text_pk 
   CONSTRAINT     s   ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT entity_definition_value_text_pk PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.entity_definition_value_text DROP CONSTRAINT entity_definition_value_text_pk;
       public         postgres    false    203    203            	           2606    17877    entity_definition_value_text_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT entity_definition_value_text_uk UNIQUE (entity_definition_id, attribute_id);
 f   ALTER TABLE ONLY public.entity_definition_value_text DROP CONSTRAINT entity_definition_value_text_uk;
       public         postgres    false    203    203    203            	           2606    17879 $   entity_definition_value_timestamp_pk 
   CONSTRAINT     }   ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT entity_definition_value_timestamp_pk PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.entity_definition_value_timestamp DROP CONSTRAINT entity_definition_value_timestamp_pk;
       public         postgres    false    205    205            	           2606    17881 $   entity_definition_value_timestamp_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT entity_definition_value_timestamp_uk UNIQUE (entity_definition_id, attribute_id);
 p   ALTER TABLE ONLY public.entity_definition_value_timestamp DROP CONSTRAINT entity_definition_value_timestamp_uk;
       public         postgres    false    205    205    205            �           2606    17883    entity_definition_value_uk 
   CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT entity_definition_value_uk UNIQUE (entity_definition_id, attribute_id);
 d   ALTER TABLE ONLY public.entity_definition_value_boolean DROP CONSTRAINT entity_definition_value_uk;
       public         postgres    false    195    195    195            �           2606    17885    entity_definiton_pk 
   CONSTRAINT     \   ALTER TABLE ONLY entity_definition
    ADD CONSTRAINT entity_definiton_pk PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.entity_definition DROP CONSTRAINT entity_definiton_pk;
       public         postgres    false    193    193            �           2606    17887 	   entity_pk 
   CONSTRAINT     G   ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_pk;
       public         postgres    false    190    190            	           2606    17889    entity_type_attribute_pk 
   CONSTRAINT     e   ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT entity_type_attribute_pk PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.entity_type_attribute DROP CONSTRAINT entity_type_attribute_pk;
       public         postgres    false    208    208            	           2606    17891    entity_type_attribute_uk 
   CONSTRAINT     z   ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT entity_type_attribute_uk UNIQUE (entity_type_id, attribute_id);
 X   ALTER TABLE ONLY public.entity_type_attribute DROP CONSTRAINT entity_type_attribute_uk;
       public         postgres    false    208    208    208            	           2606    17893    entity_type_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY entity_type
    ADD CONSTRAINT entity_type_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.entity_type DROP CONSTRAINT entity_type_pk;
       public         postgres    false    207    207            �           2606    17895 	   entity_uk 
   CONSTRAINT     D   ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_uk UNIQUE (guid);
 :   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_uk;
       public         postgres    false    190    190            	           2606    17897    evb_pk 
   CONSTRAINT     R   ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_pk PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.entity_value_boolean DROP CONSTRAINT evb_pk;
       public         postgres    false    211    211            	           2606    17899    evb_uk 
   CONSTRAINT     b   ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_uk UNIQUE (attribute_id, entity_id);
 E   ALTER TABLE ONLY public.entity_value_boolean DROP CONSTRAINT evb_uk;
       public         postgres    false    211    211    211            	           2606    17901    evc_pk 
   CONSTRAINT     T   ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.entity_value_character DROP CONSTRAINT evc_pk;
       public         postgres    false    213    213            !	           2606    17903    evc_uk 
   CONSTRAINT     d   ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_uk UNIQUE (attribute_id, entity_id);
 G   ALTER TABLE ONLY public.entity_value_character DROP CONSTRAINT evc_uk;
       public         postgres    false    213    213    213            #	           2606    17905    evd_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.entity_value_double DROP CONSTRAINT evd_pk;
       public         postgres    false    215    215            %	           2606    17907    evd_uk 
   CONSTRAINT     a   ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_uk UNIQUE (attribute_id, entity_id);
 D   ALTER TABLE ONLY public.entity_value_double DROP CONSTRAINT evd_uk;
       public         postgres    false    215    215    215            '	           2606    17909    evi_pk 
   CONSTRAINT     R   ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT evi_pk PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.entity_value_integer DROP CONSTRAINT evi_pk;
       public         postgres    false    217    217            )	           2606    17911    evi_uk 
   CONSTRAINT     b   ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT evi_uk UNIQUE (attribute_id, entity_id);
 E   ALTER TABLE ONLY public.entity_value_integer DROP CONSTRAINT evi_uk;
       public         postgres    false    217    217    217            +	           2606    17913    evs_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.entity_value_select DROP CONSTRAINT evs_pk;
       public         postgres    false    219    219            -	           2606    17915    evs_uk 
   CONSTRAINT     a   ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_uk UNIQUE (attribute_id, entity_id);
 D   ALTER TABLE ONLY public.entity_value_select DROP CONSTRAINT evs_uk;
       public         postgres    false    219    219    219            3	           2606    17917    evtm_pk 
   CONSTRAINT     U   ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.entity_value_timestamp DROP CONSTRAINT evtm_pk;
       public         postgres    false    223    223            5	           2606    17919    evtm_uk 
   CONSTRAINT     e   ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_uk UNIQUE (attribute_id, entity_id);
 H   ALTER TABLE ONLY public.entity_value_timestamp DROP CONSTRAINT evtm_uk;
       public         postgres    false    223    223    223            /	           2606    17921    evtxt_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.entity_value_text DROP CONSTRAINT evtxt_pk;
       public         postgres    false    221    221            1	           2606    17923    evtxt_uk 
   CONSTRAINT     a   ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_uk UNIQUE (attribute_id, entity_id);
 D   ALTER TABLE ONLY public.entity_value_text DROP CONSTRAINT evtxt_uk;
       public         postgres    false    221    221    221            9	           2606    17925    features_entity_definitions_pk 
   CONSTRAINT     q   ALTER TABLE ONLY features_entity_definitions
    ADD CONSTRAINT features_entity_definitions_pk PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.features_entity_definitions DROP CONSTRAINT features_entity_definitions_pk;
       public         postgres    false    226    226            7	           2606    17927    features_pk 
   CONSTRAINT     K   ALTER TABLE ONLY features
    ADD CONSTRAINT features_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.features DROP CONSTRAINT features_pk;
       public         postgres    false    225    225            >	           2606    17929 )   financial_plan_entity_definition_price_pk 
   CONSTRAINT     �   ALTER TABLE ONLY financial_plan_entity_definition_price
    ADD CONSTRAINT financial_plan_entity_definition_price_pk PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.financial_plan_entity_definition_price DROP CONSTRAINT financial_plan_entity_definition_price_pk;
       public         postgres    false    230    230            @	           2606    17931 )   financial_plan_entity_definition_price_uk 
   CONSTRAINT     �   ALTER TABLE ONLY financial_plan_entity_definition_price
    ADD CONSTRAINT financial_plan_entity_definition_price_uk UNIQUE (financial_plan_id, entity_definition_id, price_id);
 z   ALTER TABLE ONLY public.financial_plan_entity_definition_price DROP CONSTRAINT financial_plan_entity_definition_price_uk;
       public         postgres    false    230    230    230    230            <	           2606    17933    financial_plan_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY financial_plan
    ADD CONSTRAINT financial_plan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.financial_plan DROP CONSTRAINT financial_plan_pkey;
       public         postgres    false    229    229            B	           2606    17935    price pk 
   CONSTRAINT     G   ALTER TABLE ONLY price
    ADD CONSTRAINT "price pk" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.price DROP CONSTRAINT "price pk";
       public         postgres    false    233    233            F	           2606    17937    reservation_entity_pk 
   CONSTRAINT     _   ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT reservation_entity_pk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.reservation_entity DROP CONSTRAINT reservation_entity_pk;
       public         postgres    false    235    235            H	           2606    17939    reservation_entity_uk 
   CONSTRAINT     {   ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT reservation_entity_uk UNIQUE (guest_id, reservation_id, entity_id);
 R   ALTER TABLE ONLY public.reservation_entity DROP CONSTRAINT reservation_entity_uk;
       public         postgres    false    235    235    235    235            M	           2606    17941    reservation_pk 
   CONSTRAINT     R   ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservation_pk PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservation_pk;
       public         postgres    false    238    238            J	           2606    17943    rezervation_status_pk 
   CONSTRAINT     _   ALTER TABLE ONLY reservation_status
    ADD CONSTRAINT rezervation_status_pk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.reservation_status DROP CONSTRAINT rezervation_status_pk;
       public         postgres    false    237    237            O	           2606    17945    role_pk 
   CONSTRAINT     C   ALTER TABLE ONLY role
    ADD CONSTRAINT role_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pk;
       public         postgres    false    241    241            Q	           2606    17947    role_task_pk 
   CONSTRAINT     M   ALTER TABLE ONLY role_task
    ADD CONSTRAINT role_task_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.role_task DROP CONSTRAINT role_task_pk;
       public         postgres    false    243    243            S	           2606    17949    role_task_uk 
   CONSTRAINT     V   ALTER TABLE ONLY role_task
    ADD CONSTRAINT role_task_uk UNIQUE (role_id, task_id);
 @   ALTER TABLE ONLY public.role_task DROP CONSTRAINT role_task_uk;
       public         postgres    false    243    243    243            U	           2606    17951 	   status_pk 
   CONSTRAINT     G   ALTER TABLE ONLY status
    ADD CONSTRAINT status_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pk;
       public         postgres    false    246    246            W	           2606    17953    task_pk 
   CONSTRAINT     C   ALTER TABLE ONLY task
    ADD CONSTRAINT task_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pk;
       public         postgres    false    248    248            Y	           2606    17955    title_pk 
   CONSTRAINT     E   ALTER TABLE ONLY title
    ADD CONSTRAINT title_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.title DROP CONSTRAINT title_pk;
       public         postgres    false    250    250            [	           2606    17957    users_pk 
   CONSTRAINT     F   ALTER TABLE ONLY "user"
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 9   ALTER TABLE ONLY public."user" DROP CONSTRAINT users_pk;
       public         postgres    false    252    252            �           1259    18155 
   fki_b_u_fk    INDEX     ;   CREATE INDEX fki_b_u_fk ON business USING btree (user_id);
    DROP INDEX public.fki_b_u_fk;
       public         postgres    false    184            �           1259    18173    fki_clients_user_fk    INDEX     C   CREATE INDEX fki_clients_user_fk ON clients USING btree (user_id);
 '   DROP INDEX public.fki_clients_user_fk;
       public         postgres    false    188            �           1259    17958    fki_edvc_att_fk    INDEX     ^   CREATE INDEX fki_edvc_att_fk ON entity_definition_value_character USING btree (attribute_id);
 #   DROP INDEX public.fki_edvc_att_fk;
       public         postgres    false    196            �           1259    17959    fki_edvd_att_fk    INDEX     [   CREATE INDEX fki_edvd_att_fk ON entity_definition_value_double USING btree (attribute_id);
 #   DROP INDEX public.fki_edvd_att_fk;
       public         postgres    false    199            	           1259    17960    fki_edvi_att_fk    INDEX     \   CREATE INDEX fki_edvi_att_fk ON entity_definition_value_integer USING btree (attribute_id);
 #   DROP INDEX public.fki_edvi_att_fk;
       public         postgres    false    200            	           1259    17961    fki_edvs_att_fk    INDEX     [   CREATE INDEX fki_edvs_att_fk ON entity_definition_value_select USING btree (attribute_id);
 #   DROP INDEX public.fki_edvs_att_fk;
       public         postgres    false    201            	           1259    17962    fki_edvtime_att_fk    INDEX     a   CREATE INDEX fki_edvtime_att_fk ON entity_definition_value_timestamp USING btree (attribute_id);
 &   DROP INDEX public.fki_edvtime_att_fk;
       public         postgres    false    205            	           1259    17963    fki_edvtxt_att_fk    INDEX     [   CREATE INDEX fki_edvtxt_att_fk ON entity_definition_value_text USING btree (attribute_id);
 %   DROP INDEX public.fki_edvtxt_att_fk;
       public         postgres    false    203            �           1259    17964    fki_entity_definition_fk    INDEX     Y   CREATE INDEX fki_entity_definition_fk ON entity_definition USING btree (entity_type_id);
 ,   DROP INDEX public.fki_entity_definition_fk;
       public         postgres    false    193            �           1259    17965    fki_entity_entity_definition_fk    INDEX     T   CREATE INDEX fki_entity_entity_definition_fk ON entity USING btree (definition_id);
 3   DROP INDEX public.fki_entity_entity_definition_fk;
       public         postgres    false    190            	           1259    18161    fki_et_u_fk    INDEX     ?   CREATE INDEX fki_et_u_fk ON entity_type USING btree (user_id);
    DROP INDEX public.fki_et_u_fk;
       public         postgres    false    207            	           1259    17966    fki_eta_at_fk    INDEX     P   CREATE INDEX fki_eta_at_fk ON entity_type_attribute USING btree (attribute_id);
 !   DROP INDEX public.fki_eta_at_fk;
       public         postgres    false    208            :	           1259    17967    fki_fed_features_fk    INDEX     Z   CREATE INDEX fki_fed_features_fk ON features_entity_definitions USING btree (feature_id);
 '   DROP INDEX public.fki_fed_features_fk;
       public         postgres    false    226            C	           1259    17968    fki_re_entity_fk    INDEX     M   CREATE INDEX fki_re_entity_fk ON reservation_entity USING btree (entity_id);
 $   DROP INDEX public.fki_re_entity_fk;
       public         postgres    false    235            D	           1259    17969 %   fki_reservation_entity_reservation_fk    INDEX     g   CREATE INDEX fki_reservation_entity_reservation_fk ON reservation_entity USING btree (reservation_id);
 9   DROP INDEX public.fki_reservation_entity_reservation_fk;
       public         postgres    false    235            K	           1259    18167    fki_reservation_user_fk    INDEX     L   CREATE INDEX fki_reservation_user_fk ON reservations USING btree (user_id);
 +   DROP INDEX public.fki_reservation_user_fk;
       public         postgres    false    238            �	           2620    17970    res_num_trigg    TRIGGER     p   CREATE TRIGGER res_num_trigg BEFORE INSERT ON reservations FOR EACH ROW EXECUTE PROCEDURE res_num_trigg_func();
 3   DROP TRIGGER res_num_trigg ON public.reservations;
       public       postgres    false    238    256            \	           2606    17971    aov_fk    FK CONSTRAINT     �   ALTER TABLE ONLY attribute_option_values
    ADD CONSTRAINT aov_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.attribute_option_values DROP CONSTRAINT aov_fk;
       public       postgres    false    2265    182    180            ]	           2606    18150    b_u_fk    FK CONSTRAINT     s   ALTER TABLE ONLY business
    ADD CONSTRAINT b_u_fk FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.business DROP CONSTRAINT b_u_fk;
       public       postgres    false    184    252    2395            ^	           2606    18168    clients_user_fk    FK CONSTRAINT     {   ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_user_fk FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_user_fk;
       public       postgres    false    252    188    2395            a	           2606    17976    edvb_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT edvb_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.entity_definition_value_boolean DROP CONSTRAINT edvb_att_fk;
       public       postgres    false    2265    180    195            b	           2606    17981 
   edvb_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT edvb_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_boolean DROP CONSTRAINT edvb_ed_fk;
       public       postgres    false    195    193    2286            c	           2606    17986    edvc_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT edvc_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.entity_definition_value_character DROP CONSTRAINT edvc_att_fk;
       public       postgres    false    180    196    2265            d	           2606    17991 
   edvc_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT edvc_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.entity_definition_value_character DROP CONSTRAINT edvc_ed_fk;
       public       postgres    false    196    193    2286            e	           2606    17996    edvd_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT edvd_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_double DROP CONSTRAINT edvd_att_fk;
       public       postgres    false    199    180    2265            f	           2606    18001 
   edvd_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT edvd_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.entity_definition_value_double DROP CONSTRAINT edvd_ed_fk;
       public       postgres    false    199    193    2286            g	           2606    18006    edvi_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT edvi_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.entity_definition_value_integer DROP CONSTRAINT edvi_att_fk;
       public       postgres    false    200    2265    180            h	           2606    18011 
   edvi_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT edvi_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_integer DROP CONSTRAINT edvi_ed_fk;
       public       postgres    false    193    2286    200            i	           2606    18016    edvs_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT edvs_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_select DROP CONSTRAINT edvs_att_fk;
       public       postgres    false    201    2265    180            m	           2606    18021    edvtime_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT edvtime_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.entity_definition_value_timestamp DROP CONSTRAINT edvtime_att_fk;
       public       postgres    false    205    180    2265            n	           2606    18026    edvts_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT edvts_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.entity_definition_value_timestamp DROP CONSTRAINT edvts_ed_fk;
       public       postgres    false    205    2286    193            k	           2606    18031    edvtx_ed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT edvtx_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.entity_definition_value_text DROP CONSTRAINT edvtx_ed_fk;
       public       postgres    false    203    2286    193            l	           2606    18036    edvtxt_att_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT edvtxt_att_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.entity_definition_value_text DROP CONSTRAINT edvtxt_att_fk;
       public       postgres    false    203    180    2265            `	           2606    18041    entity_definition_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition
    ADD CONSTRAINT entity_definition_fk FOREIGN KEY (entity_type_id) REFERENCES entity_type(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.entity_definition DROP CONSTRAINT entity_definition_fk;
       public       postgres    false    207    2323    193            j	           2606    18046 !   entity_definition_value_select_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT entity_definition_value_select_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON UPDATE CASCADE ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.entity_definition_value_select DROP CONSTRAINT entity_definition_value_select_fk;
       public       postgres    false    2286    201    193            _	           2606    18051 	   entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_fk FOREIGN KEY (definition_id) REFERENCES entity_definition(id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_fk;
       public       postgres    false    190    193    2286            o	           2606    18156    et_u_fk    FK CONSTRAINT     w   ALTER TABLE ONLY entity_type
    ADD CONSTRAINT et_u_fk FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.entity_type DROP CONSTRAINT et_u_fk;
       public       postgres    false    207    252    2395            p	           2606    18056 	   eta_at_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT eta_at_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.entity_type_attribute DROP CONSTRAINT eta_at_fk;
       public       postgres    false    208    2265    180            q	           2606    18061 	   eta_et_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT eta_et_fk FOREIGN KEY (entity_type_id) REFERENCES entity_type(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.entity_type_attribute DROP CONSTRAINT eta_et_fk;
       public       postgres    false    208    2323    207            r	           2606    18066    evb_attributes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_attributes_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.entity_value_boolean DROP CONSTRAINT evb_attributes_fk;
       public       postgres    false    180    2265    211            s	           2606    18071    evb_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.entity_value_boolean DROP CONSTRAINT evb_entity_fk;
       public       postgres    false    190    211    2279            t	           2606    18076    evc_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.entity_value_character DROP CONSTRAINT evc_attribute_fk;
       public       postgres    false    180    213    2265            u	           2606    18081    evc_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.entity_value_character DROP CONSTRAINT evc_entity_fk;
       public       postgres    false    213    190    2279            v	           2606    18086    evd_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.entity_value_double DROP CONSTRAINT evd_attribute_fk;
       public       postgres    false    2265    180    215            w	           2606    18091    evd_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.entity_value_double DROP CONSTRAINT evd_entity_fk;
       public       postgres    false    215    2279    190            x	           2606    18096    evi_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT "evi_entity_fk" FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.entity_value_integer DROP CONSTRAINT "evi_entity_fk";
       public       postgres    false    190    2279    217            y	           2606    18101    evi_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT evi_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.entity_value_integer DROP CONSTRAINT evi_attribute_fk;
       public       postgres    false    217    2265    180            z	           2606    18106    evs_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.entity_value_select DROP CONSTRAINT evs_attribute_fk;
       public       postgres    false    180    219    2265            {	           2606    18111    evs_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.entity_value_select DROP CONSTRAINT evs_entity_fk;
       public       postgres    false    190    2279    219            ~	           2606    18116    evtm_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.entity_value_timestamp DROP CONSTRAINT evtm_attribute_fk;
       public       postgres    false    180    223    2265            	           2606    18121    evtm_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.entity_value_timestamp DROP CONSTRAINT evtm_entity_fk;
       public       postgres    false    223    190    2279            |	           2606    18126    evtxt_attribute_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.entity_value_text DROP CONSTRAINT evtxt_attribute_fk;
       public       postgres    false    2265    221    180            }	           2606    18131    evtxt_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.entity_value_text DROP CONSTRAINT evtxt_entity_fk;
       public       postgres    false    190    221    2279            �	           2606    18136    re_entity_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT re_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.reservation_entity DROP CONSTRAINT re_entity_fk;
       public       postgres    false    2279    235    190            �	           2606    18141 !   reservation_entity_reservation_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT reservation_entity_reservation_fk FOREIGN KEY (reservation_id) REFERENCES reservations(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.reservation_entity DROP CONSTRAINT reservation_entity_reservation_fk;
       public       postgres    false    238    235    2381            �	           2606    18162    reservation_user_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservation_user_fk FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservation_user_fk;
       public       postgres    false    252    2395    238            �	   �   x��0�p� �̼����"NC�?�4 4�0�vru	��+�MJ-R�OS(��K�IUHJM)��0B�a�邦#%�4	�3β��r�0Q����\�i�6�0�,I-.�I��9��y(N��L)M��K�t�P�Jr�*b���� �q@Y      �	   8   x��0�0�4�NM�2�Ȉ3�<3773/]! ??���$j�鑙�S����� H\      �	   �   x���MK1�ϓ_1'/Ņ|�v{S��'/c���nI҂�z
գ�ygx�gLi�c�~���}�R ����'E�	�e_���~�(%*�ڨ�a�\����!x��A��RyR	��~���^.	g�W�o>�����uVAm�)P&xcG�t���X���H�TS��\Z}{�O�)"E������;ܦ�a��U7hF�U����S:F�y�>�4�}B� �%i�      �	   �   x�M���0Dg�+�T-
031 $$&�Z%�M�$��������;�j���<�Bo�hf
Nll��4�E���2Ը���>Nl���b��*
����S'�E9N/w�2M�K��-V�>��s�B_��Q��W�$�rQF�R�Q!�,s@�      �	   �   x���Ak1�ϓ_1wQ2I�����{�z(x�v��f7����7�zh���������3��c���c�G���M	�� ����@J�ҰiaB�jm�,U �z~���YLe�������ó۟�!��'�5>q��f��$�]���\Bk�c��{B*����0�o��r����<�����o�.��(��'%���w�7Y�63I�3��Eiڻ����mgB�/�n�      
   H   x�37�45���L2�4�2���<CNSS��1�rL@�,9MM8�3s�rR9Az-P�@&��qqq �Z�      
      x������ � �      
   b   x�35�46�t)-�I�L�/M�I�p��9c�8�LM@J�3��sR���s9��l!�J3NcCN�ĜL��Ī�<�\ L@�
U�
)�ɥ�1z\\\ ��%s      
   !   x�3���45�0�L�2��& v	W� Jh�      
      x������ � �      

      x�3���45㴰�4�3����� t�      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
   >   x�36�,�OJ���/I�)�NU �8���9��R�8��Rʊ�KR��DNC�t� h	      
      x�3��46�0�2��46䴰������ +�f      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �      
      x������ � �       
      x������ � �      "
      x������ � �      $
      x������ � �      %
      x������ � �      (
      x������ � �      )
      x������ � �      ,
      x������ � �      .
   F   x�343�41�4��4�0�4204�50�52R04�20 "��)\���̘�Ĝ�� �����.s��=... kL�      0
   t   x�3���+,�L-��̄1b���8����2�rSS8��,��1�sb^rjNH�J�s:%gd��r&Bi��	ghqf^:����b���[f^fqFj��sFjrv~i�&g2�R���� �30�      1
   W   x�3�0�4� C �9?/-�(75�����L��H��H���
�����q�a��������DNϼ���ԢJ�4Gh20F��� J� x      4
   �   x�]�M
�@�דS� 2���nݤM��#IJ��ێq���{�9�j�%��\ͥ`�\ɛF�QEnH9G��O[Dg�����F����&�< U�q��ދI�i ����J�k�{�B�O��?�� �[;       6
   3   x�ȹ 0���&�-��%��5�I�BV�mf�ϲb����6o Ҩ      8
   J   x�3��M��+I�K�KN�2��/-Q�OS�/JI-�2�t�IM���K�2�t,K��IL�I�2���S-N����� �~y      :
   z   x�E�M�@�5�bN@��z7n�03�N�mT���i��{$|!��^V���Fz�*�|��{z�6�71�=Ԭ�N��ٶ����Ο���������Q`����������!�}�7�      <
      x�3��-��2��z\Ɯ�@2F��� ?��      >
   �   x�u�=
�0@�Y9L��+o�Z��Rd04IqrJ���:�Ns]궷�����9d�(6%5!�hB@ȟ�2������o��RE��y�ʊ!Y����CV��;Lsnx��k��hT��)�5		-Z��R�0���[ٞ�c�u��J#     