--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5rc1
-- Dumped by pg_dump version 9.5rc1

-- Started on 2016-02-19 16:23:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2608 (class 1262 OID 16393)
-- Dependencies: 2607
-- Name: hotel; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE hotel IS '- how to set autoincrement

SELECT setval(''[TABLE_NAME]_id_seq'',[NEXT_ID],false);';


--
-- TOC entry 254 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2611 (class 0 OID 0)
-- Dependencies: 254
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 255 (class 1255 OID 16394)
-- Name: hash_pwd_trigg_function(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hash_pwd_trigg_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	NEW.password = md5(NEW.password);
	RETURN NEW;

END;
$$;


ALTER FUNCTION public.hash_pwd_trigg_function() OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 16395)
-- Name: res_num_trigg_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION res_num_trigg_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.reservation_id = lpad((SELECT currval('reservations_id_seq'))::text, 10,'0');
RETURN NEW;
END
$$;


ALTER FUNCTION public.res_num_trigg_func() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 16396)
-- Name: attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE attribute (
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


ALTER TABLE attribute OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16402)
-- Name: attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attribute_id_seq OWNER TO postgres;

--
-- TOC entry 2612 (class 0 OID 0)
-- Dependencies: 181
-- Name: attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attribute_id_seq OWNED BY attribute.id;


--
-- TOC entry 182 (class 1259 OID 16404)
-- Name: attribute_option_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE attribute_option_values (
    id integer NOT NULL,
    attribute_id integer,
    value integer,
    text character varying(50)
);


ALTER TABLE attribute_option_values OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16407)
-- Name: attribute_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attribute_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attribute_option_values_id_seq OWNER TO postgres;

--
-- TOC entry 2613 (class 0 OID 0)
-- Dependencies: 183
-- Name: attribute_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attribute_option_values_id_seq OWNED BY attribute_option_values.id;


--
-- TOC entry 184 (class 1259 OID 16409)
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE business (
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


ALTER TABLE business OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16415)
-- Name: business_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE business_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE business_id_seq OWNER TO postgres;

--
-- TOC entry 2614 (class 0 OID 0)
-- Dependencies: 185
-- Name: business_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE business_id_seq OWNED BY business.id;


--
-- TOC entry 186 (class 1259 OID 16417)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(100),
    description text,
    parent_id integer
);


ALTER TABLE categories OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16423)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO postgres;

--
-- TOC entry 2615 (class 0 OID 0)
-- Dependencies: 187
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- TOC entry 188 (class 1259 OID 16425)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clients (
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


ALTER TABLE clients OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16431)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clients_id_seq OWNER TO postgres;

--
-- TOC entry 2616 (class 0 OID 0)
-- Dependencies: 189
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- TOC entry 190 (class 1259 OID 16433)
-- Name: entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity (
    id integer NOT NULL,
    definition_id integer NOT NULL,
    status character varying,
    guid character varying(10),
    status_id integer
);


ALTER TABLE entity OWNER TO postgres;

--
-- TOC entry 2617 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN entity.guid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entity.guid IS 'ovo neka bude broj sobe, za sada';


--
-- TOC entry 191 (class 1259 OID 16439)
-- Name: entity_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_category (
    id integer NOT NULL,
    entity_id integer,
    category_id integer
);


ALTER TABLE entity_category OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16442)
-- Name: entity_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_category_id_seq OWNER TO postgres;

--
-- TOC entry 2618 (class 0 OID 0)
-- Dependencies: 192
-- Name: entity_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_category_id_seq OWNED BY entity_category.id;


--
-- TOC entry 193 (class 1259 OID 16444)
-- Name: entity_definition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_definition (
    id integer NOT NULL,
    entity_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10),
    description text,
    price numeric(10,2),
    pax smallint DEFAULT 1
);


ALTER TABLE entity_definition OWNER TO postgres;

--
-- TOC entry 2619 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE entity_definition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE entity_definition IS ' - za demo verziju ova tabela ce sadrzati samo tip sobe (Single,Double, Suite...)
- kolona price predstavlja cenu na dan';


--
-- TOC entry 2620 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN entity_definition.pax; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entity_definition.pax IS ' - reference for PAX system;
- for now it will represent maximum number of persons for this type';


--
-- TOC entry 194 (class 1259 OID 16451)
-- Name: entity_definition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_definition_id_seq OWNER TO postgres;

--
-- TOC entry 2621 (class 0 OID 0)
-- Dependencies: 194
-- Name: entity_definition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_definition_id_seq OWNED BY entity_definition.id;


--
-- TOC entry 195 (class 1259 OID 16453)
-- Name: entity_definition_value_boolean; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_definition_value_boolean (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value boolean
);


ALTER TABLE entity_definition_value_boolean OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16456)
-- Name: entity_definition_value_character; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_definition_value_character (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value character varying(255)
);


ALTER TABLE entity_definition_value_character OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16459)
-- Name: entity_definition_value_character_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_definition_value_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_definition_value_character_id_seq OWNER TO postgres;

--
-- TOC entry 2622 (class 0 OID 0)
-- Dependencies: 197
-- Name: entity_definition_value_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_definition_value_character_id_seq OWNED BY entity_definition_value_character.id;


--
-- TOC entry 198 (class 1259 OID 16461)
-- Name: entity_value_boolean_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_value_boolean_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_value_boolean_id_seq OWNER TO postgres;

--
-- TOC entry 2623 (class 0 OID 0)
-- Dependencies: 198
-- Name: entity_value_boolean_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_value_boolean_id_seq OWNED BY entity_definition_value_boolean.id;


--
-- TOC entry 199 (class 1259 OID 16463)
-- Name: entity_definition_value_double; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_definition_value_double (
    id integer DEFAULT nextval('entity_value_boolean_id_seq'::regclass) NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value double precision
);


ALTER TABLE entity_definition_value_double OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16467)
-- Name: entity_definition_value_integer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_definition_value_integer (
    id integer DEFAULT nextval('entity_value_boolean_id_seq'::regclass) NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value integer
);


ALTER TABLE entity_definition_value_integer OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16471)
-- Name: entity_definition_value_select; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_definition_value_select (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value integer
);


ALTER TABLE entity_definition_value_select OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16474)
-- Name: entity_definition_value_select_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_definition_value_select_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_definition_value_select_id_seq OWNER TO postgres;

--
-- TOC entry 2624 (class 0 OID 0)
-- Dependencies: 202
-- Name: entity_definition_value_select_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_definition_value_select_id_seq OWNED BY entity_definition_value_select.id;


--
-- TOC entry 203 (class 1259 OID 16476)
-- Name: entity_definition_value_text; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_definition_value_text (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value text
);


ALTER TABLE entity_definition_value_text OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16482)
-- Name: entity_definition_value_text_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_definition_value_text_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_definition_value_text_id_seq OWNER TO postgres;

--
-- TOC entry 2625 (class 0 OID 0)
-- Dependencies: 204
-- Name: entity_definition_value_text_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_definition_value_text_id_seq OWNED BY entity_definition_value_text.id;


--
-- TOC entry 205 (class 1259 OID 16484)
-- Name: entity_definition_value_timestamp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_definition_value_timestamp (
    id integer NOT NULL,
    entity_definition_id integer,
    attribute_id integer,
    value timestamp without time zone
);


ALTER TABLE entity_definition_value_timestamp OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16487)
-- Name: entity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_id_seq OWNER TO postgres;

--
-- TOC entry 2626 (class 0 OID 0)
-- Dependencies: 206
-- Name: entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_id_seq OWNED BY entity.id;


--
-- TOC entry 207 (class 1259 OID 16489)
-- Name: entity_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    time_resolution integer DEFAULT 0
);


ALTER TABLE entity_type OWNER TO postgres;

--
-- TOC entry 2627 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE entity_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE entity_type IS '- komentar ovde...';


--
-- TOC entry 208 (class 1259 OID 16496)
-- Name: entity_type_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_type_attribute (
    id integer NOT NULL,
    entity_type_id integer NOT NULL,
    attribute_id integer NOT NULL
);


ALTER TABLE entity_type_attribute OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16499)
-- Name: entity_type_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_type_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_type_attribute_id_seq OWNER TO postgres;

--
-- TOC entry 2628 (class 0 OID 0)
-- Dependencies: 209
-- Name: entity_type_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_type_attribute_id_seq OWNED BY entity_type_attribute.id;


--
-- TOC entry 210 (class 1259 OID 16501)
-- Name: entity_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_type_id_seq OWNER TO postgres;

