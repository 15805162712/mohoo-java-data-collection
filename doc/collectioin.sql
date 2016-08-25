DROP DATABASE IF EXISTS wx_db1;
CREATE  DATABASE wx_db1;
USE wx_db1;

DROP TABLE IF EXISTS MYCAT_SEQUENCE;
CREATE TABLE MYCAT_SEQUENCE (
	`name` VARCHAR(50) NOT NULL,
	`current_value` INT NOT NULL,
	`increment` INT NOT NULL DEFAULT 100,
	PRIMARY KEY(`name`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `MYCAT_SEQUENCE`(`name`,`current_value`,`increment`) VALUES ('GLOBAL' , 100000,100);
INSERT INTO `MYCAT_SEQUENCE`(`name`,`current_value`,`increment`) VALUES('wx_data_collection',100,1);

DROP FUNCTION IF EXISTS mycat_seq_currval;
CREATE FUNCTION mycat_seq_currval(seq_name VARCHAR(50)) RETURNS varchar(64) CHARSET utf8
DETERMINISTIC
BEGIN
	DECLARE retval VARCHAR(64);
	SET retval="-999999999,null";
	SELECT concat(CAST(current_value AS CHAR),",",CAST(increment AS CHAR)) INTO retval FROM
	MYCAT_SEQUENCE WHERE name = seq_name;
	RETURN retval;
END;

DROP FUNCTION IF EXISTS mycat_seq_setval;
CREATE FUNCTION mycat_seq_setval(seq_name VARCHAR(50),value INTEGER) RETURNS varchar(64) CHARSET utf8
DETERMINISTIC
BEGIN
	UPDATE MYCAT_SEQUENCE
	SET current_value = value
	WHERE name = seq_name;
	RETURN mycat_seq_currval(seq_name);
END;

DROP FUNCTION IF EXISTS mycat_seq_nextval;
CREATE FUNCTION mycat_seq_nextval(seq_name VARCHAR(50)) RETURNS varchar(64) CHARSET utf8
DETERMINISTIC
BEGIN
	UPDATE MYCAT_SEQUENCE
	SET current_value = current_value + increment WHERE name = seq_name;
	RETURN mycat_seq_currval(seq_name);
END;

CREATE TABLE `wx_app` (
`itemid`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
`appid`  varchar(255) CHARACTER SET utf8 NULL COMMENT '关键字appid',
`secret`  varchar(255) CHARACTER SET utf8 NULL COMMENT '关键密匙secret',
`status`  char(4) CHARACTER SET utf8 NULL DEFAULT '200' COMMENT '状态200可用',
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 PRIMARY KEY (`itemid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `wx_app`(`appid`,`secret`) VALUES('test','test');

CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db2;
CREATE  DATABASE wx_db2;
USE wx_db2;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db3;
CREATE  DATABASE wx_db3;
USE wx_db3;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db4;
CREATE  DATABASE wx_db4;
USE wx_db4;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db5;
CREATE  DATABASE wx_db5;
USE wx_db5;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db6;
CREATE  DATABASE wx_db6;
USE wx_db6;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db7;
CREATE  DATABASE wx_db7;
USE wx_db7;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db8;
CREATE  DATABASE wx_db8;
USE wx_db8;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db9;
CREATE  DATABASE wx_db9;
USE wx_db9;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db10;
CREATE  DATABASE wx_db10;
USE wx_db10;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db11;
CREATE  DATABASE wx_db11;
USE wx_db11;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db12;
CREATE  DATABASE wx_db12;
USE wx_db12;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS wx_db13;
CREATE  DATABASE wx_db13;
USE wx_db13;
CREATE TABLE `wx_data_collection` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '标识',
  `event` varchar(63) CHARACTER SET utf8 NOT NULL COMMENT '事件',
  `type` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `remark` varchar(127) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '版本号',
  `attr` varchar(63) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;