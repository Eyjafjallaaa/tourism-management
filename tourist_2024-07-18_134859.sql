-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 8.138.149.182    Database: tourist
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建时间',
  `finished` int NOT NULL COMMENT '完成订单数',
  `positive` int NOT NULL COMMENT '好评数量',
  `integrity` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '诚信评级',
  `evaluations` int NOT NULL COMMENT '总评价数',
  `manager_id` int NOT NULL COMMENT '好评数',
  `doctor_id` int NOT NULL COMMENT '应急人员id',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '地理位置',
  `itinerary_info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '电子行程单',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '联系电话',
  `name` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='旅行社表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (1,'2024',15,4,'A',5,1,1,'中南大学铁道校区创业楼4楼',NULL,'18873184082','中青旅行团','/profile/upload/2024/08/旅行社图片.jpg'),(2,'2021',44,82,'B',108,2,2,'天心区人民大道向阳大厦7楼',NULL,'17755923904','向阳旅行社','/profile/upload/2024/08/旅行社2).jpg'),(3,'2007',324,83,'A',105,3,3,'雨花区解放路富贵大厦11楼',NULL,'18932795547','天源国际旅游','/profile/upload/2024/08/旅行社3.jpg'),(4,'2015',249,85,'A',100,4,4,'四川省成都市郫都区解放路114号',NULL,'0755-82202005','康辉旅行社','/profile/upload/2024/08/旅行社图片4.jpg'),(5,'2019',135,80,'A',98,5,5,'重庆市人民广场成功路514号',NULL,'15556667778','龙行神舟国际旅行社','/profile/upload/2024/08/旅行社图片5.jpg');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `licensePlate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键，车牌',
  `modle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '车型',
  `color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '颜色',
  `manufacturer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '制造商',
  `creatUser` int DEFAULT NULL COMMENT '创建者',
  `updateUser` int DEFAULT NULL COMMENT '修改者',
  `isDeleted` int DEFAULT '0' COMMENT '是否删除',
  `createtime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`licensePlate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='汽车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('贵A0375','卡车','奶奶绿','大庆',1,0,NULL,NULL),('贵A5924','越野','鸡屎黄','奔驰',1,0,NULL,NULL);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `name` varchar(255) DEFAULT NULL COMMENT '投诉人的姓名',
  `create_time` date DEFAULT NULL COMMENT '投诉日期',
  `description` varchar(255) DEFAULT NULL COMMENT '投诉内容',
  `end_time` date DEFAULT NULL COMMENT '解决投诉的日期',
  `type` int DEFAULT NULL COMMENT '投诉的类型',
  `status` int DEFAULT NULL COMMENT '投诉目前的解决状态',
  `picture` varchar(255) DEFAULT NULL COMMENT '存储投诉证据图片的路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='投诉表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,'123','2024-07-15','123','2024-07-16',2,1,''),(2,'文森特儿','2024-07-15','强制收小费','2024-07-16',1,1,''),(3,'张三','2024-07-16','饭不好吃',NULL,1,0,'');
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;

--
-- Table structure for table `evaluate`
--

DROP TABLE IF EXISTS `evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluate` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '景点',
  `sid` int DEFAULT NULL COMMENT '景点id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评价内容',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评价人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int DEFAULT NULL COMMENT '修改人',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='景点评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluate`
--

/*!40000 ALTER TABLE `evaluate` DISABLE KEYS */;
INSERT INTO `evaluate` VALUES (11,'富士山🗻',11,'非常棒的地方，景色优美，我一定会再来的。','13711111111','2024-07-15 23:37:56',103,NULL,NULL,0);
/*!40000 ALTER TABLE `evaluate` ENABLE KEYS */;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '小吃名',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '城市',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '小吃图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int DEFAULT NULL COMMENT '修改人',
  `is_deleted` int unsigned DEFAULT '0' COMMENT '是否已删除',
  `restaurant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '餐馆',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='小吃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'三文鱼','本州岛','/profile/upload/2024/07/13/samon_20240713215051A002.jpg','2024-07-13 21:53:17',1,NULL,NULL,0,'Ubuya','新鲜三文鱼，采用日本传统烹饪技艺，肉质细腻，口感鲜美，搭配特制酱料，带给您纯正的日式味觉享受。',40.00),(2,'清汤仔鸡豆花','成都','/profile/upload/2024/07/15/IMG_ED993B557616-1_20240715230312A002.jpeg','2024-07-15 16:45:30',1,'2024-07-16 17:49:00',1,0,'许家菜','清汤仔鸡豆花是一道以鸡肉和豆腐为主要食材的川菜，以其汤色清澈、味道鲜美、口感细腻而著称。清汤仔鸡豆花不仅营养丰富，而且清淡不腻，适合各种口味的食客，尤其在夏季食用，更能带来清新爽口的体验。',30.00),(13,'宫保牡丹虾球','成都','/profile/upload/2024/07/16/IMG_7EE716B9877B-1_20240716174724A009.jpeg','2024-07-16 17:47:26',1,NULL,NULL,0,'许家菜','宫保牡丹虾球是一道融合了传统宫保鸡丁风味与海鲜食材的创新川菜。这道菜以新鲜的大虾为主要食材，将虾去壳、去肠线后，经过腌制、裹粉、油炸，使其外皮酥脆，内里鲜嫩。然后，与宫保鸡丁中常见的辣椒、花椒、花生米等配料一同快速翻炒，最后调入特制的宫保酱汁，形成酸甜微辣、咸香可口的独特风味。\n\n宫保牡丹虾球不仅色泽诱人，红亮的虾球与金黄的花生米相映成趣，而且口感层次丰富，既有虾肉的鲜美弹牙，又有辣椒的热烈与花椒的麻香，花生米的香脆更是增添了口感的多样性。这道菜适合喜欢尝试新口味和享受川菜特色的食客。',20.00);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (25,'evaluate','景点评价表',NULL,NULL,'Evaluate','crud','com.ruoyi.system','system','evaluate','景点评价','ruoyi','0','/','{}','admin','2022-03-13 04:42:00','','2022-03-13 04:42:30',NULL),(26,'food','小吃',NULL,NULL,'Food','crud','com.ruoyi.system','system','food','小吃','ruoyi','0','/','{}','admin','2022-03-13 04:42:01','','2022-03-13 04:42:44',NULL),(27,'member','会员',NULL,NULL,'Member','crud','com.ruoyi.system','system','member','会员','ruoyi','0','/','{}','admin','2022-03-13 04:42:02','','2022-03-13 04:42:53',NULL),(28,'order','订单',NULL,NULL,'Order','crud','com.ruoyi.system','system','order','订单','ruoyi','0','/','{}','admin','2022-03-13 04:42:02','','2022-03-13 04:43:03',NULL),(29,'packages','旅游套餐',NULL,NULL,'Packages','crud','com.ruoyi.system','system','packages','旅游套餐','ruoyi','0','/','{}','admin','2022-03-13 04:42:04','','2022-03-13 04:43:15',NULL),(30,'scenic','景点',NULL,NULL,'Scenic','crud','com.ruoyi.system','system','scenic','景点','ruoyi','0','/','{}','admin','2022-03-13 04:42:05','','2022-03-13 04:43:32',NULL),(31,'travels','游记',NULL,NULL,'Travels','crud','com.ruoyi.system','system','travels','游记','ruoyi','0','/','{}','admin','2022-03-13 04:42:06','','2022-03-13 04:43:42',NULL),(32,'viper','会员表',NULL,NULL,'Viper','crud','com.ruoyi.system','system','viper','会员','ruoyi','0','/','{}','admin','2022-03-13 04:42:07','','2022-03-13 04:43:52',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (244,'25','id','主键','int(4)','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-03-13 04:42:00','','2022-03-13 04:42:30'),(245,'25','sname','景点','varchar(255)','String','sname','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-03-13 04:42:00','','2022-03-13 04:42:30'),(246,'25','sid','景点id','int(4)','Integer','sid','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-03-13 04:42:00','','2022-03-13 04:42:30'),(247,'25','content','评价内容','varchar(255)','String','content','0','0',NULL,'1','1','1','1','EQ','textarea','',4,'admin','2022-03-13 04:42:00','','2022-03-13 04:42:30'),(248,'25','name','评价人','varchar(255)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',5,'admin','2022-03-13 04:42:00','','2022-03-13 04:42:30'),(249,'25','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2022-03-13 04:42:00','','2022-03-13 04:42:30'),(250,'25','create_user','创建人','int(4)','Integer','createUser','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-03-13 04:42:00','','2022-03-13 04:42:30'),(251,'25','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2022-03-13 04:42:00','','2022-03-13 04:42:30'),(252,'25','update_user','修改人','int(4)','Integer','updateUser','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2022-03-13 04:42:00','','2022-03-13 04:42:31'),(253,'25','is_deleted','是否已删除','int(1)','Integer','isDeleted','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:31'),(254,'26','id','主键','int(4)','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:44'),(255,'26','name','小吃名','varchar(255)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:44'),(256,'26','city','城市','varchar(255)','String','city','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:44'),(257,'26','picture','小吃图片','varchar(255)','String','picture','0','0',NULL,'1','1','1','1','EQ','imageUpload','',4,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:44'),(258,'26','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:44'),(259,'26','create_user','创建人','int(4)','Integer','createUser','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:44'),(260,'26','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',7,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:44'),(261,'26','update_user','修改人','int(4)','Integer','updateUser','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:44'),(262,'26','is_deleted','是否已删除','int(1) unsigned','Integer','isDeleted','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2022-03-13 04:42:01','','2022-03-13 04:42:44'),(263,'27','id','主键','int(4)','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-03-13 04:42:02','','2022-03-13 04:42:53'),(264,'27','name','会员','varchar(255)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-03-13 04:42:02','','2022-03-13 04:42:53'),(265,'27','content','内容','varchar(255)','String','content','0','0',NULL,'1','1','1','1','EQ','textarea','',3,'admin','2022-03-13 04:42:02','','2022-03-13 04:42:53'),(266,'27','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2022-03-13 04:42:02','','2022-03-13 04:42:53'),(267,'27','create_user','创建人','int(4)','Integer','createUser','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-03-13 04:42:02','','2022-03-13 04:42:53'),(268,'27','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',6,'admin','2022-03-13 04:42:02','','2022-03-13 04:42:53'),(269,'27','update_user','修改人','int(4)','Integer','updateUser','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-03-13 04:42:02','','2022-03-13 04:42:53'),(270,'27','is_deleted','是否已删除','int(1)','Integer','isDeleted','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-03-13 04:42:02','','2022-03-13 04:42:53'),(271,'28','id','主键','int(4)','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:03'),(272,'28','sid','景点id','int(4)','Integer','sid','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:03'),(273,'28','sname','景点名','varchar(255)','String','sname','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:03'),(274,'28','price','订单价格','varchar(32)','String','price','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:03'),(275,'28','number','出行人数','int(4)','Integer','number','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:03'),(276,'28','status','状态','varchar(255)','String','status','0','0',NULL,'1','1','1','1','EQ','radio','',6,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:03'),(277,'28','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:03'),(278,'28','create_user','创建人','int(4)','Integer','createUser','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:03'),(279,'28','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',9,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:03'),(280,'28','update_user','修改人','int(4)','Integer','updateUser','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:04'),(281,'28','is_deleted','是否已删除','int(1)','Integer','isDeleted','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2022-03-13 04:42:03','','2022-03-13 04:43:04'),(282,'29','id','主键','int(4)','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:15'),(283,'29','sid','景点id','int(4)','Integer','sid','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:15'),(284,'29','sname','景点名','varchar(255)','String','sname','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:15'),(285,'29','name','套餐名','varchar(255)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',4,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:15'),(286,'29','type','套餐类型','varchar(255)','String','type','0','0',NULL,'1','1','1','1','EQ','select','',5,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:16'),(287,'29','content','套餐详情','varchar(2000)','String','content','0','0',NULL,'1','1','1','1','EQ','textarea','',6,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:16'),(288,'29','price','套餐价格','varchar(32)','String','price','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:16'),(289,'29','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:16'),(290,'29','create_user','创建人','int(4)','Integer','createUser','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:16'),(291,'29','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',10,'admin','2022-03-13 04:42:04','','2022-03-13 04:43:16'),(292,'29','update_user','修改人','int(4)','Integer','updateUser','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:16'),(293,'29','is_deleted','是否已删除','int(1)','Integer','isDeleted','0','0',NULL,'1','1','1','1','EQ','input','',12,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:16'),(294,'30','id','主键','int(4)','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:32'),(295,'30','name','景点名','varchar(255)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:32'),(296,'30','picture','景点图片','longtext','String','picture','0','0',NULL,'1','1','1','1','EQ','imageUpload','',3,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:32'),(297,'30','score','评分','varchar(255)','String','score','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:32'),(298,'30','introduction','景点简介','varchar(2000)','String','introduction','0','0',NULL,'1','1','1','1','EQ','textarea','',5,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:33'),(299,'30','price','票价','varchar(32)','String','price','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:33'),(300,'30','play_time','建议游玩时间','varchar(255)','String','playTime','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:33'),(301,'30','city','城市','varchar(255)','String','city','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-03-13 04:42:05','','2022-03-13 04:43:33'),(302,'30','address','景点位置','varchar(255)','String','address','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2022-03-13 04:42:06','','2022-03-13 04:43:33'),(303,'30','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',10,'admin','2022-03-13 04:42:06','','2022-03-13 04:43:33'),(304,'30','create_user','创建人','int(4)','Integer','createUser','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2022-03-13 04:42:06','','2022-03-13 04:43:33'),(305,'30','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',12,'admin','2022-03-13 04:42:06','','2022-03-13 04:43:33'),(306,'30','update_user','更新人','int(4)','Integer','updateUser','0','0',NULL,'1','1','1','1','EQ','input','',13,'admin','2022-03-13 04:42:06','','2022-03-13 04:43:33'),(307,'30','is_deleted','是否已删除','int(1)','Integer','isDeleted','0','0',NULL,'1','1','1','1','EQ','input','',14,'admin','2022-03-13 04:42:06','','2022-03-13 04:43:33'),(308,'31','id','主键','int(4)','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-03-13 04:42:06','','2022-03-13 04:43:42'),(309,'31','name','游记名','varchar(255)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-03-13 04:42:06','','2022-03-13 04:43:42'),(310,'31','content','内容','longtext','String','content','0','0',NULL,'1','1','1','1','EQ','textarea','',3,'admin','2022-03-13 04:42:06','','2022-03-13 04:43:42'),(311,'31','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:42'),(312,'31','create_user','创建人','int(4)','Integer','createUser','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:42'),(313,'31','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',6,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:42'),(314,'31','update_user','修改人','int(4)','Integer','updateUser','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:43'),(315,'31','is_deleted','是否已删除','int(1)','Integer','isDeleted','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:43'),(316,'32','id','主键','int(4)','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:52'),(317,'32','uid','用户id','int(4)','Integer','uid','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:52'),(318,'32','uname','用户名','varchar(255)','String','uname','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:52'),(319,'32','integral','积分','varchar(255)','String','integral','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:52'),(320,'32','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2022-03-13 04:42:07','','2022-03-13 04:43:53'),(321,'32','create_user','创建人','int(4)','Integer','createUser','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-03-13 04:42:08','','2022-03-13 04:43:53'),(322,'32','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',7,'admin','2022-03-13 04:42:08','','2022-03-13 04:43:53'),(323,'32','update_user','修改人','int(4)','Integer','updateUser','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-03-13 04:42:08','','2022-03-13 04:43:53'),(324,'32','is_deleted','是否已删除','int(1)','Integer','isDeleted','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2022-03-13 04:42:08','','2022-03-13 04:43:53');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;

--
-- Table structure for table `give_good`
--

DROP TABLE IF EXISTS `give_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `give_good` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tid` int DEFAULT NULL COMMENT '游记id',
  `tname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '游记名字',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '点赞人',
  `create_user` int DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int DEFAULT NULL COMMENT '修改时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='点赞';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `give_good`