--
-- TOC entry 2629 (class 0 OID 0)
-- Dependencies: 210
-- Name: entity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_type_id_seq OWNED BY entity_type.id;


--
-- TOC entry 211 (class 1259 OID 16503)
-- Name: entity_value_boolean; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_value_boolean (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value boolean
);


ALTER TABLE entity_value_boolean OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16506)
-- Name: entity_value_boolean_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_value_boolean_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_value_boolean_id_seq1 OWNER TO postgres;

--
-- TOC entry 2630 (class 0 OID 0)
-- Dependencies: 212
-- Name: entity_value_boolean_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_value_boolean_id_seq1 OWNED BY entity_value_boolean.id;


--
-- TOC entry 213 (class 1259 OID 16508)
-- Name: entity_value_character; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_value_character (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value character varying(100)
);


ALTER TABLE entity_value_character OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16511)
-- Name: entity_value_character_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_value_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_value_character_id_seq OWNER TO postgres;

--
-- TOC entry 2631 (class 0 OID 0)
-- Dependencies: 214
-- Name: entity_value_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_value_character_id_seq OWNED BY entity_value_character.id;


--
-- TOC entry 215 (class 1259 OID 16513)
-- Name: entity_value_double; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_value_double (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value double precision
);


ALTER TABLE entity_value_double OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16516)
-- Name: entity_value_double_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_value_double_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_value_double_id_seq OWNER TO postgres;

--
-- TOC entry 2632 (class 0 OID 0)
-- Dependencies: 216
-- Name: entity_value_double_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_value_double_id_seq OWNED BY entity_value_double.id;


--
-- TOC entry 217 (class 1259 OID 16518)
-- Name: entity_value_integer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_value_integer (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value integer
);


ALTER TABLE entity_value_integer OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16521)
-- Name: entity_value_integer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_value_integer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_value_integer_id_seq OWNER TO postgres;

--
-- TOC entry 2633 (class 0 OID 0)
-- Dependencies: 218
-- Name: entity_value_integer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_value_integer_id_seq OWNED BY entity_value_integer.id;


--
-- TOC entry 219 (class 1259 OID 16523)
-- Name: entity_value_select; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_value_select (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value integer
);


ALTER TABLE entity_value_select OWNER TO postgres;

--
-- TOC entry 2634 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN entity_value_select.attribute_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entity_value_select.attribute_id IS '
';


--
-- TOC entry 220 (class 1259 OID 16526)
-- Name: entity_value_select_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_value_select_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_value_select_id_seq OWNER TO postgres;

--
-- TOC entry 2635 (class 0 OID 0)
-- Dependencies: 220
-- Name: entity_value_select_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_value_select_id_seq OWNED BY entity_value_select.id;


--
-- TOC entry 221 (class 1259 OID 16528)
-- Name: entity_value_text; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_value_text (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value text
);


ALTER TABLE entity_value_text OWNER TO postgres;

--
-- TOC entry 2636 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN entity_value_text.attribute_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entity_value_text.attribute_id IS ' ';


--
-- TOC entry 222 (class 1259 OID 16534)
-- Name: entity_value_text_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_value_text_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_value_text_id_seq OWNER TO postgres;

--
-- TOC entry 2637 (class 0 OID 0)
-- Dependencies: 222
-- Name: entity_value_text_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_value_text_id_seq OWNED BY entity_value_text.id;


--
-- TOC entry 223 (class 1259 OID 16536)
-- Name: entity_value_timestamp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entity_value_timestamp (
    id integer NOT NULL,
    attribute_id integer,
    entity_id integer,
    value timestamp without time zone
);


ALTER TABLE entity_value_timestamp OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16539)
-- Name: entity_value_timestamp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entity_value_timestamp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entity_value_timestamp_id_seq OWNER TO postgres;

--
-- TOC entry 2638 (class 0 OID 0)
-- Dependencies: 224
-- Name: entity_value_timestamp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entity_value_timestamp_id_seq OWNED BY entity_value_timestamp.id;


--
-- TOC entry 225 (class 1259 OID 16541)
-- Name: features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE features (
    id integer NOT NULL,
    name character varying(100)[],
    description text
);


ALTER TABLE features OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16547)
-- Name: features_entity_definitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE features_entity_definitions (
    id integer NOT NULL,
    feature_id integer,
    entity_definition_id integer
);


ALTER TABLE features_entity_definitions OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16550)
-- Name: features_entity_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE features_entity_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE features_entity_definitions_id_seq OWNER TO postgres;

--
-- TOC entry 2639 (class 0 OID 0)
-- Dependencies: 227
-- Name: features_entity_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE features_entity_definitions_id_seq OWNED BY features_entity_definitions.id;


--
-- TOC entry 228 (class 1259 OID 16552)
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE features_id_seq OWNER TO postgres;

--
-- TOC entry 2640 (class 0 OID 0)
-- Dependencies: 228
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE features_id_seq OWNED BY features.id;


--
-- TOC entry 229 (class 1259 OID 16554)
-- Name: financial_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE financial_plan (
    id integer NOT NULL,
    name character varying(50),
    description text
);


ALTER TABLE financial_plan OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16560)
-- Name: financial_plan_entity_definition_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE financial_plan_entity_definition_price (
    id integer NOT NULL,
    financial_plan_id integer,
    entity_definition_id integer,
    price_id integer
);


ALTER TABLE financial_plan_entity_definition_price OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16563)
-- Name: financial_plan_entity_definition_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE financial_plan_entity_definition_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financial_plan_entity_definition_price_id_seq OWNER TO postgres;

--
-- TOC entry 2641 (class 0 OID 0)
-- Dependencies: 231
-- Name: financial_plan_entity_definition_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE financial_plan_entity_definition_price_id_seq OWNED BY financial_plan_entity_definition_price.id;


--
-- TOC entry 232 (class 1259 OID 16565)
-- Name: financial_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE financial_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financial_plan_id_seq OWNER TO postgres;

--
-- TOC entry 2642 (class 0 OID 0)
-- Dependencies: 232
-- Name: financial_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE financial_plan_id_seq OWNED BY financial_plan.id;


--
-- TOC entry 233 (class 1259 OID 16567)
-- Name: price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE price (
    id integer NOT NULL,
    value double precision,
    currency character varying(3),
    description character varying(50)
);


ALTER TABLE price OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16570)
-- Name: price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE price_id_seq OWNER TO postgres;

--
-- TOC entry 2643 (class 0 OID 0)
-- Dependencies: 234
-- Name: price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE price_id_seq OWNED BY price.id;


--
-- TOC entry 235 (class 1259 OID 16572)
-- Name: reservation_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reservation_entity (
    id integer NOT NULL,
    guest_id integer,
    entity_id integer NOT NULL,
    reservation_id integer NOT NULL,
    date_from timestamp without time zone,
    date_to timestamp without time zone
);


ALTER TABLE reservation_entity OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16575)
-- Name: reservation_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reservation_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reservation_entity_id_seq OWNER TO postgres;

--
-- TOC entry 2644 (class 0 OID 0)
-- Dependencies: 236
-- Name: reservation_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reservation_entity_id_seq OWNED BY reservation_entity.id;


--
-- TOC entry 237 (class 1259 OID 16577)
-- Name: reservation_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reservation_status (
    id integer NOT NULL,
    statustext character varying(50),
    statusvalue character varying(20)
);


