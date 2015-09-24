DROP TABLE if exists T_WebStream;
DROP TABLE if exists T_WebStream_Entity_Mapping;
DROP TABLE if exists T_WebStream_Entity_Mapping_Type;

CREATE TABLE T_WebStream (
    id integer primary key autoincrement,
    name varchar(100)
);

CREATE TABLE T_WebStream_Entity_Mapping (
    id integer primary key,
    camelcaseCol varchar(10),
    snakecase_col varchar(10),
    UcamelcaseCol varchar(10)
);

CREATE TABLE T_WebStream_Entity_Mapping_Type (
    id integer primary key,
    name varchar(10),
    created_at timestamp,
    created_at_time time,
    created_at_date date,
    bigint_num bigint,
    smallint_num smallint
);