--

/*!40000 ALTER TABLE `give_good` DISABLE KEYS */;
INSERT INTO `give_good` VALUES (10,3,'少时诵诗书所所所','阿宇1',100,'2022-03-27 15:54:07',NULL,NULL,0),(12,4,'富士山的独特之旅','13711111111',103,'2024-07-14 00:54:46',NULL,NULL,0),(20,4,'富士山的独特之旅','13777777777',106,'2024-07-16 19:11:20',NULL,NULL,0),(22,5,'成都武侯祠：与铁马金戈的厚重历史不同','18873184082',102,'2024-07-16 20:00:56',NULL,NULL,0),(23,4,'富士山的独特之旅','18873184082',102,'2024-07-16 20:01:02',NULL,NULL,0),(25,4,'富士山的独特之旅','15588899911',104,'2024-07-16 22:34:16',NULL,NULL,0);
/*!40000 ALTER TABLE `give_good` ENABLE KEYS */;

--
-- Table structure for table `guide`
--

DROP TABLE IF EXISTS `guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '导游姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '导游手机号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '导游居住地',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '导游备注信息',
  `scenic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '导游所属景区',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '导游照片',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `age` int DEFAULT NULL COMMENT '导游年龄',
  `qualification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '导游资质审验信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='导游';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide`
--