ALTER TABLE reservation_status OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16580)
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reservations (
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


ALTER TABLE reservations OWNER TO postgres;

--
-- TOC entry 2645 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE reservations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE reservations IS '2015-10-12 12:00:00 = 1444644000
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


--
-- TOC entry 2646 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN reservations.reservation_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reservations.reservation_id IS ' - id rezervacije za prikaz na front-endu';


--
-- TOC entry 2647 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN reservations.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reservations.status IS '- treba da bude enum, za sada je varchar, zbog jednostavnije izzmene';


--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN reservations.comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reservations.comment IS '- comment - free entry, optional at check-in';


--
-- TOC entry 239 (class 1259 OID 16590)
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reservations_id_seq OWNER TO postgres;

--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 239
-- Name: reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reservations_id_seq OWNED BY reservations.id;


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 239
-- Name: SEQUENCE reservations_id_seq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON SEQUENCE reservations_id_seq IS ' - reset auto increment to 1;
SELECT setval(''reservation_id_seq'',1,false);';


--
-- TOC entry 240 (class 1259 OID 16592)
-- Name: rezervation_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rezervation_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rezervation_status_id_seq OWNER TO postgres;

--
-- TOC entry 2651 (class 0 OID 0)
-- Dependencies: 240
-- Name: rezervation_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rezervation_status_id_seq OWNED BY reservation_status.id;


--
-- TOC entry 241 (class 1259 OID 16594)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE role (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE role OWNER TO postgres;

--
-- TOC entry 2652 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE role IS 'Table of possible user roles.';


--
-- TOC entry 242 (class 1259 OID 16600)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_id_seq OWNER TO postgres;

--
-- TOC entry 2653 (class 0 OID 0)
-- Dependencies: 242
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- TOC entry 243 (class 1259 OID 16602)
-- Name: role_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE role_task (
    id integer NOT NULL,
    role_id integer NOT NULL,
    task_id integer
);


ALTER TABLE role_task OWNER TO postgres;

--
-- TOC entry 2654 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE role_task; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE role_task IS 'Table which connects roles and tasks.';


--
-- TOC entry 2655 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN role_task.role_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN role_task.role_id IS 'Reference to the role.';


--
-- TOC entry 2656 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN role_task.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN role_task.task_id IS 'Reference to the user task.';


--
-- TOC entry 244 (class 1259 OID 16605)
-- Name: role_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_task_id_seq OWNER TO postgres;

--
-- TOC entry 2657 (class 0 OID 0)
-- Dependencies: 244
-- Name: role_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_task_id_seq OWNED BY role_task.id;


--
-- TOC entry 245 (class 1259 OID 16607)
-- Name: roomlist; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW roomlist AS
 SELECT e.guid,
    eavi.value
   FROM entity e,
    attribute a,
    entity_value_integer eavi
  WHERE ((eavi.entity_id = e.id) AND (eavi.attribute_id = a.id));


ALTER TABLE roomlist OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16611)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status (
    id integer NOT NULL,
    value character varying(50)
);


ALTER TABLE status OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16614)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_id_seq OWNER TO postgres;

--
-- TOC entry 2658 (class 0 OID 0)
-- Dependencies: 247
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_id_seq OWNED BY status.id;


--
-- TOC entry 248 (class 1259 OID 16616)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE task (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE task OWNER TO postgres;

--
-- TOC entry 2659 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE task; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE task IS 'Table of possible user tasks.';


--
-- TOC entry 249 (class 1259 OID 16622)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE task_id_seq OWNER TO postgres;

--
-- TOC entry 2660 (class 0 OID 0)
-- Dependencies: 249
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE task_id_seq OWNED BY task.id;


--
-- TOC entry 250 (class 1259 OID 16624)
-- Name: title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE title (
    id integer NOT NULL,
    title character varying(20)
);


ALTER TABLE title OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16627)
-- Name: title_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE title_id_seq OWNER TO postgres;

--
-- TOC entry 2661 (class 0 OID 0)
-- Dependencies: 251
-- Name: title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE title_id_seq OWNED BY title.id;


--
-- TOC entry 252 (class 1259 OID 16629)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(255),
    role_id integer DEFAULT 1
);


ALTER TABLE "user" OWNER TO postgres;

--
-- TOC entry 2662 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE "user"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "user" IS 'System users.';


--
-- TOC entry 253 (class 1259 OID 16633)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2663 (class 0 OID 0)
-- Dependencies: 253
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY "user".id;


--
-- TOC entry 2220 (class 2604 OID 16635)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute ALTER COLUMN id SET DEFAULT nextval('attribute_id_seq'::regclass);


--
-- TOC entry 2221 (class 2604 OID 16636)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_option_values ALTER COLUMN id SET DEFAULT nextval('attribute_option_values_id_seq'::regclass);


--
-- TOC entry 2222 (class 2604 OID 16637)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY business ALTER COLUMN id SET DEFAULT nextval('business_id_seq'::regclass);


--
-- TOC entry 2223 (class 2604 OID 16638)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- TOC entry 2224 (class 2604 OID 16639)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 16640)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity ALTER COLUMN id SET DEFAULT nextval('entity_id_seq'::regclass);


--
-- TOC entry 2226 (class 2604 OID 16641)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_category ALTER COLUMN id SET DEFAULT nextval('entity_category_id_seq'::regclass);


--
-- TOC entry 2228 (class 2604 OID 16642)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition ALTER COLUMN id SET DEFAULT nextval('entity_definition_id_seq'::regclass);


--
-- TOC entry 2229 (class 2604 OID 16643)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_boolean ALTER COLUMN id SET DEFAULT nextval('entity_value_boolean_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 16644)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_character ALTER COLUMN id SET DEFAULT nextval('entity_definition_value_character_id_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 16645)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_select ALTER COLUMN id SET DEFAULT nextval('entity_definition_value_select_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 16646)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_text ALTER COLUMN id SET DEFAULT nextval('entity_definition_value_text_id_seq'::regclass);


--
-- TOC entry 2236 (class 2604 OID 16647)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_type ALTER COLUMN id SET DEFAULT nextval('entity_type_id_seq'::regclass);


--
-- TOC entry 2237 (class 2604 OID 16648)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_type_attribute ALTER COLUMN id SET DEFAULT nextval('entity_type_attribute_id_seq'::regclass);


--
-- TOC entry 2238 (class 2604 OID 16649)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_boolean ALTER COLUMN id SET DEFAULT nextval('entity_value_boolean_id_seq1'::regclass);


--
-- TOC entry 2239 (class 2604 OID 16650)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_character ALTER COLUMN id SET DEFAULT nextval('entity_value_character_id_seq'::regclass);


--
-- TOC entry 2240 (class 2604 OID 16651)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_double ALTER COLUMN id SET DEFAULT nextval('entity_value_double_id_seq'::regclass);


--
-- TOC entry 2241 (class 2604 OID 16652)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_integer ALTER COLUMN id SET DEFAULT nextval('entity_value_integer_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 16653)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_select ALTER COLUMN id SET DEFAULT nextval('entity_value_select_id_seq'::regclass);


--
-- TOC entry 2243 (class 2604 OID 16654)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_text ALTER COLUMN id SET DEFAULT nextval('entity_value_text_id_seq'::regclass);


--
-- TOC entry 2244 (class 2604 OID 16655)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_timestamp ALTER COLUMN id SET DEFAULT nextval('entity_value_timestamp_id_seq'::regclass);


--
-- TOC entry 2245 (class 2604 OID 16656)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY features ALTER COLUMN id SET DEFAULT nextval('features_id_seq'::regclass);


--
-- TOC entry 2246 (class 2604 OID 16657)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY features_entity_definitions ALTER COLUMN id SET DEFAULT nextval('features_entity_definitions_id_seq'::regclass);


--
-- TOC entry 2247 (class 2604 OID 16658)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY financial_plan ALTER COLUMN id SET DEFAULT nextval('financial_plan_id_seq'::regclass);


--
-- TOC entry 2248 (class 2604 OID 16659)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY financial_plan_entity_definition_price ALTER COLUMN id SET DEFAULT nextval('financial_plan_entity_definition_price_id_seq'::regclass);


--
-- TOC entry 2249 (class 2604 OID 16660)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY price ALTER COLUMN id SET DEFAULT nextval('price_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 16661)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation_entity ALTER COLUMN id SET DEFAULT nextval('reservation_entity_id_seq'::regclass);


--
-- TOC entry 2251 (class 2604 OID 16662)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation_status ALTER COLUMN id SET DEFAULT nextval('rezervation_status_id_seq'::regclass);


--
-- TOC entry 2256 (class 2604 OID 16663)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservations ALTER COLUMN id SET DEFAULT nextval('reservations_id_seq'::regclass);


--
-- TOC entry 2257 (class 2604 OID 16664)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- TOC entry 2258 (class 2604 OID 16665)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_task ALTER COLUMN id SET DEFAULT nextval('role_task_id_seq'::regclass);


--
-- TOC entry 2259 (class 2604 OID 16666)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);


--
-- TOC entry 2260 (class 2604 OID 16667)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);


--
-- TOC entry 2261 (class 2604 OID 16668)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY title ALTER COLUMN id SET DEFAULT nextval('title_id_seq'::regclass);


--
-- TOC entry 2263 (class 2604 OID 16669)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2530 (class 0 OID 16396)
-- Dependencies: 180
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attribute (id, code, label, type, sort_order, unit, "unique", nullable, scope) FROM stdin;
65	sport	Sport	select	1	\N	f	f	1
66	haslights	Has Lights	boolean	1	\N	f	f	2
69	covered	Covered	boolean	2	\N	f	f	1
68	depth	Depth	integer	1	m	f	f	1
70	covered	Is Covered	boolean	4	\N	f	f	1
75	Description	Description	text	3	\N	f	f	1
77	AREA	Area	double	\N	sqm	f	f	1
54	counter	Counter	character	1	\N	t	f	2
55	sbeds	Number of single beds	integer	2	\N	f	t	1
56	dbeds	Number of double beds	integer	2	\N	f	t	1
57	bathroom	Bathroom type	select	3	\N	f	f	1
58	positioning	Positioning	select	4	\N	f	f	2
59	floor	Floor	select	5	\N	f	f	2
60	pax	PAX	integer	7	\N	f	f	1
71	roomcount	Room Count	integer	1	\N	f	f	1
72	area	Area	double	2	sqm	f	f	1
73	view	View Type	select	1	\N	f	f	2
74	pax	PAX	integer	2	\N	f	f	1
76	FLOOR	Floor	select	4	\N	f	f	0
78	AC	Clima	boolean	\N	\N	f	f	1
79	SBED	Single Beds	integer	5	\N	f	f	1
80	DBEDS	Double Beds	integer	7	\N	f	f	1
61	clima	Has Clima	boolean	8	\N	f	f	1
62	roomcount	Count of rooms	integer	16	\N	f	f	1
63	view	View	select	20	\N	f	f	2
64	balcony	Balcony Type	select	21	\N	f	f	2
67	floortype	Floor Type	select	4	\N	f	f	1
81	tip	Tip Broda	select	1	\N	f	f	1
82	brzina	Brzina	double	\N	m/s	f	f	2
\.


--
-- TOC entry 2664 (class 0 OID 0)
-- Dependencies: 181
-- Name: attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attribute_id_seq', 82, true);


--
-- TOC entry 2532 (class 0 OID 16404)
-- Dependencies: 182
-- Data for Name: attribute_option_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attribute_option_values (id, attribute_id, value, text) FROM stdin;
75	73	1	Seaside
76	73	2	Pool Area
77	73	3	Hills
78	76	1	I
79	76	2	II
80	76	3	III
81	76	4	IV
82	76	5	V
83	81	1	Jedrilica
84	81	2	Jahta
54	57	0	Own bathroom
55	57	1	Shared bathroom
56	58	0	Near elevator
57	58	1	Away from elevator
58	59	1	I
59	59	2	II
60	59	3	III
61	63	1	Street
62	63	2	Parking
63	63	3	Sea
64	63	4	Hills area
65	64	1	No Balcony
66	64	2	Balcony
67	64	3	Terrace
72	67	1	Wooden
73	67	2	Polyurethan
74	67	3	Ceramic Tiles
68	65	1	Tennis
69	65	2	Basketball
70	65	3	Squash
71	65	4	Bowling
\.


--
-- TOC entry 2665 (class 0 OID 0)
-- Dependencies: 183
-- Name: attribute_option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attribute_option_values_id_seq', 84, true);


--
-- TOC entry 2534 (class 0 OID 16409)
-- Dependencies: 184
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY business (id, name, description, company_name, address, phone, email, contact_first_name, contact_last_name) FROM stdin;
1	Small Hotel on the Beach	This is our small hotel, where we rent rooms and other stuff.	Hotel & Co.	Hollywood Boulevard 14234, CA, Los Angeles	+1 555 333 222	hotel@hollywood.rs	John	Isner
\.


--
-- TOC entry 2666 (class 0 OID 0)
-- Dependencies: 185
-- Name: business_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('business_id_seq', 1, true);


--
-- TOC entry 2536 (class 0 OID 16417)
-- Dependencies: 186
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, name, description, parent_id) FROM stdin;
0	Vrsta	Kakav je tip sobe	-1
1	Soba	Obicna soba	0
2	Apartman	Apartman sa vise soba	0
4	Pogled	Gde gleda soba	-1
5	Na more	Pogled na more	4
6	Na grad	Pogled na grad	4
7	Na parking	Pogled na parking hotela.	4
\.


