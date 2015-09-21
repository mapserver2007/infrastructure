DROP TABLE IF EXISTS t_webstream;
DROP TABLE IF EXISTS t_webstream_entity_mapping;
DROP TABLE IF EXISTS t_webstream_entity_mapping_type;

CREATE TABLE t_webstream
(
  id serial NOT NULL,
  name character varying(100),
  CONSTRAINT t_webstream_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_webstream
  OWNER TO postgres;

CREATE TABLE t_webstream_entity_mapping
(
  id serial NOT NULL,
  camelcasecol character varying(10),
  snakecase_col character varying(10),
  ucamelcasecol character varying(10),
  CONSTRAINT t_webstream_entity_mapping_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_webstream_entity_mapping
  OWNER TO postgres;

CREATE TABLE t_webstream_entity_mapping_type
(
  id serial NOT NULL,
  name character varying(10),
  created_at timestamp without time zone,
  created_at_time time without time zone,
  created_at_date date,
  bigint_num bigint,
  smallint_num smallint,
  CONSTRAINT t_webstream_entity_mapping_type_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_webstream_entity_mapping_type
  OWNER TO postgres;