/*!40000 ALTER TABLE `guide` DISABLE KEYS */;
INSERT INTO `guide` VALUES (1,'赵强','13500135000','四川','赵强是一位热爱自然和摄影的导游，他对九寨沟的每一个角落都了如指掌。他能够为游客提供最佳的摄影点和旅行建议，确保每位游客都能留下难忘的回忆。','九寨沟','/profile/upload/2024/07/17/pexels-olly-3760371_20240717194612A001.jpg',NULL,NULL,32,'优秀'),(2,'陈浩','24681357910','成都','陈浩是成都本地人，对大熊猫有着浓厚的兴趣和深入的了解。他以其幽默风趣的讲解和对大熊猫习性的熟悉，赢得了游客的喜爱。','大熊猫基地','/profile/upload/2024/07/17/pexels-olly-3760613_20240717194646A002.jpg',NULL,NULL,33,'合格'),(3,'佐藤健太郎','08012345678','东京','佐藤健太郎是一位经验丰富的导游，对东京的现代文化和历史都有着广泛的了解。他以其专业的知识和热情的服务，为游客提供难忘的东京之旅。','浅草寺','/profile/upload/2024/07/17/pexels-sora-shimazaki-5668790_20240717194658A003.jpg',NULL,NULL,40,'顶级'),(4,'李敏','13800138000','北京','李敏拥有丰富的历史文化知识，对故宫的每一块砖瓦都有着深刻的了解。他的热情和专业，使他成为故宫最受欢迎的导游之一。','故宫博物院','/profile/upload/2024/07/17/pexels-alex-green-5699469_20240717194725A004.jpg',NULL,NULL,35,'优秀');
/*!40000 ALTER TABLE `guide` ENABLE KEYS */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会员',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int DEFAULT NULL COMMENT '修改人',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='会员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'终身会员99.99','1、积分换取折扣。\n2、可进行免费取消行程。','2022-03-13 13:23:55',1,'2022-03-13 13:24:47',1,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sid` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '景点id',
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '景点名',
  `price` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单价格',
  `num` int DEFAULT NULL COMMENT '出行人数',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int DEFAULT NULL COMMENT '修改人',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (5,'1','玫瑰海岸','66',2,'已取消','2022-03-14 13:15:39',100,'2022-03-14 16:11:57',100,0),(6,'1','玫瑰海岸','23',1,'未出行','2022-03-14 15:59:15',100,NULL,NULL,0),(7,'1','玫瑰海岸','33',1,'未出行','2022-03-15 09:49:10',101,NULL,NULL,0),(8,'1','玫瑰海岸','33',1,'未出行','2022-03-15 09:50:04',101,NULL,NULL,0),(35,'0','清汤仔鸡豆花','5',1,'已取消','2024-07-16 16:16:37',103,'2024-07-16 16:16:54',103,0),(36,'0','宫保牡丹虾球','20',1,'未出行','2024-07-16 19:12:32',106,NULL,NULL,0),(38,'0','清汤仔鸡豆花','30',1,'未出行','2024-07-16 20:27:56',107,NULL,NULL,0),(39,'0','清汤仔鸡豆花','30',1,'未出行','2024-07-16 20:28:31',106,NULL,NULL,0);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '景点id',
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '景点名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '套餐名',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '套餐类型',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '套餐详情',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '照片',
  `price` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '套餐价格',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int DEFAULT NULL COMMENT '修改人',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='旅游套餐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (4,'11,12','富士山🗻、东京塔🗼','东京-富士山直升机套餐','相关景点套餐','提供了环绕富士山一圈的体验，飞行时间大约15分钟，适用于4名乘客。套餐包括了从东京直升机场出发，沿着东海道海岸飞行，游览箱根和芦之湖上空，环游富士山的体验','/profile/upload/2024/07/16/Xnip2024-07-14_16-39-56_20240714164005A001_20240716174030A008.jpg','10000','2024-07-16 17:42:23',1,NULL,NULL,0),(5,'13,14','伏见稻荷大社⛩️、清水寺🏯','京都神社一日游套餐','相关景点套餐','包括了京都周围所有有名的神社，在这些神社里你们可以见到各个神社的不同传统，感受日本文化的魅力','/profile/upload/2024/07/13/清水寺.jpg','12580','2024-07-16 19:18:25',1,NULL,NULL,0),(6,'12,14','东京塔🗼、伏见稻荷大社⛩️','东京-京都一日游套餐','相关景点套餐','东京-京都一日游套餐囊括了东京和京都所有有名的景点，古典与现代交错，为假期较短的人们提供了一个不错的选择','/profile/upload/2024/07/13/东京塔.jpg','8888','2024-07-16 19:28:28',1,NULL,NULL,0);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avg_price` decimal(10,2) DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_deleted` int(10) unsigned zerofill DEFAULT '0000000000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='饭店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (2,'Ubuya','本州岛','/profile/upload/2024/07/16/富士山饭店1_20240716173813A007.jpeg','Ubuya保留了日本传统的精华，是一家能感受到日式温泉文化的好地方。酒店胜在地理位置很好！临着河口湖的马路边就是酒店大楼，正对着湖景然.和富士山 人，毫无遮挡，虽然在马路边，但酒店隔音还是不错的。',1000.00,'4.5',0000000000),(3,'许家菜','成都','/profile/upload/2024/07/16/IMG_DB3FB85BE45A-1_20240716160652A001.jpeg','许家菜是一家以川菜为主的一家米其林餐厅，主轴为川菜，菜单按味型搭配，同时也供应一些地方菜式。',500.00,'4.6',0000000000);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;

--
-- Table structure for table `scenic`
--

DROP TABLE IF EXISTS `scenic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenic` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '景点名',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '景点图片',
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评分',
  `introduction` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '景点简介',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '票价',
  `play_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '建议游玩时间',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '城市',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '景点位置',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` int DEFAULT NULL COMMENT '更新人',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='景点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenic`
--

/*!40000 ALTER TABLE `scenic` DISABLE KEYS */;
INSERT INTO `scenic` VALUES (11,'富士山🗻','/profile/upload/2024/07/13/fuji_20240713214051A001.jpg','4.3','富士山是位于静冈县和山梨县之间的山，高度是3776米。 是日本最高的山，同时被人们信仰，艺术性很高，所以在2013年被注册为世界文化遗产。 山顶上终年积雪，薄薄的云覆盖着的平稳的姿态令人印象深刻，其实富士山是火山。 现在末蔓延的美丽姿态，是富士山过去多次喷发而熔岩等多重叠加形成的“自然艺术”。','普通	900円	540円\n一个学生	800円	480円','2小时','本州岛','富士箱根伊豆国立公园','2024-07-13 21:48:20',1,'2024-07-16 17:10:27',1,0),(12,'东京塔🗼','/profile/upload/2024/07/13/东京塔_20240713220142A003.jpg','4.6','东京塔由建筑师内藤多仲与日建设计株式会社共同设计。 高332.6米，比埃菲尔铁塔高出8.6米，比东京晴空塔矮301.4米，比中国广州塔矮267.4米，是世界第三高的自立式铁塔，重4,000吨，开工于1957年6月29日，1958年10月14日竣工，12月7日正式公开，12月23日举行竣工仪式并正式营业。','成人（19歲以上）	        2,800日圓\n高中生（16～18歲）	2,600日圓\n國中小學生（7～15歲）	1,800日圓','2小时','东京','东京都港区芝公园4丁目','2024-07-13 22:03:24',1,'2024-07-16 17:10:21',1,0),(13,'伏见稻荷大社⛩️','/profile/upload/2024/07/13/pexels-quang-minh-197679900-11517092_20240713220739A004.jpg','4.7','伏见稻荷大社是遍布日本全国3万余座稻荷神社的总社本宫。 也是京都市内最古老的神社之一。 这里供奉的是保佑生意兴隆，五谷丰登的神明，每到正月或每月1日赶集的日子，这里就热闹非凡，本殿与鸟居都是红色的，代表万物丰收秋天的色彩。 穿过“千本鸟居”，就是稻荷神山的入口，从这里可登上稻荷山顶，山道两旁布满了红色鸟居。','免费','2小时','京都','深草薮之内町68番地','2024-07-13 22:09:12',1,'2024-07-16 17:10:12',1,0),(14,'清水寺🏯','/profile/upload/2024/07/13/pexels-belle-co-99483-402028_20240713221908A005.jpg','4.5','清水寺是一座位于日本京都府京都市东山区清水的寺院，于778年（宝龟9年）前后由延镇上人起造。 清水寺的山号为音羽山，主要供奉千手观音，原本属于法相宗这一宗派但目前已独立，成为北法相宗的大本山。 清水寺与北山鹿苑寺（金阁寺）、岚山天龙寺等同为京都境内最著名的名胜古迹，一年四季前来朝拜的香客或来访的观光客是络驿不绝。','500日元','2小时','京都','東山区清水1丁目','2024-07-13 22:20:17',1,'2024-07-16 17:10:07',1,0),(15,'奈良公园⛲️','/profile/upload/2024/07/13/pexels-satoshi-2070030_20240713223911A006.jpg','4.5','奈良公园位于奈良市街的东边，东西长4公里、南北宽2公里，面积广阔，若草山、东大寺、春日大社、国立博物馆等奈良的名胜古迹大多在这里。 在明治21年(1888年)成为了县立公园，是日本现代公园的先驱之一。 大正11年(1922年)被指定为日本的国家名胜。','免费','2小时','奈良','奈良県奈良市雑司町','2024-07-13 22:43:03',1,'2024-07-16 17:10:02',1,0),(16,'武侯祠','/profile/upload/2024/07/16/IMG_0253E77D00FE-1_20240716170822A005.jpeg','4.4','武侯祠，位于中国四川省成都市，是纪念三国时期蜀汉丞相诸葛亮的祠堂，也是中国唯一的一座君臣合祀祠庙。始建于公元223年，历经多次修缮扩建，现存建筑主要为清代风格。祠内古木参天，环境幽雅，有三绝碑、岳飞手书《出师表》等珍贵文物，是研究三国文化和诸葛亮生平的重要场所。每年吸引众多游客和三国迷前来参观，感受古代智慧与忠诚精神。','全价门票为50元/人次，半价门票为25元/人次，年票为100元/人/年。此外，对于6周岁（不含6周岁）至18周岁（含18周岁）的未成年人、19周岁（含19周岁）至23周岁（含23周岁）的全日制大学本科及以下学历的学生，可以享受半价优惠。60周岁及以上的老年人可以免费参观，6周岁以下（含6周岁）或身高1.3米以下（含1.3米）的儿童也可以免费参观，但需要由监护人陪同','2小时','成都','武侯区武侯大街231号','2024-07-16 17:09:53',1,NULL,NULL,0);
/*!40000 ALTER TABLE `scenic` ENABLE KEYS */;

--
-- Table structure for table `sensitive_word`
--