--
-- TOC entry 2667 (class 0 OID 0)
-- Dependencies: 187
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- TOC entry 2538 (class 0 OID 16425)
-- Dependencies: 188
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clients (id, first_name, last_name, address1, address2, city, zipcode, country, phone, mobile, fax, email, title, guest_class, title_id) FROM stdin;
1	Billy Ray	Valentine	Feet Street 2	Sole Street 3	Philadelphia	1232412	USA	+381 11 238 2232	+381 11 238 2232	+381 11 238 2232	billiray@example.com	\N	\N	\N
7	Billy	Jean	First street 22	Second str. 33	New York	1234123	USA	+1 555-333-222	+1 555-333-222	+1 555-111-222	bjean@mail.us	\N	\N	\N
19	Milijana	Markovic	Kotorska 12		Podgorica	1234124	Crna Gora	23412341			aa@bb.cg	\N	\N	\N
21	Slavisa	Mijuskovic	Milutina Milankovica 123		Beograd	11000	Srbija	+381 11 22 33 344			slavisa@mail.rs	\N	\N	\N
23	Predrag	Živković	Pere Velimirovića 33		Beograd	11000	Serbia	324234234			pz@maxi.rs	\N	\N	\N
24	Gorica	Popovic	Mike Alasa 33		Beograd	11000	Srbija	12341234123			goca@mail.rs	\N	\N	\N
25	Neko	Novi	Glavna 23		Beograd	11000	Srbija	23412341234			sinisa.ristic@gmail.com	\N	\N	\N
26	Jorgovanka	Tabakovic	Prva 22		Zemun	11080	Srbija	1234 1234			mail@moj.rs	\N	\N	\N
28	Petar	Vukomanovic	Somborska 33		Sombor	27000	Srbija	12341234			adresa@mail.rs	\N	\N	\N
29	Mirko	Roncevic	Agostina Neta 48		Beograd	11070	Serbia	12345123			mirko@mail.rs	\N	\N	\N
17	Tatjana	Matic	Jurija Gagarina 123		Beograd	11070	Serbia	234123412		\N	ma@il.rs	\N	\N	\N
22	Miki	Markovic	Glavna 22		Zemun	11080	Srbija	234 234 234		\N	sinisa@mail.rs	\N	\N	\N
16	Dragana	Milojević	Prva ulica br.11	asdfasdf	Belgrade	11070	Serbia	+381 11 238 2232	+381 11 238 2232	\N	dragana@tu.com	\N	\N	\N
3	Randolph	Duke	Address 3		Philadelphia		USA	333333333333		\N	randyduke@example.com	\N	\N	\N
2	Louis	Winthorpe III	Address 2		Philadelphia		USA	22222222		\N	louiwinthorpe@example.com	\N	\N	\N
4	Mortimer	Duke	Address 4		Philadelphia		USA	444444444		\N	mortyduke@example.com	\N	\N	\N
12	Siniša	Ristić	Dušana Vukasovića 63	Dr. Agostina Neta 48	Beograd	11070	SRB	+381 11 7184763	+381 63 297167	\N	sinisa.ristic@gmail.com	\N	\N	\N
43	Dragan	Rankovic	Glavna 22		Beograd	11000	Serbia	+381 11 222 333		\N	dragan@mail.ru	\N	\N	\N
\.


--
-- TOC entry 2668 (class 0 OID 0)
-- Dependencies: 189
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clients_id_seq', 43, true);


--
-- TOC entry 2540 (class 0 OID 16433)
-- Dependencies: 190
-- Data for Name: entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity (id, definition_id, status, guid, status_id) FROM stdin;
72	48	\N	101	1
75	51	\N	Delfin II	1
76	52	\N	Jadranka	1
74	48	Maintenance	103	1
73	48	In Use	102	2
\.


--
-- TOC entry 2541 (class 0 OID 16439)
-- Dependencies: 191
-- Data for Name: entity_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_category (id, entity_id, category_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 0)
-- Dependencies: 192
-- Name: entity_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_category_id_seq', 1, false);


--
-- TOC entry 2543 (class 0 OID 16444)
-- Dependencies: 193
-- Data for Name: entity_definition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_definition (id, entity_type_id, name, code, description, price, pax) FROM stdin;
48	25	Single Room	SINGLE	Room for a single person, with the regular single bed.	\N	1
49	25	Double Room	DOUBLE	Room for the maximum numbers of 2 persons. 	\N	1
50	25	Studio	STUDIO	Studio, small apartment for 2+1 persons, with small kitchen.	\N	1
51	26	Jahta tip A	JAHTA-A	Jahta tip A	\N	1
52	26	Jahta tip B	JAHTA-B	Jahta tip B	\N	1
53	26	Jedrilica	JEDRILICA	Jedrilica	\N	1
\.


