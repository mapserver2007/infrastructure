DROP TABLE if exists T_WebStream;
DROP TABLE if exists T_WebStream_Entity_Mapping;
DROP TABLE if exists T_WebStream_Entity_Mapping_Type;

CREATE TABLE `T_WebStream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `T_WebStream_Entity_Mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `camelcaseCol` varchar(10) DEFAULT NULL,
  `snakecase_col` varchar(10) DEFAULT NULL,
  `UcamelcaseCol` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `T_WebStream_Entity_Mapping_Type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_at_time` time DEFAULT NULL,
  `created_at_date` date DEFAULT NULL,
  `bigint_num` bigint(20) DEFAULT NULL,
  `smallint_num` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