DROP TABLE IF EXISTS `sensitive_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensitive_word` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensitive_word`
--

/*!40000 ALTER TABLE `sensitive_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensitive_word` ENABLE KEYS */;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-03-12 13:11:21','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-03-12 13:11:21','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-03-12 13:11:21','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaOnOff','true','Y','admin','2022-03-12 13:11:21','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2022-03-12 13:11:21','',NULL,'是否开启注册用户功能（true开启，false关闭）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','中南旅游',0,'Vincent','15888888888','vincent@gmail.com','0','0','admin','2022-03-12 13:11:09','admin','2024-07-15 17:36:19'),(101,100,'0,100','总部',1,'超级管理员','15888888888','111@qq.com','0','0','admin','2022-03-12 13:11:09','admin','2022-03-12 15:30:40'),(200,100,'0,100','门户用户',2,NULL,NULL,NULL,'0','0','admin','2022-03-13 06:54:37','admin','2022-03-13 07:13:34');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2022-03-12 13:11:20','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2022-03-12 13:11:20','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2022-03-12 13:11:20','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2022-03-12 13:11:20','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2022-03-12 13:11:20','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2022-03-12 13:11:20','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2022-03-12 13:11:20','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2022-03-12 13:11:20','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2022-03-12 13:11:20','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2022-03-12 13:11:20','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2022-03-12 13:11:20','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2022-03-12 13:11:20','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2022-03-12 13:11:20','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2022-03-12 13:11:20','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2022-03-12 13:11:21','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2022-03-12 13:11:21','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2022-03-12 13:11:21','',NULL,'关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2022-03-12 13:11:21','',NULL,'新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2022-03-12 13:11:21','',NULL,'修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2022-03-12 13:11:21','',NULL,'删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2022-03-12 13:11:21','',NULL,'授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2022-03-12 13:11:21','',NULL,'导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2022-03-12 13:11:21','',NULL,'导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2022-03-12 13:11:21','',NULL,'强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2022-03-12 13:11:21','',NULL,'生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2022-03-12 13:11:21','',NULL,'清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2022-03-12 13:11:21','',NULL,'正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2022-03-12 13:11:21','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2022-03-12 13:11:19','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2022-03-12 13:11:19','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2022-03-12 13:11:19','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2022-03-12 13:11:19','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2022-03-12 13:11:19','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2022-03-12 13:11:20','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2022-03-12 13:11:20','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2022-03-12 13:11:20','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2022-03-12 13:11:20','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2022-03-12 13:11:20','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2022-03-12 13:11:22','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2022-03-12 13:11:22','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2022-03-12 13:11:22','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-12 15:24:57'),(101,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-12 15:38:22'),(102,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-12 15:38:41'),(103,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-12 15:47:28'),(104,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-13 04:35:16'),(105,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-13 06:10:19'),(106,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-13 06:12:37'),(107,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-13 06:37:57'),(108,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-13 06:38:02'),(109,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-13 07:01:26'),(110,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-13 07:01:30'),(111,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-13 07:07:35'),(112,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-13 07:07:52'),(113,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-13 07:12:50'),(114,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-13 07:16:06'),(115,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','注册成功','2022-03-13 07:22:07'),(116,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-13 07:24:27'),(117,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-13 07:57:06'),(118,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-13 07:57:55'),(119,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2022-03-14 02:14:44'),(120,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 02:14:50'),(121,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 04:24:26'),(122,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 04:37:45'),(123,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-14 04:39:34'),(124,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 04:39:39'),(125,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 05:51:57'),(126,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 06:11:26'),(127,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 06:12:45'),(128,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 07:22:09'),(129,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 07:56:40'),(130,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 08:32:43'),(131,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-14 12:47:36'),(132,'15888881111','127.0.0.1','内网IP','Chrome 9','Windows 10','0','注册成功','2022-03-15 01:47:28'),(133,'15888881111','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-15 01:47:40'),(134,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-15 09:54:45'),(135,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2022-03-15 09:54:50'),(136,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-15 09:56:16'),(137,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2022-03-15 09:56:16'),(138,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-15 09:56:30'),(139,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-15 09:58:46'),(140,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-15 09:58:55'),(141,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-03-15 09:59:08'),(142,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-15 10:01:13'),(143,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-15 10:03:59'),(144,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-15 10:05:02'),(145,'15233332222','127.0.0.1','内网IP','Chrome 9','Windows 10','1','登录用户：15233332222 不存在','2022-03-20 06:27:22'),(146,'15233332222','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2022-03-20 06:27:25'),(147,'15222223333','127.0.0.1','内网IP','Chrome 9','Windows 10','1','登录用户：15222223333 不存在','2022-03-20 06:28:13'),(148,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 06:28:24'),(149,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2022-03-20 06:57:16'),(150,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 06:57:25'),(151,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 07:06:23'),(152,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 07:07:36'),(153,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 07:08:46'),(154,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 07:11:57'),(155,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 07:12:03'),(156,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 07:12:32'),(157,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 07:13:30'),(158,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 07:15:49'),(159,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-20 07:16:08'),(160,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-27 06:26:28'),(161,'15233332222','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2022-03-27 06:38:42'),(162,'15233332222','127.0.0.1','内网IP','Chrome 9','Windows 10','1','登录用户：15233332222 不存在','2022-03-27 06:38:45'),(163,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-27 06:38:54'),(164,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2022-03-27 07:37:35'),(165,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-27 07:37:40'),(166,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-27 07:44:11'),(167,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-27 07:46:10'),(168,'18090404945','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-03-27 07:47:03'),(169,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:13:42'),(170,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 13:52:27'),(171,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-10 15:39:00'),(172,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-07-10 15:47:46'),(173,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-10 15:47:57'),(174,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-10 15:48:42'),(175,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-10 16:50:25'),(176,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-10 21:00:57'),(177,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-10 21:01:01'),(178,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-11 15:22:06'),(179,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-11 16:34:15'),(180,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','1','登录用户：13711111111 不存在','2024-07-13 10:58:54'),(181,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','注册成功','2024-07-13 10:59:14'),(182,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-13 10:59:19'),(183,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-13 11:00:27'),(184,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-13 11:00:31'),(185,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','1','登录用户：15588899911 不存在','2024-07-13 11:12:49'),(186,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-07-13 11:13:01'),(187,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-13 11:13:10'),(188,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-13 11:13:18'),(189,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-13 21:04:58'),(190,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-13 21:07:29'),(191,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-14 00:51:24'),(192,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-14 00:51:47'),(193,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-15 16:21:07'),(194,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 16:21:20'),(195,'15607352515','127.0.0.1','内网IP','Chrome 12','Windows 10','1','登录用户：15607352515 不存在','2024-07-15 16:29:30'),(196,'15607352515','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-07-15 16:29:50'),(197,'15607352515','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 16:30:06'),(198,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 16:30:59'),(199,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-15 16:37:01'),(200,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 16:37:05'),(201,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 16:41:59'),(202,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 16:59:38'),(203,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-15 17:26:51'),(204,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-15 17:34:37'),(205,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-15 18:25:51'),(206,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 18:25:56'),(207,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 18:41:35'),(208,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-15 19:21:40'),(209,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 19:28:01'),(210,'15607352515','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 19:30:24'),(211,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 19:34:42'),(212,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-15 19:51:06'),(213,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','1','验证码错误','2024-07-15 20:31:09'),(214,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-15 20:31:13'),(215,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','1','验证码错误','2024-07-15 20:31:41'),(216,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-15 20:31:44'),(217,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 20:33:16'),(218,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-15 20:44:37'),(219,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 20:44:40'),(220,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-15 20:58:55'),(221,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 20:59:00'),(222,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 21:02:02'),(223,'15607352515','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 21:45:46'),(224,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 21:51:26'),(225,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-15 22:27:02'),(226,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-15 22:35:21'),(227,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-15 23:07:16'),(228,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','1','验证码错误','2024-07-16 14:58:33'),(229,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 14:58:41'),(230,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 15:03:56'),(231,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 15:04:19'),(232,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 15:09:00'),(233,'15607352515','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 15:12:03'),(234,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 15:12:27'),(235,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 15:12:49'),(236,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 15:20:55'),(237,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 16:03:00'),(238,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 16:07:15'),(239,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 16:41:44'),(240,'13711111111','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 16:45:38'),(241,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','注册成功','2024-07-16 16:47:33'),(242,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 16:47:42'),(243,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 17:37:52'),(244,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 18:24:43'),(245,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 18:40:43'),(246,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 18:57:38'),(247,'15225430103','127.0.0.1','内网IP','Chrome 12','Windows 10','1','登录用户：15225430103 不存在','2024-07-16 18:58:03'),(248,'15225430103','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-16 18:58:05'),(249,'15225430103','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-07-16 18:58:13'),(250,'15225430103','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 18:58:17'),(251,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 18:58:49'),(252,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 19:02:24'),(253,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 19:10:34'),(254,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 19:11:12'),(255,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 19:20:55'),(256,'15607352515','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 19:32:11'),(257,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 19:37:13'),(258,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 19:44:53'),(259,'18873184082','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 20:01:20'),(260,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 20:08:13'),(261,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 20:20:04'),(262,'15225430103','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 20:27:37'),(263,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-16 20:28:19'),(264,'15588899911','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 21:58:11'),(265,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 22:08:56'),(266,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-16 22:50:49'),(267,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-17 15:16:21'),(268,'15225430103','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-17 15:21:41'),(269,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-17 15:47:42'),(270,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-17 15:52:56'),(271,'15225430103','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-17 16:21:51'),(272,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-17 16:42:27'),(273,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-17 17:34:47'),(274,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-17 19:29:54'),(275,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-17 19:33:50'),(276,'13777777777','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-17 19:39:46'),(277,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-07-17 19:45:31');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','1','0','','system','admin','2022-03-12 13:11:11','admin','2024-07-17 16:42:45','系统管理目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2022-03-12 13:11:11','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2022-03-12 13:11:11','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2022-03-12 13:11:11','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2022-03-12 13:11:11','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2022-03-12 13:11:11','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','1','0','system:dict:list','dict','admin','2022-03-12 13:11:11','admin','2022-03-13 06:50:17','字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','1','0','system:config:list','edit','admin','2022-03-12 13:11:11','admin','2022-03-13 06:50:31','参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','1','0','system:notice:list','message','admin','2022-03-12 13:11:11','admin','2022-03-13 06:50:39','通知公告菜单'),(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2022-03-12 13:11:12','',NULL,''),(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2022-03-12 13:11:12','',NULL,''),(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2022-03-12 13:11:12','',NULL,''),(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2022-03-12 13:11:12','',NULL,''),(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2022-03-12 13:11:12','',NULL,''),(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2022-03-12 13:11:12','',NULL,''),(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2022-03-12 13:11:12','',NULL,''),(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2022-03-12 13:11:12','',NULL,''),(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2022-03-12 13:11:12','',NULL,''),(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2022-03-12 13:11:12','',NULL,''),(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2022-03-12 13:11:12','',NULL,''),(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2022-03-12 13:11:12','',NULL,''),(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2022-03-12 13:11:12','',NULL,''),(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2022-03-12 13:11:12','',NULL,''),(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2022-03-12 13:11:12','',NULL,''),(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2022-03-12 13:11:12','',NULL,''),(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2022-03-12 13:11:12','',NULL,''),(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2022-03-12 13:11:12','',NULL,''),(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2022-03-12 13:11:13','',NULL,''),(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2022-03-12 13:11:13','',NULL,''),(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2022-03-12 13:11:13','',NULL,''),(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2022-03-12 13:11:13','',NULL,''),(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2022-03-12 13:11:13','',NULL,''),(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2022-03-12 13:11:13','',NULL,''),(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2022-03-12 13:11:13','',NULL,''),(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2022-03-12 13:11:13','',NULL,''),(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2022-03-12 13:11:13','',NULL,''),(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2022-03-12 13:11:13','',NULL,''),(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2022-03-12 13:11:13','',NULL,''),(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2022-03-12 13:11:13','',NULL,''),(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2022-03-12 13:11:13','',NULL,''),(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2022-03-12 13:11:13','',NULL,''),(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2022-03-12 13:11:13','',NULL,''),(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2022-03-12 13:11:13','',NULL,''),(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2022-03-12 13:11:13','',NULL,''),(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2022-03-12 13:11:13','',NULL,''),(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2022-03-12 13:11:13','',NULL,''),(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2022-03-12 13:11:13','',NULL,''),(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2022-03-12 13:11:13','',NULL,''),(2002,'景点管理',0,5,'scenic',NULL,NULL,1,0,'M','0','0',NULL,'message','admin','2022-03-13 04:56:22','',NULL,''),(2003,'旅游套餐管理',0,6,'packages',NULL,NULL,1,0,'M','0','0',NULL,'education','admin','2022-03-13 04:57:04','',NULL,''),(2004,'评价管理',0,7,'evaluate',NULL,NULL,1,0,'M','0','0','','eye','admin','2022-03-13 04:57:40','admin','2022-03-13 04:58:13',''),(2005,'游记管理',0,8,'travels',NULL,NULL,1,0,'M','0','0',NULL,'list','admin','2022-03-13 04:58:07','',NULL,''),(2006,'特色美食管理',0,9,'food',NULL,NULL,1,0,'M','0','0','','logininfor','admin','2022-03-13 04:58:45','admin','2024-07-16 15:14:10',''),(2007,'订单管理',0,10,'order',NULL,NULL,1,0,'M','0','0',NULL,'nested','admin','2022-03-13 04:59:58','',NULL,''),(2010,'景点管理',2002,1,'scenic','system/scenic/index',NULL,1,0,'C','0','0',NULL,'button','admin','2022-03-13 05:02:09','',NULL,''),(2011,'旅游套餐管理',2003,1,'packages','system/packages/index',NULL,1,0,'C','0','0',NULL,'button','admin','2022-03-13 05:02:36','',NULL,''),(2012,'评价管理',2004,1,'evaluate','system/evaluate/index',NULL,1,0,'C','0','0',NULL,'button','admin','2022-03-13 05:03:02','',NULL,''),(2013,'游记管理',2005,1,'travels','system/travels/index',NULL,1,0,'C','0','0',NULL,'button','admin','2022-03-13 05:03:29','',NULL,''),(2014,'特色美食管理',2006,1,'food','system/food/index',NULL,1,0,'C','0','0','','button','admin','2022-03-13 05:03:50','admin','2024-07-16 15:14:35',''),(2015,'订单管理',2007,1,'order','system/order/index',NULL,1,0,'C','0','0',NULL,'button','admin','2022-03-13 05:04:13','',NULL,''),(2016,'导游管理',0,11,'guide',NULL,NULL,1,0,'M','0','0',NULL,'peoples','admin','2024-07-13 11:01:56','',NULL,''),(2017,'导游管理',2016,1,'guide','system/guide/index',NULL,1,0,'C','0','0',NULL,'people','admin','2024-07-13 11:03:09','',NULL,''),(2018,'旅行社管理',0,12,'Agency',NULL,NULL,1,0,'M','0','0','','international','admin','2024-07-13 11:06:54','admin','2024-07-13 11:37:24',''),(2019,'旅行社管理',2018,1,'Agency','system/Agency/agency',NULL,1,0,'C','0','0','','tool','admin','2024-07-13 11:07:26','admin','2024-07-13 11:37:50',''),(2020,'饭店管理',0,3,'restaurant',NULL,NULL,1,0,'M','0','0','','cascader','admin','2024-07-15 16:42:40','admin','2024-07-15 16:43:42',''),(2021,'饭店管理',2020,1,'restaurant','system/restaurant/index',NULL,1,0,'C','0','0',NULL,'date','admin','2024-07-15 16:43:14','',NULL,''),(2022,'投诉管理',0,7,'complain',NULL,NULL,1,0,'M','0','0','','email','admin','2024-07-15 21:51:56','admin','2024-07-16 19:38:31',''),(2023,'投诉管理',2022,1,'complain','system/complain/index',NULL,1,0,'C','0','0','','checkbox','admin','2024-07-15 21:52:29','admin','2024-07-16 19:38:48','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1647061870000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:25:32'),(101,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{menuId=4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:25:41'),(102,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/116','127.0.0.1','内网IP','{menuId=116}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:25:45'),(103,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/114','127.0.0.1','内网IP','{menuId=114}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:25:49'),(104,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/113','127.0.0.1','内网IP','{menuId=113}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:25:54'),(105,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/112','127.0.0.1','内网IP','{menuId=112}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:25:57'),(106,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/111','127.0.0.1','内网IP','{menuId=111}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:25:59'),(107,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1049','127.0.0.1','内网IP','{menuId=1049}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:03'),(108,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1050','127.0.0.1','内网IP','{menuId=1050}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:05'),(109,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1051','127.0.0.1','内网IP','{menuId=1051}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:09'),(110,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1052','127.0.0.1','内网IP','{menuId=1052}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:12'),(111,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1053','127.0.0.1','内网IP','{menuId=1053}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:14'),(112,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1054','127.0.0.1','内网IP','{menuId=1054}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:16'),(113,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/110','127.0.0.1','内网IP','{menuId=110}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:22'),(114,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1048','127.0.0.1','内网IP','{menuId=1048}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:25'),(115,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1047','127.0.0.1','内网IP','{menuId=1047}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:30'),(116,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1046','127.0.0.1','内网IP','{menuId=1046}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:32'),(117,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/109','127.0.0.1','内网IP','{menuId=109}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:35'),(118,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2','127.0.0.1','内网IP','{menuId=2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:37'),(119,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1045','127.0.0.1','内网IP','{menuId=1045}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:50'),(120,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1043','127.0.0.1','内网IP','{menuId=1043}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:53'),(121,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1044','127.0.0.1','内网IP','{menuId=1044}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:56'),(122,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/501','127.0.0.1','内网IP','{menuId=501}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:26:59'),(123,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1042','127.0.0.1','内网IP','{menuId=1042}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:01'),(124,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1041','127.0.0.1','内网IP','{menuId=1041}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:04'),(125,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1040','127.0.0.1','内网IP','{menuId=1040}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:06'),(126,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/500','127.0.0.1','内网IP','{menuId=500}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:11'),(127,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/108','127.0.0.1','内网IP','{menuId=108}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:14'),(128,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin',NULL,'/system/user/2','127.0.0.1','内网IP','{userIds=2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:29'),(129,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/109','127.0.0.1','内网IP','{deptId=109}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:40'),(130,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/108','127.0.0.1','内网IP','{deptId=108}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:42'),(131,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/102','127.0.0.1','内网IP','{deptId=102}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:45'),(132,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/107','127.0.0.1','内网IP','{deptId=107}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:47'),(133,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/106','127.0.0.1','内网IP','{deptId=106}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:49'),(134,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/105','127.0.0.1','内网IP','{deptId=105}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:52'),(135,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/104','127.0.0.1','内网IP','{deptId=104}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:27:54'),(136,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/103','127.0.0.1','内网IP','{deptId=103}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}',0,NULL,'2022-03-12 15:27:56'),(137,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"研发部门\",\"leader\":\"管理\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647061869000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"111@qq.com\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:29:41'),(138,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"管理部门\",\"leader\":\"超级管理员\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647061869000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"111@qq.com\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:29:59'),(139,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"总部\",\"leader\":\"超级管理员\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647061869000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"111@qq.com\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:30:40'),(140,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1647061870000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"111@163.com\",\"nickName\":\"超级管理员\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1647061870000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:31:21'),(141,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1647061870000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"111@163.com\",\"nickName\":\"超级管理员\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1647061870000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:31:22'),(142,'岗位管理',3,'com.ruoyi.web.controller.system.SysPostController.remove()','DELETE',1,'admin',NULL,'/system/post/4','127.0.0.1','内网IP','{postIds=4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:31:40'),(143,'岗位管理',3,'com.ruoyi.web.controller.system.SysPostController.remove()','DELETE',1,'admin',NULL,'/system/post/3','127.0.0.1','内网IP','{postIds=3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:31:42'),(144,'岗位管理',3,'com.ruoyi.web.controller.system.SysPostController.remove()','DELETE',1,'admin',NULL,'/system/post/2','127.0.0.1','内网IP','{postIds=2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:31:45'),(145,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"postSort\":\"1\",\"flag\":false,\"remark\":\"\",\"postId\":1,\"params\":{},\"createBy\":\"admin\",\"createTime\":1647061870000,\"updateBy\":\"admin\",\"postName\":\"超级管理员\",\"postCode\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:31:55'),(146,'岗位管理',1,'com.ruoyi.web.controller.system.SysPostController.add()','POST',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"postSort\":\"2\",\"flag\":false,\"postId\":5,\"params\":{},\"createBy\":\"admin\",\"postName\":\"门户用户\",\"postCode\":\"user\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:32:36'),(147,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1647061870000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"门户用户\",\"menuIds\":[],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:33:05'),(148,'通知公告',3,'com.ruoyi.web.controller.system.SysNoticeController.remove()','DELETE',1,'admin',NULL,'/system/notice/2','127.0.0.1','内网IP','{noticeIds=2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:33:31'),(149,'通知公告',3,'com.ruoyi.web.controller.system.SysNoticeController.remove()','DELETE',1,'admin',NULL,'/system/notice/1','127.0.0.1','内网IP','{noticeIds=1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-12 15:33:33'),(150,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','travels,order,viper,member,evaluate,packages,food,scenic','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:36:27'),(151,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','travels,order,viper,member,evaluate,packages,food,scenic','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:36:33'),(152,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','travels,order,viper,member,evaluate,packages,food,scenic','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:36:34'),(153,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117378000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Sname\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117378000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"sname\"},{\"capJavaField\":\"Sid\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117378000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"sid\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"content\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"评价内容\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117379000,\"isEdit\":\"1\",\"tableId\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:39:08'),(154,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117379000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"小吃名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117379000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"City\",\"usableColumn\":false,\"columnId\":13,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"city\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"城市\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117380000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"city\"},{\"capJavaField\":\"Picture\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"picture\",\"htmlType\":\"imageUpload\",\"edit\":true,\"query\":true,\"columnComment\":\"小吃图片\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":16471173800','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:39:31'),(155,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":20,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117380000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":21,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"会员\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117380000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":22,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"content\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"内容\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117380000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"content\"},{\"capJavaField\":\"CreateTime\",\"usableColumn\":false,\"columnId\":23,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"columnComment\":\"创建时间\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117381000,\"tableId\":3,\"p','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:40:11'),(156,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117381000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Sid\",\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117381000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"sid\"},{\"capJavaField\":\"Sname\",\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117381000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"sname\"},{\"capJavaField\":\"Price\",\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"price\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单价格\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117381000,\"isEdit\":\"1','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:40:26'),(157,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":39,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117382000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Sid\",\"usableColumn\":false,\"columnId\":40,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117382000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"sid\"},{\"capJavaField\":\"Sname\",\"usableColumn\":false,\"columnId\":41,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117383000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"sname\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":42,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"套餐名\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117383000,\"isEdit\":\"1','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:40:55'),(158,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":51,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117384000,\"tableId\":6,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":52,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117384000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Picture\",\"usableColumn\":false,\"columnId\":53,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"picture\",\"htmlType\":\"imageUpload\",\"edit\":true,\"query\":true,\"columnComment\":\"景点图片\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"longtext\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117384000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"picture\"},{\"capJavaField\":\"Score\",\"usableColumn\":false,\"columnId\":54,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"score\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"评分\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117384','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:41:13'),(159,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/1,2,3,4,5,6,7,8,9,10','127.0.0.1','内网IP','{tableIds=1,2,3,4,5,6,7,8,9,10}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:41:46'),(160,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/11,12,13,14,15,16,17,18,19,20','127.0.0.1','内网IP','{tableIds=11,12,13,14,15,16,17,18,19,20}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:41:49'),(161,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/21,22,23,24','127.0.0.1','内网IP','{tableIds=21,22,23,24}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:41:53'),(162,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','travels,order,viper,member,evaluate,packages,food,scenic','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:42:08'),(163,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":244,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117720000,\"tableId\":25,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Sname\",\"usableColumn\":false,\"columnId\":245,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117720000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"sname\"},{\"capJavaField\":\"Sid\",\"usableColumn\":false,\"columnId\":246,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117720000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"sid\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":247,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"content\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"评价内容\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":16471177200','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:42:31'),(164,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":254,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117721000,\"tableId\":26,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":255,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"小吃名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117721000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"City\",\"usableColumn\":false,\"columnId\":256,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"city\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"城市\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117721000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"city\"},{\"capJavaField\":\"Picture\",\"usableColumn\":false,\"columnId\":257,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"picture\",\"htmlType\":\"imageUpload\",\"edit\":true,\"query\":true,\"columnComment\":\"小吃图片\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:42:45'),(165,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":263,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117722000,\"tableId\":27,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":264,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"会员\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117722000,\"isEdit\":\"1\",\"tableId\":27,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":265,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"content\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"内容\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117722000,\"isEdit\":\"1\",\"tableId\":27,\"pk\":false,\"columnName\":\"content\"},{\"capJavaField\":\"CreateTime\",\"usableColumn\":false,\"columnId\":266,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"columnComment\":\"创建时间\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117722000,\"tableI','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:42:54'),(166,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":271,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117723000,\"tableId\":28,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Sid\",\"usableColumn\":false,\"columnId\":272,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117723000,\"isEdit\":\"1\",\"tableId\":28,\"pk\":false,\"columnName\":\"sid\"},{\"capJavaField\":\"Sname\",\"usableColumn\":false,\"columnId\":273,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117723000,\"isEdit\":\"1\",\"tableId\":28,\"pk\":false,\"columnName\":\"sname\"},{\"capJavaField\":\"Price\",\"usableColumn\":false,\"columnId\":274,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"price\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单价格\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117723000,\"isE','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:43:04'),(167,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":282,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117724000,\"tableId\":29,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Sid\",\"usableColumn\":false,\"columnId\":283,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117724000,\"isEdit\":\"1\",\"tableId\":29,\"pk\":false,\"columnName\":\"sid\"},{\"capJavaField\":\"Sname\",\"usableColumn\":false,\"columnId\":284,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117724000,\"isEdit\":\"1\",\"tableId\":29,\"pk\":false,\"columnName\":\"sname\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":285,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"套餐名\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117724000,\"isE','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:43:16'),(168,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":294,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117725000,\"tableId\":30,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":295,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"景点名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117725000,\"isEdit\":\"1\",\"tableId\":30,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Picture\",\"usableColumn\":false,\"columnId\":296,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"picture\",\"htmlType\":\"imageUpload\",\"edit\":true,\"query\":true,\"columnComment\":\"景点图片\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"longtext\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117725000,\"isEdit\":\"1\",\"tableId\":30,\"pk\":false,\"columnName\":\"picture\"},{\"capJavaField\":\"Score\",\"usableColumn\":false,\"columnId\":297,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"score\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"评分\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":164','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:43:34'),(169,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":308,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117726000,\"tableId\":31,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":309,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"游记名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117726000,\"isEdit\":\"1\",\"tableId\":31,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":310,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"content\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"内容\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"longtext\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117726000,\"isEdit\":\"1\",\"tableId\":31,\"pk\":false,\"columnName\":\"content\"},{\"capJavaField\":\"CreateTime\",\"usableColumn\":false,\"columnId\":311,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"columnComment\":\"创建时间\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117727000,\"tableId\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:43:43'),(170,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":316,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647117727000,\"tableId\":32,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Uid\",\"usableColumn\":false,\"columnId\":317,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"uid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117727000,\"isEdit\":\"1\",\"tableId\":32,\"pk\":false,\"columnName\":\"uid\"},{\"capJavaField\":\"Uname\",\"usableColumn\":false,\"columnId\":318,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"uname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117727000,\"isEdit\":\"1\",\"tableId\":32,\"pk\":false,\"columnName\":\"uname\"},{\"capJavaField\":\"Integral\",\"usableColumn\":false,\"columnId\":319,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"integral\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"积分\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647117727000','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:43:53'),(171,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-03-13 04:44:19'),(172,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":3,\"menuName\":\"会员管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"viper\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:55:25'),(173,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":4,\"menuName\":\"会员规则\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"member\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:55:53'),(174,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":5,\"menuName\":\"景点管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"scenic\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:56:22'),(175,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":6,\"menuName\":\"旅游套餐管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"packages\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:57:04'),(176,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"eye\",\"orderNum\":6,\"menuName\":\"评价管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"evaluate\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:57:40'),(177,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":8,\"menuName\":\"游记管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"travels\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:58:07'),(178,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"eye\",\"orderNum\":7,\"menuName\":\"评价管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"evaluate\",\"children\":[],\"createTime\":1647118660000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:58:13'),(179,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"logininfor\",\"orderNum\":9,\"menuName\":\"特色小吃管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"food\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:58:45'),(180,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":10,\"menuName\":\"订单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"order\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 04:59:58'),(181,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"会员管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"viper\",\"component\":\"system/viper/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:01:13'),(182,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"会员规则\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"system/member/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:01:40'),(183,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"景点管理\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"scenic\",\"component\":\"system/scenic/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:02:09'),(184,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"旅游套餐管理\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"packages\",\"component\":\"system/packages/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:02:36'),(185,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"评价管理\",\"params\":{},\"parentId\":2004,\"isCache\":\"0\",\"path\":\"evaluate\",\"component\":\"system/evaluate/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:03:02'),(186,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"游记管理\",\"params\":{},\"parentId\":2005,\"isCache\":\"0\",\"path\":\"travels\",\"component\":\"system/travels/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:03:29'),(187,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"特色小吃管理\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"food\",\"component\":\"system/food/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:03:50'),(188,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"订单管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"system/order/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:04:13'),(189,'会员',1,'com.ruoyi.controller.MemberController.add()','POST',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"params\":{},\"content\":\"1、积分换取折扣\\n2、可进行免费取消行程\",\"createTime\":1647149034779,\"name\":\"终身会员99.99\",\"createUser\":1,\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:23:57'),(190,'会员',2,'com.ruoyi.controller.MemberController.edit()','PUT',1,'admin',NULL,'/system/member','127.0.0.1','内网IP','{\"updateUser\":1,\"updateTime\":1647149086614,\"params\":{},\"content\":\"1、积分换取折扣。\\n2、可进行免费取消行程。\",\"isDeleted\":0,\"createTime\":1647149035000,\"name\":\"终身会员99.99\",\"createUser\":1,\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:24:47'),(191,'景点',1,'com.ruoyi.controller.ScenicController.add()','POST',1,'admin',NULL,'/system/scenic','127.0.0.1','内网IP','{\"address\":\"深圳市龙岗区深葵公路\",\"city\":\"深圳\",\"pic\":\"http://localhost:8080/profile/upload/2022/03/13/100w1f000001gw96p82A7_C_1600_1200_20220313133523A001.jpg\",\"params\":{},\"picture\":\"/profile/upload/2022/03/13/100w1f000001gw96p82A7_C_1600_1200_20220313133523A001.jpg\",\"score\":\"4.3\",\"createTime\":1647149801323,\"price\":\"儿童：1.2米（不含）以下，免费；1.2米（含）-1.5米（含）儿童，优惠 老人：70周岁（含）以上凭老年证或身份证，免费；65周岁（含）-69周岁（含）凭老年证，优惠 残疾人：1-2级残疾人，免费；3-4级残疾人凭相关证件，优惠 军人：现役军人凭相关证件，免费\",\"name\":\"玫瑰海岸\",\"createUser\":1,\"playTime\":\"4小时\",\"introduction\":\"玫瑰海岸是大鹏湾内的一处绝美海滩，这里沙平水清，海岸上拥有众多城堡、花海等梦幻场景，从而成为了深圳热门的婚纱摄影地。\\n\\n面朝广阔无边的大海，脚踩细软沙滩，漫步在玫瑰海岸，惬意又舒爽。沙滩生有万种风情的原生态树林，还有诸多浪漫建筑，彩虹桥是来这必看的，同心锁、一幢幢童话城堡等构建的场景都是拍照的热门场景。\\n\\n除了走走拍拍，沙滩上也不乏体验项目，在这里可以骑上马背，感受别样海景，也可以畅玩沙滩排球等运动项目。\"}',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'price\' at row 1\r\n### The error may exist in file [D:\\code\\ideaworkspace\\tour-system\\ruoyi-system\\target\\classes\\mapper\\system\\ScenicMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ScenicMapper.insertScenic-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into scenic          ( name,             picture,             score,             introduction,             price,             play_time,             city,             address,             create_time,             create_user )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'price\' at row 1\n; Data truncation: Data too long for column \'price\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'price\' at row 1','2022-03-13 05:36:42'),(192,'景点',1,'com.ruoyi.controller.ScenicController.add()','POST',1,'admin',NULL,'/system/scenic','127.0.0.1','内网IP','{\"address\":\"深圳市龙岗区深葵公路\",\"city\":\"深圳\",\"pic\":\"http://localhost:8080/profile/upload/2022/03/13/100w1f000001gw96p82A7_C_1600_1200_20220313133523A001.jpg\",\"params\":{},\"picture\":\"/profile/upload/2022/03/13/100w1f000001gw96p82A7_C_1600_1200_20220313133523A001.jpg\",\"score\":\"4.3\",\"createTime\":1647149880842,\"price\":\"儿童：1.2米（不含）以下，免费；1.2米（含）-1.5米（含）儿童，优惠 老人：70周岁（含）以上凭老年证或身份证，免费；65周岁（含）-69周岁（含）凭老年证，优惠 残疾人：1-2级残疾人，免费；3-4级残疾人凭相关证件，优惠 军人：现役军人凭相关证件，免费\",\"name\":\"玫瑰海岸\",\"createUser\":1,\"playTime\":\"4小时\",\"id\":1,\"introduction\":\"玫瑰海岸是大鹏湾内的一处绝美海滩，这里沙平水清，海岸上拥有众多城堡、花海等梦幻场景，从而成为了深圳热门的婚纱摄影地。\\n\\n面朝广阔无边的大海，脚踩细软沙滩，漫步在玫瑰海岸，惬意又舒爽。沙滩生有万种风情的原生态树林，还有诸多浪漫建筑，彩虹桥是来这必看的，同心锁、一幢幢童话城堡等构建的场景都是拍照的热门场景。\\n\\n除了走走拍拍，沙滩上也不乏体验项目，在这里可以骑上马背，感受别样海景，也可以畅玩沙滩排球等运动项目。\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 05:38:01'),(193,'旅游套餐',1,'com.ruoyi.controller.PackagesController.add()','POST',1,'admin',NULL,'/system/packages','127.0.0.1','内网IP','{\"params\":{},\"content\":\"套餐1\",\"createTime\":1647151506618,\"price\":\"22\",\"name\":\"套餐1\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:05:07'),(194,'旅游套餐',1,'com.ruoyi.controller.PackagesController.add()','POST',1,'admin',NULL,'/system/packages','127.0.0.1','内网IP','{\"params\":{},\"type\":\"周末游\",\"content\":\"套餐2\",\"sid\":1,\"createTime\":1647151978361,\"price\":\"33\",\"sname\":\"玫瑰海岸\",\"name\":\"套餐2\",\"createUser\":1,\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:12:58'),(195,'景点评价',1,'com.ruoyi.controller.EvaluateController.add()','POST',1,'admin',NULL,'/system/evaluate','127.0.0.1','内网IP','{\"params\":{},\"content\":\"111\",\"createTime\":1647152424441,\"sname\":\"111\",\"name\":\"111\",\"id\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:20:24'),(196,'景点评价',3,'com.ruoyi.controller.EvaluateController.remove()','DELETE',1,'admin',NULL,'/system/evaluate/5','127.0.0.1','内网IP','{ids=5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:20:29'),(197,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1060','127.0.0.1','内网IP','{menuId=1060}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:49:44'),(198,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1059','127.0.0.1','内网IP','{menuId=1059}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:49:47'),(199,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1057','127.0.0.1','内网IP','{menuId=1057}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:49:49'),(200,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1058','127.0.0.1','内网IP','{menuId=1058}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:49:52'),(201,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1056','127.0.0.1','内网IP','{menuId=1056}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:49:55'),(202,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1055','127.0.0.1','内网IP','{menuId=1055}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:49:57'),(203,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/115','127.0.0.1','内网IP','{menuId=115}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:50:00'),(204,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/3','127.0.0.1','内网IP','{menuId=3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:50:03'),(205,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"query\":\"\",\"icon\":\"dict\",\"orderNum\":6,\"menuName\":\"字典管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"dict\",\"component\":\"system/dict/index\",\"children\":[],\"createTime\":1647061871000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":105,\"menuType\":\"C\",\"perms\":\"system:dict:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:50:17'),(206,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"query\":\"\",\"icon\":\"edit\",\"orderNum\":7,\"menuName\":\"参数设置\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"config\",\"component\":\"system/config/index\",\"children\":[],\"createTime\":1647061871000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":106,\"menuType\":\"C\",\"perms\":\"system:config:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:50:31'),(207,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"query\":\"\",\"icon\":\"message\",\"orderNum\":8,\"menuName\":\"通知公告\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"notice\",\"component\":\"system/notice/index\",\"children\":[],\"createTime\":1647061871000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":107,\"menuType\":\"C\",\"perms\":\"system:notice:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:50:39'),(208,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"门户用户\",\"orderNum\":\"2\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101,103\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 06:54:37'),(209,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"沐阳旅游\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647061869000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 07:13:26'),(210,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"门户用户\",\"deptId\":200,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647125677000,\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-13 07:13:34'),(211,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'18090404945',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"phonenumber\":\"18090404945\",\"admin\":false,\"nickName\":\"阿宇\",\"sex\":\"0\",\"params\":{},\"userName\":\"18090404945\"}','{\"msg\":\"修改用户\'18090404945\'失败，手机号码已存在\",\"code\":500}',0,NULL,'2022-03-14 05:16:49'),(212,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'18090404945',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"phonenumber\":\"18090404945\",\"admin\":false,\"nickName\":\"阿宇\",\"sex\":\"0\",\"params\":{},\"userName\":\"18090404945\"}','{\"msg\":\"修改用户\'18090404945\'失败，手机号码已存在\",\"code\":500}',0,NULL,'2022-03-14 05:17:12'),(213,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'18090404945',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"phonenumber\":\"18090404945\",\"admin\":false,\"nickName\":\"阿宇\",\"sex\":\"0\",\"params\":{},\"userName\":\"18090404945\",\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-14 05:18:35'),(214,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updatePwd()','PUT',1,'18090404945',NULL,'/system/user/profile/updatePwd','127.0.0.1','内网IP','123456 123321','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-14 05:18:49'),(215,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'18090404945',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"phonenumber\":\"18090404945\",\"admin\":false,\"nickName\":\"阿宇1\",\"sex\":\"0\",\"params\":{},\"userName\":\"18090404945\",\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-20 06:28:32'),(216,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updatePwd()','PUT',1,'18090404945',NULL,'/system/user/profile/updatePwd','127.0.0.1','内网IP','123321 123456','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-20 06:28:53'),(217,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updatePwd()','PUT',1,'18090404945',NULL,'/system/user/profile/updatePwd','127.0.0.1','内网IP','123456 123321','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-03-20 06:30:16'),(218,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":11,\"menuName\":\"导游管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"guide\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-13 11:01:57'),(219,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":1,\"menuName\":\"导游管理\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"guide\",\"component\":\"system/guide/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-13 11:03:09'),(220,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"international\",\"orderNum\":12,\"menuName\":\"旅行社管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"agency\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-13 11:06:54'),(221,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":1,\"menuName\":\"旅行社管理\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"agency\",\"component\":\"system/agency/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-13 11:07:26'),(222,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"international\",\"orderNum\":12,\"menuName\":\"旅行社管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"Agency\",\"children\":[],\"createTime\":1720840014000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-13 11:37:24'),(223,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":1,\"menuName\":\"旅行社管理\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"Agency\",\"component\":\"system/Agency/agency\",\"children\":[],\"createTime\":1720840046000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-13 11:37:51'),(224,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":3,\"menuName\":\"饭点管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"restaurant\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-15 16:42:40'),(225,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":1,\"menuName\":\"饭店管理\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"restaurant\",\"component\":\"system/restaurant/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-15 16:43:14'),(226,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":3,\"menuName\":\"饭店管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"restaurant\",\"children\":[],\"createTime\":1721032960000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-15 16:43:42'),(227,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"中南旅游\",\"leader\":\"Vincent\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647061869000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"vincent@gmail.com\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-15 17:36:19'),(228,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":7,\"menuName\":\"投诉管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"complain\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-15 21:51:56'),(229,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"投诉管理\",\"params\":{},\"parentId\":2022,\"isCache\":\"0\",\"path\":\"complain\",\"component\":\"system/index/complain\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-15 21:52:29'),(230,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"download\",\"orderNum\":7,\"menuName\":\"投诉管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"complain\",\"children\":[],\"createTime\":1721051516000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2022,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-15 21:56:55'),(231,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"投诉管理\",\"params\":{},\"parentId\":2022,\"isCache\":\"0\",\"path\":\"complain\",\"component\":\"system/complain/index\",\"children\":[],\"createTime\":1721051549000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2023,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-15 21:57:27'),(232,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":13,\"menuName\":\"投诉管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"complain\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"新增菜单\'投诉管理\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2024-07-15 23:08:03'),(233,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"logininfor\",\"orderNum\":9,\"menuName\":\"特色美食管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"food\",\"children\":[],\"createTime\":1647118725000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 15:14:10'),(234,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"特色美食管理\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"food\",\"component\":\"system/food/index\",\"children\":[],\"createTime\":1647119030000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 15:14:35'),(235,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2001','127.0.0.1','内网IP','{menuId=2001}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}',0,NULL,'2024-07-16 16:25:52'),(236,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2009','127.0.0.1','内网IP','{menuId=2009}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 16:25:58'),(237,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2008','127.0.0.1','内网IP','{menuId=2008}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 16:26:03'),(238,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2000','127.0.0.1','内网IP','{menuId=2000}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 16:26:07'),(239,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2001','127.0.0.1','内网IP','{menuId=2001}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 16:26:11'),(240,'旅游套餐',3,'com.ruoyi.controller.PackagesController.remove()','DELETE',1,'admin',NULL,'/system/packages/2,3','127.0.0.1','内网IP','{ids=2,3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 17:39:15'),(241,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"email\",\"orderNum\":7,\"menuName\":\"投诉管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"complain\",\"children\":[],\"createTime\":1721051516000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2022,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 19:38:31'),(242,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":1,\"menuName\":\"投诉管理\",\"params\":{},\"parentId\":2022,\"isCache\":\"0\",\"path\":\"complain\",\"component\":\"system/complain/index\",\"children\":[],\"createTime\":1721051549000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2023,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 19:38:48'),(243,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"download\",\"orderNum\":14,\"menuName\":\"123123\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"abc\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 22:37:33'),(244,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"404\",\"orderNum\":1,\"menuName\":\"123\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"abc\",\"component\":\"system/abc/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 22:38:18'),(245,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2024','127.0.0.1','内网IP','{menuId=2024}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}',0,NULL,'2024-07-16 22:38:42'),(246,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2025','127.0.0.1','内网IP','{menuId=2025}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 22:38:54'),(247,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2024','127.0.0.1','内网IP','{menuId=2024}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-16 22:38:57'),(248,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"1\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":1,\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1647061871000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-17 16:42:45');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'admin','超级管理员',1,'0','admin','2022-03-12 13:11:10','admin','2022-03-12 15:31:55',''),(5,'user','门户用户',2,'0','admin','2022-03-12 15:32:36','',NULL,NULL);
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2022-03-12 13:11:10','',NULL,'超级管理员'),(2,'门户用户','common',2,'2',1,1,'0','0','admin','2022-03-12 13:11:10','admin','2022-03-12 15:33:05','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,101,'admin','超级管理员','00','111@163.com','15888888888','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-07-17 19:45:32','admin','2022-03-12 13:11:10','','2024-07-17 19:45:31','管理员'),(100,200,'18090404945','阿宇1','00','','18090404945','0','','$2a$10$GQphSj5ldLeuiab6QwfqB.fqF09Cm2oYikQf9i9C1jjYwua6cPmfa','0','0','127.0.0.1','2022-03-27 15:47:03','','2022-03-13 07:22:07','','2022-03-27 07:47:03','会员'),(101,200,'15888881111','15888881111','00','','15888881111','0','','$2a$10$0WNoRkAfbmaYR6z8YGp5ye2VPDgpsOOWcSunt38pn.o3mOMfQRp0i','0','0','127.0.0.1','2022-03-15 09:47:40','','2022-03-15 01:47:28','','2022-03-15 01:49:47','会员'),(102,200,'18873184082','18873184082','00','','18873184082','0','','$2a$10$wcix8vWK0CGHHexC20kdd.wSGhu0ErdSMUxE55.oACJcXHd/11GwO','0','0','127.0.0.1','2024-07-16 20:01:20','','2024-07-10 15:47:46','','2024-07-16 20:01:20',NULL),(103,200,'13711111111','13711111111','00','','13711111111','0','','$2a$10$BHyYG2yUER9A/DFELwzb9u0/Nrhke6SznUocvjypTGDiIQV9lwS8a','0','0','127.0.0.1','2024-07-16 16:45:38','','2024-07-13 10:59:14','','2024-07-16 16:45:38','会员'),(104,200,'15588899911','15588899911','00','','15588899911','0','','$2a$10$nX0p8X9SUGDitRFzptrU/uMHfS4/jMxN75TBLGHk6A7ay6FcdE5Wi','0','0','127.0.0.1','2024-07-16 21:58:11','','2024-07-13 11:13:01','','2024-07-16 21:58:11',NULL),(105,200,'15607352515','15607352515','00','','15607352515','0','','$2a$10$2n.oIgPDhLMpXKOjcvXhmehOI2HcdtDP/CJU/suEHN1J2K3yVx4KK','0','0','127.0.0.1','2024-07-16 19:32:14','','2024-07-15 16:29:50','','2024-07-16 19:32:11','会员'),(106,200,'13777777777','13777777777','00','','13777777777','0','','$2a$10$a.u980fRYRIPESQDAvYquOePJbDCn3wuaBdhBQsh7xf8SbyAN47RG','0','0','127.0.0.1','2024-07-17 19:39:46','','2024-07-16 16:47:33','','2024-07-17 19:39:46',NULL),(107,200,'15225430103','15225430103','00','','15225430103','0','','$2a$10$IpopK3tq6frNzqfUK6vBj./INGnL4ufYBxeqOYYU2pWAdviwcEA2S','0','0','127.0.0.1','2024-07-17 16:21:53','','2024-07-16 18:58:13','','2024-07-17 16:21:51',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

--
-- Table structure for table `travels`
--

DROP TABLE IF EXISTS `travels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travels` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '游记名',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '照片',
  `good_num` int DEFAULT NULL COMMENT '点赞数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int DEFAULT NULL COMMENT '修改人',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='游记';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travels`