--
-- TOC entry 2670 (class 0 OID 0)
-- Dependencies: 194
-- Name: entity_definition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_definition_id_seq', 53, true);


--
-- TOC entry 2545 (class 0 OID 16453)
-- Dependencies: 195
-- Data for Name: entity_definition_value_boolean; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_definition_value_boolean (id, entity_definition_id, attribute_id, value) FROM stdin;
172	48	78	t
178	49	78	t
184	50	78	t
\.


--
-- TOC entry 2546 (class 0 OID 16456)
-- Dependencies: 196
-- Data for Name: entity_definition_value_character; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_definition_value_character (id, entity_definition_id, attribute_id, value) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 0)
-- Dependencies: 197
-- Name: entity_definition_value_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_definition_value_character_id_seq', 11, true);


--
-- TOC entry 2549 (class 0 OID 16463)
-- Dependencies: 199
-- Data for Name: entity_definition_value_double; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_definition_value_double (id, entity_definition_id, attribute_id, value) FROM stdin;
170	48	72	20.399999999999999
176	49	72	20.399999999999999
182	50	72	30
\.


--
-- TOC entry 2550 (class 0 OID 16467)
-- Dependencies: 200
-- Data for Name: entity_definition_value_integer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_definition_value_integer (id, entity_definition_id, attribute_id, value) FROM stdin;
169	48	71	1
171	48	74	1
173	48	79	1
174	48	80	0
175	49	71	1
177	49	74	2
179	49	79	0
180	49	80	1
181	50	71	2
183	50	74	3
185	50	79	1
186	50	80	1
\.


--
-- TOC entry 2551 (class 0 OID 16471)
-- Dependencies: 201
-- Data for Name: entity_definition_value_select; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_definition_value_select (id, entity_definition_id, attribute_id, value) FROM stdin;
30	51	81	2
31	52	81	2
32	53	81	1
\.


--
-- TOC entry 2672 (class 0 OID 0)
-- Dependencies: 202
-- Name: entity_definition_value_select_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_definition_value_select_id_seq', 32, true);


--
-- TOC entry 2553 (class 0 OID 16476)
-- Dependencies: 203
-- Data for Name: entity_definition_value_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_definition_value_text (id, entity_definition_id, attribute_id, value) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 0)
-- Dependencies: 204
-- Name: entity_definition_value_text_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_definition_value_text_id_seq', 17, true);


--
-- TOC entry 2555 (class 0 OID 16484)
-- Dependencies: 205
-- Data for Name: entity_definition_value_timestamp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_definition_value_timestamp (id, entity_definition_id, attribute_id, value) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 0)
-- Dependencies: 206
-- Name: entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_id_seq', 76, true);


--
-- TOC entry 2557 (class 0 OID 16489)
-- Dependencies: 207
-- Data for Name: entity_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_type (id, name, description, time_resolution) FROM stdin;
25	ACUNIT	Accomodation unit	2
26	BROD	Razne vrste brodova	2
\.


--
-- TOC entry 2558 (class 0 OID 16496)
-- Dependencies: 208
-- Data for Name: entity_type_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_type_attribute (id, entity_type_id, attribute_id) FROM stdin;
64	25	71
65	25	72
66	25	73
67	25	74
68	25	76
69	25	78
70	25	79
71	25	80
72	26	81
73	26	82
\.


--
-- TOC entry 2675 (class 0 OID 0)
-- Dependencies: 209
-- Name: entity_type_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_type_attribute_id_seq', 73, true);


--
-- TOC entry 2676 (class 0 OID 0)
-- Dependencies: 210
-- Name: entity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_type_id_seq', 26, true);


--
-- TOC entry 2561 (class 0 OID 16503)
-- Dependencies: 211
-- Data for Name: entity_value_boolean; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_value_boolean (id, attribute_id, entity_id, value) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 0)
-- Dependencies: 198
-- Name: entity_value_boolean_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_value_boolean_id_seq', 186, true);


--
-- TOC entry 2678 (class 0 OID 0)
-- Dependencies: 212
-- Name: entity_value_boolean_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_value_boolean_id_seq1', 6, true);


--
-- TOC entry 2563 (class 0 OID 16508)
-- Dependencies: 213
-- Data for Name: entity_value_character; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_value_character (id, attribute_id, entity_id, value) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 0)
-- Dependencies: 214
-- Name: entity_value_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_value_character_id_seq', 21, true);


--
-- TOC entry 2565 (class 0 OID 16513)
-- Dependencies: 215
-- Data for Name: entity_value_double; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_value_double (id, attribute_id, entity_id, value) FROM stdin;
1	82	75	50.200000000000003
2	82	76	64.099999999999994
\.


--
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 216
-- Name: entity_value_double_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_value_double_id_seq', 2, true);


--
-- TOC entry 2567 (class 0 OID 16518)
-- Dependencies: 217
-- Data for Name: entity_value_integer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_value_integer (id, attribute_id, entity_id, value) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 218
-- Name: entity_value_integer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_value_integer_id_seq', 1, false);


--
-- TOC entry 2569 (class 0 OID 16523)
-- Dependencies: 219
-- Data for Name: entity_value_select; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_value_select (id, attribute_id, entity_id, value) FROM stdin;
68	73	72	1
70	73	74	1
69	73	73	2
\.


--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 220
-- Name: entity_value_select_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_value_select_id_seq', 70, true);


--
-- TOC entry 2571 (class 0 OID 16528)
-- Dependencies: 221
-- Data for Name: entity_value_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_value_text (id, attribute_id, entity_id, value) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 0)
-- Dependencies: 222
-- Name: entity_value_text_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_value_text_id_seq', 1, false);


--
-- TOC entry 2573 (class 0 OID 16536)
-- Dependencies: 223
-- Data for Name: entity_value_timestamp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entity_value_timestamp (id, attribute_id, entity_id, value) FROM stdin;
\.


--
-- TOC entry 2684 (class 0 OID 0)
-- Dependencies: 224
-- Name: entity_value_timestamp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entity_value_timestamp_id_seq', 1, false);


--
-- TOC entry 2575 (class 0 OID 16541)
-- Dependencies: 225
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY features (id, name, description) FROM stdin;
\.


--
-- TOC entry 2576 (class 0 OID 16547)
-- Dependencies: 226
-- Data for Name: features_entity_definitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY features_entity_definitions (id, feature_id, entity_definition_id) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 227
-- Name: features_entity_definitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('features_entity_definitions_id_seq', 1, false);


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 228
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('features_id_seq', 1, false);


--
-- TOC entry 2579 (class 0 OID 16554)
-- Dependencies: 229
-- Data for Name: financial_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY financial_plan (id, name, description) FROM stdin;
\.


--
-- TOC entry 2580 (class 0 OID 16560)
-- Dependencies: 230
-- Data for Name: financial_plan_entity_definition_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY financial_plan_entity_definition_price (id, financial_plan_id, entity_definition_id, price_id) FROM stdin;
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 231
-- Name: financial_plan_entity_definition_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('financial_plan_entity_definition_price_id_seq', 1, false);


--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 232
-- Name: financial_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('financial_plan_id_seq', 1, false);


--
-- TOC entry 2583 (class 0 OID 16567)
-- Dependencies: 233
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY price (id, value, currency, description) FROM stdin;
\.


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 234
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('price_id_seq', 1, false);


--
-- TOC entry 2585 (class 0 OID 16572)
-- Dependencies: 235
-- Data for Name: reservation_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reservation_entity (id, guest_id, entity_id, reservation_id, date_from, date_to) FROM stdin;
158	1	74	180	2016-02-21 12:00:00	2016-02-26 12:00:00
157	43	73	179	2016-02-19 12:00:00	2016-02-25 12:00:00
\.


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 236
-- Name: reservation_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reservation_entity_id_seq', 158, true);


--
-- TOC entry 2587 (class 0 OID 16577)
-- Dependencies: 237
-- Data for Name: reservation_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reservation_status (id, statustext, statusvalue) FROM stdin;
1	Inquiery	inquiery
2	Confirmed	confirmed
3	Cancelled	cancelled
7	Archive	archive
4	Using	inhouse
6	Finished(Checkout)	checkout
\.


