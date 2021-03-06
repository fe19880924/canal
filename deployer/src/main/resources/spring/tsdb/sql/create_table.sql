CREATE TABLE IF NOT EXISTS `meta_snapshot` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `destination` varchar(128) DEFAULT NULL COMMENT '通道名称',
  `binlog_file` varchar(64) DEFAULT NULL COMMENT 'binlog文件名',
  `binlog_offest` bigint(20) DEFAULT NULL COMMENT 'binlog偏移量',
  `binlog_master_id` varchar(64) DEFAULT NULL COMMENT 'binlog节点id',
  `binlog_timestamp` bigint(20) DEFAULT NULL COMMENT 'binlog应用的时间戳',
  `data` longtext DEFAULT NULL COMMENT '表结构数据',
  `extra` text DEFAULT NULL COMMENT '额外的扩展信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY binlog_file_offest(`destination`,`binlog_master_id`,`binlog_file`,`binlog_offest`),
  KEY `destination` (`destination`),
  KEY `destination_timestamp` (`destination`,`binlog_timestamp`),
  KEY `gmt_modified` (`gmt_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='表结构记录表快照表';

CREATE TABLE IF NOT EXISTS `meta_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `destination` varchar(128) DEFAULT NULL COMMENT '通道名称',
  `binlog_file` varchar(64) DEFAULT NULL COMMENT 'binlog文件名',
  `binlog_offest` bigint(20) DEFAULT NULL COMMENT 'binlog偏移量',
  `binlog_master_id` varchar(64) DEFAULT NULL COMMENT 'binlog节点id',
  `binlog_timestamp` bigint(20) DEFAULT NULL COMMENT 'binlog应用的时间戳',
  `use_schema` varchar(1024) DEFAULT NULL COMMENT '执行sql时对应的schema',
  `schema` varchar(1024) DEFAULT NULL COMMENT '对应的schema',
  `table` varchar(1024) DEFAULT NULL COMMENT '对应的table',
  `sql` longtext DEFAULT NULL COMMENT '执行的sql',
  `type` varchar(256) DEFAULT NULL COMMENT 'sql类型',
  `extra` text DEFAULT NULL COMMENT '额外的扩展信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY binlog_file_offest(`destination`,`binlog_master_id`,`binlog_file`,`binlog_offest`),
  KEY `destination` (`destination`),
  KEY `destination_timestamp` (`destination`,`binlog_timestamp`),
  KEY `gmt_modified` (`gmt_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='表结构变化明细表';