--

/*!40000 ALTER TABLE `travels` DISABLE KEYS */;
INSERT INTO `travels` VALUES (4,'富士山的独特之旅','在日本，富士山不仅仅是一座山。它是日本文化和自然美景的象征，一直以来都是艺术（和信仰的源泉。作为世界文化遗产，富士山的价值在于其神圣而庄严的景观，尤其是海拔1500米以上的地域，这里不仅是艺术作品中的常客，也是富士山信仰的圣地。但是，富士山的魅力远不止于此。在它的周边，隐藏着一些令人心动的宝藏，等待着我们去探索。\n想象一下，在晴朗的清晨，拍摄到富士山与夕阳落下重合时的“钻石富士\"美景，这一刻无疑是摄影爱好者梦寐以求的场景。而山中湖，这个设有自行车道的地方，让你可以一边骑车，一边眺望富士山，感受湖畔雄伟的自然风光。\n除了富士山本身的美丽，其附近的望月庵處提供了一次独特的坐禅体验，让游客通过静坐、品尝素餐，来净化身心，重新发现自我。这是一次身心灵的旅行，让人暂时忘却尘世的烦恼。','http://localhost:8080/profile/upload/2024/07/13/富士山_20240711143925A006_20240713225844A007.jpg',4,'2024-07-13 23:02:59',103,'2024-07-16 22:34:16',NULL,0),(5,'成都武侯祠：与铁马金戈的厚重历史不同','“丞相祠堂何处寻，锦官城外柏森森。“\n成都武侯祠是全国唯一一座君臣合祀祠庙，且以臣主，君为辅，是全世界影响最大的三国遗迹博物馆。\n与铁马金戈、波澜壮阔的厚重历史长卷不同，武侯祠给人自然清新的轻盈之感。\n走进武祠，更像是走进了一座古典园林，庭院深深、假山溪流、茂林修竹、参天古树以及树影摇曳间跳跃的光芒，令人心旷神怡。\n徜徉在一个又一个建筑里，走在竹影红墙间，铺呈开的又是一幅金戈铁马、刀光剑影、叱咤风云、英雄辈出的三国史诗。','http://localhost:8080/profile/upload/2024/07/16/IMG_0253E77D00FE-1_20240716171239A006.jpeg',1,'2024-07-16 17:12:41',106,'2024-07-16 20:00:56',NULL,0);
/*!40000 ALTER TABLE `travels` ENABLE KEYS */;

--
-- Table structure for table `viper`
--

DROP TABLE IF EXISTS `viper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viper` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int DEFAULT NULL COMMENT '用户id',
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `integral` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '积分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int DEFAULT NULL COMMENT '修改人',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viper`
--

/*!40000 ALTER TABLE `viper` DISABLE KEYS */;
INSERT INTO `viper` VALUES (2,100,'阿宇','0','2022-03-14 15:17:05',100,'2022-03-14 15:59:14',NULL,0),(3,101,'15888881111','33','2022-03-15 09:49:48',101,'2022-03-15 09:50:03',NULL,0),(4,105,'15607352515','160','2024-07-16 16:12:22',105,'2024-07-16 19:47:26',NULL,0);
/*!40000 ALTER TABLE `viper` ENABLE KEYS */;

--
-- Dumping routines for database 'tourist'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-18 13:49:38