--
-- TOC entry 2588 (class 0 OID 16580)
-- Dependencies: 238
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reservations (id, reservation_id, status, created_at, modified_at, client_id, pax_a, pax_y, pax_c, comment, status_id) FROM stdin;
135	0000000135	Confirmed	2016-01-26 00:00:00	2016-01-26 00:00:00	16	0	0	0	\N	2
136	0000000136	Inquiery	2016-01-26 00:00:00	2016-01-26 00:00:00	17	0	0	0	\N	1
96	0000000096	Finished(Checkout)	2016-01-17 00:00:00	2016-02-19 00:00:00	36	0	0	0	\N	6
83	0000000083	Checked Out	2015-12-29 00:00:00	2016-01-17 00:00:00	18	0	0	0	\N	6
104	0000000104	Checked Out	2016-01-17 00:00:00	2016-01-18 00:00:00	17	0	0	0	\N	6
169	0000000169	Inquiery	2016-02-15 00:00:00	2016-02-15 00:00:00	4	0	0	0	\N	1
89	0000000089	Finished(Checkout)	2016-01-07 00:00:00	2016-02-15 00:00:00	16	0	0	0	\N	6
137	0000000137	Using	2016-01-26 00:00:00	2016-01-26 00:00:00	12	0	0	0	\N	4
82	0000000082	Cancelled	2015-12-29 00:00:00	2015-12-29 00:00:00	18	0	0	0	\N	3
86	0000000086	Ckeckout	2015-12-30 00:00:00	2015-12-30 00:00:00	5	0	0	0	\N	6
170	0000000170	Inquiery	2016-02-15 00:00:00	2016-02-15 00:00:00	1	0	0	0	\N	1
133	0000000133	Using	2016-01-26 00:00:00	2016-02-04 00:00:00	2	0	0	0	\N	4
139	0000000139	Using	2016-01-26 00:00:00	2016-01-26 00:00:00	24	0	0	0	\N	4
154	0000000154	Using	2016-01-31 00:00:00	2016-02-04 00:00:00	23	0	0	0	\N	4
140	0000000140	Confirmed	2016-01-26 00:00:00	2016-01-26 00:00:00	22	0	0	0	\N	2
124	0000000124	Confirmed	2016-01-23 00:00:00	2016-01-23 00:00:00	2	0	0	0	\N	2
87	0000000087	Ckeckout	2015-12-30 00:00:00	2016-01-07 00:00:00	20	0	0	0	\N	6
88	0000000088	Ckeckout	2015-12-30 00:00:00	2016-01-07 00:00:00	2	0	0	0	\N	6
80	0000000080	Ckeckout	2015-12-29 00:00:00	2016-01-07 00:00:00	12	0	0	0	\N	6
85	0000000085	Ckeckout	2015-12-29 00:00:00	2016-01-07 00:00:00	19	0	0	0	\N	6
141	0000000141	Inquiery	2016-01-26 00:00:00	2016-01-26 00:00:00	25	0	0	0	\N	1
127	0000000127	Using	2016-01-25 00:00:00	2016-01-25 00:00:00	21	0	0	0	\N	4
142	0000000142	Inquiery	2016-01-26 00:00:00	2016-01-26 00:00:00	28	0	0	0	\N	1
143	0000000143	Inquiery	2016-01-26 00:00:00	2016-01-26 00:00:00	2	0	0	0	\N	1
144	0000000144	Inquiery	2016-01-26 00:00:00	2016-01-26 00:00:00	2	0	0	0	\N	1
145	0000000145	Cancelled	2016-01-26 00:00:00	2016-01-26 00:00:00	28	0	0	0	\N	3
159	0000000159	Inquiery	2016-02-05 00:00:00	2016-02-05 00:00:00	2	0	0	0	\N	1
129	0000000129	Confirmed	2016-01-25 00:00:00	2016-01-25 00:00:00	12	0	0	0	\N	2
125	0000000125	Using	2016-01-23 00:00:00	2016-01-26 00:00:00	26	0	0	0	\N	4
131	0000000131	Using	2016-01-26 00:00:00	2016-01-28 00:00:00	18	0	0	0	\N	4
119	0000000119	Finished(Checkout)	2016-01-21 00:00:00	2016-01-21 00:00:00	2	0	0	0	\N	6
120	0000000120	Finished(Checkout)	2016-01-21 00:00:00	2016-01-21 00:00:00	3	0	0	0	\N	6
146	0000000146	Using	2016-01-28 00:00:00	2016-01-28 00:00:00	27	0	0	0	\N	4
152	0000000152	Finished(Checkout)	2016-01-31 00:00:00	2016-01-31 00:00:00	1	0	0	0	\N	6
100	0000000100	Finished(Checkout)	2016-01-17 00:00:00	2016-01-26 00:00:00	23	0	0	0	\N	6
91	0000000091	Finished(Checkout)	2016-01-16 00:00:00	2016-02-15 00:00:00	19	0	0	0	\N	6
130	0000000130	Using	2016-01-26 00:00:00	2016-01-28 00:00:00	17	0	0	0	\N	4
111	0000000111	Finished(Checkout)	2016-01-19 00:00:00	2016-01-26 00:00:00	2	0	0	0	\N	6
84	0000000084	Finished(Checkout)	2015-12-29 00:00:00	2016-01-26 00:00:00	18	0	0	0	\N	6
95	0000000095	Finished(Checkout)	2016-01-17 00:00:00	2016-01-26 00:00:00	22	0	0	0	\N	6
115	0000000115	Finished(Checkout)	2016-01-21 00:00:00	2016-01-26 00:00:00	26	0	0	0	\N	6
114	0000000114	Finished(Checkout)	2016-01-20 00:00:00	2016-01-26 00:00:00	25	0	0	0	\N	6
121	0000000121	Finished(Checkout)	2016-01-22 00:00:00	2016-01-31 00:00:00	12	0	0	0	\N	6
128	0000000128	Using	2016-01-25 00:00:00	2016-02-05 00:00:00	12	0	0	0	\N	4
110	0000000110	Finished(Checkout)	2016-01-19 00:00:00	2016-01-26 00:00:00	16	0	0	0	\N	6
134	0000000134	Using	2016-01-26 00:00:00	2016-01-26 00:00:00	1	0	0	0	\N	4
148	0000000148	Confirmed	2016-01-29 00:00:00	2016-01-29 00:00:00	29	0	0	0	\N	2
160	0000000160	Inquiery	2016-02-05 00:00:00	2016-02-05 00:00:00	2	0	0	0	\N	1
112	0000000112	Finished(Checkout)	2016-01-19 00:00:00	2016-01-31 00:00:00	2	0	0	0	\N	6
132	0000000132	Using	2016-01-26 00:00:00	2016-01-31 00:00:00	20	0	0	0	\N	4
94	0000000094	Finished(Checkout)	2016-01-16 00:00:00	2016-02-15 00:00:00	4	0	0	0	\N	6
126	0000000126	Finished(Checkout)	2016-01-24 00:00:00	2016-01-31 00:00:00	23	0	0	0	\N	6
153	0000000153	Confirmed	2016-01-31 00:00:00	2016-01-31 00:00:00	29	0	0	0	\N	2
103	0000000103	Finished(Checkout)	2016-01-17 00:00:00	2016-01-31 00:00:00	24	0	0	0	\N	6
149	0000000149	Finished(Checkout)	2016-01-31 00:00:00	2016-01-31 00:00:00	2	0	0	0	\N	6
151	0000000151	Finished(Checkout)	2016-01-31 00:00:00	2016-01-31 00:00:00	16	0	0	0	\N	6
150	0000000150	Finished(Checkout)	2016-01-31 00:00:00	2016-01-31 00:00:00	3	0	0	0	\N	6
155	0000000155	Finished(Checkout)	2016-01-31 00:00:00	2016-02-15 00:00:00	26	0	0	0	\N	6
156	0000000156	Using	2016-02-05 00:00:00	2016-02-07 00:00:00	2	0	0	0	\N	4
158	0000000158	Using	2016-02-05 00:00:00	2016-02-07 00:00:00	28	0	0	0	\N	4
157	0000000157	Finished(Checkout)	2016-02-05 00:00:00	2016-02-15 00:00:00	12	0	0	0	\N	6
162	0000000162	Using	2016-02-08 00:00:00	2016-02-11 00:00:00	23	0	0	0	\N	4
161	0000000161	Finished(Checkout)	2016-02-07 00:00:00	2016-02-11 00:00:00	29	0	0	0	\N	6
147	0000000147	Finished(Checkout)	2016-01-28 00:00:00	2016-02-11 00:00:00	24	0	0	0	\N	6
167	0000000167	Using	2016-02-11 00:00:00	2016-02-15 00:00:00	7	0	0	0	\N	4
165	0000000165	Using	2016-02-11 00:00:00	2016-02-19 00:00:00	28	0	0	0	\N	4
166	0000000166	Using	2016-02-11 00:00:00	2016-02-15 00:00:00	4	0	0	0	\N	4
164	0000000164	Using	2016-02-08 00:00:00	2016-02-15 00:00:00	12	0	0	0	\N	4
168	0000000168	Finished(Checkout)	2016-02-11 00:00:00	2016-02-15 00:00:00	23	0	0	0	\N	6
163	0000000163	Finished(Checkout)	2016-02-08 00:00:00	2016-02-15 00:00:00	21	0	0	0	\N	6
93	0000000093	Finished(Checkout)	2016-01-16 00:00:00	2016-02-15 00:00:00	16	0	0	0	\N	6
171	0000000171	Inquiery	2016-02-15 00:00:00	2016-02-15 00:00:00	1	0	0	0	\N	1
172	0000000172	Inquiery	2016-02-19 00:00:00	2016-02-19 00:00:00	12	0	0	0	\N	1
92	0000000092	Finished(Checkout)	2016-01-16 00:00:00	2016-02-19 00:00:00	17	0	0	0	\N	6
173	0000000173	Inquiery	2016-02-19 00:00:00	2016-02-19 00:00:00	16	0	0	0	\N	1
174	0000000174	Confirmed	2016-02-19 00:00:00	2016-02-19 00:00:00	42	0	0	0	\N	2
175	0000000175	Confirmed	2016-02-19 00:00:00	2016-02-19 00:00:00	23	0	0	0	\N	2
90	0000000090	Finished(Checkout)	2016-01-15 00:00:00	2016-02-19 00:00:00	21	0	0	0	\N	6
176	0000000176	Confirmed	2016-02-19 00:00:00	2016-02-19 00:00:00	24	0	0	0	\N	2
177	0000000177	Inquiery	2016-02-19 00:00:00	2016-02-19 00:00:00	3	0	0	0	\N	1
178	0000000178	Inquiery	2016-02-19 00:00:00	2016-02-19 00:00:00	1	0	0	0	\N	1
180	0000000180	Inquiery	2016-02-19 00:00:00	2016-02-19 00:00:00	1	0	0	0	\N	1
181	0000000181	Inquiery	2016-02-19 00:00:00	2016-02-19 00:00:00	1	0	0	0	\N	1
179	0000000179	Using	2016-02-19 00:00:00	2016-02-19 00:00:00	43	0	0	0	\N	4
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 239
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reservations_id_seq', 181, true);


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 240
-- Name: rezervation_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rezervation_status_id_seq', 7, true);


--
-- TOC entry 2591 (class 0 OID 16594)
-- Dependencies: 241
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role (id, name, description) FROM stdin;
1	sysadmin	System administrator. Can do all.
2	poweruser	Power user. Can read, write to db and change the dabase structure.
3	user	Normal user. Can read and write to db.
\.


--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 242
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_id_seq', 1, false);


--
-- TOC entry 2593 (class 0 OID 16602)
-- Dependencies: 243
-- Data for Name: role_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role_task (id, role_id, task_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	2	2
6	2	3
7	2	4
8	3	3
9	3	4
\.


--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 244
-- Name: role_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_task_id_seq', 1, true);


--
-- TOC entry 2595 (class 0 OID 16611)
-- Dependencies: 246
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY status (id, value) FROM stdin;
3	Maintenance
5	Out of order
4	Cleaning
1	Available
2	In Use
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 247
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_id_seq', 5, true);


--
-- TOC entry 2597 (class 0 OID 16616)
-- Dependencies: 248
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY task (id, name, description) FROM stdin;
1	sysconfig	Configures the system variables.
2	dbread	Reads the database data.
3	dbwrite	Writes the data to database.
4	dbchange	Changes the dabase structure.
\.


--
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 249
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('task_id_seq', 1, false);


--
-- TOC entry 2599 (class 0 OID 16624)
-- Dependencies: 250
-- Data for Name: title; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY title (id, title) FROM stdin;
1	Mr.
2	Mrs.
3	Ms.
\.


--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 251
-- Name: title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('title_id_seq', 3, true);


--
-- TOC entry 2601 (class 0 OID 16629)
-- Dependencies: 252
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, username, password, email, role_id) FROM stdin;
14	Administrator	0cc175b9c0f1b6a831c399e269772661	admin@mail.rs	1
16	Office	8bf8854bebe108183caeb845c7676ae4	office@mail.rs	2
12	Reception	12eccbdd9b32918131341f38907cbbb5	info@hotel.rs	3
\.


--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 253
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 16, true);


--
-- TOC entry 2267 (class 2606 OID 16671)
-- Name: attribute_option_value_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_option_values
    ADD CONSTRAINT attribute_option_value_pk PRIMARY KEY (id);


--
-- TOC entry 2269 (class 2606 OID 16673)
-- Name: attribute_option_value_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_option_values
    ADD CONSTRAINT attribute_option_value_uk UNIQUE (attribute_id, value);


--
-- TOC entry 2265 (class 2606 OID 16675)
-- Name: attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT attribute_pk PRIMARY KEY (id);


--
-- TOC entry 2271 (class 2606 OID 16677)
-- Name: business_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY business
    ADD CONSTRAINT business_pk PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 16679)
-- Name: categories_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pk PRIMARY KEY (id);


--
-- TOC entry 2275 (class 2606 OID 16681)
-- Name: clients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pk PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 16683)
-- Name: entity_category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_category
    ADD CONSTRAINT entity_category_pk PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 16685)
-- Name: entity_definition_value_character_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT entity_definition_value_character_pk PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 16687)
-- Name: entity_definition_value_character_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT entity_definition_value_character_uk UNIQUE (entity_definition_id, attribute_id);


--
-- TOC entry 2295 (class 2606 OID 16689)
-- Name: entity_definition_value_double_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT entity_definition_value_double_pk PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 16691)
-- Name: entity_definition_value_double_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT entity_definition_value_double_uk UNIQUE (entity_definition_id, attribute_id);


--
-- TOC entry 2299 (class 2606 OID 16693)
-- Name: entity_definition_value_integer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT entity_definition_value_integer_pk PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 16695)
-- Name: entity_definition_value_integer_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT entity_definition_value_integer_uk UNIQUE (entity_definition_id, attribute_id);


--
-- TOC entry 2287 (class 2606 OID 16697)
-- Name: entity_definition_value_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT entity_definition_value_pk PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 16699)
-- Name: entity_definition_value_select_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT entity_definition_value_select_pk PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 16701)
-- Name: entity_definition_value_select_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT entity_definition_value_select_uk UNIQUE (entity_definition_id, attribute_id);


--
-- TOC entry 2307 (class 2606 OID 16703)
-- Name: entity_definition_value_text_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT entity_definition_value_text_pk PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 16705)
-- Name: entity_definition_value_text_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT entity_definition_value_text_uk UNIQUE (entity_definition_id, attribute_id);


--
-- TOC entry 2311 (class 2606 OID 16707)
-- Name: entity_definition_value_timestamp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT entity_definition_value_timestamp_pk PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 16709)
-- Name: entity_definition_value_timestamp_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT entity_definition_value_timestamp_uk UNIQUE (entity_definition_id, attribute_id);


--
-- TOC entry 2289 (class 2606 OID 16711)
-- Name: entity_definition_value_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT entity_definition_value_uk UNIQUE (entity_definition_id, attribute_id);


--
-- TOC entry 2284 (class 2606 OID 16713)
-- Name: entity_definiton_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition
    ADD CONSTRAINT entity_definiton_pk PRIMARY KEY (id);


--
-- TOC entry 2277 (class 2606 OID 16715)
-- Name: entity_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_pk PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 16717)
-- Name: entity_type_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT entity_type_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 16719)
-- Name: entity_type_attribute_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT entity_type_attribute_uk UNIQUE (entity_type_id, attribute_id);


--
-- TOC entry 2315 (class 2606 OID 16721)
-- Name: entity_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_type
    ADD CONSTRAINT entity_type_pk PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 16723)
-- Name: entity_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_uk UNIQUE (guid);


--
-- TOC entry 2322 (class 2606 OID 16725)
-- Name: evb_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_pk PRIMARY KEY (id);


--
-- TOC entry 2324 (class 2606 OID 16727)
-- Name: evb_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_uk UNIQUE (attribute_id, entity_id);


--
-- TOC entry 2326 (class 2606 OID 16729)
-- Name: evc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_pk PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 16731)
-- Name: evc_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_uk UNIQUE (attribute_id, entity_id);


--
-- TOC entry 2330 (class 2606 OID 16733)
-- Name: evd_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_pk PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 16735)
-- Name: evd_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_uk UNIQUE (attribute_id, entity_id);


--
-- TOC entry 2334 (class 2606 OID 16737)
-- Name: evi_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT evi_pk PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 16739)
-- Name: evi_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT evi_uk UNIQUE (attribute_id, entity_id);


--
-- TOC entry 2338 (class 2606 OID 16741)
-- Name: evs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_pk PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 16743)
-- Name: evs_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_uk UNIQUE (attribute_id, entity_id);


--
-- TOC entry 2346 (class 2606 OID 16745)
-- Name: evtm_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_pk PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 16747)
-- Name: evtm_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_uk UNIQUE (attribute_id, entity_id);


--
-- TOC entry 2342 (class 2606 OID 16749)
-- Name: evtxt_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_pk PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 16751)
-- Name: evtxt_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_uk UNIQUE (attribute_id, entity_id);


--
-- TOC entry 2352 (class 2606 OID 16753)
-- Name: features_entity_definitions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY features_entity_definitions
    ADD CONSTRAINT features_entity_definitions_pk PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 16755)
-- Name: features_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY features
    ADD CONSTRAINT features_pk PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 16757)
-- Name: financial_plan_entity_definition_price_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY financial_plan_entity_definition_price
    ADD CONSTRAINT financial_plan_entity_definition_price_pk PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 16759)
-- Name: financial_plan_entity_definition_price_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY financial_plan_entity_definition_price
    ADD CONSTRAINT financial_plan_entity_definition_price_uk UNIQUE (financial_plan_id, entity_definition_id, price_id);


--
-- TOC entry 2355 (class 2606 OID 16761)
-- Name: financial_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY financial_plan
    ADD CONSTRAINT financial_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 16763)
-- Name: price pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY price
    ADD CONSTRAINT "price pk" PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 16765)
-- Name: reservation_entity_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT reservation_entity_pk PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 16767)
-- Name: reservation_entity_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT reservation_entity_uk UNIQUE (guest_id, reservation_id, entity_id);


--
-- TOC entry 2371 (class 2606 OID 16769)
-- Name: reservation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservation_pk PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 16771)
-- Name: rezervation_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation_status
    ADD CONSTRAINT rezervation_status_pk PRIMARY KEY (id);


--
-- TOC entry 2373 (class 2606 OID 16773)
-- Name: role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pk PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 16775)
-- Name: role_task_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_task
    ADD CONSTRAINT role_task_pk PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 16777)
-- Name: role_task_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_task
    ADD CONSTRAINT role_task_uk UNIQUE (role_id, task_id);


--
-- TOC entry 2379 (class 2606 OID 16779)
-- Name: status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pk PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 16781)
-- Name: task_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pk PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 16783)
-- Name: title_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY title
    ADD CONSTRAINT title_pk PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 16785)
-- Name: users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 2285 (class 1259 OID 16786)
-- Name: fki_entity_definition_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_entity_definition_fk ON entity_definition USING btree (entity_type_id);


--
-- TOC entry 2280 (class 1259 OID 16787)
-- Name: fki_entity_entity_definition_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_entity_entity_definition_fk ON entity USING btree (definition_id);


--
-- TOC entry 2320 (class 1259 OID 16788)
-- Name: fki_eta_at_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_eta_at_fk ON entity_type_attribute USING btree (attribute_id);


--
-- TOC entry 2353 (class 1259 OID 16789)
-- Name: fki_fed_features_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fed_features_fk ON features_entity_definitions USING btree (feature_id);


--
-- TOC entry 2362 (class 1259 OID 16790)
-- Name: fki_re_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_re_entity_fk ON reservation_entity USING btree (entity_id);


--
-- TOC entry 2363 (class 1259 OID 16791)
-- Name: fki_reservation_entity_reservation_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_reservation_entity_reservation_fk ON reservation_entity USING btree (reservation_id);


--
-- TOC entry 2414 (class 2620 OID 16792)
-- Name: res_num_trigg; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER res_num_trigg BEFORE INSERT ON reservations FOR EACH ROW EXECUTE PROCEDURE res_num_trigg_func();


--
-- TOC entry 2386 (class 2606 OID 16793)
-- Name: aov_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_option_values
    ADD CONSTRAINT aov_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;


--
-- TOC entry 2389 (class 2606 OID 16798)
-- Name: edvb_ed_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_boolean
    ADD CONSTRAINT edvb_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;


--
-- TOC entry 2390 (class 2606 OID 16803)
-- Name: edvc_ed_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_character
    ADD CONSTRAINT edvc_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;


--
-- TOC entry 2391 (class 2606 OID 16808)
-- Name: edvd_ed_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_double
    ADD CONSTRAINT edvd_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;


--
-- TOC entry 2392 (class 2606 OID 16813)
-- Name: edvi_ed_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_integer
    ADD CONSTRAINT edvi_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;


--
-- TOC entry 2395 (class 2606 OID 16818)
-- Name: edvts_ed_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_timestamp
    ADD CONSTRAINT edvts_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;


--
-- TOC entry 2394 (class 2606 OID 16823)
-- Name: edvtx_ed_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_text
    ADD CONSTRAINT edvtx_ed_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON DELETE CASCADE;


--
-- TOC entry 2388 (class 2606 OID 16828)
-- Name: entity_definition_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition
    ADD CONSTRAINT entity_definition_fk FOREIGN KEY (entity_type_id) REFERENCES entity_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2393 (class 2606 OID 16833)
-- Name: entity_definition_value_select_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_definition_value_select
    ADD CONSTRAINT entity_definition_value_select_fk FOREIGN KEY (entity_definition_id) REFERENCES entity_definition(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2387 (class 2606 OID 16838)
-- Name: entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_fk FOREIGN KEY (definition_id) REFERENCES entity_definition(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2396 (class 2606 OID 16843)
-- Name: eta_at_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT eta_at_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;


--
-- TOC entry 2397 (class 2606 OID 16848)
-- Name: eta_et_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_type_attribute
    ADD CONSTRAINT eta_et_fk FOREIGN KEY (entity_type_id) REFERENCES entity_type(id) ON DELETE CASCADE;


--
-- TOC entry 2398 (class 2606 OID 16853)
-- Name: evb_attributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_attributes_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;


--
-- TOC entry 2399 (class 2606 OID 16938)
-- Name: evb_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_boolean
    ADD CONSTRAINT evb_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;


--
-- TOC entry 2400 (class 2606 OID 16863)
-- Name: evc_attribute_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;


--
-- TOC entry 2401 (class 2606 OID 16868)
-- Name: evc_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_character
    ADD CONSTRAINT evc_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;


--
-- TOC entry 2402 (class 2606 OID 16873)
-- Name: evd_attribute_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;


--
-- TOC entry 2403 (class 2606 OID 16878)
-- Name: evd_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_double
    ADD CONSTRAINT evd_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;


--
-- TOC entry 2404 (class 2606 OID 16883)
-- Name: evi_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT "evi_entity_fk" FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;


--
-- TOC entry 2405 (class 2606 OID 16888)
-- Name: evi_attribute_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_integer
    ADD CONSTRAINT evi_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;


--
-- TOC entry 2406 (class 2606 OID 16893)
-- Name: evs_attribute_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;


--
-- TOC entry 2407 (class 2606 OID 16898)
-- Name: evs_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_select
    ADD CONSTRAINT evs_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;


--
-- TOC entry 2410 (class 2606 OID 16903)
-- Name: evtm_attribute_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;


--
-- TOC entry 2411 (class 2606 OID 16908)
-- Name: evtm_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_timestamp
    ADD CONSTRAINT evtm_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;


--
-- TOC entry 2408 (class 2606 OID 16913)
-- Name: evtxt_attribute_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_attribute_fk FOREIGN KEY (attribute_id) REFERENCES attribute(id) ON DELETE CASCADE;


--
-- TOC entry 2409 (class 2606 OID 16918)
-- Name: evtxt_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entity_value_text
    ADD CONSTRAINT evtxt_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;


--
-- TOC entry 2412 (class 2606 OID 16923)
-- Name: re_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT re_entity_fk FOREIGN KEY (entity_id) REFERENCES entity(id) ON DELETE CASCADE;


--
-- TOC entry 2413 (class 2606 OID 16928)
-- Name: reservation_entity_reservation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation_entity
    ADD CONSTRAINT reservation_entity_reservation_fk FOREIGN KEY (reservation_id) REFERENCES reservations(id) ON DELETE CASCADE;


--
-- TOC entry 2610 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-02-19 16:23:07

--
-- PostgreSQL database dump complete
--

