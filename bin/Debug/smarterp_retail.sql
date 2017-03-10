-- MySQL dump 10.13  Distrib 5.5.22, for Win32 (x86)
--
-- Host: localhost    Database: smarterp_tokoemas
-- ------------------------------------------------------
-- Server version	5.5.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_general_setup`
--

DROP TABLE IF EXISTS `account_general_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_general_setup` (
  `account_length` double DEFAULT NULL,
  `use_separator` int(11) DEFAULT NULL,
  `separator_text` varchar(1) DEFAULT NULL,
  `front_code` varchar(30) DEFAULT NULL,
  `back_code` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_general_setup`
--

LOCK TABLES `account_general_setup` WRITE;
/*!40000 ALTER TABLE `account_general_setup` DISABLE KEYS */;
INSERT INTO `account_general_setup` VALUES (6,1,'-',NULL,NULL);
/*!40000 ALTER TABLE `account_general_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_status`
--

DROP TABLE IF EXISTS `ap_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status` (
  `no_purchase` varchar(30) NOT NULL,
  `date_trn` datetime DEFAULT NULL,
  `id_supplier` varchar(30) DEFAULT NULL,
  `purchase_amount` double DEFAULT NULL,
  `return_amount` double DEFAULT NULL,
  `disc_amount` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  KEY `ar_status_no_sales_fkey` (`no_purchase`),
  KEY `ar_status_cust_id_fkey` (`id_supplier`),
  CONSTRAINT `ap_status_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `mst_supplier` (`id_supplier`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_status`
--

LOCK TABLES `ap_status` WRITE;
/*!40000 ALTER TABLE `ap_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_status`
--

DROP TABLE IF EXISTS `ar_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_status` (
  `no_sales` varchar(30) NOT NULL,
  `date_trn` datetime DEFAULT NULL,
  `id_customer` varchar(30) DEFAULT NULL,
  `sales_amount` double DEFAULT NULL,
  `return_amount` double DEFAULT NULL,
  `disc_amount` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  KEY `ar_status_no_sales_fkey` (`no_sales`),
  KEY `ar_status_cust_id_fkey` (`id_customer`),
  CONSTRAINT `ar_status_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `mst_customer` (`id_customer`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_status`
--

LOCK TABLES `ar_status` WRITE;
/*!40000 ALTER TABLE `ar_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `coa_detail_view`
--

DROP TABLE IF EXISTS `coa_detail_view`;
/*!50001 DROP VIEW IF EXISTS `coa_detail_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `coa_detail_view` (
  `id_account` varchar(25),
  `account_name` varchar(60),
  `parent` varchar(25),
  `flag_active` int(11),
  `flag_header` int(11),
  `is_income` int(11),
  `is_balance_sheet` int(11),
  `notes` text,
  `def_position` char(1),
  `modified_user` varchar(120),
  `created_date` datetime,
  `modified_date` datetime,
  `created_user` varchar(120),
  `beg_balance` double,
  `golongan` int(1),
  `header` varchar(60),
  `company_name` varchar(200),
  `header_text` varchar(250)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `coa_header_view`
--

DROP TABLE IF EXISTS `coa_header_view`;
/*!50001 DROP VIEW IF EXISTS `coa_header_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `coa_header_view` (
  `id_account` varchar(25),
  `account_name` varchar(60)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `combo_billofmaterial`
--

DROP TABLE IF EXISTS `combo_billofmaterial`;
/*!50001 DROP VIEW IF EXISTS `combo_billofmaterial`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combo_billofmaterial` (
  `date_trn` datetime,
  `no_bom` varchar(60),
  `item_desc` varchar(123),
  `qty_item_production` double,
  `id_unit` varchar(30),
  `total_cost` double,
  `finished` int(1)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `combo_conversion_cost`
--

DROP TABLE IF EXISTS `combo_conversion_cost`;
/*!50001 DROP VIEW IF EXISTS `combo_conversion_cost`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combo_conversion_cost` (
  `id_cost` varchar(30),
  `cost_name` varchar(120),
  `cost_def` double
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `combo_departemen_produksi`
--

DROP TABLE IF EXISTS `combo_departemen_produksi`;
/*!50001 DROP VIEW IF EXISTS `combo_departemen_produksi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combo_departemen_produksi` (
  `department_id` int(11),
  `department_name` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `combo_employee`
--

DROP TABLE IF EXISTS `combo_employee`;
/*!50001 DROP VIEW IF EXISTS `combo_employee`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combo_employee` (
  `id_employee` varchar(25),
  `nama` varchar(401),
  `position_name` varchar(100),
  `department_name` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `combo_rem_material_usage_wo`
--

DROP TABLE IF EXISTS `combo_rem_material_usage_wo`;
/*!50001 DROP VIEW IF EXISTS `combo_rem_material_usage_wo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combo_rem_material_usage_wo` (
  `no_wo` varchar(60),
  `no_bom` varchar(60),
  `id_item` varchar(120),
  `item_name` varchar(60),
  `remaining_qty` double,
  `id_unit` varchar(255),
  `cost` double,
  `total_cost` double,
  `jenis` varchar(20)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `combo_supplier_po`
--

DROP TABLE IF EXISTS `combo_supplier_po`;
/*!50001 DROP VIEW IF EXISTS `combo_supplier_po`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combo_supplier_po` (
  `id_supplier` varchar(25),
  `name` varchar(401),
  `address` varchar(400)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `combo_view_opname`
--

DROP TABLE IF EXISTS `combo_view_opname`;
/*!50001 DROP VIEW IF EXISTS `combo_view_opname`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combo_view_opname` (
  `date_trn` datetime,
  `no_opname` varchar(30),
  `id_warehouse` varchar(25)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `combo_wo_view`
--

DROP TABLE IF EXISTS `combo_wo_view`;
/*!50001 DROP VIEW IF EXISTS `combo_wo_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combo_wo_view` (
  `wo_no` varchar(60),
  `department_name` varchar(100),
  `department_id` int(11),
  `tgl_mulai` date,
  `pic` varchar(401),
  `expected_date` date
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `commission_report_view`
--

DROP TABLE IF EXISTS `commission_report_view`;
/*!50001 DROP VIEW IF EXISTS `commission_report_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `commission_report_view` (
  `date_trn` datetime,
  `no_service` varchar(30),
  `nama` varchar(401),
  `service_name` varchar(60),
  `qty` int(11),
  `price` double(19,4),
  `nominal` double(19,4),
  `notes` varchar(255),
  `rate_commission` double,
  `commission` double
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `control_no_master`
--

DROP TABLE IF EXISTS `control_no_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_no_master` (
  `form` varchar(25) NOT NULL DEFAULT '',
  `prefix` varchar(10) DEFAULT NULL,
  `nourut` varchar(10) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_no_master`
--

LOCK TABLES `control_no_master` WRITE;
/*!40000 ALTER TABLE `control_no_master` DISABLE KEYS */;
INSERT INTO `control_no_master` VALUES ('ASSEMBLY PRODUCT','ASSEMBLY.','000002','NOURUT PERAKITAN BARANG'),('FORMULA PRODUCT','BOM.','000001','NOURUT FORMULA BIAYA'),('MASTER BIAYA','COST.','000000','NOURUT MASTER BIAYA'),('MASTER CARA BAYAR SIMRS',' ','00','NOURUT MASTER CARA BAYAR SIMRS'),('MASTER CUSTOMER','C.','000004','NOURUT MASTER CUSTOMER'),('MASTER MARKETING','E.','000001','NOURUT MASTER MARKETING'),('MASTER SUPPLIER','S.','000001','NOURUT MASTER SUPPLIER');
/*!40000 ALTER TABLE `control_no_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_no_trans`
--

DROP TABLE IF EXISTS `control_no_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_no_trans` (
  `form` varchar(25) NOT NULL DEFAULT '',
  `prefix` varchar(10) DEFAULT NULL,
  `nourut` varchar(10) DEFAULT NULL,
  `bulan` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_no_trans`
--

LOCK TABLES `control_no_trans` WRITE;
/*!40000 ALTER TABLE `control_no_trans` DISABLE KEYS */;
INSERT INTO `control_no_trans` VALUES ('MASTER_ITEM_JENIS','','003',8,2016,'MASTER ITEM JENIS'),('MASTER_ITEM_KATEGORI','','005',8,2016,'MASTER ITEM KATEGORI'),('MASTER_ITEM','','000004',8,2016,'MASTER ITEM'),('MASTER_SERVICE','M/SVC-','000001',8,2016,'MASTER SERVICE'),('PO','PO','00001',8,2016,'PURCHASE ORDER FORM NUMBER'),('PELUNASAN_PO','LPO','00001',8,2016,'PELUNASAN PO FORM NUMBER'),('PURCHASE_DIRECT','PUD','00000',8,2016,'PURCHASE DIRECT FORM NUMBER'),('PURCHASE_RETURN','PRU','00001',8,2016,'PURCHASE_RETURN FORM NUMBER'),('SALES_ORDER','SO','00002',8,2016,'SALES ORDER FORM NUMBER'),('SALES_RETURN','SRU','00001',8,2016,'SALES_RETURN FORM NUMBER'),('CASHIER','CSH','00004',8,2016,'CASHIER FORM NUMBER'),('CASHIER_RETURN','CSU','00001',8,2016,'CASHIER RETURN FORM NUMBER'),('PELUNASAN_SO','LSO','00003',8,2016,'PELUNASAN SO FORM NUMBER'),('ADJUSTSTOCK','ADS','00002',8,2016,'ADJUST STOCK FORM NUMBER'),('PINJAMAN','PNJ','00001',8,2016,'PINJAMAN FORM NUMBER'),('PINJAMAN','PNJ','00000',9,2016,'PINJAMAN FORM NUMBER'),('PINJAMAN','PNJ','00000',10,2016,'PINJAMAN FORM NUMBER'),('BAYAR_PINJAMAN','BNJ','00000',9,2016,'PINJAMAN FORM NUMBER'),('PINJAMAN','PNJ','00000',11,2016,'PINJAMAN FORM NUMBER'),('PINJAMAN','PNJ','00000',12,2016,'PINJAMAN FORM NUMBER'),('MASTER_ITEM','','000000',12,2016,'MASTER ITEM'),('MASTER_ITEM','','000000',10,2016,'MASTER ITEM'),('PINJAMAN','PNJ','00000',1,2017,'PINJAMAN FORM NUMBER'),('BAYAR_PINJAMAN','BNJ','00000',8,2016,'PINJAMAN FORM NUMBER'),('BAYAR_PINJAMAN','BNJ','00002',10,2016,'PINJAMAN FORM NUMBER'),('BAYAR_PINJAMAN','BNJ','00004',12,2016,'PINJAMAN FORM NUMBER'),('OPNAME','OPN','00001',8,2016,'STOCK OPNAME FORM NUMBER');
/*!40000 ALTER TABLE `control_no_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `goods_view`
--

DROP TABLE IF EXISTS `goods_view`;
/*!50001 DROP VIEW IF EXISTS `goods_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `goods_view` (
  `id_item` varchar(25),
  `item_name` varchar(60),
  `id_barcode` varchar(30),
  `mst_itemcat_nm` varchar(120)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `hitung_rekap_jual_category`
--

DROP TABLE IF EXISTS `hitung_rekap_jual_category`;
/*!50001 DROP VIEW IF EXISTS `hitung_rekap_jual_category`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `hitung_rekap_jual_category` (
  `id_category` varchar(25),
  `total` double
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `hitung_rekap_jual_view`
--

DROP TABLE IF EXISTS `hitung_rekap_jual_view`;
/*!50001 DROP VIEW IF EXISTS `hitung_rekap_jual_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `hitung_rekap_jual_view` (
  `tanggal` bigint(20),
  `total` double
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `i_accounting_period`
--

DROP TABLE IF EXISTS `i_accounting_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_accounting_period` (
  `periode` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `last_closed_date` datetime DEFAULT NULL,
  `lock_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`periode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_accounting_period`
--

LOCK TABLES `i_accounting_period` WRITE;
/*!40000 ALTER TABLE `i_accounting_period` DISABLE KEYS */;
INSERT INTO `i_accounting_period` VALUES (11,2015,'2015-03-20 00:00:00',0);
/*!40000 ALTER TABLE `i_accounting_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_activation`
--

DROP TABLE IF EXISTS `i_activation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_activation` (
  `ip_address` varchar(120) NOT NULL,
  `serial1` varchar(250) DEFAULT NULL,
  `serial2` varchar(250) DEFAULT NULL,
  `serial3` varchar(250) DEFAULT NULL,
  `serial4` varchar(250) DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_activation`
--

LOCK TABLES `i_activation` WRITE;
/*!40000 ALTER TABLE `i_activation` DISABLE KEYS */;
INSERT INTO `i_activation` VALUES ('EC55F9C25A62','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-06-21 11:05:34');
/*!40000 ALTER TABLE `i_activation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_activation_copy`
--

DROP TABLE IF EXISTS `i_activation_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_activation_copy` (
  `ip_address` varchar(120) NOT NULL,
  `serial1` varchar(250) DEFAULT NULL,
  `serial2` varchar(250) DEFAULT NULL,
  `serial3` varchar(250) DEFAULT NULL,
  `serial4` varchar(250) DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_activation_copy`
--

LOCK TABLES `i_activation_copy` WRITE;
/*!40000 ALTER TABLE `i_activation_copy` DISABLE KEYS */;
INSERT INTO `i_activation_copy` VALUES ('001E101F0815','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-03-12 13:16:41'),('001E101F0856','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-02-01 01:09:16'),('001E101F2452','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-01-31 10:36:48'),('001E101F3269','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-02-01 21:11:25'),('001E101F4455','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-02-06 14:13:53'),('001E101F80B6','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-02-21 10:41:23'),('001E101F9DEE','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-01-31 08:30:39'),('001E101FC1E9','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-01-31 16:32:29'),('001E101FC819','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-01-17 10:15:18'),('001E101FCB91','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-02-01 21:34:34'),('001E101FED7A','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-02-16 21:47:30'),('EC55F9C25A62','b73a2ad61a6b2ec8c72e43f0d0e8f1ff','c923c84117fef6123ab37ff551372beb','fd33a50cdce4dd0a974091c48422e3a3','99770a2fa92bec4940c26f7ccadf677b','2016-02-01 12:58:23');
/*!40000 ALTER TABLE `i_activation_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_aset_depreciation`
--

DROP TABLE IF EXISTS `i_aset_depreciation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_aset_depreciation` (
  `id_accasetdep` varchar(30) NOT NULL DEFAULT '',
  `id_aset` varchar(30) DEFAULT NULL,
  `nominal` double DEFAULT NULL,
  `date_trn` date DEFAULT NULL,
  `notes` varchar(160) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `years` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_user` varchar(120) DEFAULT NULL,
  `modified_user` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_aset_depreciation`
--

LOCK TABLES `i_aset_depreciation` WRITE;
/*!40000 ALTER TABLE `i_aset_depreciation` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_aset_depreciation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_bank_simrs`
--

DROP TABLE IF EXISTS `i_bank_simrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_bank_simrs` (
  `id_bank` varchar(30) NOT NULL,
  `nm_bank` varchar(120) DEFAULT NULL,
  `id_account` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_bank_simrs`
--

LOCK TABLES `i_bank_simrs` WRITE;
/*!40000 ALTER TABLE `i_bank_simrs` DISABLE KEYS */;
INSERT INTO `i_bank_simrs` VALUES ('009','Bank Mandiri','1110501');
/*!40000 ALTER TABLE `i_bank_simrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_carabayar_simrs`
--

DROP TABLE IF EXISTS `i_carabayar_simrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_carabayar_simrs` (
  `id_carabayar` varchar(30) NOT NULL,
  `nm_carabayar` varchar(120) DEFAULT NULL,
  `id_account` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_carabayar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_carabayar_simrs`
--

LOCK TABLES `i_carabayar_simrs` WRITE;
/*!40000 ALTER TABLE `i_carabayar_simrs` DISABLE KEYS */;
INSERT INTO `i_carabayar_simrs` VALUES ('01','Tunai','1110101'),('02','Kartu Kredit','1110501'),('03','Tranfer Bank','1110501'),('04','Jaminan/Anggunan','1130801'),('05','BPJS',''),('06','Asuransi','');
/*!40000 ALTER TABLE `i_carabayar_simrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_cashbank_setup`
--

DROP TABLE IF EXISTS `i_cashbank_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_cashbank_setup` (
  `id_account` varchar(255) DEFAULT NULL,
  `id_cashbank` varchar(255) NOT NULL,
  `modified_by` varchar(120) NOT NULL,
  `modified_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_cashbank_setup`
--

LOCK TABLES `i_cashbank_setup` WRITE;
/*!40000 ALTER TABLE `i_cashbank_setup` DISABLE KEYS */;
INSERT INTO `i_cashbank_setup` VALUES ('1-1101','1','admin','2016-01-13'),('1-1102','1','admin','2016-01-13'),('1-1199','1','admin','2016-01-13'),('1-1103','2','admin','2016-01-13'),('1-1104','2','admin','2016-01-13'),('1-1105','2','admin','2016-01-13');
/*!40000 ALTER TABLE `i_cashbank_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_cogs`
--

DROP TABLE IF EXISTS `i_cogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_cogs` (
  `no_urut` int(11) NOT NULL AUTO_INCREMENT,
  `no_bukti` varchar(120) NOT NULL,
  `id_item` varchar(120) DEFAULT NULL,
  `date_trn` datetime DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `akum_qty` int(11) DEFAULT NULL,
  `cogs` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`no_urut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_cogs`
--

LOCK TABLES `i_cogs` WRITE;
/*!40000 ALTER TABLE `i_cogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_cogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_cogs_acc_setting`
--

DROP TABLE IF EXISTS `i_cogs_acc_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_cogs_acc_setting` (
  `id_account_inv` varchar(120) DEFAULT NULL,
  `id_account_cogs` varchar(120) DEFAULT NULL,
  `id_account_cogs_manufacture` varchar(120) DEFAULT NULL,
  KEY `id_account_inv` (`id_account_inv`),
  KEY `id_account_cogs` (`id_account_cogs`),
  KEY `id_account_cogs_manufacture` (`id_account_cogs_manufacture`),
  CONSTRAINT `i_cogs_acc_setting_ibfk_1` FOREIGN KEY (`id_account_inv`) REFERENCES `mst_account` (`id_account`) ON UPDATE CASCADE,
  CONSTRAINT `i_cogs_acc_setting_ibfk_2` FOREIGN KEY (`id_account_cogs`) REFERENCES `mst_account` (`id_account`) ON UPDATE CASCADE,
  CONSTRAINT `i_cogs_acc_setting_ibfk_3` FOREIGN KEY (`id_account_cogs_manufacture`) REFERENCES `mst_account` (`id_account`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_cogs_acc_setting`
--

LOCK TABLES `i_cogs_acc_setting` WRITE;
/*!40000 ALTER TABLE `i_cogs_acc_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_cogs_acc_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_component_account_purchsimrs`
--

DROP TABLE IF EXISTS `i_component_account_purchsimrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_component_account_purchsimrs` (
  `id_component` int(11) NOT NULL AUTO_INCREMENT,
  `id_account` varchar(30) DEFAULT NULL,
  `notes` text,
  `table_name` varchar(250) DEFAULT NULL,
  `field_name` varchar(250) DEFAULT NULL,
  `position_dk` varchar(60) DEFAULT NULL,
  `is_dependent_itemacc` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_component`),
  KEY `fk_account` (`id_account`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_component_account_purchsimrs`
--

LOCK TABLES `i_component_account_purchsimrs` WRITE;
/*!40000 ALTER TABLE `i_component_account_purchsimrs` DISABLE KEYS */;
INSERT INTO `i_component_account_purchsimrs` VALUES (85,'1170106','PERSEDIAAN OBAT DAN ALKES','TPENERIMAANBARANG','SUBTOTALFAKTUR','Debet',1),(86,'2130301','PPN PEMBELIAN','TPENERIMAANBARANG','TOTALPPN','Debet',0),(87,'2163506','POTONGAN PEMBELIAN','TPENERIMAANBARANG','TOTALDISCOUNT','Kredit',0),(88,'2163507','HUTANG USAHA','TPENERIMAANBARANG','TOTALTAGIHAN','Kredit',0);
/*!40000 ALTER TABLE `i_component_account_purchsimrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_component_account_returpurchsimrs`
--

DROP TABLE IF EXISTS `i_component_account_returpurchsimrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_component_account_returpurchsimrs` (
  `id_component` int(11) NOT NULL AUTO_INCREMENT,
  `id_account` varchar(30) DEFAULT NULL,
  `notes` text,
  `table_name` varchar(250) DEFAULT NULL,
  `field_name` varchar(250) DEFAULT NULL,
  `position_dk` varchar(60) DEFAULT NULL,
  `is_dependent_itemacc` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_component`),
  KEY `fk_account` (`id_account`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_component_account_returpurchsimrs`
--

LOCK TABLES `i_component_account_returpurchsimrs` WRITE;
/*!40000 ALTER TABLE `i_component_account_returpurchsimrs` DISABLE KEYS */;
INSERT INTO `i_component_account_returpurchsimrs` VALUES (85,'1170106','PERSEDIAAN OBAT DAN ALKES x','TPENERIMAANBARANG','SUBTOTALFAKTUR','Kredit',1),(86,'2130301','PPN PEMBELIAN x','TPENERIMAANBARANG','TOTALPPN','Kredit',0),(87,'2163506','POTONGAN PEMBELIAN x','TPENERIMAANBARANG','TOTALDISCOUNT','Debet',0),(88,'2163506','HUTANG USAHA x','TPENERIMAANBARANG','TOTALTAGIHAN','Debet',0);
/*!40000 ALTER TABLE `i_component_account_returpurchsimrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_event_attendance`
--

DROP TABLE IF EXISTS `i_event_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_event_attendance` (
  `id_event` varchar(30) DEFAULT NULL,
  `id_attendance` varchar(30) NOT NULL,
  `attendance_date` datetime DEFAULT NULL,
  `id_member` varchar(30) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_user` varchar(120) DEFAULT NULL,
  `modified_user` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_attendance`),
  KEY `id_event` (`id_event`),
  KEY `id_member` (`id_member`),
  CONSTRAINT `i_event_attendance_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `mst_event` (`id_event`) ON UPDATE CASCADE,
  CONSTRAINT `i_event_attendance_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `mst_event_member` (`id_member`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_event_attendance`
--

LOCK TABLES `i_event_attendance` WRITE;
/*!40000 ALTER TABLE `i_event_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_event_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_fp_branch`
--

DROP TABLE IF EXISTS `i_fp_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_fp_branch` (
  `code` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_fp_branch`
--

LOCK TABLES `i_fp_branch` WRITE;
/*!40000 ALTER TABLE `i_fp_branch` DISABLE KEYS */;
INSERT INTO `i_fp_branch` VALUES ('000');
/*!40000 ALTER TABLE `i_fp_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_fp_statuscode`
--

DROP TABLE IF EXISTS `i_fp_statuscode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_fp_statuscode` (
  `kode` varchar(30) NOT NULL,
  `notes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_fp_statuscode`
--

LOCK TABLES `i_fp_statuscode` WRITE;
/*!40000 ALTER TABLE `i_fp_statuscode` DISABLE KEYS */;
INSERT INTO `i_fp_statuscode` VALUES ('0','Normal'),('1','Pengganti');
/*!40000 ALTER TABLE `i_fp_statuscode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_fp_transcode`
--

DROP TABLE IF EXISTS `i_fp_transcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_fp_transcode` (
  `kode` varchar(30) NOT NULL,
  `notes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_fp_transcode`
--

LOCK TABLES `i_fp_transcode` WRITE;
/*!40000 ALTER TABLE `i_fp_transcode` DISABLE KEYS */;
INSERT INTO `i_fp_transcode` VALUES ('01','kepada Selain Pemungut PPN'),('02','kepada Pemungut Bendaharawan'),('03','kepada Pemungut PPN Lainnya'),('04','yang menggunakan DPP Nilai Lain kpd Selain Pemungut PPN'),('05','yang PPN-nya di Deemed kpd Selain Pemungut PPN'),('06','penyerahan Lainnya kpd Selain Pemungut PPN'),('07','yang PPN-nya TDP kpd Selain Pemungut PPN'),('08','yang dibebaskan dari Pengenaan PPN kpd Selain Pemungut PPN'),('09','penyerahan Aktiva pasal 16 D kpd Selain Pemungut PPN');
/*!40000 ALTER TABLE `i_fp_transcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_golongan_account_bumn`
--

DROP TABLE IF EXISTS `i_golongan_account_bumn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_golongan_account_bumn` (
  `golongan` int(2) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`golongan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_golongan_account_bumn`
--

LOCK TABLES `i_golongan_account_bumn` WRITE;
/*!40000 ALTER TABLE `i_golongan_account_bumn` DISABLE KEYS */;
INSERT INTO `i_golongan_account_bumn` VALUES (1,'ASET'),(2,'KEWAJIBAN'),(3,'EKUITAS'),(4,'PENDAPATAN LRA'),(5,'BIAYA LRA'),(6,'PENDAPATAN LO'),(7,'BIAYA LO');
/*!40000 ALTER TABLE `i_golongan_account_bumn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_golongan_account_umum`
--

DROP TABLE IF EXISTS `i_golongan_account_umum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_golongan_account_umum` (
  `golongan` int(2) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`golongan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_golongan_account_umum`
--

LOCK TABLES `i_golongan_account_umum` WRITE;
/*!40000 ALTER TABLE `i_golongan_account_umum` DISABLE KEYS */;
INSERT INTO `i_golongan_account_umum` VALUES (1,'ASET'),(2,'KEWAJIBAN'),(3,'EKUITAS'),(4,'PENDAPATAN'),(5,'HPP'),(6,'BIAYA');
/*!40000 ALTER TABLE `i_golongan_account_umum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_hakakses`
--

DROP TABLE IF EXISTS `i_hakakses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_hakakses` (
  `parentkey` varchar(120) NOT NULL,
  `childkey` varchar(120) NOT NULL,
  `username` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_hakakses`
--

LOCK TABLES `i_hakakses` WRITE;
/*!40000 ALTER TABLE `i_hakakses` DISABLE KEYS */;
INSERT INTO `i_hakakses` VALUES ('ROOT','MN_CARDFILE','admin'),('MN_CARDFILE','MN_CUSTOMER','admin'),('MN_CUSTOMER','MN_CUSTOMER_EDIT','admin'),('MN_CUSTOMER','MN_CUSTOMER_ADD','admin'),('MN_CUSTOMER','MN_CUSTOMER_DELETE','admin'),('MN_CARDFILE','MN_SUPPLIER','admin'),('MN_SUPPLIER','MN_SUPPLIER_EDIT','admin'),('MN_SUPPLIER','MN_SUPPLIER_ADD','admin'),('MN_SUPPLIER','MN_SUPPLIER_DELETE','admin'),('MN_CARDFILE','MN_EMPLOYEE','admin'),('MN_EMPLOYEE','MN_EMPLOYEE_EDIT','admin'),('MN_EMPLOYEE','MN_EMPLOYEE_ADD','admin'),('MN_EMPLOYEE','MN_EMPLOYEE_DELETE','admin'),('MN_CARDFILE','MN_ITEM_TYPE','admin'),('MN_ITEM_TYPE','MN_ITEM_TYPE_EDIT','admin'),('MN_ITEM_TYPE','MN_ITEM_TYPE_ADD','admin'),('MN_ITEM_TYPE','MN_ITEM_TYPE_DELETE','admin'),('MN_CARDFILE','MN_ITEM_CAT','admin'),('MN_ITEM_CAT','MN_ITEM_CAT_EDIT','admin'),('MN_ITEM_CAT','MN_ITEM_CAT_ADD','admin'),('MN_ITEM_CAT','MN_ITEM_CAT_DELETE','admin'),('MN_CARDFILE','MN_ITEM_NAME','admin'),('MN_ITEM_NAME','MN_ITEM_NAME_EDIT','admin'),('MN_ITEM_NAME','MN_ITEM_NAME_ADD','admin'),('MN_ITEM_NAME','MN_ITEM_NAME_DELETE','admin'),('MN_CARDFILE','MN_BEGINING_BALANCE','admin'),('MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_EDIT','admin'),('MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_ADD','admin'),('MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_DELETE','admin'),('MN_CARDFILE','MN_JENIS_JASA','admin'),('MN_JENIS_JASA','MN_JENIS_JASA_EDIT','admin'),('MN_JENIS_JASA','MN_JENIS_JASA_ADD','admin'),('MN_JENIS_JASA','MN_JENIS_JASA_DELETE','admin'),('MN_CARDFILE','MN_CARD_FILE_REPORT','admin'),('MN_CARD_FILE_REPORT','MN_CUST_REPORT_DAFTARPELANGGAN','admin'),('MN_CARD_FILE_REPORT','MN_CUST_REPORT_DAFTARPELANGGAN_CITY','admin'),('MN_CARD_FILE_REPORT','MN_CUST_REPORT_RANKING_PENJUALAN','admin'),('MN_CARD_FILE_REPORT','MN_SUPP_REPORT_DAFTARSUPPLIER','admin'),('MN_CARD_FILE_REPORT','MN_SUPP_REPORT_RANKING_PEMBELIAN','admin'),('MN_CARD_FILE_REPORT','MN_EMPP_REPORT_DAFTARKARYAWAN','admin'),('ROOT','MN_STOCK','admin'),('MN_STOCK','MN_STOCK_OPNAME','admin'),('MN_STOCK_OPNAME','MN_STOCK_OPNAME_EDIT','admin'),('MN_STOCK_OPNAME','MN_STOCK_OPNAME_ADD','admin'),('MN_STOCK_OPNAME','MN_STOCK_OPNAME_DELETE','admin'),('MN_STOCK','MN_STOCK_CORRECTION','admin'),('MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_EDIT','admin'),('MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_ADD','admin'),('MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_DELETE','admin'),('MN_STOCK','MN_STOCK_REPORT','admin'),('MN_STOCK_REPORT','MN_STOCK_ADJUSTMENT_REPORT','admin'),('MN_STOCK_REPORT','MN_STOCK_MUTATION_REPORT','admin'),('MN_STOCK_REPORT','MN_STOCK_CARD_COGS','admin'),('ROOT','MN_PURCHASE','admin'),('MN_PURCHASE','MN_PO','admin'),('MN_PO','MN_PO_EDIT','admin'),('MN_PO','MN_PO_ADD','admin'),('MN_PO','MN_PO_DELETE','admin'),('MN_PO','MN_PO_PRINT','admin'),('MN_PO','MN_PO_EDIT_UM','admin'),('MN_PURCHASE','MN_PURCHASE_UM_LUNAS','admin'),('MN_PURCHASE_UM_LUNAS','MN_PURCHASE_UM_LUNAS_ADD','admin'),('MN_PURCHASE_UM_LUNAS','MN_PURCHASE_UM_LUNAS_DELETE','admin'),('MN_PURCHASE_UM_LUNAS','MN_PURCHASE_UM_LUNAS_EDIT','admin'),('MN_PURCHASE','MN_PURCHASE_DIRECT','admin'),('MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_EDIT','admin'),('MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_ADD','admin'),('MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_DELETE','admin'),('MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_PRINT','admin'),('MN_PURCHASE','MN_PURCHASE_RETURN','admin'),('MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_EDIT','admin'),('MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_ADD','admin'),('MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_DELETE','admin'),('MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_PRINT','admin'),('MN_PURCHASE','MN_PURCHASE_REPORT','admin'),('MN_PURCHASE_REPORT','MN_LAP_PO','admin'),('MN_PURCHASE_REPORT','MN_LAP_PURCH','admin'),('MN_PURCHASE_REPORT','MN_LAP_PURCH_GROUP_SUPP','admin'),('MN_PURCHASE_REPORT','MN_LAP_PURCH_GROUP_PERIOD','admin'),('MN_PURCHASE_REPORT','MN_LAP_PURCH_GRAPHIC','admin'),('ROOT','MN_SALES','admin'),('MN_SALES','MN_SO','admin'),('MN_SO','MN_SO_EDIT','admin'),('MN_SO','MN_SO_ADD','admin'),('MN_SO','MN_SO_DELETE','admin'),('MN_SO','MN_SO_PRINT','admin'),('MN_SALES','MN_SALES_UM_LUNAS','admin'),('MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_ADD','admin'),('MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_DELETE','admin'),('MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_EDIT','admin'),('MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_PRINT','admin'),('MN_SALES','MN_SALES_RETURN','admin'),('MN_SALES_RETURN','MN_SALES_RETURN_EDIT','admin'),('MN_SALES_RETURN','MN_SALES_RETURN_ADD','admin'),('MN_SALES_RETURN','MN_SALES_RETURN_DELETE','admin'),('MN_SALES_RETURN','MN_SALES_RETURN_PRINT','admin'),('MN_OUTLET_SALES','MN_LAPORAN_JUAL','admin'),('MN_LAPORAN_JUAL','MN_LAPORAN_SO','admin'),('MN_LAPORAN_JUAL','MN_LAPORAN_SALES_STD','admin'),('MN_LAPORAN_JUAL','MN_LAPORAN_SALES_GROUP','admin'),('MN_LAPORAN_JUAL','MN_LAPORAN_SALES_RECAP','admin'),('MN_LAPORAN_JUAL','MN_LAPORAN_SALES_GRAFIK','admin'),('ROOT','MN_OUTLET_SALES','admin'),('MN_OUTLET_SALES','MN_CASHIER','admin'),('MN_CASHIER','MN_CASHIER_EDIT','admin'),('MN_CASHIER','MN_CASHIER_ADD','admin'),('MN_CASHIER','MN_CASHIER_DELETE','admin'),('MN_CASHIER','MN_CASHIER_PRINT','admin'),('MN_OUTLET_SALES','MN_CASHIER_RETURN','admin'),('MN_CASHIER_RETURN','MN_CASHIER_RETURN_EDIT','admin'),('MN_CASHIER_RETURN','MN_CASHIER_RETURN_ADD','admin'),('MN_CASHIER_RETURN','MN_CASHIER_RETURN_DELETE','admin'),('MN_CASHIER_RETURN','MN_CASHIER_RETURN_PRINT','admin'),('MN_OUTLET_SALES','MN_CASHIER_REGISTER','admin'),('MN_OUTLET_SALES','MN_MUTASI_CASHIER','admin'),('MN_MUTASI_CASHIER','MN_MUTASI_CASHIER_DETAIL','admin'),('MN_MUTASI_CASHIER','MN_MUTASI_CASHIER_RECAP','admin'),('ROOT','MN_CASH_BANK','admin'),('MN_CASH_BANK','MN_SPEND_MONEY','admin'),('MN_SPEND_MONEY','MN_SPEND_MONEY_EDIT','admin'),('MN_SPEND_MONEY','MN_SPEND_MONEY_ADD','admin'),('MN_SPEND_MONEY','MN_SPEND_MONEY_DELETE','admin'),('MN_SPEND_MONEY','MN_SPEND_MONEY_PRINT','admin'),('MN_CASH_BANK','MN_CASHBANK_TRANS_REPORT','admin'),('MN_CASHBANK_TRANS_REPORT','MN_CASHBANK_TRANS_DETAIL','admin'),('MN_CASH_BANK','MN_CASHBANK_RECAP_REPORT','admin'),('MN_CASHBANK_RECAP_REPORT','MN_CASHBANK_TRANS_RECAP','admin'),('ROOT','MN_KOPERASI','admin'),('MN_KOPERASI','MN_SIMPAN_PINJAM','admin'),('MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_ADD','admin'),('MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_EDIT','admin'),('MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_DELETE','admin'),('MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_PRINT','admin'),('MN_KOPERASI','MN_LAP_KOPERASI','admin'),('ROOT','MN_ACCOUNT','admin'),('MN_ACCOUNT','MN_COA','admin'),('MN_COA','MN_COA_EDIT','admin'),('MN_COA','MN_COA_ADD','admin'),('MN_COA','MN_COA_DELETE','admin'),('MN_COA','MN_COA_PRINT','admin'),('MN_ACCOUNT','MN_CLOSE_PERIOD','admin'),('MN_ACCOUNT','MN_ACCOUNTING_REPORT','admin'),('MN_ACCOUNTING_REPORT','MN_INCOME_STATEMENT','admin'),('ROOT','MN_TOOLS','admin'),('MN_TOOLS','MN_BACKUP','admin'),('MN_TOOLS','MN_RESTORE','admin'),('MN_TOOLS','MN_USERMANAGE','admin'),('MN_TOOLS','MN_SET_PATH','admin'),('MN_TOOLS','MN_CLEANSING_DB','admin');
/*!40000 ALTER TABLE `i_hakakses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_import_lapkasirsentral_simrs`
--

DROP TABLE IF EXISTS `i_import_lapkasirsentral_simrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_import_lapkasirsentral_simrs` (
  `carabayar` varchar(30) DEFAULT NULL,
  `namabank` varchar(120) DEFAULT NULL,
  `nostruk` varchar(30) DEFAULT NULL,
  `nopembayaran` varchar(30) DEFAULT NULL,
  `namauser` varchar(200) DEFAULT NULL,
  `jumlahbayar` double(19,2) DEFAULT NULL,
  `pembayaranke` int(11) DEFAULT NULL,
  `nokarturek` varchar(60) DEFAULT NULL,
  `namaruangan` varchar(250) DEFAULT NULL,
  `tglstruk` date DEFAULT NULL,
  `totalbiaya` double(19,2) DEFAULT NULL,
  `deposit` double(19,2) DEFAULT NULL,
  `tanggunganpenjamin` double(19,2) DEFAULT NULL,
  `tanggunganrs` double(19,2) DEFAULT NULL,
  `pembebasan` double(19,2) DEFAULT NULL,
  `discountnilai` double(19,2) DEFAULT NULL,
  `biayaadministrasi` double(19,2) DEFAULT NULL,
  `totalharusdibayar` double(19,2) DEFAULT NULL,
  `totalbayar` double(19,2) DEFAULT NULL,
  `sisatagihan` double(19,2) DEFAULT NULL,
  `sisadeposit` double(19,2) DEFAULT NULL,
  `nocm` varchar(30) DEFAULT NULL,
  `namalengkap` varchar(250) DEFAULT NULL,
  `noregistrasi` varchar(60) DEFAULT NULL,
  `namajenispelayanan` varchar(250) DEFAULT NULL,
  `namapelayanan` varchar(250) DEFAULT NULL,
  `totaltarif` double(19,2) DEFAULT NULL,
  `kdjenispelayanan` varchar(30) DEFAULT NULL,
  `kdpelayanan` varchar(30) DEFAULT NULL,
  `namakaryawan` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_import_lapkasirsentral_simrs`
--

LOCK TABLES `i_import_lapkasirsentral_simrs` WRITE;
/*!40000 ALTER TABLE `i_import_lapkasirsentral_simrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_import_lapkasirsentral_simrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_item_beg_balance`
--

DROP TABLE IF EXISTS `i_item_beg_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_item_beg_balance` (
  `id_warehouse` varchar(25) DEFAULT NULL,
  `id_item` varchar(25) DEFAULT NULL,
  `id_unit` varchar(25) DEFAULT NULL,
  `balance` double(10,0) DEFAULT NULL,
  `notes` text,
  `price` double DEFAULT NULL,
  `status_update` int(11) DEFAULT NULL,
  KEY `item_balance_fkey1` (`id_item`),
  KEY `item_balance_fkey2` (`id_unit`),
  KEY `item_balance_fkey3` (`id_warehouse`),
  CONSTRAINT `fk_id_warehouse` FOREIGN KEY (`id_warehouse`) REFERENCES `mst_warehouse` (`id_warehouse`) ON UPDATE CASCADE,
  CONSTRAINT `i_item_beg_balance_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `mst_item` (`id_item`) ON UPDATE CASCADE,
  CONSTRAINT `i_item_beg_balance_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `mst_unit` (`id_unit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_item_beg_balance`
--

LOCK TABLES `i_item_beg_balance` WRITE;
/*!40000 ALTER TABLE `i_item_beg_balance` DISABLE KEYS */;
INSERT INTO `i_item_beg_balance` VALUES ('WH001','0816000001','pcs',3,'',2640000,1),('WH001','0816000002','pcs',4,'',990000,1),('WH001','0816000003','pcs',0,'',NULL,NULL),('WH001','0816000004','pcs',0,'',NULL,NULL);
/*!40000 ALTER TABLE `i_item_beg_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_mailing_list`
--

DROP TABLE IF EXISTS `i_mailing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_mailing_list` (
  `mailing_list_id` varchar(120) NOT NULL,
  `date_trn` date NOT NULL,
  `mail_nmb` varchar(120) DEFAULT NULL,
  `mail_date` date DEFAULT NULL,
  `mail_type` int(11) DEFAULT NULL,
  `sender_name` varchar(120) DEFAULT NULL,
  `mail_concerning` longtext,
  `urgent_status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_user` varchar(120) DEFAULT NULL,
  `modified_user` varchar(120) DEFAULT NULL,
  `id_expedition` varchar(120) DEFAULT NULL,
  `dest_address` text,
  `receiver_name` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`mailing_list_id`),
  KEY `mail_type` (`mail_type`),
  KEY `urgent_status` (`urgent_status`),
  KEY `id_expedition` (`id_expedition`),
  CONSTRAINT `i_mailing_list_ibfk_1` FOREIGN KEY (`id_expedition`) REFERENCES `mst_expedition` (`id_expedition`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_mailing_list`
--

LOCK TABLES `i_mailing_list` WRITE;
/*!40000 ALTER TABLE `i_mailing_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_mailing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_material_in`
--

DROP TABLE IF EXISTS `i_material_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_material_in` (
  `no_material_in` varchar(60) DEFAULT NULL,
  `date_trn` datetime DEFAULT NULL,
  `id_item` varchar(30) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `id_unit` varchar(30) DEFAULT NULL,
  `cogs` double(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  KEY `id_unit_fkey` (`id_unit`),
  KEY `id_item_fkey` (`id_item`),
  CONSTRAINT `i_material_in_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `mst_item` (`id_item`) ON UPDATE CASCADE,
  CONSTRAINT `i_material_in_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `mst_unit` (`id_unit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_material_in`
--

LOCK TABLES `i_material_in` WRITE;
/*!40000 ALTER TABLE `i_material_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_material_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_material_out`
--

DROP TABLE IF EXISTS `i_material_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_material_out` (
  `no_material_out` varchar(60) DEFAULT NULL,
  `date_trn` datetime DEFAULT NULL,
  `id_item` varchar(30) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `id_unit` varchar(30) DEFAULT NULL,
  `cogs` double(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  KEY `id_unit_fkey2` (`id_unit`),
  KEY `id_item_fkey2` (`id_item`),
  CONSTRAINT `i_material_out_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `mst_item` (`id_item`) ON UPDATE CASCADE,
  CONSTRAINT `i_material_out_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `mst_unit` (`id_unit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_material_out`
--

LOCK TABLES `i_material_out` WRITE;
/*!40000 ALTER TABLE `i_material_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_material_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_material_type_usage`
--

DROP TABLE IF EXISTS `i_material_type_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_material_type_usage` (
  `material_type_id` int(11) NOT NULL,
  `material_type_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`material_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_material_type_usage`
--

LOCK TABLES `i_material_type_usage` WRITE;
/*!40000 ALTER TABLE `i_material_type_usage` DISABLE KEYS */;
INSERT INTO `i_material_type_usage` VALUES (1,'Bahan Baku'),(2,'Barang Setengah Jadi');
/*!40000 ALTER TABLE `i_material_type_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_opname_det`
--

DROP TABLE IF EXISTS `i_opname_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_opname_det` (
  `no_opname` varchar(25) DEFAULT NULL,
  `id_item` varchar(25) DEFAULT NULL,
  `id_unit` varchar(25) DEFAULT NULL,
  `qty_onhand` double DEFAULT NULL,
  `qty_opname` double DEFAULT NULL,
  `notes` text,
  `weight_onhand` double DEFAULT NULL,
  `weight_opname` double DEFAULT NULL,
  KEY `opname_fkey1` (`no_opname`),
  KEY `opname_fkey2` (`id_item`),
  CONSTRAINT `i_opname_det_ibfk_1` FOREIGN KEY (`no_opname`) REFERENCES `i_opname_head` (`no_opname`) ON UPDATE CASCADE,
  CONSTRAINT `i_opname_det_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `mst_item` (`id_item`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_opname_det`
--

LOCK TABLES `i_opname_det` WRITE;
/*!40000 ALTER TABLE `i_opname_det` DISABLE KEYS */;
INSERT INTO `i_opname_det` VALUES ('OPN/08-2016-00001','0816000001','pcs',11,11,'',8,8),('OPN/08-2016-00001','0816000002','pcs',8,8,'',3,3),('OPN/08-2016-00001','0816000003','pcs',1,1,'',4,4),('OPN/08-2016-00001','0816000004','pcs',1,1,'',3.25,3);
/*!40000 ALTER TABLE `i_opname_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_opname_head`
--

DROP TABLE IF EXISTS `i_opname_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_opname_head` (
  `no_opname` varchar(30) NOT NULL,
  `date_trn` datetime DEFAULT NULL,
  `id_warehouse` varchar(25) DEFAULT NULL,
  `is_corrected` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_opname`),
  KEY `fk_opname_wh` (`id_warehouse`),
  CONSTRAINT `fk_opname_wh` FOREIGN KEY (`id_warehouse`) REFERENCES `mst_warehouse` (`id_warehouse`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_opname_head`
--

LOCK TABLES `i_opname_head` WRITE;
/*!40000 ALTER TABLE `i_opname_head` DISABLE KEYS */;
INSERT INTO `i_opname_head` VALUES ('OPN/08-2016-00001','2016-08-27 00:00:00','WH001',NULL);
/*!40000 ALTER TABLE `i_opname_head` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_path_autobackup`
--

DROP TABLE IF EXISTS `i_path_autobackup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_path_autobackup` (
  `type` varchar(20) DEFAULT NULL,
  `filepath` varchar(1000) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `backup_date` date DEFAULT NULL,
  `modified_user` varchar(250) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_path_autobackup`
--

LOCK TABLES `i_path_autobackup` WRITE;
/*!40000 ALTER TABLE `i_path_autobackup` DISABLE KEYS */;
INSERT INTO `i_path_autobackup` VALUES ('Harian','D:/backup','12:56:35','','2016-04-18','','2016-04-18 01:08:42');
/*!40000 ALTER TABLE `i_path_autobackup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_phone_in`
--

DROP TABLE IF EXISTS `i_phone_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_phone_in` (
  `phone_book_id` varchar(120) NOT NULL,
  `phone_name` varchar(120) NOT NULL,
  `home_phone_1` varchar(120) DEFAULT NULL,
  `home_phone_2` varchar(120) DEFAULT NULL,
  `mobile_phone_1` varchar(120) DEFAULT NULL,
  `mobile_phone_2` varchar(120) DEFAULT NULL,
  `office_phone_1` varchar(120) DEFAULT NULL,
  `office_phone_2` varchar(120) DEFAULT NULL,
  `fax` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `address_phone` text,
  `website` varchar(120) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_user` varchar(120) DEFAULT NULL,
  `modified_user` varchar(120) DEFAULT NULL,
  `status_id` smallint(6) DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `call_receiver` varchar(0) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`phone_book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_phone_in`
--

LOCK TABLES `i_phone_in` WRITE;
/*!40000 ALTER TABLE `i_phone_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_phone_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_product`
--

DROP TABLE IF EXISTS `i_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_product`
--

LOCK TABLES `i_product` WRITE;
/*!40000 ALTER TABLE `i_product` DISABLE KEYS */;
INSERT INTO `i_product` VALUES (1,'Basic'),(2,'POS'),(3,'Retail'),(4,'Toko Emas'),(5,'Manufaktur');
/*!40000 ALTER TABLE `i_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_product_id`
--

DROP TABLE IF EXISTS `i_product_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_product_id` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) DEFAULT NULL,
  `product_version` varchar(200) DEFAULT NULL,
  `logo` text,
  `panel` varchar(200) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `copyright` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_product_id`
--

LOCK TABLES `i_product_id` WRITE;
/*!40000 ALTER TABLE `i_product_id` DISABLE KEYS */;
INSERT INTO `i_product_id` VALUES (1,'Pi-Accounting Software','1.0','D:/YOLK-IT/YolkEnterpriseAccounting (YORSA Software)/Pi-Accounting - Development/bin/Debug/pi-accounting-small.png','Dashboard',0,'Copyright Ôö¼┬« 2014-2015'),(2,'Pi-Accounting RS HAJI','1.1','D:/YOLK-IT/YolkEnterpriseAccounting (YORSA Software)/Pi-Accounting - Development/bin/Debug/pi-accounting-small.png','Dashboard',1,'Copyright Ôö¼┬« 2014-2015'),(3,'Pi-Accounting Attendance Sheraton','1.2','D:/YOLK-IT/YolkEnterpriseAccounting (YORSA Software)/Pi-Accounting - Development/bin/Debug/ITPI-LOGO.png','Panel Logo',0,'Copyright Ôö¼┬« 2014-2015');
/*!40000 ALTER TABLE `i_product_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_product_parameter`
--

DROP TABLE IF EXISTS `i_product_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_product_parameter` (
  `param_id` int(11) NOT NULL AUTO_INCREMENT,
  `produk_id` int(11) DEFAULT NULL,
  `origin_value` varchar(250) DEFAULT NULL,
  `subtitute_value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`param_id`),
  KEY `produk_id` (`produk_id`),
  CONSTRAINT `i_product_parameter_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `i_product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_product_parameter`
--

LOCK TABLES `i_product_parameter` WRITE;
/*!40000 ALTER TABLE `i_product_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_product_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_product_reg`
--

DROP TABLE IF EXISTS `i_product_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_product_reg` (
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_product_reg`
--

LOCK TABLES `i_product_reg` WRITE;
/*!40000 ALTER TABLE `i_product_reg` DISABLE KEYS */;
INSERT INTO `i_product_reg` VALUES (4);
/*!40000 ALTER TABLE `i_product_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_project_name`
--

DROP TABLE IF EXISTS `i_project_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_project_name` (
  `id_project` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(250) DEFAULT NULL,
  `header_text` varchar(250) DEFAULT NULL,
  `project_default` int(1) DEFAULT NULL,
  `profit_notes` varchar(250) DEFAULT NULL,
  `profit_notes_header` varchar(250) DEFAULT NULL,
  `include_prive` int(1) DEFAULT NULL,
  `is_bumn` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_project`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_project_name`
--

LOCK TABLES `i_project_name` WRITE;
/*!40000 ALTER TABLE `i_project_name` DISABLE KEYS */;
INSERT INTO `i_project_name` VALUES (1,'Sistem Akuntansi RSU Haji Surabaya','PEMERINTAH PROPINSI JAWA TIMUR',0,'Surplus (Defisit) Tahun Berjalan','Surplus (Defisit)',0,1),(2,'Manufacturing Company','PERUSAHAAN DAGANG DAN INDUSTRI',0,'Laba - Rugi Periode Berjalan','Laba - Rugi',1,0),(3,'Pi Accounting','PERUSAHAAN KANTOR KONSULTAN',1,'Laba - Rugi Periode Berjalan','Laba - Rugi',1,0);
/*!40000 ALTER TABLE `i_project_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_set_account_def`
--

DROP TABLE IF EXISTS `i_set_account_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_set_account_def` (
  `acc_parameter` varchar(200) NOT NULL,
  `id_account` varchar(30) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`acc_parameter`),
  KEY `fk_account` (`id_account`),
  CONSTRAINT `id_account` FOREIGN KEY (`id_account`) REFERENCES `mst_account` (`id_account`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_set_account_def`
--

LOCK TABLES `i_set_account_def` WRITE;
/*!40000 ALTER TABLE `i_set_account_def` DISABLE KEYS */;
INSERT INTO `i_set_account_def` VALUES ('acc_accummulated_profit','3-1199','Akumulasi Profit / Surplus / Defisit Tahun Lalu'),('acc_capital','3-1101','Capital Account'),('acc_cash_cashier','1-1101','Cashier Cash Account'),('acc_cash_purchase','1-1101','Cash Purchase Account'),('acc_cash_sales','1-1101','Cash Sales Account'),('acc_cash_service','1-1101','Cash Service Account'),('acc_close_period','3-1199','Profit - Loss Summary Account'),('acc_credit_purchase','2-1101','Account Payable Account'),('acc_credit_sales','1-1301','Account Receivable Account'),('acc_credit_service','1-1301','Account Receivable Account for Service'),('acc_def_cogs','5-1101','Default Inventory COGS Account'),('acc_def_inventory','1-1201','Default Inventory Account'),('acc_disc_beli','4-1102','Purchase Disc Account'),('acc_disc_sales','4-1103','Sales Disc Account'),('acc_disc_service','4-1103','Sales Service Disc Account'),('acc_dp_po','1-1499','Biaya Dibayar Dimuka Uang Muka PO'),('acc_dp_sales','2-1301','Sales Down Payment Account'),('acc_freight','6-1107','Freight Account'),('acc_freight_sales','6-1299','Freight Sales'),('acc_kurs_expenses','6-2101','Exchange Rate Expense Account'),('acc_kurs_revenue','4-2102','Exchange Rate Revenue Account'),('acc_other_expenses','6-1199','Others Expense Account'),('acc_other_revenue','4-1203','Others Revenue Account'),('acc_pay_purchase_disc','4-1104','Account Payable Payment Account'),('acc_pay_sales_disc','4-1105','Account Payable Payment Disc Account'),('acc_prive','3-1102','Prive Account'),('acc_sales','4-1101','Sales Account'),('acc_service_revenue','4-1201','Service Revenue Account'),('acc_tax_in','1-1501','VAT IN Account'),('acc_tax_out','2-1102','VAT OUT Account'),('acc_temp_konversi','5-2103','Rekening Perantara Biaya Konversi Perakitan / Produksi'),('acc_temp_material_cost','5-2101','Rekening Perantara Biaya Bahan Baku / Sparepart'),('acc_temp_payroll','2-1401','Rekening Perantara Payroll'),('acc_temp_subtitute_cost','5-2102','Rekening Perantara Biaya Bahan Pembantu'),('acc_temp_wip','1-1203','Rekening Perantara Barang Dalam Proses');
/*!40000 ALTER TABLE `i_set_account_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_set_account_def_manufacture`
--

DROP TABLE IF EXISTS `i_set_account_def_manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_set_account_def_manufacture` (
  `acc_parameter` varchar(200) NOT NULL,
  `id_account` varchar(30) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`acc_parameter`),
  KEY `fk_account` (`id_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_set_account_def_manufacture`
--

LOCK TABLES `i_set_account_def_manufacture` WRITE;
/*!40000 ALTER TABLE `i_set_account_def_manufacture` DISABLE KEYS */;
INSERT INTO `i_set_account_def_manufacture` VALUES ('acc_capital','3-1101','Capital Account'),('acc_cash_cashier','1-1199','Cashier Cash Account'),('acc_cash_purchase','1-1101','Cash Purchase Account'),('acc_cash_sales','1-1101','Cash Sales Account'),('acc_cash_service','1-1101','Cash Service Account'),('acc_close_period','3-1199','Profit - Loss Summary Account'),('acc_credit_purchase','2-1101','Account Payable Account'),('acc_credit_sales','1-1301','Account Receivable Account'),('acc_credit_service','1-1301','Account Receivable Account for Service'),('acc_disc_beli','4-1102','Purchase Disc Account'),('acc_disc_sales','4-1202','Sales Disc Account'),('acc_disc_service','4-1103','Sales Service Disc Account'),('acc_freight','6-1107','Freight Account'),('acc_kurs_expenses','6-2101','Exchange Rate Expense Account'),('acc_kurs_revenue','4-2101','Exchange Rate Revenue Account'),('acc_other_expenses','6-1299','Others Expense Account'),('acc_other_revenue','4-1203','Others Revenue Account'),('acc_pay_purchase_disc','4-1104','Account Payable Payment Account'),('acc_pay_sales_disc','4-1105','Account Payable Payment Disc Account'),('acc_prive','3-1102','Prive Account'),('acc_sales','4-1101','Sales Account'),('acc_tax_in','1-1501','VAT IN Account'),('acc_tax_out','2-1102','VAT OUT Account');
/*!40000 ALTER TABLE `i_set_account_def_manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_set_account_def_retail`
--

DROP TABLE IF EXISTS `i_set_account_def_retail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_set_account_def_retail` (
  `acc_parameter` varchar(200) NOT NULL,
  `id_account` varchar(30) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`acc_parameter`),
  KEY `fk_account` (`id_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_set_account_def_retail`
--

LOCK TABLES `i_set_account_def_retail` WRITE;
/*!40000 ALTER TABLE `i_set_account_def_retail` DISABLE KEYS */;
INSERT INTO `i_set_account_def_retail` VALUES ('acc_capital','3-1101','Capital Account'),('acc_cash_cashier','1-1199','Cashier Cash Account'),('acc_cash_purchase','1-1101','Cash Purchase Account'),('acc_cash_sales','1-1101','Cash Sales Account'),('acc_cash_service','1-1101','Cash Service Account'),('acc_close_period','3-1199','Profit - Loss Summary Account'),('acc_credit_purchase','2-1101','Account Payable Account'),('acc_credit_sales','1-1301','Account Receivable Account'),('acc_credit_service','1-1301','Account Receivable Account for Service'),('acc_disc_beli','4-1102','Purchase Disc Account'),('acc_disc_sales','4-1202','Sales Disc Account'),('acc_disc_service','4-1103','Sales Service Disc Account'),('acc_freight','6-1107','Freight Account'),('acc_kurs_expenses','6-2101','Exchange Rate Expense Account'),('acc_kurs_revenue','4-2101','Exchange Rate Revenue Account'),('acc_other_expenses','6-1299','Others Expense Account'),('acc_other_revenue','4-1203','Others Revenue Account'),('acc_pay_purchase_disc','4-1104','Account Payable Payment Account'),('acc_pay_sales_disc','4-1105','Account Payable Payment Disc Account'),('acc_prive','3-1102','Prive Account'),('acc_sales','4-1101','Sales Account'),('acc_tax_in','1-1501','VAT IN Account'),('acc_tax_out','2-1102','VAT OUT Account');
/*!40000 ALTER TABLE `i_set_account_def_retail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_set_account_def_simrs`
--

DROP TABLE IF EXISTS `i_set_account_def_simrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_set_account_def_simrs` (
  `acc_parameter` varchar(200) NOT NULL,
  `id_account` varchar(30) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`acc_parameter`),
  KEY `fk_account` (`id_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_set_account_def_simrs`
--

LOCK TABLES `i_set_account_def_simrs` WRITE;
/*!40000 ALTER TABLE `i_set_account_def_simrs` DISABLE KEYS */;
INSERT INTO `i_set_account_def_simrs` VALUES ('acc_diskon_pembelian','2163506','Akun Diskon Pembelian'),('acc_hpp_obat','2163506','Akun HPP Persediaan Obat'),('acc_jasa_layanan_blud','8141901','Akun Pendapatan Jasa Layanan Medis'),('acc_peralatan_alkes','2163506','Akun Peralatan Alat Kesehatan'),('acc_persediaan_obat','2163506','Akun Persediaan Obat'),('acc_ppn_pembelian','2163506','Akun PPN Pembelian Obat dan Alkes');
/*!40000 ALTER TABLE `i_set_account_def_simrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_set_age`
--

DROP TABLE IF EXISTS `i_set_age`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_set_age` (
  `id` int(11) NOT NULL,
  `notes` text,
  `start_value` int(11) DEFAULT NULL,
  `end_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_set_age`
--

LOCK TABLES `i_set_age` WRITE;
/*!40000 ALTER TABLE `i_set_age` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_set_age` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_set_ap_prosentase`
--

DROP TABLE IF EXISTS `i_set_ap_prosentase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_set_ap_prosentase` (
  `id_cadangan` int(11) NOT NULL AUTO_INCREMENT,
  `umur_hutang` varchar(200) DEFAULT NULL,
  `prosentase` double(19,2) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_cadangan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_set_ap_prosentase`
--

LOCK TABLES `i_set_ap_prosentase` WRITE;
/*!40000 ALTER TABLE `i_set_ap_prosentase` DISABLE KEYS */;
INSERT INTO `i_set_ap_prosentase` VALUES (1,'Belum Jatuh Tempo',0.00,'2015-11-17 00:00:00','demo'),(2,'<= 30 Hari',0.00,'2015-11-17 00:00:00','demo'),(3,'31 - 60 Hari',0.00,'2015-11-17 00:00:00','demo'),(4,'61 - 90 Hari',0.00,'2015-11-17 00:00:00','demo'),(5,'91 - 120 Hari',0.00,'2015-11-17 00:00:00','demo'),(6,'> 120 Hari',0.00,'2015-11-17 00:00:00','demo');
/*!40000 ALTER TABLE `i_set_ap_prosentase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_set_ar_prosentase`
--

DROP TABLE IF EXISTS `i_set_ar_prosentase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_set_ar_prosentase` (
  `id_cadangan` int(11) NOT NULL AUTO_INCREMENT,
  `umur_piutang` varchar(200) DEFAULT NULL,
  `prosentase` double(19,2) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_cadangan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_set_ar_prosentase`
--

LOCK TABLES `i_set_ar_prosentase` WRITE;
/*!40000 ALTER TABLE `i_set_ar_prosentase` DISABLE KEYS */;
INSERT INTO `i_set_ar_prosentase` VALUES (1,'Belum Jatuh Tempo',0.00,'2015-12-08 00:00:00','demo'),(2,'<= 30 Hari',0.00,'2015-12-08 00:00:00','demo'),(3,'31 - 60 Hari',0.00,'2015-12-08 00:00:00','demo'),(4,'61 - 90 Hari',0.00,'2015-12-08 00:00:00','demo'),(5,'91 - 120 Hari',0.00,'2015-12-08 00:00:00','demo'),(6,'> 120 Hari',0.00,'2015-12-08 00:00:00','demo');
/*!40000 ALTER TABLE `i_set_ar_prosentase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_set_price`
--

DROP TABLE IF EXISTS `i_set_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_set_price` (
  `id_warehouse` varchar(25) DEFAULT NULL,
  `id_item` varchar(25) DEFAULT NULL,
  `id_unit` varchar(25) DEFAULT NULL,
  `amount_cogs` double DEFAULT NULL,
  `amount_price` double DEFAULT NULL,
  KEY `set_price_fkey1` (`id_item`),
  KEY `set_price_fkey2` (`id_warehouse`),
  CONSTRAINT `i_set_price_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `mst_item` (`id_item`) ON UPDATE CASCADE,
  CONSTRAINT `i_set_price_ibfk_2` FOREIGN KEY (`id_warehouse`) REFERENCES `mst_warehouse` (`id_warehouse`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_set_price`
--

LOCK TABLES `i_set_price` WRITE;
/*!40000 ALTER TABLE `i_set_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_set_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_setup_email`
--

DROP TABLE IF EXISTS `i_setup_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_setup_email` (
  `smtpclient` varchar(250) DEFAULT NULL,
  `pop3client` varchar(250) DEFAULT NULL,
  `smtpport` varchar(250) DEFAULT NULL,
  `imapport` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `user` varchar(250) DEFAULT NULL,
  `pass` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_setup_email`
--

LOCK TABLES `i_setup_email` WRITE;
/*!40000 ALTER TABLE `i_setup_email` DISABLE KEYS */;
INSERT INTO `i_setup_email` VALUES ('smtp.gmail.com','imap.gmail.com','587','993','indonesia.erp.software@gmail.com','indonesia.erp.software','apaya?lupa');
/*!40000 ALTER TABLE `i_setup_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_stock_in`
--

DROP TABLE IF EXISTS `i_stock_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_stock_in` (
  `no_stock_in` varchar(60) DEFAULT NULL,
  `date_trn` datetime DEFAULT NULL,
  `id_item` varchar(30) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `id_unit` varchar(30) DEFAULT NULL,
  `cogs` double(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `id_warehouse` varchar(60) DEFAULT NULL,
  KEY `id_unit_fkey` (`id_unit`),
  KEY `id_item_fkey` (`id_item`),
  CONSTRAINT `id_item_fkey` FOREIGN KEY (`id_item`) REFERENCES `mst_item` (`id_item`) ON UPDATE CASCADE,
  CONSTRAINT `id_unit_fkey` FOREIGN KEY (`id_unit`) REFERENCES `mst_unit` (`id_unit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_stock_in`
--

LOCK TABLES `i_stock_in` WRITE;
/*!40000 ALTER TABLE `i_stock_in` DISABLE KEYS */;
INSERT INTO `i_stock_in` VALUES ('LPO/08-2016-00001','2016-08-17 00:00:00','0816000001',10,'pcs',2640000,2640000,'WH001'),('LPO/08-2016-00001','2016-08-17 00:00:00','0816000002',8,'pcs',990000,990000,'WH001'),('CSU/08-2016-00001','2016-08-17 00:00:00','0816000002',1,'pcs',0,1260000,'WH001'),('SRU/08-2016-00001','2016-08-18 00:00:00','0816000001',1,'pcs',0,3840000,'WH001'),('PNJ/08-2016-00001','2016-08-18 00:00:00','0816000003',1,'pcs',0,0,'WH001'),('PNJ/08-2016-00001','2016-08-18 00:00:00','0816000004',1,'pcs',0,0,'WH001');
/*!40000 ALTER TABLE `i_stock_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_stock_out`
--

DROP TABLE IF EXISTS `i_stock_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_stock_out` (
  `no_stock_out` varchar(60) DEFAULT NULL,
  `date_trn` datetime DEFAULT NULL,
  `id_item` varchar(30) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `id_unit` varchar(30) DEFAULT NULL,
  `cogs` double(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `id_warehouse` varchar(60) DEFAULT NULL,
  KEY `id_unit_fkey2` (`id_unit`),
  KEY `id_item_fkey2` (`id_item`),
  CONSTRAINT `id_item_fkey2` FOREIGN KEY (`id_item`) REFERENCES `mst_item` (`id_item`) ON UPDATE CASCADE,
  CONSTRAINT `id_unit_fkey2` FOREIGN KEY (`id_unit`) REFERENCES `mst_unit` (`id_unit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_stock_out`
--

LOCK TABLES `i_stock_out` WRITE;
/*!40000 ALTER TABLE `i_stock_out` DISABLE KEYS */;
INSERT INTO `i_stock_out` VALUES ('PRU/08-2016-00001','2016-08-17 00:00:00','0816000002',1,'pcs',0,990000,'WH001'),('CSH/08-2016-00001','2016-08-17 00:00:00','0816000001',1,'pcs',3840000,3840000,'OT001'),('CSH/08-2016-00002','2016-08-17 00:00:00','0816000002',2,'pcs',1260000,1260000,'OT001'),('LSO/08-2016-00003','2016-08-17 00:00:00','0816000001',2,'pcs',3840000,3840000,'WH001'),('LSO/08-2016-00003','2016-08-17 00:00:00','0816000002',2,'pcs',1260000,1260000,'WH001'),('CSH/08-2016-00003','2016-08-28 00:00:00','0816000003',1,'pcs',1680000,1680000,'OT001'),('CSH/08-2016-00003','2016-08-28 00:00:00','0816000004',1,'pcs',1365000,1365000,'OT001'),('CSH/08-2016-00004','2016-08-28 00:00:00','0816000001',1,'pcs',3840000,3840000,'OT001');
/*!40000 ALTER TABLE `i_stock_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_tax_setting`
--

DROP TABLE IF EXISTS `i_tax_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_tax_setting` (
  `tax_name` varchar(30) NOT NULL,
  `tax_decription` varchar(200) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  PRIMARY KEY (`tax_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_tax_setting`
--

LOCK TABLES `i_tax_setting` WRITE;
/*!40000 ALTER TABLE `i_tax_setting` DISABLE KEYS */;
INSERT INTO `i_tax_setting` VALUES ('PPN','Value Added Tax',10);
/*!40000 ALTER TABLE `i_tax_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_templatehakakses`
--

DROP TABLE IF EXISTS `i_templatehakakses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_templatehakakses` (
  `nourut` int(11) NOT NULL AUTO_INCREMENT,
  `parentkey` varchar(120) NOT NULL,
  `childkey` varchar(120) NOT NULL,
  `notes` varchar(400) DEFAULT NULL,
  `ismenu` int(11) DEFAULT NULL,
  `icon_webapp` varchar(250) DEFAULT NULL,
  `link_webapp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATEHAKAKSES_PK` (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATENOOROT` (`nourut`) USING BTREE,
  KEY `PARENTKEY` (`parentkey`),
  KEY `CHILDKEY` (`childkey`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_templatehakakses`
--

LOCK TABLES `i_templatehakakses` WRITE;
/*!40000 ALTER TABLE `i_templatehakakses` DISABLE KEYS */;
INSERT INTO `i_templatehakakses` VALUES (334,'MN_ACCOUNT','MN_ACCOUNTING_REPORT','LAPORAN AKUNTANSI',1,NULL,NULL),(333,'MN_ACCOUNT','MN_CLOSE_PERIOD','TUTUP PERIODE TRANSAKSI',1,NULL,NULL),(310,'MN_ACCOUNT','MN_COA','CHART OF ACCOUNT',1,NULL,NULL),(342,'MN_ACCOUNTING_REPORT','MN_INCOME_STATEMENT','LAPORAN LABA - RUGI',2,NULL,NULL),(32,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_ADD','Akses Add',2,NULL,NULL),(33,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_DELETE','Akses Delete',2,NULL,NULL),(31,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_EDIT','Akses Edit',2,NULL,NULL),(30,'MN_CARDFILE','MN_BEGINING_BALANCE','SALDO AWAL BARANG',1,NULL,NULL),(54,'MN_CARDFILE','MN_CARD_FILE_REPORT','LAPORAN MASTER',1,NULL,NULL),(2,'MN_CARDFILE','MN_CUSTOMER','PELANGGAN',1,NULL,NULL),(10,'MN_CARDFILE','MN_EMPLOYEE','KARYAWAN',1,NULL,NULL),(18,'MN_CARDFILE','MN_ITEM_CAT','KATEGORI BARANG',1,NULL,NULL),(26,'MN_CARDFILE','MN_ITEM_NAME','NAMA BARANG',1,NULL,NULL),(14,'MN_CARDFILE','MN_ITEM_TYPE','JENIS BARANG',1,NULL,NULL),(34,'MN_CARDFILE','MN_JENIS_JASA','JENIS JASA',1,NULL,NULL),(6,'MN_CARDFILE','MN_SUPPLIER','PEMASOK',1,NULL,NULL),(55,'MN_CARD_FILE_REPORT','MN_CUST_REPORT_DAFTARPELANGGAN','LAPORAN DAFTAR PELANGGAN',2,NULL,NULL),(56,'MN_CARD_FILE_REPORT','MN_CUST_REPORT_DAFTARPELANGGAN_CITY','LAPORAN DAFTAR PELANGGAN GROUP BY KOTA',2,NULL,NULL),(57,'MN_CARD_FILE_REPORT','MN_CUST_REPORT_RANKING_PENJUALAN','LAPORAN RANKING PENJUALAN PELANGGAN',2,NULL,NULL),(60,'MN_CARD_FILE_REPORT','MN_EMPP_REPORT_DAFTARKARYAWAN','LAPORAN DAFTAR KARYAWAN',2,NULL,NULL),(58,'MN_CARD_FILE_REPORT','MN_SUPP_REPORT_DAFTARSUPPLIER','LAPORAN DAFTAR SUPPLIER',2,NULL,NULL),(59,'MN_CARD_FILE_REPORT','MN_SUPP_REPORT_RANKING_PEMBELIAN','LAPORAN RANKING PEMBELIAN SUPPLIER',2,NULL,NULL),(245,'MN_CASHBANK_RECAP_REPORT','MN_CASHBANK_TRANS_RECAP','LAPORAN REKAPITUASI KAS / BANK',2,NULL,NULL),(242,'MN_CASHBANK_TRANS_REPORT','MN_CASHBANK_TRANS_DETAIL','LAPORAN KAS / BANK DETAIL',2,NULL,NULL),(212,'MN_CASHIER','MN_CASHIER_ADD','Akses Add',2,NULL,NULL),(213,'MN_CASHIER','MN_CASHIER_DELETE','Akses Delete',2,NULL,NULL),(211,'MN_CASHIER','MN_CASHIER_EDIT','Akses Edit',2,NULL,NULL),(214,'MN_CASHIER','MN_CASHIER_PRINT','Akses Print',2,NULL,NULL),(217,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_ADD','Akses Add',2,NULL,NULL),(218,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_DELETE','Akses Delete',2,NULL,NULL),(216,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_EDIT','Akses Edit',2,NULL,NULL),(219,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_PRINT','Akses Print',2,NULL,NULL),(244,'MN_CASH_BANK','MN_CASHBANK_RECAP_REPORT','LAPORAN REKAPITULASI ',1,NULL,NULL),(241,'MN_CASH_BANK','MN_CASHBANK_TRANS_REPORT','LAPORAN DETAIL',1,NULL,NULL),(230,'MN_CASH_BANK','MN_SPEND_MONEY','PEMBAYARAN VIA KAS/BANK',1,NULL,NULL),(312,'MN_COA','MN_COA_ADD','Akses Add',2,NULL,NULL),(313,'MN_COA','MN_COA_DELETE','Akses Delete',2,NULL,NULL),(311,'MN_COA','MN_COA_EDIT','Akses Edit',2,NULL,NULL),(314,'MN_COA','MN_COA_PRINT','Akses Print',2,NULL,NULL),(4,'MN_CUSTOMER','MN_CUSTOMER_ADD','Akses Add',2,NULL,NULL),(5,'MN_CUSTOMER','MN_CUSTOMER_DELETE','Akses Delete',2,NULL,NULL),(3,'MN_CUSTOMER','MN_CUSTOMER_EDIT','Akses Edit',2,NULL,NULL),(12,'MN_EMPLOYEE','MN_EMPLOYEE_ADD','Akses Add',2,NULL,NULL),(13,'MN_EMPLOYEE','MN_EMPLOYEE_DELETE','Akses Delete',2,NULL,NULL),(11,'MN_EMPLOYEE','MN_EMPLOYEE_EDIT','Akses Edit',2,NULL,NULL),(20,'MN_ITEM_CAT','MN_ITEM_CAT_ADD','Akses Add',2,NULL,NULL),(21,'MN_ITEM_CAT','MN_ITEM_CAT_DELETE','Akses Delete',2,NULL,NULL),(19,'MN_ITEM_CAT','MN_ITEM_CAT_EDIT','Akses Edit',2,NULL,NULL),(28,'MN_ITEM_NAME','MN_ITEM_NAME_ADD','Akses Add',2,NULL,NULL),(29,'MN_ITEM_NAME','MN_ITEM_NAME_DELETE','Akses Delete',2,NULL,NULL),(27,'MN_ITEM_NAME','MN_ITEM_NAME_EDIT','Akses Edit',2,NULL,NULL),(16,'MN_ITEM_TYPE','MN_ITEM_TYPE_ADD','Akses Add',2,NULL,NULL),(17,'MN_ITEM_TYPE','MN_ITEM_TYPE_DELETE','Akses Delete',2,NULL,NULL),(15,'MN_ITEM_TYPE','MN_ITEM_TYPE_EDIT','Akses Edit',2,NULL,NULL),(36,'MN_JENIS_JASA','MN_JENIS_JASA_ADD','Akses Add',2,NULL,NULL),(37,'MN_JENIS_JASA','MN_JENIS_JASA_DELETE','Akses Delete',2,NULL,NULL),(35,'MN_JENIS_JASA','MN_JENIS_JASA_EDIT','Akses Edit',2,NULL,NULL),(308,'MN_KOPERASI','MN_LAP_KOPERASI','LAPORAN SIMPAN PINJAM EMAS',1,NULL,NULL),(303,'MN_KOPERASI','MN_SIMPAN_PINJAM','SIMPAN PINJAM EMAS',1,NULL,NULL),(200,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_GRAFIK','LAPORAN GRAFIK PENJUALAN',2,NULL,NULL),(197,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_GROUP','LAPORAN PENJUALAN GROUP PELANGGAN',2,NULL,NULL),(198,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_RECAP','LAPORAN REKAPITULASI PENJUALAN',2,NULL,NULL),(196,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_STD','LAPORAN PENJUALAN STANDAR',2,NULL,NULL),(194,'MN_LAPORAN_JUAL','MN_LAPORAN_SO','LAPORAN SALES ORDER',2,NULL,NULL),(222,'MN_MUTASI_CASHIER','MN_MUTASI_CASHIER_DETAIL','LAPORAN KASIR DETAIL',2,NULL,NULL),(223,'MN_MUTASI_CASHIER','MN_MUTASI_CASHIER_RECAP','LAPORAN KASIR REKAP',2,NULL,NULL),(210,'MN_OUTLET_SALES','MN_CASHIER','TRANSAKSI KASIR',1,NULL,NULL),(220,'MN_OUTLET_SALES','MN_CASHIER_REGISTER','KASIR REGISTER',1,NULL,NULL),(215,'MN_OUTLET_SALES','MN_CASHIER_RETURN','RETUR TRANSAKSI KASIR',1,NULL,NULL),(193,'MN_OUTLET_SALES','MN_LAPORAN_JUAL','LAPORAN PENJUALAN',1,NULL,NULL),(221,'MN_OUTLET_SALES','MN_MUTASI_CASHIER','LAPORAN KASIR',1,NULL,NULL),(88,'MN_PO','MN_PO_ADD','Akses Add',2,NULL,NULL),(89,'MN_PO','MN_PO_DELETE','Akses Delete',2,NULL,NULL),(87,'MN_PO','MN_PO_EDIT','Akses Edit',2,NULL,NULL),(91,'MN_PO','MN_PO_EDIT_UM','Edit Uang Muka',2,NULL,NULL),(90,'MN_PO','MN_PO_PRINT','Akses Print',2,NULL,NULL),(86,'MN_PURCHASE','MN_PO','PURCHASE ORDER',1,NULL,NULL),(106,'MN_PURCHASE','MN_PURCHASE_DIRECT','PEMBELIAN LANGSUNG',1,NULL,NULL),(127,'MN_PURCHASE','MN_PURCHASE_REPORT','LAPORAN PEMBELIAN',1,NULL,NULL),(111,'MN_PURCHASE','MN_PURCHASE_RETURN','RETUR BELI',1,NULL,NULL),(97,'MN_PURCHASE','MN_PURCHASE_UM_LUNAS','PELUNASAN PESANAN PO',1,NULL,NULL),(108,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_ADD','Akses Add',2,NULL,NULL),(109,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_DELETE','Akses Delete',2,NULL,NULL),(107,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_EDIT','Akses Edit',2,NULL,NULL),(110,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_PRINT','Akses Print',2,NULL,NULL),(129,'MN_PURCHASE_REPORT','MN_LAP_PO','LAPORAN PO',2,NULL,NULL),(131,'MN_PURCHASE_REPORT','MN_LAP_PURCH','LAPORAN PEMBELIAN STANDAR',2,NULL,NULL),(136,'MN_PURCHASE_REPORT','MN_LAP_PURCH_GRAPHIC','LAPORAN GRAFIK PEMBELIAN',2,NULL,NULL),(133,'MN_PURCHASE_REPORT','MN_LAP_PURCH_GROUP_PERIOD','LAPORAN PEMBELIAN GRUP PERIODE',2,NULL,NULL),(132,'MN_PURCHASE_REPORT','MN_LAP_PURCH_GROUP_SUPP','LAPORAN PEMBELIAN GRUP SUPPLIER',2,NULL,NULL),(113,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_ADD','Akses Add',2,NULL,NULL),(114,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_DELETE','Akses Delete',2,NULL,NULL),(112,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_EDIT','Akses Edit',2,NULL,NULL),(115,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_PRINT','Akses Print',2,NULL,NULL),(98,'MN_PURCHASE_UM_LUNAS','MN_PURCHASE_UM_LUNAS_ADD','Akses Add',2,NULL,NULL),(99,'MN_PURCHASE_UM_LUNAS','MN_PURCHASE_UM_LUNAS_DELETE','Akses Delete',2,NULL,NULL),(100,'MN_PURCHASE_UM_LUNAS','MN_PURCHASE_UM_LUNAS_EDIT','Akses Edit',2,NULL,NULL),(175,'MN_SALES','MN_SALES_RETURN','RETUR JUAL',1,NULL,NULL),(155,'MN_SALES','MN_SALES_UM_LUNAS','PELUNASAN PESANAN SO',1,NULL,NULL),(148,'MN_SALES','MN_SO','ORDER PENJUALAN',1,NULL,NULL),(177,'MN_SALES_RETURN','MN_SALES_RETURN_ADD','Akses Add',2,NULL,NULL),(178,'MN_SALES_RETURN','MN_SALES_RETURN_DELETE','Akses Delete',2,NULL,NULL),(176,'MN_SALES_RETURN','MN_SALES_RETURN_EDIT','Akses Edit',2,NULL,NULL),(179,'MN_SALES_RETURN','MN_SALES_RETURN_PRINT','Akses Print',2,NULL,NULL),(156,'MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_ADD','Akses Add',2,NULL,NULL),(157,'MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_DELETE','Akses Delete',2,NULL,NULL),(158,'MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_EDIT','Akses Edit',2,NULL,NULL),(159,'MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_PRINT','Akses Print',2,NULL,NULL),(304,'MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_ADD','Akses Add',2,NULL,NULL),(306,'MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_DELETE','Akses Delete',2,NULL,NULL),(305,'MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_EDIT','Akses Edit',2,NULL,NULL),(307,'MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_PRINT','Akses Print',2,NULL,NULL),(150,'MN_SO','MN_SO_ADD','Akses Add',2,NULL,NULL),(151,'MN_SO','MN_SO_DELETE','Akses Delete',2,NULL,NULL),(149,'MN_SO','MN_SO_EDIT','Akses Edit',2,NULL,NULL),(152,'MN_SO','MN_SO_PRINT','Akses Print',2,NULL,NULL),(232,'MN_SPEND_MONEY','MN_SPEND_MONEY_ADD','Akses Add',2,NULL,NULL),(233,'MN_SPEND_MONEY','MN_SPEND_MONEY_DELETE','Akses Delete',2,NULL,NULL),(231,'MN_SPEND_MONEY','MN_SPEND_MONEY_EDIT','Akses Edit',2,NULL,NULL),(234,'MN_SPEND_MONEY','MN_SPEND_MONEY_PRINT','Akses Print',2,NULL,NULL),(66,'MN_STOCK','MN_STOCK_CORRECTION','KOREKSI STOK',1,NULL,NULL),(62,'MN_STOCK','MN_STOCK_OPNAME','STOK OPNAME',1,NULL,NULL),(75,'MN_STOCK','MN_STOCK_REPORT','LAPORAN STOK',1,NULL,NULL),(68,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_ADD','Akses Add',2,NULL,NULL),(69,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_DELETE','Akses Delete',2,NULL,NULL),(67,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_EDIT','Akses Edit',2,NULL,NULL),(64,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_ADD','Akses Add',2,NULL,NULL),(65,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_DELETE','Akses Delete',2,NULL,NULL),(63,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_EDIT','Akses Edit',2,NULL,NULL),(76,'MN_STOCK_REPORT','MN_STOCK_ADJUSTMENT_REPORT','LAPORAN KOREKSI STOK',2,NULL,NULL),(78,'MN_STOCK_REPORT','MN_STOCK_CARD_COGS','KARTU STOK DENGAN HPP PER ITEM',2,NULL,NULL),(77,'MN_STOCK_REPORT','MN_STOCK_MUTATION_REPORT','LAPORAN MUTASI STOK',2,NULL,NULL),(8,'MN_SUPPLIER','MN_SUPPLIER_ADD','Akses Add',2,NULL,NULL),(9,'MN_SUPPLIER','MN_SUPPLIER_DELETE','Akses Delete',2,NULL,NULL),(7,'MN_SUPPLIER','MN_SUPPLIER_EDIT','Akses Edit',2,NULL,NULL),(346,'MN_TOOLS','MN_BACKUP','BACKUP',1,NULL,NULL),(352,'MN_TOOLS','MN_CLEANSING_DB','CLEANSING DB',1,NULL,NULL),(348,'MN_TOOLS','MN_RESTORE','RESTORE',1,NULL,NULL),(351,'MN_TOOLS','MN_SET_PATH','SETUP IMAGE DIREKTORI PATH',1,NULL,NULL),(350,'MN_TOOLS','MN_USERMANAGE','PENGATURAN USER',1,NULL,NULL),(309,'ROOT','MN_ACCOUNT','AKUNTANSI',0,NULL,NULL),(1,'ROOT','MN_CARDFILE','MASTER DATA',0,NULL,NULL),(224,'ROOT','MN_CASH_BANK','KEUANGAN',0,NULL,NULL),(302,'ROOT','MN_KOPERASI','SIMPAN PINJAM',0,NULL,NULL),(209,'ROOT','MN_OUTLET_SALES','KASIR',0,NULL,NULL),(79,'ROOT','MN_PURCHASE','PEMBELIAN',0,NULL,NULL),(145,'ROOT','MN_SALES','PESANAN PENJUALAN',0,NULL,NULL),(61,'ROOT','MN_STOCK','STOK',0,NULL,NULL),(345,'ROOT','MN_TOOLS','TOOLS',0,NULL,NULL);
/*!40000 ALTER TABLE `i_templatehakakses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_templatehakakses_def`
--

DROP TABLE IF EXISTS `i_templatehakakses_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_templatehakakses_def` (
  `nourut` int(11) NOT NULL AUTO_INCREMENT,
  `parentkey` varchar(60) NOT NULL,
  `childkey` varchar(60) NOT NULL,
  `notes` text,
  `ismenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATEHAKAKSES_PK` (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATENOOROT` (`nourut`) USING BTREE,
  KEY `PARENTKEY` (`parentkey`),
  KEY `CHILDKEY` (`childkey`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_templatehakakses_def`
--

LOCK TABLES `i_templatehakakses_def` WRITE;
/*!40000 ALTER TABLE `i_templatehakakses_def` DISABLE KEYS */;
INSERT INTO `i_templatehakakses_def` VALUES (352,'MN_ACCOUNT','MN_ACCOUNTING_REPORT','LAPORAN AKUNTANSI',1),(351,'MN_ACCOUNT','MN_CLOSE_PERIOD','TUTUP PERIODE TRANSAKSI',1),(328,'MN_ACCOUNT','MN_COA','CHART OF ACCOUNT',1),(360,'MN_ACCOUNTING_REPORT','MN_INCOME_STATEMENT','LAPORAN LABA - RUGI',1),(44,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_ADD','Akses Add',2),(45,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_DELETE','Akses Delete',2),(43,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_EDIT','Akses Edit',2),(42,'MN_CARDFILE','MN_BEGINING_BALANCE','SALDO AWAL BARANG',1),(69,'MN_CARDFILE','MN_CARD_FILE_REPORT','LAPORAN MASTER',1),(14,'MN_CARDFILE','MN_CUSTOMER','PELANGGAN',1),(22,'MN_CARDFILE','MN_EMPLOYEE','KARYAWAN',1),(30,'MN_CARDFILE','MN_ITEM_CAT','KATEGORI BARANG',1),(38,'MN_CARDFILE','MN_ITEM_NAME','NAMA BARANG',1),(26,'MN_CARDFILE','MN_ITEM_TYPE','JENIS BARANG',1),(46,'MN_CARDFILE','MN_JENIS_JASA','JENIS JASA',1),(18,'MN_CARDFILE','MN_SUPPLIER','PEMASOK',1),(70,'MN_CARD_FILE_REPORT','MN_CUST_REPORT_DAFTARPELANGGAN','LAPORAN DAFTAR PELANGGAN',1),(71,'MN_CARD_FILE_REPORT','MN_CUST_REPORT_DAFTARPELANGGAN_CITY','LAPORAN DAFTAR PELANGGAN GROUP BY KOTA',1),(72,'MN_CARD_FILE_REPORT','MN_CUST_REPORT_RANKING_PENJUALAN','LAPORAN RANKING PENJUALAN PELANGGAN',1),(75,'MN_CARD_FILE_REPORT','MN_EMPP_REPORT_DAFTARKARYAWAN','LAPORAN DAFTAR KARYAWAN',1),(73,'MN_CARD_FILE_REPORT','MN_SUPP_REPORT_DAFTARSUPPLIER','LAPORAN DAFTAR SUPPLIER',1),(74,'MN_CARD_FILE_REPORT','MN_SUPP_REPORT_RANKING_PEMBELIAN','LAPORAN RANKING PEMBELIAN SUPPLIER',1),(255,'MN_CASHBANK_RECAP_REPORT','MN_CASHBANK_TRANS_RECAP','LAPORAN REKAPITUASI KAS / BANK',1),(252,'MN_CASHBANK_TRANS_REPORT','MN_CASHBANK_TRANS_DETAIL','LAPORAN KAS / BANK DETAIL',2),(223,'MN_CASHIER','MN_CASHIER_ADD','Akses Add',2),(224,'MN_CASHIER','MN_CASHIER_DELETE','Akses Delete',2),(222,'MN_CASHIER','MN_CASHIER_EDIT','Akses Edit',2),(225,'MN_CASHIER','MN_CASHIER_PRINT','Akses Print',2),(228,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_ADD','Akses Add',2),(229,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_DELETE','Akses Delete',2),(227,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_EDIT','Akses Edit',2),(230,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_PRINT','Akses Print',2),(254,'MN_CASH_BANK','MN_CASHBANK_RECAP_REPORT','LAPORAN REKAPITULASI ',1),(251,'MN_CASH_BANK','MN_CASHBANK_TRANS_REPORT','LAPORAN DETAIL',1),(240,'MN_CASH_BANK','MN_SPEND_MONEY','PEMBAYARAN VIA KAS/BANK',1),(330,'MN_COA','MN_COA_ADD','Akses Add',2),(331,'MN_COA','MN_COA_DELETE','Akses Delete',2),(329,'MN_COA','MN_COA_EDIT','Akses Edit',2),(332,'MN_COA','MN_COA_PRINT','Akses Print',2),(16,'MN_CUSTOMER','MN_CUSTOMER_ADD','Akses Add',2),(17,'MN_CUSTOMER','MN_CUSTOMER_DELETE','Akses Delete',2),(15,'MN_CUSTOMER','MN_CUSTOMER_EDIT','Akses Edit',2),(24,'MN_EMPLOYEE','MN_EMPLOYEE_ADD','Akses Add',2),(25,'MN_EMPLOYEE','MN_EMPLOYEE_DELETE','Akses Delete',2),(23,'MN_EMPLOYEE','MN_EMPLOYEE_EDIT','Akses Edit',2),(32,'MN_ITEM_CAT','MN_ITEM_CAT_ADD','Akses Add',2),(33,'MN_ITEM_CAT','MN_ITEM_CAT_DELETE','Akses Delete',2),(31,'MN_ITEM_CAT','MN_ITEM_CAT_EDIT','Akses Edit',2),(40,'MN_ITEM_NAME','MN_ITEM_NAME_ADD','Akses Add',2),(41,'MN_ITEM_NAME','MN_ITEM_NAME_DELETE','Akses Delete',2),(39,'MN_ITEM_NAME','MN_ITEM_NAME_EDIT','Akses Edit',2),(28,'MN_ITEM_TYPE','MN_ITEM_TYPE_ADD','Akses Add',2),(29,'MN_ITEM_TYPE','MN_ITEM_TYPE_DELETE','Akses Delete',2),(27,'MN_ITEM_TYPE','MN_ITEM_TYPE_EDIT','Akses Edit',2),(48,'MN_JENIS_JASA','MN_JENIS_JASA_ADD','Akses Add',2),(49,'MN_JENIS_JASA','MN_JENIS_JASA_DELETE','Akses Delete',2),(47,'MN_JENIS_JASA','MN_JENIS_JASA_EDIT','Akses Edit',2),(327,'MN_KOPERASI','MN_LAP_KOPERASI','LAPORAN SIMPAN PINJAM EMAS',1),(322,'MN_KOPERASI','MN_SIMPAN_PINJAM','SIMPAN PINJAM EMAS',1),(212,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_GRAFIK','LAPORAN GRAFIK PENJUALAN',1),(209,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_GROUP','LAPORAN PENJUALAN GROUP PELANGGAN',1),(210,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_RECAP','LAPORAN REKAPITULASI PENJUALAN',1),(208,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_STD','LAPORAN PENJUALAN STANDAR',1),(206,'MN_LAPORAN_JUAL','MN_LAPORAN_SO','LAPORAN SALES ORDER',1),(233,'MN_MUTASI_CASHIER','MN_MUTASI_CASHIER_DETAIL','LAPORAN KASIR DETAIL',2),(234,'MN_MUTASI_CASHIER','MN_MUTASI_CASHIER_RECAP','LAPORAN KASIR REKAP',2),(221,'MN_OUTLET_SALES','MN_CASHIER','TRANSAKSI KASIR',1),(231,'MN_OUTLET_SALES','MN_CASHIER_REGISTER','KASIR REGISTER',1),(226,'MN_OUTLET_SALES','MN_CASHIER_RETURN','RETUR TRANSAKSI KASIR',1),(205,'MN_OUTLET_SALES','MN_LAPORAN_JUAL','LAPORAN PENJUALAN',1),(232,'MN_OUTLET_SALES','MN_MUTASI_CASHIER','LAPORAN KASIR',1),(101,'MN_PO','MN_PO_ADD','Akses Add',2),(102,'MN_PO','MN_PO_DELETE','Akses Delete',2),(100,'MN_PO','MN_PO_EDIT','Akses Edit',2),(104,'MN_PO','MN_PO_EDIT_UM','Edit Uang Muka',2),(103,'MN_PO','MN_PO_PRINT','Akses Print',2),(99,'MN_PURCHASE','MN_PO','PURCHASE ORDER',1),(119,'MN_PURCHASE','MN_PURCHASE_DIRECT','PEMBELIAN LANGSUNG',1),(140,'MN_PURCHASE','MN_PURCHASE_REPORT','LAPORAN PEMBELIAN',1),(124,'MN_PURCHASE','MN_PURCHASE_RETURN','RETUR BELI',1),(110,'MN_PURCHASE','MN_PURCHASE_UM_LUNAS','PELUNASAN PESANAN PO',1),(121,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_ADD','Akses Add',2),(122,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_DELETE','Akses Delete',2),(120,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_EDIT','Akses Edit',2),(123,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_PRINT','Akses Print',2),(142,'MN_PURCHASE_REPORT','MN_LAP_PO','LAPORAN PO',1),(144,'MN_PURCHASE_REPORT','MN_LAP_PURCH','LAPORAN PEMBELIAN STANDAR',1),(149,'MN_PURCHASE_REPORT','MN_LAP_PURCH_GRAPHIC','LAPORAN GRAFIK PEMBELIAN',1),(146,'MN_PURCHASE_REPORT','MN_LAP_PURCH_GROUP_PERIOD','LAPORAN PEMBELIAN GRUP PERIODE',1),(145,'MN_PURCHASE_REPORT','MN_LAP_PURCH_GROUP_SUPP','LAPORAN PEMBELIAN GRUP SUPPLIER',1),(126,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_ADD','Akses Add',2),(127,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_DELETE','Akses Delete',2),(125,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_EDIT','Akses Edit',2),(128,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_PRINT','Akses Print',2),(111,'MN_PURCHASE_UM_LUNAS','MN_PURCHASE_UM_LUNAS_ADD','Akses Add',2),(112,'MN_PURCHASE_UM_LUNAS','MN_PURCHASE_UM_LUNAS_DELETE','Akses Delete',2),(113,'MN_PURCHASE_UM_LUNAS','MN_PURCHASE_UM_LUNAS_EDIT','Akses Edit',2),(187,'MN_SALES','MN_SALES_RETURN','RETUR JUAL',1),(167,'MN_SALES','MN_SALES_UM_LUNAS','PELUNASAN PESANAN SO',1),(160,'MN_SALES','MN_SO','ORDER PENJUALAN',1),(189,'MN_SALES_RETURN','MN_SALES_RETURN_ADD','Akses Add',2),(190,'MN_SALES_RETURN','MN_SALES_RETURN_DELETE','Akses Delete',2),(188,'MN_SALES_RETURN','MN_SALES_RETURN_EDIT','Akses Edit',2),(191,'MN_SALES_RETURN','MN_SALES_RETURN_PRINT','Akses Print',2),(168,'MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_ADD','Akses Add',2),(169,'MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_DELETE','Akses Delete',2),(170,'MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_EDIT','Akses Edit',2),(171,'MN_SALES_UM_LUNAS','MN_SALES_UM_LUNAS_PRINT','Akses Print',2),(323,'MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_ADD','Akses Add',2),(325,'MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_DELETE','Akses Delete',2),(324,'MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_EDIT','Akses Edit',2),(326,'MN_SIMPAN_PINJAM','MN_SIMPAN_PINJAM_PRINT','Akses Print',2),(162,'MN_SO','MN_SO_ADD','Akses Add',2),(163,'MN_SO','MN_SO_DELETE','Akses Delete',2),(161,'MN_SO','MN_SO_EDIT','Akses Edit',2),(164,'MN_SO','MN_SO_PRINT','Akses Print',2),(242,'MN_SPEND_MONEY','MN_SPEND_MONEY_ADD','Akses Add',2),(243,'MN_SPEND_MONEY','MN_SPEND_MONEY_DELETE','Akses Delete',2),(241,'MN_SPEND_MONEY','MN_SPEND_MONEY_EDIT','Akses Edit',2),(244,'MN_SPEND_MONEY','MN_SPEND_MONEY_PRINT','Akses Print',2),(80,'MN_STOCK','MN_STOCK_CORRECTION','KOREKSI STOK',1),(76,'MN_STOCK','MN_STOCK_OPNAME','STOK OPNAME',1),(89,'MN_STOCK','MN_STOCK_REPORT','LAPORAN STOK',1),(82,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_ADD','Akses Add',2),(83,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_DELETE','Akses Delete',2),(81,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_EDIT','Akses Edit',2),(78,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_ADD','Akses Add',2),(79,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_DELETE','Akses Delete',2),(77,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_EDIT','Akses Edit',2),(90,'MN_STOCK_REPORT','MN_STOCK_ADJUSTMENT_REPORT','LAPORAN KOREKSI STOK',2),(92,'MN_STOCK_REPORT','MN_STOCK_CARD_COGS','KARTU STOK DENGAN HPP PER ITEM',2),(91,'MN_STOCK_REPORT','MN_STOCK_MUTATION_REPORT','LAPORAN MUTASI STOK',2),(20,'MN_SUPPLIER','MN_SUPPLIER_ADD','Akses Add',2),(21,'MN_SUPPLIER','MN_SUPPLIER_DELETE','Akses Delete',2),(19,'MN_SUPPLIER','MN_SUPPLIER_EDIT','Akses Edit',2),(363,'MN_TOOLS','MN_BACKUP','BACKUP',1),(369,'MN_TOOLS','MN_CLEANSING_DB','CLEANSING DB',1),(365,'MN_TOOLS','MN_RESTORE','RESTORE',1),(368,'MN_TOOLS','MN_SET_PATH','SETUP IMAGE DIREKTORI PATH',1),(367,'MN_TOOLS','MN_USERMANAGE','PENGATURAN USER',1),(12,'ROOT','MN_ACCOUNT','AKUNTANSI',0),(1,'ROOT','MN_CARDFILE','MASTER DATA',0),(6,'ROOT','MN_CASH_BANK','KEUANGAN',0),(11,'ROOT','MN_KOPERASI','SIMPAN PINJAM',0),(5,'ROOT','MN_OUTLET_SALES','KASIR',0),(3,'ROOT','MN_PURCHASE','PEMBELIAN',0),(4,'ROOT','MN_SALES','PESANAN PENJUALAN',0),(2,'ROOT','MN_STOCK','STOK',0),(13,'ROOT','MN_TOOLS','TOOLS',0);
/*!40000 ALTER TABLE `i_templatehakakses_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_templatehakakses_pos`
--

DROP TABLE IF EXISTS `i_templatehakakses_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_templatehakakses_pos` (
  `nourut` int(11) NOT NULL,
  `parentkey` varchar(120) NOT NULL,
  `childkey` varchar(120) NOT NULL,
  `notes` varchar(400) DEFAULT NULL,
  `ismenu` int(11) DEFAULT NULL,
  `icon_webapp` varchar(250) DEFAULT NULL,
  `link_webapp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATEHAKAKSES_PK` (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATENOOROT` (`nourut`) USING BTREE,
  KEY `PARENTKEY` (`parentkey`),
  KEY `CHILDKEY` (`childkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_templatehakakses_pos`
--

LOCK TABLES `i_templatehakakses_pos` WRITE;
/*!40000 ALTER TABLE `i_templatehakakses_pos` DISABLE KEYS */;
INSERT INTO `i_templatehakakses_pos` VALUES (259,'MN_ACCOUNT','MN_ACCOUNTING_REPORT','LAPORAN AKUNTANSI',1,'fa fa-circle-o',NULL),(252,'MN_ACCOUNT','MN_ADJUST_JOURNAL','JURNAL PENYESUAIAN',1,'fa fa-circle-o',NULL),(246,'MN_ACCOUNT','MN_AP_SETUP','SETUP CADANGAN HUTANG',1,'fa fa-circle-o',NULL),(245,'MN_ACCOUNT','MN_AR_SETUP','SETUP CADANGAN PIUTANG',1,'fa fa-circle-o',NULL),(242,'MN_ACCOUNT','MN_CASHBANK_SETUP','KAS/BANK SETUP',1,'fa fa-circle-o',NULL),(243,'MN_ACCOUNT','MN_CASHFLOW_SETUP','SETUP KOMPONEN CASH FLOW',1,'fa fa-circle-o',NULL),(258,'MN_ACCOUNT','MN_CLOSE_PERIOD','TUTUP PERIODE AKUNTANSI',1,'fa fa-circle-o',NULL),(236,'MN_ACCOUNT','MN_COA','CHART OF ACCOUNT',1,'fa fa-circle-o',NULL),(244,'MN_ACCOUNT','MN_COA_ASET_SETUP','SETUP COA ASET',1,'fa fa-circle-o',NULL),(241,'MN_ACCOUNT','MN_COA_SETUP','SETUP COA INTEGRATION',1,'fa fa-circle-o',NULL),(247,'MN_ACCOUNT','MN_JOURNAL','JURNAL UMUM',1,'fa fa-circle-o',NULL),(257,'MN_ACCOUNT','MN_LEDGER','HISTORY AKUN',1,'fa fa-circle-o',NULL),(264,'MN_ACCOUNTING_REPORT','MN_BALANCE_SHEET_SCONTRO','LAPORAN NERACA (SKONTRO)',1,'fa fa-circle-o',NULL),(265,'MN_ACCOUNTING_REPORT','MN_BALANCE_SHEET_STAFFEL','LAPORAN NERACA (STAFFEL)',1,'fa fa-circle-o',NULL),(269,'MN_ACCOUNTING_REPORT','MN_CASHFLOW_REPORT','LAPORAN ARUS KAS',1,'fa fa-circle-o',NULL),(266,'MN_ACCOUNTING_REPORT','MN_COGS_REPORT','LAPORAN HARGA POKOK PENJUALAN BARANG',1,'fa fa-circle-o',NULL),(268,'MN_ACCOUNTING_REPORT','MN_EQUITY_REPORT','LAPORAN PERUBAHAN EKUITAS',1,'fa fa-circle-o',NULL),(261,'MN_ACCOUNTING_REPORT','MN_GENERAL_LEDGER_REPORT','LAPORAN BUKU BESAR',1,'fa fa-circle-o',NULL),(267,'MN_ACCOUNTING_REPORT','MN_INCOME_STATEMENT','LAPORAN LABA - RUGI',1,'fa fa-circle-o',NULL),(260,'MN_ACCOUNTING_REPORT','MN_JOURNAL_REPORT','LAPORAN DAFTAR JURNAL',1,'fa fa-circle-o',NULL),(262,'MN_ACCOUNTING_REPORT','MN_TRIAL_BALANCE','LAPORAN NERACA SALDO',1,'fa fa-circle-o',NULL),(263,'MN_ACCOUNTING_REPORT','MN_TRIAL_BALANCE_ADJUSTED','LAPORAN NERACA SALDO SETELAH PENYESUAIAN',1,'fa fa-circle-o',NULL),(254,'MN_ADJUST_JOURNAL','MN_ADJUSTJOURNAL_ADD','Akses Add',2,'',NULL),(255,'MN_ADJUST_JOURNAL','MN_ADJUSTJOURNAL_DELETE','Akses Delete',2,'',NULL),(253,'MN_ADJUST_JOURNAL','MN_ADJUSTJOURNAL_EDIT','Akses Edit',2,'',NULL),(256,'MN_ADJUST_JOURNAL','MN_ADJUSTJOURNAL_PRINT','Akses Print',2,'',NULL),(121,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_ADD','Akses Add',2,'',NULL),(122,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_DELETE','Akses Delete',2,'',NULL),(120,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_EDIT','Akses Edit',2,'',NULL),(123,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_PRINT','Akses Print',2,'',NULL),(146,'MN_AP_REPORT','MN_LAP_APBALANCE_RECAP','LAPORAN REKAP SALDO HUTANG',1,'fa fa-circle-o',NULL),(143,'MN_AP_REPORT','MN_LAP_APPAYMENT_HISTORY','LAPORAN HISTORY PEMBAYARAN HUTANG',1,'fa fa-circle-o',NULL),(144,'MN_AP_REPORT','MN_LAP_APPAYMENT_PAIDOFF','LAPORAN PIUTANG LUNAS',1,'fa fa-circle-o',NULL),(145,'MN_AP_REPORT','MN_LAP_APPAYMENT_RECAP','LAPORAN REKAP PEMBAYARAN HUTANG',1,'fa fa-circle-o',NULL),(142,'MN_AP_REPORT','MN_LAP_AP_AGING','LAPORAN UMUR HUTANG',1,'fa fa-circle-o',NULL),(141,'MN_AP_REPORT','MN_LAP_AP_CARD','LAPORAN KARTU HUTANG SUPPLIER',1,'fa fa-circle-o',NULL),(147,'MN_AP_REPORT','MN_LAP_EST_APDUEDATE','LAPORAN ESTIMASI HUTANG JT TEMPO',1,'fa fa-circle-o',NULL),(181,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_ADD','Akses Add',2,'',NULL),(182,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_DELETE','Akses Delete',2,'',NULL),(180,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_EDIT','Akses Edit',2,'',NULL),(183,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_PRINT','Akses Print',2,'',NULL),(39,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_ADD','Akses Add',2,'',NULL),(40,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_DELETE','Akses Delete',2,'',NULL),(38,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_EDIT','Akses Edit',2,'',NULL),(37,'MN_CARDFILE','MN_BEGINING_BALANCE','SALDO AWAL BARANG',1,'fa fa-circle-o',NULL),(64,'MN_CARDFILE','MN_CARD_FILE_REPORT','LAPORAN MASTER',1,'fa fa-circle-o',NULL),(53,'MN_CARDFILE','MN_CURRENCY','MATA UANG DAN KONVERSI',1,'fa fa-circle-o',NULL),(9,'MN_CARDFILE','MN_CUSTOMER','PELANGGAN',1,'fa fa-circle-o',NULL),(17,'MN_CARDFILE','MN_EMPLOYEE','KARYAWAN',1,'fa fa-circle-o',NULL),(60,'MN_CARDFILE','MN_EXPEDITION','EKSPEDISI DAN TARIF',1,'fa fa-circle-o',NULL),(29,'MN_CARDFILE','MN_ITEM_BRAND','MEREK BARANG',1,'fa fa-circle-o',NULL),(25,'MN_CARDFILE','MN_ITEM_CAT','KATEGORI BARANG',1,'fa fa-circle-o',NULL),(33,'MN_CARDFILE','MN_ITEM_NAME','NAMA BARANG',1,'fa fa-circle-o',NULL),(21,'MN_CARDFILE','MN_ITEM_TYPE','JENIS BARANG',1,'fa fa-circle-o',NULL),(41,'MN_CARDFILE','MN_JENIS_JASA','JENIS JASA',1,'fa fa-circle-o',NULL),(13,'MN_CARDFILE','MN_SUPPLIER','PEMASOK',1,'fa fa-circle-o',NULL),(45,'MN_CARDFILE','MN_UNIT','SATUAN DAN KONVERSI',1,'fa fa-circle-o',NULL),(49,'MN_CARDFILE','MN_WAREHOUSE','GUDANG',1,'fa fa-circle-o',NULL),(65,'MN_CARD_FILE_REPORT','MN_CUST_REPORT_DAFTARPELANGGAN','LAPORAN DAFTAR PELANGGAN',1,'fa fa-circle-o',NULL),(66,'MN_CARD_FILE_REPORT','MN_CUST_REPORT_DAFTARPELANGGAN_CITY','LAPORAN DAFTAR PELANGGAN GROUP BY KOTA',1,'fa fa-circle-o',NULL),(67,'MN_CARD_FILE_REPORT','MN_CUST_REPORT_RANKING_PENJUALAN','LAPORAN RANKING PENJUALAN PELANGGAN',1,'fa fa-circle-o',NULL),(70,'MN_CARD_FILE_REPORT','MN_EMPP_REPORT_DAFTARKARYAWAN','LAPORAN DAFTAR KARYAWAN',1,'fa fa-circle-o',NULL),(68,'MN_CARD_FILE_REPORT','MN_SUPP_REPORT_DAFTARSUPPLIER','LAPORAN DAFTAR SUPPLIER',1,'fa fa-circle-o',NULL),(69,'MN_CARD_FILE_REPORT','MN_SUPP_REPORT_RANKING_PEMBELIAN','LAPORAN RANKING PEMBELIAN SUPPLIER',1,'fa fa-circle-o',NULL),(235,'MN_CASHBANK_RECAP_REPORT','MN_CASHBANK_TRANS_RECAP','LAPORAN REKAPITUASI KAS / BANK',NULL,'',NULL),(233,'MN_CASHBANK_TRANS_REPORT','MN_CASHBANK_REKON_DETAIL','LAPORAN REKONSILIASI DETAIL',2,'',NULL),(232,'MN_CASHBANK_TRANS_REPORT','MN_CASHBANK_TRANS_DETAIL','LAPORAN KAS / BANK DETAIL',2,'',NULL),(208,'MN_CASHIER','MN_CASHIER_ADD','Akses Add',2,'',NULL),(209,'MN_CASHIER','MN_CASHIER_DELETE','Akses Delete',2,'',NULL),(207,'MN_CASHIER','MN_CASHIER_EDIT','Akses Edit',2,'',NULL),(210,'MN_CASHIER','MN_CASHIER_PRINT','Akses Print',2,'',NULL),(213,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_ADD','Akses Add',2,'',NULL),(214,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_DELETE','Akses Delete',2,'',NULL),(212,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_EDIT','Akses Edit',2,'',NULL),(215,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_PRINT','Akses Print',2,'',NULL),(234,'MN_CASH_BANK','MN_CASHBANK_RECAP_REPORT','LAPORAN REKAPITULASI ',1,'fa fa-circle-o',NULL),(230,'MN_CASH_BANK','MN_CASHBANK_REGISTER','KAS/BANK REGISTER',1,'fa fa-circle-o',NULL),(231,'MN_CASH_BANK','MN_CASHBANK_TRANS_REPORT','LAPORAN DETAIL',1,'fa fa-circle-o',NULL),(220,'MN_CASH_BANK','MN_RECEIPT_MONEY','PENERIMAAN KAS/BANK',1,'fa fa-circle-o',NULL),(225,'MN_CASH_BANK','MN_SPEND_MONEY','PENGELUARAN KAS/BANK',1,'fa fa-circle-o',NULL),(238,'MN_COA','MN_COA_ADD','Akses Add',2,'',NULL),(239,'MN_COA','MN_COA_DELETE','Akses Delete',2,'',NULL),(237,'MN_COA','MN_COA_EDIT','Akses Edit',2,'',NULL),(240,'MN_COA','MN_COA_PRINT','Akses Print',2,'',NULL),(55,'MN_CURRENCY','MN_CURRENCY_ADD','Akses Add',2,'',NULL),(56,'MN_CURRENCY','MN_CURRENCY_DELETE','Akses Delete',2,'',NULL),(54,'MN_CURRENCY','MN_CURRENCY_EDIT','Akses Edit',2,'',NULL),(58,'MN_CURRENCY_CONVERSION','MN_CURRENCY_CONVERSION_ADD','Akses Add',2,'',NULL),(59,'MN_CURRENCY_CONVERSION','MN_CURRENCY_CONVERSION_DELETE','Akses Delete',2,'',NULL),(57,'MN_CURRENCY_CONVERSION','MN_CURRENCY_CONVERSION_EDIT','Akses Edit',2,'',NULL),(11,'MN_CUSTOMER','MN_CUSTOMER_ADD','Akses Add',2,'',NULL),(12,'MN_CUSTOMER','MN_CUSTOMER_DELETE','Akses Delete',2,'',NULL),(10,'MN_CUSTOMER','MN_CUSTOMER_EDIT','Akses Edit',2,'',NULL),(159,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_ADD','Akses Add',2,'',NULL),(160,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_DELETE','Akses Delete',2,'',NULL),(158,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_EDIT','Akses Edit',2,'',NULL),(161,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_PRINT','Akses Print',2,'',NULL),(156,'MN_DP_SO','MN_DP_SO_EDIT','Akses Edit',2,'',NULL),(19,'MN_EMPLOYEE','MN_EMPLOYEE_ADD','Akses Add',2,'',NULL),(20,'MN_EMPLOYEE','MN_EMPLOYEE_DELETE','Akses Delete',2,'',NULL),(18,'MN_EMPLOYEE','MN_EMPLOYEE_EDIT','Akses Edit',2,'',NULL),(62,'MN_EXPEDITION','MN_EXPEDITION_ADD','Akses Add',2,'',NULL),(63,'MN_EXPEDITION','MN_EXPEDITION_DELETE','Akses Delete',2,'',NULL),(61,'MN_EXPEDITION','MN_EXPEDITION_EDIT','Akses Edit',2,'',NULL),(164,'MN_EXPEDITION_PAYMENT','MN_EXPEDITION_PAYMENT_ADD','Akses Add',2,'',NULL),(165,'MN_EXPEDITION_PAYMENT','MN_EXPEDITION_PAYMENT_DELETE','Akses Delete',2,'',NULL),(163,'MN_EXPEDITION_PAYMENT','MN_EXPEDITION_PAYMENT_EDIT','Akses Edit',2,'',NULL),(166,'MN_EXPEDITION_PAYMENT','MN_EXPEDITION_PAYMENT_PRINT','Akses Print',2,'',NULL),(178,'MN_FAKTUR_PAJAK','MN_FAKTUR_PAJAK_PRINT','Akses Print',2,'',NULL),(31,'MN_ITEM_BRAND','MN_ITEM_BRAND_ADD','Akses Add',2,'',NULL),(32,'MN_ITEM_BRAND','MN_ITEM_BRAND_DELETE','Akses Delete',2,'',NULL),(30,'MN_ITEM_BRAND','MN_ITEM_BRAND_EDIT','Akses Edit',2,'',NULL),(27,'MN_ITEM_CAT','MN_ITEM_CAT_ADD','Akses Add',2,'',NULL),(28,'MN_ITEM_CAT','MN_ITEM_CAT_DELETE','Akses Delete',2,'',NULL),(26,'MN_ITEM_CAT','MN_ITEM_CAT_EDIT','Akses Edit',2,'',NULL),(35,'MN_ITEM_NAME','MN_ITEM_NAME_ADD','Akses Add',2,'',NULL),(36,'MN_ITEM_NAME','MN_ITEM_NAME_DELETE','Akses Delete',2,'',NULL),(34,'MN_ITEM_NAME','MN_ITEM_NAME_EDIT','Akses Edit',2,'',NULL),(23,'MN_ITEM_TYPE','MN_ITEM_TYPE_ADD','Akses Add',2,'',NULL),(24,'MN_ITEM_TYPE','MN_ITEM_TYPE_DELETE','Akses Delete',2,'',NULL),(22,'MN_ITEM_TYPE','MN_ITEM_TYPE_EDIT','Akses Edit',2,'',NULL),(43,'MN_JENIS_JASA','MN_JENIS_JASA_ADD','Akses Add',2,'',NULL),(44,'MN_JENIS_JASA','MN_JENIS_JASA_DELETE','Akses Delete',2,'',NULL),(42,'MN_JENIS_JASA','MN_JENIS_JASA_EDIT','Akses Edit',2,'',NULL),(249,'MN_JOURNAL','MN_JOURNAL_ADD','Akses Add',2,'',NULL),(250,'MN_JOURNAL','MN_JOURNAL_DELETE','Akses Delete',2,'',NULL),(248,'MN_JOURNAL','MN_JOURNAL_EDIT','Akses Edit',2,'',NULL),(251,'MN_JOURNAL','MN_JOURNAL_PRINT','Akses Print',2,'',NULL),(192,'MN_LAPORAN_JUAL','MN_LAPORAN_DO','LAPORAN PENGIRIMAN BARANG',1,'fa fa-circle-o',NULL),(197,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_GRAFIK','LAPORAN GRAFIK PENJUALAN',1,'fa fa-circle-o',NULL),(194,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_GROUP','LAPORAN PENJUALAN GROUP PELANGGAN',1,'fa fa-circle-o',NULL),(196,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_RANK','LAPORAN RANKING PENJUALAN',1,'fa fa-circle-o',NULL),(195,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_RECAP','LAPORAN REKAPITULASI PENJUALAN',1,'fa fa-circle-o',NULL),(193,'MN_LAPORAN_JUAL','MN_LAPORAN_SALES_STD','LAPORAN PENJUALAN STANDAR',1,'fa fa-circle-o',NULL),(191,'MN_LAPORAN_JUAL','MN_LAPORAN_SO','LAPORAN SALES ORDER',1,'fa fa-circle-o',NULL),(205,'MN_LAPORAN_PIUTANG','MN_LAPORAN_ESTIMASI_JATUH_TEMPO','ESTIMASI PIUTANG JATUH TEMPO',1,'fa fa-circle-o',NULL),(203,'MN_LAPORAN_PIUTANG','MN_LAPORAN_PELUNASAN_PIUTANG','LAPORAN PELUNASAN PIUTANG',1,'fa fa-circle-o',NULL),(202,'MN_LAPORAN_PIUTANG','MN_LAPORAN_PEMBAYARAN_PER_PERIOD','LAPORAN PEMBAYARAN PER PERIODE',1,'fa fa-circle-o',NULL),(201,'MN_LAPORAN_PIUTANG','MN_LAPORAN_PEMBAYARAN_PIUTANG','LAPORAN PEMBAYARAN PIUTANG',1,'fa fa-circle-o',NULL),(199,'MN_LAPORAN_PIUTANG','MN_LAPORAN_PIUTANG_SUPPLIER','LAPORAN PIUTANG PER SUPPLIER',1,'fa fa-circle-o',NULL),(204,'MN_LAPORAN_PIUTANG','MN_LAPORAN_SALDO_PER_PERIOD','LAPORAN SALDO PIUTANG PER PERIODE',1,'fa fa-circle-o',NULL),(200,'MN_LAPORAN_PIUTANG','MN_LAPORAN_UMUR_PIUTANG','LAPORAN UMUR PIUTANG',1,'fa fa-circle-o',NULL),(81,'MN_MOVE_ITEM','MN_MOVE_ITEM_ADD','Akses Add',2,'',NULL),(82,'MN_MOVE_ITEM','MN_MOVE_ITEM_DELETE','Akses Delete',2,'',NULL),(80,'MN_MOVE_ITEM','MN_MOVE_ITEM_EDIT','Akses Edit',2,'',NULL),(218,'MN_MUTASI_CASHIER','MN_MUTASI_CASHIER_DETAIL','LAPORAN KASIR DETAIL',2,'',NULL),(219,'MN_MUTASI_CASHIER','MN_MUTASI_CASHIER_RECAP','LAPORAN KASIR REKAP',2,'',NULL),(206,'MN_OUTLET_SALES','MN_CASHIER','TRANSAKSI KASIR',1,'fa fa-circle-o',NULL),(216,'MN_OUTLET_SALES','MN_CASHIER_REGISTER','KASIR REGISTER',1,'fa fa-circle-o',NULL),(211,'MN_OUTLET_SALES','MN_CASHIER_RETURN','RETUR TRANSAKSI KASIR',1,'fa fa-circle-o',NULL),(217,'MN_OUTLET_SALES','MN_MUTASI_CASHIER','LAPORAN KASIR',1,'fa fa-circle-o',NULL),(186,'MN_PAYMENT_AR','MN_PAYMENT_AR_ADD','Akses Add',2,'',NULL),(187,'MN_PAYMENT_AR','MN_PAYMENT_AR_DELETE','Akses Delete',2,'',NULL),(185,'MN_PAYMENT_AR','MN_PAYMENT_AR_EDIT','Akses Edit',2,'',NULL),(188,'MN_PAYMENT_AR','MN_PAYMENT_AR_PRINT','Akses Print',2,'',NULL),(126,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_ADD','Akses Add',2,'',NULL),(127,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_DELETE','Akses Delete',2,'',NULL),(125,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_EDIT','Akses Edit',2,'',NULL),(128,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_PRINT','Akses Print',2,'',NULL),(96,'MN_PO','MN_PO_ADD','Akses Add',2,'',NULL),(97,'MN_PO','MN_PO_DELETE','Akses Delete',2,'',NULL),(95,'MN_PO','MN_PO_EDIT','Akses Edit',2,'',NULL),(98,'MN_PO','MN_PO_PRINT','Akses Print',2,'',NULL),(93,'MN_PURCHASE','MN_APPROVAL_RO','APPROVAL PERMINTAAN',1,'fa fa-circle-o',NULL),(119,'MN_PURCHASE','MN_AP_INITBALANCE','SALDO AWAL HUTANG',1,'fa fa-circle-o',NULL),(140,'MN_PURCHASE','MN_AP_REPORT','LAPORAN HUTANG',1,'fa fa-circle-o',NULL),(124,'MN_PURCHASE','MN_PEMBAYARAN_HUTANG','PEMBAYARAN HUTANG',1,'fa fa-circle-o',NULL),(94,'MN_PURCHASE','MN_PO','PURCHASE ORDER',1,'fa fa-circle-o',NULL),(109,'MN_PURCHASE','MN_PURCHASE_DIRECT','PEMBELIAN LANGSUNG',1,'fa fa-circle-o',NULL),(104,'MN_PURCHASE','MN_PURCHASE_INV','FAKTUR BELI',1,'fa fa-circle-o',NULL),(130,'MN_PURCHASE','MN_PURCHASE_REPORT','LAPORAN PEMBELIAN',1,'fa fa-circle-o',NULL),(114,'MN_PURCHASE','MN_PURCHASE_RETURN','RETUR BELI',1,'fa fa-circle-o',NULL),(99,'MN_PURCHASE','MN_RECEIVED_ORDER','PENERIMAAN BARANG',1,'fa fa-circle-o',NULL),(88,'MN_PURCHASE','MN_RO','PERMINTAAN GUDANG',1,'fa fa-circle-o',NULL),(129,'MN_PURCHASE','MN_STATUS_HUTANG','STATUS HUTANG',1,'fa fa-circle-o',NULL),(111,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_ADD','Akses Add',2,'',NULL),(112,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_DELETE','Akses Delete',2,'',NULL),(110,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_EDIT','Akses Edit',2,'',NULL),(113,'MN_PURCHASE_DIRECT','MN_PURCHASE_DIRECT_PRINT','Akses Print',2,'',NULL),(106,'MN_PURCHASE_INV','MN_PURCHASE_INV_ADD','Akses Add',2,'',NULL),(107,'MN_PURCHASE_INV','MN_PURCHASE_INV_DELETE','Akses Delete',2,'',NULL),(105,'MN_PURCHASE_INV','MN_PURCHASE_INV_EDIT','Akses Edit',2,'',NULL),(108,'MN_PURCHASE_INV','MN_PURCHASE_INV_PRINT','Akses Print',2,'',NULL),(137,'MN_PURCHASE_REPORT','MN_LAP_BUYPRICE_HISTORY','LAPORAN PERUBAHAN HARGA BELI',1,'fa fa-circle-o',NULL),(132,'MN_PURCHASE_REPORT','MN_LAP_PO','LAPORAN PO',1,'fa fa-circle-o',NULL),(134,'MN_PURCHASE_REPORT','MN_LAP_PURCH','LAPORAN PEMBELIAN STANDAR',1,'fa fa-circle-o',NULL),(139,'MN_PURCHASE_REPORT','MN_LAP_PURCH_GRAPHIC','LAPORAN GRAFIK PEMBELIAN',1,'fa fa-circle-o',NULL),(136,'MN_PURCHASE_REPORT','MN_LAP_PURCH_GROUP_PERIOD','LAPORAN PEMBELIAN GRUP PERIODE',1,'fa fa-circle-o',NULL),(135,'MN_PURCHASE_REPORT','MN_LAP_PURCH_GROUP_SUPP','LAPORAN PEMBELIAN GRUP SUPPLIER',1,'fa fa-circle-o',NULL),(138,'MN_PURCHASE_REPORT','MN_LAP_PURCH_RANKING','LAPORAN RANKING PEMBELIAN',1,'fa fa-circle-o',NULL),(133,'MN_PURCHASE_REPORT','MN_LAP_REC_ITEM','LAPORAN PENERIMAAN BARANG',1,'fa fa-circle-o',NULL),(131,'MN_PURCHASE_REPORT','MN_LAP_RO','LAPORAN PERMINTAAN BARANG',1,'fa fa-circle-o',NULL),(116,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_ADD','Akses Add',2,'',NULL),(117,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_DELETE','Akses Delete',2,'',NULL),(115,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_EDIT','Akses Edit',2,'',NULL),(118,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_PRINT','Akses Print',2,'',NULL),(222,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_ADD','Akses Add',2,'',NULL),(223,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_DELETE','Akses Delete',2,'',NULL),(221,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_EDIT','Akses Edit',2,'',NULL),(224,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_PRINT','Akses Print',2,'',NULL),(101,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_ADD','Akses Add',2,'',NULL),(102,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_DELETE','Akses Delete',2,'',NULL),(100,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_EDIT','Akses Edit',2,'',NULL),(103,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_PRINT','Akses Print',2,'',NULL),(90,'MN_RO','MN_RO_ADD','Akses Add',2,'',NULL),(91,'MN_RO','MN_RO_DELETE','Akses Delete',2,'',NULL),(89,'MN_RO','MN_RO_EDIT','Akses Edit',2,'',NULL),(92,'MN_RO','MN_RO_PRINT','Akses Print',2,'',NULL),(179,'MN_SALES','MN_AR_INITBALANCE','SALDO AWAL PIUTANG',1,'fa fa-circle-o',NULL),(189,'MN_SALES','MN_AR_STATUS','STATUS PIUTANG',1,'fa fa-circle-o',NULL),(157,'MN_SALES','MN_DELIVERED_ITEM','PENGIRIMAN BARANG',1,'fa fa-circle-o',NULL),(155,'MN_SALES','MN_DP_SO','UANG MUKA PESANAN (SO)',1,'fa fa-circle-o',NULL),(162,'MN_SALES','MN_EXPEDITION_PAYMENT','PEMBAYARAN EKSPEDISI',1,'fa fa-circle-o',NULL),(177,'MN_SALES','MN_FAKTUR_PAJAK','FAKTUR / RETUR PAJAK',1,'fa fa-circle-o',NULL),(190,'MN_SALES','MN_LAPORAN_JUAL','LAPORAN PENJUALAN',1,'fa fa-circle-o',NULL),(198,'MN_SALES','MN_LAPORAN_PIUTANG','LAPORAN PIUTANG',1,'fa fa-circle-o',NULL),(184,'MN_SALES','MN_PAYMENT_AR','PEMBAYARAN PIUTANG',1,'fa fa-circle-o',NULL),(167,'MN_SALES','MN_SALES_INV','FAKTUR JUAL',1,'fa fa-circle-o',NULL),(172,'MN_SALES','MN_SALES_RETURN','RETUR JUAL',1,'fa fa-circle-o',NULL),(148,'MN_SALES','MN_SET_MARKETING','SETUP MARKETING',1,'fa fa-circle-o',NULL),(150,'MN_SALES','MN_SO','ORDER PENJUALAN',1,'fa fa-circle-o',NULL),(169,'MN_SALES_INV','MN_SALES_INV_ADD','Akses Add',2,'',NULL),(170,'MN_SALES_INV','MN_SALES_INV_DELETE','Akses Delete',2,'',NULL),(168,'MN_SALES_INV','MN_SALES_INV_EDIT','Akses Edit',2,'',NULL),(171,'MN_SALES_INV','MN_SALES_INV_PRINT','Akses Print',2,'',NULL),(174,'MN_SALES_RETURN','MN_SALES_RETURN_ADD','Akses Add',2,'',NULL),(175,'MN_SALES_RETURN','MN_SALES_RETURN_DELETE','Akses Delete',2,'',NULL),(173,'MN_SALES_RETURN','MN_SALES_RETURN_EDIT','Akses Edit',2,'',NULL),(176,'MN_SALES_RETURN','MN_SALES_RETURN_PRINT','Akses Print',2,'',NULL),(149,'MN_SET_MARKETING','MN_SET_MARKETING_EDIT','Akses Edit',2,'',NULL),(152,'MN_SO','MN_SO_ADD','Akses Add',2,'',NULL),(153,'MN_SO','MN_SO_DELETE','Akses Delete',2,'',NULL),(151,'MN_SO','MN_SO_EDIT','Akses Edit',2,'',NULL),(154,'MN_SO','MN_SO_PRINT','Akses Print',2,'',NULL),(227,'MN_SPEND_MONEY','MN_SPEND_MONEY_ADD','Akses Add',2,'',NULL),(228,'MN_SPEND_MONEY','MN_SPEND_MONEY_DELETE','Akses Delete',2,'',NULL),(226,'MN_SPEND_MONEY','MN_SPEND_MONEY_EDIT','Akses Edit',2,'',NULL),(229,'MN_SPEND_MONEY','MN_SPEND_MONEY_PRINT','Akses Print',2,'',NULL),(83,'MN_STOCK','MN_ITEM_LIST','DAFTAR BARANG',1,'fa fa-circle-o',NULL),(79,'MN_STOCK','MN_MOVE_ITEM','PINDAH GUDANG',1,'fa fa-circle-o',NULL),(75,'MN_STOCK','MN_STOCK_CORRECTION','KOREKSI STOK',1,'fa fa-circle-o',NULL),(71,'MN_STOCK','MN_STOCK_OPNAME','STOK OPNAME',1,'fa fa-circle-o',NULL),(84,'MN_STOCK','MN_STOCK_REPORT','LAPORAN STOK',1,'fa fa-circle-o',NULL),(77,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_ADD','Akses Add',2,'',NULL),(78,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_DELETE','Akses Delete',2,'',NULL),(76,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_EDIT','Akses Edit',2,'',NULL),(73,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_ADD','Akses Add',2,'',NULL),(74,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_DELETE','Akses Delete',2,'',NULL),(72,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_EDIT','Akses Edit',2,'',NULL),(85,'MN_STOCK_REPORT','MN_STOCK_ADJUSTMENT_REPORT','LAPORAN KOREKSI STOK',2,'',NULL),(87,'MN_STOCK_REPORT','MN_STOCK_CARD_COGS','KARTU STOK DENGAN HPP PER ITEM',2,'',NULL),(86,'MN_STOCK_REPORT','MN_STOCK_MUTATION_REPORT','LAPORAN MUTASI STOK',2,'',NULL),(15,'MN_SUPPLIER','MN_SUPPLIER_ADD','Akses Add',2,'',NULL),(16,'MN_SUPPLIER','MN_SUPPLIER_DELETE','Akses Delete',2,'',NULL),(14,'MN_SUPPLIER','MN_SUPPLIER_EDIT','Akses Edit',2,'',NULL),(271,'MN_TOOLS','MN_AUTOBACKUP','AUTO BACKUP',1,'fa fa-circle-o',NULL),(270,'MN_TOOLS','MN_BACKUP','BACKUP',1,'fa fa-circle-o',NULL),(276,'MN_TOOLS','MN_CLEANSING_DB','CLEANSING DB',1,'fa fa-circle-o',NULL),(273,'MN_TOOLS','MN_LOG','LOG TRANSAKSI',1,'fa fa-circle-o',NULL),(272,'MN_TOOLS','MN_RESTORE','RESTORE',1,'fa fa-circle-o',NULL),(275,'MN_TOOLS','MN_SET_PATH','SETUP IMAGE DIREKTORI PATH',1,'fa fa-circle-o',NULL),(274,'MN_TOOLS','MN_USERMANAGE','PENGATURAN USER',1,'fa fa-circle-o',NULL),(47,'MN_UNIT','MN_UNIT_ADD','Akses Add',2,'',NULL),(48,'MN_UNIT','MN_UNIT_DELETE','Akses Delete',2,'',NULL),(46,'MN_UNIT','MN_UNIT_EDIT','Akses Edit',2,'',NULL),(51,'MN_WAREHOUSE','MN_WAREHOUSE_ADD','Akses Add',2,'',NULL),(52,'MN_WAREHOUSE','MN_WAREHOUSE_DELETE','Akses Delete',2,'',NULL),(50,'MN_WAREHOUSE','MN_WAREHOUSE_EDIT','Akses Edit',2,'',NULL),(7,'ROOT','MN_ACCOUNT','AKUNTANSI',0,'fa fa-book',NULL),(1,'ROOT','MN_CARDFILE','MASTER DATA',0,'fa fa-indent',NULL),(6,'ROOT','MN_CASH_BANK','KEUANGAN',0,'fa fa-money',NULL),(5,'ROOT','MN_OUTLET_SALES','KASIR',0,'fa fa-tags',NULL),(3,'ROOT','MN_PURCHASE','PEMBELIAN',0,'fa fa-dropbox',NULL),(4,'ROOT','MN_SALES','PENJUALAN',0,'fa fa-share',NULL),(2,'ROOT','MN_STOCK','STOK',0,'fa fa-info-circle',NULL),(8,'ROOT','MN_TOOLS','TOOLS',0,'fa fa-gear',NULL);
/*!40000 ALTER TABLE `i_templatehakakses_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_templatehakakses_setmanufacture`
--

DROP TABLE IF EXISTS `i_templatehakakses_setmanufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_templatehakakses_setmanufacture` (
  `nourut` int(11) NOT NULL,
  `parentkey` varchar(60) NOT NULL,
  `childkey` varchar(60) NOT NULL,
  `notes` text,
  `ismenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATEHAKAKSES_PK` (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATENOOROT` (`nourut`) USING BTREE,
  KEY `PARENTKEY` (`parentkey`),
  KEY `CHILDKEY` (`childkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_templatehakakses_setmanufacture`
--

LOCK TABLES `i_templatehakakses_setmanufacture` WRITE;
/*!40000 ALTER TABLE `i_templatehakakses_setmanufacture` DISABLE KEYS */;
INSERT INTO `i_templatehakakses_setmanufacture` VALUES (199,'MN_ACCOUNT','MN_ACCOUNT_REPORT','MENU ACCOUNTING & ANALYST REPORT',1),(191,'MN_ACCOUNT','MN_CASHBANK_SETUP','MENU ADD CASH/BANK TYPE',1),(186,'MN_ACCOUNT','MN_COA','MENU CHART OF ACCOUNT',1),(192,'MN_ACCOUNT','MN_JOURNAL','MENU GENERAL JOURNAL',1),(197,'MN_ACCOUNT','MN_JOURNAL_LIST','MENU JOURNAL LIST',1),(198,'MN_ACCOUNT','MN_LEDGER','MENU LEDGER',1),(200,'MN_ACCOUNT_REPORT','MN_ACCOUNTING_REPORT','MENU ACCOUNTING REPORT',1),(201,'MN_ACCOUNT_REPORT','MN_ANALYST_REPORT','MENU ANALYST REPORT',1),(220,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_ADD','Akses Add',1),(221,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_DELETE','Akses Delete',1),(219,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_EDIT','Akses Edit',1),(222,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_PRINT','Akses Print',1),(157,'MN_AR','MN_AR_STATUS','MENU A/R STATUS',1),(152,'MN_AR','MN_PAYMENT_AR','MENU A/R PAYMENT',1),(225,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_ADD','Akses Add',1),(226,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_DELETE','Akses Delete',1),(224,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_EDIT','Akses Edit',1),(227,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_PRINT','Akses Print',1),(180,'MN_BANK_RECONCILE','MN_BANK_RECONCILE_ADD','Akses Add',1),(181,'MN_BANK_RECONCILE','MN_BANK_RECONCILE_DELETE','Akses Delete',1),(179,'MN_BANK_RECONCILE','MN_BANK_RECONCILE_EDIT','Akses Edit',1),(182,'MN_BANK_RECONCILE','MN_BANK_RECONCILE_PRINT','Akses Print',1),(40,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_ADD','Akses Add',1),(41,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_DELETE','Akses Delete',1),(39,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_EDIT','Akses Edit',1),(24,'MN_CARDFILE','MN_CARD_LIST','MENU CARD LIST',1),(55,'MN_CARDFILE','MN_CURRENCY','MENU CURRENCY',1),(59,'MN_CARDFILE','MN_CURRENCY_CONVERSION','MENU CURRENCY CONVERSION',1),(12,'MN_CARDFILE','MN_CUSTOMER','CUSTOMER',1),(20,'MN_CARDFILE','MN_EMPLOYEE','MENU EMPLOYEE',1),(25,'MN_CARDFILE','MN_ITEM','MENU ITEM',1),(42,'MN_CARDFILE','MN_JENIS_JASA','MENU SERVICE ITEM',1),(63,'MN_CARDFILE','MN_LAPORAN','MENU  MASTER REPORT',1),(16,'MN_CARDFILE','MN_SUPPLIER','MENU SUPPLIER',1),(46,'MN_CARDFILE','MN_UNIT','MENU UNIT',1),(50,'MN_CARDFILE','MN_UNIT_CONVERSION','MENU UNIT CONVERSION',1),(51,'MN_CARDFILE','MN_WAREHOUSE','MENU WAREHOUSE',1),(185,'MN_CASHBANK_REPORT','MN_CASHBANK_RECAP_REPORT','MENU CASH/BANK SUMMARY',1),(184,'MN_CASHBANK_REPORT','MN_CASHBANK_TRANS_REPORT','MENU CASH/BANK DETAIL',1),(163,'MN_CASHIER','MN_CASHIER_ADD','Akses Add',1),(164,'MN_CASHIER','MN_CASHIER_DELETE','Akses Delete',1),(162,'MN_CASHIER','MN_CASHIER_EDIT','Akses Edit',1),(165,'MN_CASHIER','MN_CASHIER_PRINT','Akses Print',1),(214,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_ADD','Akses Add',1),(216,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_DELETE','Akses Delete',1),(213,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_EDIT','Akses Edit',1),(217,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_PRINT','Akses Print',1),(178,'MN_CASH_BANK','MN_BANK_RECONCILE','MENU BANK RECONCILE',1),(177,'MN_CASH_BANK','MN_CASHBANK_REGISTER','MENU CASH/BANK REGISTER',1),(183,'MN_CASH_BANK','MN_CASHBANK_REPORT','MENU CASH/BANK REPORT',1),(167,'MN_CASH_BANK','MN_RECEIPT_MONEY','MENU CASH/BANK RECEIPTS',1),(172,'MN_CASH_BANK','MN_SPEND_MONEY','MENU CASH/BANK DISBURSEMENT',1),(188,'MN_COA','MN_COA_ADD','Akses Add',1),(189,'MN_COA','MN_COA_DELETE','Akses Delete',1),(187,'MN_COA','MN_COA_EDIT','Akses Edit',1),(190,'MN_COA','MN_COA_PRINT','Akses Print',1),(57,'MN_CURRENCY','MN_CURRENCY_ADD','Akses Add',1),(58,'MN_CURRENCY','MN_CURRENCY_DELETE','Akses Delete',1),(56,'MN_CURRENCY','MN_CURRENCY_EDIT','Akses Edit',1),(61,'MN_CURRENCY_CONVERSION','MN_CURRENCY_CONVERSION_ADD','Akses Add',1),(62,'MN_CURRENCY_CONVERSION','MN_CURRENCY_CONVERSION_DELETE','Akses Delete',1),(60,'MN_CURRENCY_CONVERSION','MN_CURRENCY_CONVERSION_EDIT','Akses Edit',1),(14,'MN_CUSTOMER','MN_CUSTOMER_ADD','Akses Add',1),(15,'MN_CUSTOMER','MN_CUSTOMER_DELETE','Akses Delete',1),(13,'MN_CUSTOMER','MN_CUSTOMER_EDIT','Akses Edit',1),(138,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_ADD','Akses Add',1),(139,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_DELETE','Akses Delete',1),(137,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_EDIT','Akses Edit',1),(140,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_PRINT','Akses Print',1),(22,'MN_EMPLOYEE','MN_EMPLOYEE_ADD','Akses Add',1),(23,'MN_EMPLOYEE','MN_EMPLOYEE_DELETE','Akses Delete',1),(21,'MN_EMPLOYEE','MN_EMPLOYEE_EDIT','Akses Edit',1),(38,'MN_ITEM','MN_BEGINING_BALANCE','MENU BEGINNING BALANCE',1),(231,'MN_ITEM','MN_ITEM_BRAND','MENU ITEM TYPE',1),(30,'MN_ITEM','MN_ITEM_CAT','MENU ITEM CATEGORY',1),(34,'MN_ITEM','MN_ITEM_NAME','MENU ITEM NAME',1),(26,'MN_ITEM','MN_ITEM_TYPE','MENU ITEM TYPE',1),(233,'MN_ITEM_BRAND','MN_ITEM_BRAND_ADD','Akses Add',1),(234,'MN_ITEM_BRAND','MN_ITEM_BRAND_DELETE','Akses Delete',1),(232,'MN_ITEM_BRAND','MN_ITEM_BRAND_EDIT','Akses Edit',1),(32,'MN_ITEM_CAT','MN_ITEM_CAT_ADD','Akses Add',1),(33,'MN_ITEM_CAT','MN_ITEM_CAT_DELETE','Akses Delete',1),(31,'MN_ITEM_CAT','MN_ITEM_CAT_EDIT','Akses Edit',1),(36,'MN_ITEM_NAME','MN_ITEM_NAME_ADD','Akses Add',1),(37,'MN_ITEM_NAME','MN_ITEM_NAME_DELETE','Akses Delete',1),(35,'MN_ITEM_NAME','MN_ITEM_NAME_EDIT','Akses Edit',1),(28,'MN_ITEM_TYPE','MN_ITEM_TYPE_ADD','Akses Add',1),(29,'MN_ITEM_TYPE','MN_ITEM_TYPE_DELETE','Akses Delete',1),(27,'MN_ITEM_TYPE','MN_ITEM_TYPE_EDIT','Akses Edit',1),(44,'MN_JENIS_JASA','MN_JENIS_JASA_ADD','Akses Add',1),(45,'MN_JENIS_JASA','MN_JENIS_JASA_DELETE','Akses Delete',1),(43,'MN_JENIS_JASA','MN_JENIS_JASA_EDIT','Akses Edit',1),(194,'MN_JOURNAL','MN_JOURNAL_ADD','Akses Add',1),(195,'MN_JOURNAL','MN_JOURNAL_DELETE','Akses Delete',1),(193,'MN_JOURNAL','MN_JOURNAL_EDIT','Akses Edit',1),(196,'MN_JOURNAL','MN_JOURNAL_PRINT','Akses Print',1),(64,'MN_LAPORAN','MN_CARD_FILE_REPORT','MENU CARD FILE REPORT',1),(75,'MN_MOVE_ITEM','MN_MOVE_ITEM_ADD','Akses Add',1),(76,'MN_MOVE_ITEM','MN_MOVE_ITEM_DELETE','Akses Delete',1),(74,'MN_MOVE_ITEM','MN_MOVE_ITEM_EDIT','Akses Edit',1),(161,'MN_OUTLET_SALES','MN_CASHIER','MENU CASHIER',1),(166,'MN_OUTLET_SALES','MN_CASHIER_REGISTER','MENU CASHIER SUMMARY',1),(212,'MN_OUTLET_SALES','MN_CASHIER_RETURN','MENU CASHIER RETURN',1),(211,'MN_OUTLET_SALES','MN_MUTASI_CASHIER','MENU CASHIER REGISTER DETAIL',1),(107,'MN_PAYMENT_AP','MN_PEMBAYARAN_HUTANG','MENU A/P PAYMENT',1),(112,'MN_PAYMENT_AP','MN_STATUS_HUTANG','MENU A/P STATUS',1),(154,'MN_PAYMENT_AR','MN_PAYMENT_AR_ADD','Akses Add',1),(155,'MN_PAYMENT_AR','MN_PAYMENT_AR_DELETE','Akses Delete',1),(153,'MN_PAYMENT_AR','MN_PAYMENT_AR_EDIT','Akses Edit',1),(156,'MN_PAYMENT_AR','MN_PAYMENT_AR_PRINT','Akses Print',1),(109,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_ADD','Akses Add',1),(110,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_DELETE','Akses Delete',1),(108,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_EDIT','Akses Edit',1),(111,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_PRINT','Akses Print',1),(88,'MN_PO','MN_PO_ADD','Akses Add',1),(89,'MN_PO','MN_PO_DELETE','Akses Delete',1),(87,'MN_PO','MN_PO_EDIT','Akses Edit',1),(90,'MN_PO','MN_PO_PRINT','Akses Print',1),(85,'MN_PURCHASE','MN_APPROVAL_RO','MENU APPROVAL RO',1),(218,'MN_PURCHASE','MN_AP_INITBALANCE','MENU A/P BEGINNING BALANCE',1),(106,'MN_PURCHASE','MN_PAYMENT_AP','MENU ACCOUNT PAYABLE',1),(86,'MN_PURCHASE','MN_PO','MENU PURCHASE ORDER',1),(96,'MN_PURCHASE','MN_PURCHASE_INV','MENU PURCHASE INVOICE',1),(113,'MN_PURCHASE','MN_PURCHASE_REPORT','MENU PURCHASE & A/P REPORT',1),(101,'MN_PURCHASE','MN_PURCHASE_RETURN','MENU PURCHASE RETURN',1),(91,'MN_PURCHASE','MN_RECEIVED_ORDER','MENU RECEIVED ITEM',1),(80,'MN_PURCHASE','MN_RO','MENU PURCHASE REQUISITION',1),(98,'MN_PURCHASE_INV','MN_PURCHASE_INV_ADD','Akses Add',1),(99,'MN_PURCHASE_INV','MN_PURCHASE_INV_DELETE','Akses Delete',1),(97,'MN_PURCHASE_INV','MN_PURCHASE_INV_EDIT','Akses Edit',1),(100,'MN_PURCHASE_INV','MN_PURCHASE_INV_PRINT','Akses Print',1),(114,'MN_PURCHASE_REPORT','MN_AP_REPORT','MENU A/P REPORT',1),(103,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_ADD','Akses Add',1),(104,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_DELETE','Akses Delete',1),(102,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_EDIT','Akses Edit',1),(105,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_PRINT','Akses Print',1),(169,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_ADD','Akses Add',1),(170,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_DELETE','Akses Delete',1),(168,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_EDIT','Akses Edit',1),(171,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_PRINT','Akses Print',1),(93,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_ADD','Akses Add',1),(94,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_DELETE','Akses Delete',1),(92,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_EDIT','Akses Edit',1),(95,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_PRINT','Akses Print',1),(82,'MN_RO','MN_RO_ADD','Akses Add',1),(83,'MN_RO','MN_RO_DELETE','Akses Delete',1),(81,'MN_RO','MN_RO_EDIT','Akses Edit',1),(84,'MN_RO','MN_RO_PRINT','Akses Print',1),(151,'MN_SALES','MN_AR','MENU ACCOUNT RECEIVABLE',1),(223,'MN_SALES','MN_AR_INITBALANCE','MENU A/R BEGINNING BALANCE',1),(136,'MN_SALES','MN_DELIVERED_ITEM','MENU DELIVERY ITEM',1),(141,'MN_SALES','MN_SALES_INV','MENU SALES INVOICE',1),(158,'MN_SALES','MN_SALES_REPORT','MENU SALES / AR REPORT',1),(146,'MN_SALES','MN_SALES_RETURN','MENU SALES RETURN',1),(228,'MN_SALES','MN_SET_MARKETING','MENU ADD MARKETING FROM EMPLOYEE',1),(131,'MN_SALES','MN_SO','MENU SALES ORDER',1),(143,'MN_SALES_INV','MN_SALES_INV_ADD','Akses Add',1),(144,'MN_SALES_INV','MN_SALES_INV_DELETE','Akses Delete',1),(142,'MN_SALES_INV','MN_SALES_INV_EDIT','Akses Edit',1),(145,'MN_SALES_INV','MN_SALES_INV_PRINT','Akses Print',1),(159,'MN_SALES_REPORT','MN_LAPORAN_JUAL','MENU SALES REPORT',1),(160,'MN_SALES_REPORT','MN_LAPORAN_PIUTANG','MENU A/R REPORT',1),(148,'MN_SALES_RETURN','MN_SALES_RETURN_ADD','Akses Add',1),(149,'MN_SALES_RETURN','MN_SALES_RETURN_DELETE','Akses Delete',1),(147,'MN_SALES_RETURN','MN_SALES_RETURN_EDIT','Akses Edit',1),(150,'MN_SALES_RETURN','MN_SALES_RETURN_PRINT','Akses Print',1),(229,'MN_SET_MARKETING','MN_SET_MARKETING_EDIT','Akses Edit',1),(133,'MN_SO','MN_SO_ADD','Akses Add',1),(134,'MN_SO','MN_SO_DELETE','Akses Delete',1),(132,'MN_SO','MN_SO_EDIT','Akses Edit',1),(135,'MN_SO','MN_SO_PRINT','Akses Print',1),(174,'MN_SPEND_MONEY','MN_SPEND_MONEY_ADD','Akses Add',1),(175,'MN_SPEND_MONEY','MN_SPEND_MONEY_DELETE','Akses Delete',1),(173,'MN_SPEND_MONEY','MN_SPEND_MONEY_EDIT','Akses Edit',1),(176,'MN_SPEND_MONEY','MN_SPEND_MONEY_PRINT','Akses Print',1),(77,'MN_STOCK','MN_ITEM_LIST','MENU STOCK LIST',1),(79,'MN_STOCK','MN_LAPORAN_STOCK','MENU STOCK REPORT',1),(73,'MN_STOCK','MN_MOVE_ITEM','MENU STOCK TRANSFER',1),(69,'MN_STOCK','MN_STOCK_CORRECTION','MENU STOCK ADJUSTMENT',1),(65,'MN_STOCK','MN_STOCK_OPNAME','MENU STOCK OPNAME',1),(78,'MN_STOCK','MN_STOCK_REPORT','MENU STOCK REPORT',1),(71,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_ADD','Akses Add',1),(72,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_DELETE','Akses Delete',1),(70,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_EDIT','Akses Edit',1),(67,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_ADD','Akses Add',1),(68,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_DELETE','Akses Delete',1),(66,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_EDIT','Akses Edit',1),(18,'MN_SUPPLIER','MN_SUPPLIER_ADD','Akses Add',1),(19,'MN_SUPPLIER','MN_SUPPLIER_DELETE','Akses Delete',1),(17,'MN_SUPPLIER','MN_SUPPLIER_EDIT','Akses Edit',1),(202,'MN_TOOLS','MN_BACKUP','MENU BACKUP',1),(204,'MN_TOOLS','MN_LOG','MENU TRANSACTION LOG ',1),(203,'MN_TOOLS','MN_RESTORE','MENU RESTORE',1),(230,'MN_TOOLS','MN_SET_PATH','MENU SET IMAGE DIRECTORY',1),(205,'MN_TOOLS','MN_USERMANAGE','MENU USER MANAGEMENT ',1),(48,'MN_UNIT','MN_UNIT_ADD','Akses Add',1),(49,'MN_UNIT','MN_UNIT_DELETE','Akses Delete',1),(47,'MN_UNIT','MN_UNIT_EDIT','Akses Edit',1),(53,'MN_WAREHOUSE','MN_WAREHOUSE_ADD','Akses Add',1),(54,'MN_WAREHOUSE','MN_WAREHOUSE_DELETE','Akses Delete',1),(52,'MN_WAREHOUSE','MN_WAREHOUSE_EDIT','Akses Edit',1),(9,'ROOT','MN_ACCOUNT','ACCOUNTING',0),(1,'ROOT','MN_CARDFILE','CARDFILE',0),(8,'ROOT','MN_CASH_BANK','CASH BANK',0),(11,'ROOT','MN_HELP','HELP',0),(6,'ROOT','MN_OUTLET_SALES','OUTLET SALES',0),(3,'ROOT','MN_PURCHASE','PURCHASE',0),(5,'ROOT','MN_SALES','SALES',0),(2,'ROOT','MN_STOCK','STOCK',0),(10,'ROOT','MN_TOOLS','TOOLS',0);
/*!40000 ALTER TABLE `i_templatehakakses_setmanufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_templatehakakses_setretail`
--

DROP TABLE IF EXISTS `i_templatehakakses_setretail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_templatehakakses_setretail` (
  `nourut` int(11) NOT NULL,
  `parentkey` varchar(60) NOT NULL,
  `childkey` varchar(60) NOT NULL,
  `notes` text,
  `ismenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATEHAKAKSES_PK` (`parentkey`,`childkey`),
  UNIQUE KEY `TEMPLATENOOROT` (`nourut`) USING BTREE,
  KEY `PARENTKEY` (`parentkey`),
  KEY `CHILDKEY` (`childkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_templatehakakses_setretail`
--

LOCK TABLES `i_templatehakakses_setretail` WRITE;
/*!40000 ALTER TABLE `i_templatehakakses_setretail` DISABLE KEYS */;
INSERT INTO `i_templatehakakses_setretail` VALUES (199,'MN_ACCOUNT','MN_ACCOUNT_REPORT','MENU ACCOUNTING & ANALYST REPORT',1),(191,'MN_ACCOUNT','MN_CASHBANK_SETUP','MENU ADD CASH/BANK TYPE',1),(186,'MN_ACCOUNT','MN_COA','MENU CHART OF ACCOUNT',1),(192,'MN_ACCOUNT','MN_JOURNAL','MENU GENERAL JOURNAL',1),(197,'MN_ACCOUNT','MN_JOURNAL_LIST','MENU JOURNAL LIST',1),(198,'MN_ACCOUNT','MN_LEDGER','MENU LEDGER',1),(200,'MN_ACCOUNT_REPORT','MN_ACCOUNTING_REPORT','MENU ACCOUNTING REPORT',1),(201,'MN_ACCOUNT_REPORT','MN_ANALYST_REPORT','MENU ANALYST REPORT',1),(220,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_ADD','Akses Add',1),(221,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_DELETE','Akses Delete',1),(219,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_EDIT','Akses Edit',1),(222,'MN_AP_INITBALANCE','MN_AP_INITBALANCE_PRINT','Akses Print',1),(157,'MN_AR','MN_AR_STATUS','MENU A/R STATUS',1),(152,'MN_AR','MN_PAYMENT_AR','MENU A/R PAYMENT',1),(225,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_ADD','Akses Add',1),(226,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_DELETE','Akses Delete',1),(224,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_EDIT','Akses Edit',1),(227,'MN_AR_INITBALANCE','MN_AR_INITBALANCE_PRINT','Akses Print',1),(180,'MN_BANK_RECONCILE','MN_BANK_RECONCILE_ADD','Akses Add',1),(181,'MN_BANK_RECONCILE','MN_BANK_RECONCILE_DELETE','Akses Delete',1),(179,'MN_BANK_RECONCILE','MN_BANK_RECONCILE_EDIT','Akses Edit',1),(182,'MN_BANK_RECONCILE','MN_BANK_RECONCILE_PRINT','Akses Print',1),(40,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_ADD','Akses Add',1),(41,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_DELETE','Akses Delete',1),(39,'MN_BEGINING_BALANCE','MN_BEGINING_BALANCE_EDIT','Akses Edit',1),(24,'MN_CARDFILE','MN_CARD_LIST','MENU CARD LIST',1),(55,'MN_CARDFILE','MN_CURRENCY','MENU CURRENCY',1),(59,'MN_CARDFILE','MN_CURRENCY_CONVERSION','MENU CURRENCY CONVERSION',1),(12,'MN_CARDFILE','MN_CUSTOMER','CUSTOMER',1),(20,'MN_CARDFILE','MN_EMPLOYEE','MENU EMPLOYEE',1),(25,'MN_CARDFILE','MN_ITEM','MENU ITEM',1),(42,'MN_CARDFILE','MN_JENIS_JASA','MENU SERVICE ITEM',1),(63,'MN_CARDFILE','MN_LAPORAN','MENU  MASTER REPORT',1),(16,'MN_CARDFILE','MN_SUPPLIER','MENU SUPPLIER',1),(46,'MN_CARDFILE','MN_UNIT','MENU UNIT',1),(50,'MN_CARDFILE','MN_UNIT_CONVERSION','MENU UNIT CONVERSION',1),(51,'MN_CARDFILE','MN_WAREHOUSE','MENU WAREHOUSE',1),(185,'MN_CASHBANK_REPORT','MN_CASHBANK_RECAP_REPORT','MENU CASH/BANK SUMMARY',1),(184,'MN_CASHBANK_REPORT','MN_CASHBANK_TRANS_REPORT','MENU CASH/BANK DETAIL',1),(163,'MN_CASHIER','MN_CASHIER_ADD','Akses Add',1),(164,'MN_CASHIER','MN_CASHIER_DELETE','Akses Delete',1),(162,'MN_CASHIER','MN_CASHIER_EDIT','Akses Edit',1),(165,'MN_CASHIER','MN_CASHIER_PRINT','Akses Print',1),(214,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_ADD','Akses Add',1),(216,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_DELETE','Akses Delete',1),(213,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_EDIT','Akses Edit',1),(217,'MN_CASHIER_RETURN','MN_CASHIER_RETURN_PRINT','Akses Print',1),(178,'MN_CASH_BANK','MN_BANK_RECONCILE','MENU BANK RECONCILE',1),(177,'MN_CASH_BANK','MN_CASHBANK_REGISTER','MENU CASH/BANK REGISTER',1),(183,'MN_CASH_BANK','MN_CASHBANK_REPORT','MENU CASH/BANK REPORT',1),(167,'MN_CASH_BANK','MN_RECEIPT_MONEY','MENU CASH/BANK RECEIPTS',1),(172,'MN_CASH_BANK','MN_SPEND_MONEY','MENU CASH/BANK DISBURSEMENT',1),(188,'MN_COA','MN_COA_ADD','Akses Add',1),(189,'MN_COA','MN_COA_DELETE','Akses Delete',1),(187,'MN_COA','MN_COA_EDIT','Akses Edit',1),(190,'MN_COA','MN_COA_PRINT','Akses Print',1),(57,'MN_CURRENCY','MN_CURRENCY_ADD','Akses Add',1),(58,'MN_CURRENCY','MN_CURRENCY_DELETE','Akses Delete',1),(56,'MN_CURRENCY','MN_CURRENCY_EDIT','Akses Edit',1),(61,'MN_CURRENCY_CONVERSION','MN_CURRENCY_CONVERSION_ADD','Akses Add',1),(62,'MN_CURRENCY_CONVERSION','MN_CURRENCY_CONVERSION_DELETE','Akses Delete',1),(60,'MN_CURRENCY_CONVERSION','MN_CURRENCY_CONVERSION_EDIT','Akses Edit',1),(14,'MN_CUSTOMER','MN_CUSTOMER_ADD','Akses Add',1),(15,'MN_CUSTOMER','MN_CUSTOMER_DELETE','Akses Delete',1),(13,'MN_CUSTOMER','MN_CUSTOMER_EDIT','Akses Edit',1),(138,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_ADD','Akses Add',1),(139,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_DELETE','Akses Delete',1),(137,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_EDIT','Akses Edit',1),(140,'MN_DELIVERED_ITEM','MN_DELIVERED_ITEM_PRINT','Akses Print',1),(22,'MN_EMPLOYEE','MN_EMPLOYEE_ADD','Akses Add',1),(23,'MN_EMPLOYEE','MN_EMPLOYEE_DELETE','Akses Delete',1),(21,'MN_EMPLOYEE','MN_EMPLOYEE_EDIT','Akses Edit',1),(38,'MN_ITEM','MN_BEGINING_BALANCE','MENU BEGINNING BALANCE',1),(231,'MN_ITEM','MN_ITEM_BRAND','MENU ITEM TYPE',1),(30,'MN_ITEM','MN_ITEM_CAT','MENU ITEM CATEGORY',1),(34,'MN_ITEM','MN_ITEM_NAME','MENU ITEM NAME',1),(26,'MN_ITEM','MN_ITEM_TYPE','MENU ITEM TYPE',1),(233,'MN_ITEM_BRAND','MN_ITEM_BRAND_ADD','Akses Add',1),(234,'MN_ITEM_BRAND','MN_ITEM_BRAND_DELETE','Akses Delete',1),(232,'MN_ITEM_BRAND','MN_ITEM_BRAND_EDIT','Akses Edit',1),(32,'MN_ITEM_CAT','MN_ITEM_CAT_ADD','Akses Add',1),(33,'MN_ITEM_CAT','MN_ITEM_CAT_DELETE','Akses Delete',1),(31,'MN_ITEM_CAT','MN_ITEM_CAT_EDIT','Akses Edit',1),(36,'MN_ITEM_NAME','MN_ITEM_NAME_ADD','Akses Add',1),(37,'MN_ITEM_NAME','MN_ITEM_NAME_DELETE','Akses Delete',1),(35,'MN_ITEM_NAME','MN_ITEM_NAME_EDIT','Akses Edit',1),(28,'MN_ITEM_TYPE','MN_ITEM_TYPE_ADD','Akses Add',1),(29,'MN_ITEM_TYPE','MN_ITEM_TYPE_DELETE','Akses Delete',1),(27,'MN_ITEM_TYPE','MN_ITEM_TYPE_EDIT','Akses Edit',1),(44,'MN_JENIS_JASA','MN_JENIS_JASA_ADD','Akses Add',1),(45,'MN_JENIS_JASA','MN_JENIS_JASA_DELETE','Akses Delete',1),(43,'MN_JENIS_JASA','MN_JENIS_JASA_EDIT','Akses Edit',1),(194,'MN_JOURNAL','MN_JOURNAL_ADD','Akses Add',1),(195,'MN_JOURNAL','MN_JOURNAL_DELETE','Akses Delete',1),(193,'MN_JOURNAL','MN_JOURNAL_EDIT','Akses Edit',1),(196,'MN_JOURNAL','MN_JOURNAL_PRINT','Akses Print',1),(64,'MN_LAPORAN','MN_CARD_FILE_REPORT','MENU CARD FILE REPORT',1),(75,'MN_MOVE_ITEM','MN_MOVE_ITEM_ADD','Akses Add',1),(76,'MN_MOVE_ITEM','MN_MOVE_ITEM_DELETE','Akses Delete',1),(74,'MN_MOVE_ITEM','MN_MOVE_ITEM_EDIT','Akses Edit',1),(161,'MN_OUTLET_SALES','MN_CASHIER','MENU CASHIER',1),(166,'MN_OUTLET_SALES','MN_CASHIER_REGISTER','MENU CASHIER SUMMARY',1),(212,'MN_OUTLET_SALES','MN_CASHIER_RETURN','MENU CASHIER RETURN',1),(211,'MN_OUTLET_SALES','MN_MUTASI_CASHIER','MENU CASHIER REGISTER DETAIL',1),(107,'MN_PAYMENT_AP','MN_PEMBAYARAN_HUTANG','MENU A/P PAYMENT',1),(112,'MN_PAYMENT_AP','MN_STATUS_HUTANG','MENU A/P STATUS',1),(154,'MN_PAYMENT_AR','MN_PAYMENT_AR_ADD','Akses Add',1),(155,'MN_PAYMENT_AR','MN_PAYMENT_AR_DELETE','Akses Delete',1),(153,'MN_PAYMENT_AR','MN_PAYMENT_AR_EDIT','Akses Edit',1),(156,'MN_PAYMENT_AR','MN_PAYMENT_AR_PRINT','Akses Print',1),(109,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_ADD','Akses Add',1),(110,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_DELETE','Akses Delete',1),(108,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_EDIT','Akses Edit',1),(111,'MN_PEMBAYARAN_HUTANG','MN_PEMBAYARAN_HUTANG_PRINT','Akses Print',1),(88,'MN_PO','MN_PO_ADD','Akses Add',1),(89,'MN_PO','MN_PO_DELETE','Akses Delete',1),(87,'MN_PO','MN_PO_EDIT','Akses Edit',1),(90,'MN_PO','MN_PO_PRINT','Akses Print',1),(85,'MN_PURCHASE','MN_APPROVAL_RO','MENU APPROVAL RO',1),(218,'MN_PURCHASE','MN_AP_INITBALANCE','MENU A/P BEGINNING BALANCE',1),(106,'MN_PURCHASE','MN_PAYMENT_AP','MENU ACCOUNT PAYABLE',1),(86,'MN_PURCHASE','MN_PO','MENU PURCHASE ORDER',1),(96,'MN_PURCHASE','MN_PURCHASE_INV','MENU PURCHASE INVOICE',1),(113,'MN_PURCHASE','MN_PURCHASE_REPORT','MENU PURCHASE & A/P REPORT',1),(101,'MN_PURCHASE','MN_PURCHASE_RETURN','MENU PURCHASE RETURN',1),(91,'MN_PURCHASE','MN_RECEIVED_ORDER','MENU RECEIVED ITEM',1),(80,'MN_PURCHASE','MN_RO','MENU PURCHASE REQUISITION',1),(98,'MN_PURCHASE_INV','MN_PURCHASE_INV_ADD','Akses Add',1),(99,'MN_PURCHASE_INV','MN_PURCHASE_INV_DELETE','Akses Delete',1),(97,'MN_PURCHASE_INV','MN_PURCHASE_INV_EDIT','Akses Edit',1),(100,'MN_PURCHASE_INV','MN_PURCHASE_INV_PRINT','Akses Print',1),(114,'MN_PURCHASE_REPORT','MN_AP_REPORT','MENU A/P REPORT',1),(103,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_ADD','Akses Add',1),(104,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_DELETE','Akses Delete',1),(102,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_EDIT','Akses Edit',1),(105,'MN_PURCHASE_RETURN','MN_PURCHASE_RETURN_PRINT','Akses Print',1),(169,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_ADD','Akses Add',1),(170,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_DELETE','Akses Delete',1),(168,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_EDIT','Akses Edit',1),(171,'MN_RECEIPT_MONEY','MN_RECEIPT_MONEY_PRINT','Akses Print',1),(93,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_ADD','Akses Add',1),(94,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_DELETE','Akses Delete',1),(92,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_EDIT','Akses Edit',1),(95,'MN_RECEIVED_ORDER','MN_RECEIVED_ORDER_PRINT','Akses Print',1),(82,'MN_RO','MN_RO_ADD','Akses Add',1),(83,'MN_RO','MN_RO_DELETE','Akses Delete',1),(81,'MN_RO','MN_RO_EDIT','Akses Edit',1),(84,'MN_RO','MN_RO_PRINT','Akses Print',1),(151,'MN_SALES','MN_AR','MENU ACCOUNT RECEIVABLE',1),(223,'MN_SALES','MN_AR_INITBALANCE','MENU A/R BEGINNING BALANCE',1),(136,'MN_SALES','MN_DELIVERED_ITEM','MENU DELIVERY ITEM',1),(141,'MN_SALES','MN_SALES_INV','MENU SALES INVOICE',1),(158,'MN_SALES','MN_SALES_REPORT','MENU SALES / AR REPORT',1),(146,'MN_SALES','MN_SALES_RETURN','MENU SALES RETURN',1),(228,'MN_SALES','MN_SET_MARKETING','MENU ADD MARKETING FROM EMPLOYEE',1),(131,'MN_SALES','MN_SO','MENU SALES ORDER',1),(143,'MN_SALES_INV','MN_SALES_INV_ADD','Akses Add',1),(144,'MN_SALES_INV','MN_SALES_INV_DELETE','Akses Delete',1),(142,'MN_SALES_INV','MN_SALES_INV_EDIT','Akses Edit',1),(145,'MN_SALES_INV','MN_SALES_INV_PRINT','Akses Print',1),(159,'MN_SALES_REPORT','MN_LAPORAN_JUAL','MENU SALES REPORT',1),(160,'MN_SALES_REPORT','MN_LAPORAN_PIUTANG','MENU A/R REPORT',1),(148,'MN_SALES_RETURN','MN_SALES_RETURN_ADD','Akses Add',1),(149,'MN_SALES_RETURN','MN_SALES_RETURN_DELETE','Akses Delete',1),(147,'MN_SALES_RETURN','MN_SALES_RETURN_EDIT','Akses Edit',1),(150,'MN_SALES_RETURN','MN_SALES_RETURN_PRINT','Akses Print',1),(229,'MN_SET_MARKETING','MN_SET_MARKETING_EDIT','Akses Edit',1),(133,'MN_SO','MN_SO_ADD','Akses Add',1),(134,'MN_SO','MN_SO_DELETE','Akses Delete',1),(132,'MN_SO','MN_SO_EDIT','Akses Edit',1),(135,'MN_SO','MN_SO_PRINT','Akses Print',1),(174,'MN_SPEND_MONEY','MN_SPEND_MONEY_ADD','Akses Add',1),(175,'MN_SPEND_MONEY','MN_SPEND_MONEY_DELETE','Akses Delete',1),(173,'MN_SPEND_MONEY','MN_SPEND_MONEY_EDIT','Akses Edit',1),(176,'MN_SPEND_MONEY','MN_SPEND_MONEY_PRINT','Akses Print',1),(77,'MN_STOCK','MN_ITEM_LIST','MENU STOCK LIST',1),(79,'MN_STOCK','MN_LAPORAN_STOCK','MENU STOCK REPORT',1),(73,'MN_STOCK','MN_MOVE_ITEM','MENU STOCK TRANSFER',1),(69,'MN_STOCK','MN_STOCK_CORRECTION','MENU STOCK ADJUSTMENT',1),(65,'MN_STOCK','MN_STOCK_OPNAME','MENU STOCK OPNAME',1),(78,'MN_STOCK','MN_STOCK_REPORT','MENU STOCK REPORT',1),(71,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_ADD','Akses Add',1),(72,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_DELETE','Akses Delete',1),(70,'MN_STOCK_CORRECTION','MN_STOCK_CORRECTION_EDIT','Akses Edit',1),(67,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_ADD','Akses Add',1),(68,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_DELETE','Akses Delete',1),(66,'MN_STOCK_OPNAME','MN_STOCK_OPNAME_EDIT','Akses Edit',1),(18,'MN_SUPPLIER','MN_SUPPLIER_ADD','Akses Add',1),(19,'MN_SUPPLIER','MN_SUPPLIER_DELETE','Akses Delete',1),(17,'MN_SUPPLIER','MN_SUPPLIER_EDIT','Akses Edit',1),(202,'MN_TOOLS','MN_BACKUP','MENU BACKUP',1),(204,'MN_TOOLS','MN_LOG','MENU TRANSACTION LOG ',1),(203,'MN_TOOLS','MN_RESTORE','MENU RESTORE',1),(230,'MN_TOOLS','MN_SET_PATH','MENU SET IMAGE DIRECTORY',1),(205,'MN_TOOLS','MN_USERMANAGE','MENU USER MANAGEMENT ',1),(48,'MN_UNIT','MN_UNIT_ADD','Akses Add',1),(49,'MN_UNIT','MN_UNIT_DELETE','Akses Delete',1),(47,'MN_UNIT','MN_UNIT_EDIT','Akses Edit',1),(53,'MN_WAREHOUSE','MN_WAREHOUSE_ADD','Akses Add',1),(54,'MN_WAREHOUSE','MN_WAREHOUSE_DELETE','Akses Delete',1),(52,'MN_WAREHOUSE','MN_WAREHOUSE_EDIT','Akses Edit',1),(9,'ROOT','MN_ACCOUNT','ACCOUNTING',0),(1,'ROOT','MN_CARDFILE','CARDFILE',0),(8,'ROOT','MN_CASH_BANK','CASH BANK',0),(11,'ROOT','MN_HELP','HELP',0),(6,'ROOT','MN_OUTLET_SALES','OUTLET SALES',0),(3,'ROOT','MN_PURCHASE','PURCHASE',0),(5,'ROOT','MN_SALES','SALES',0),(2,'ROOT','MN_STOCK','STOCK',0),(10,'ROOT','MN_TOOLS','TOOLS',0);
/*!40000 ALTER TABLE `i_templatehakakses_setretail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_upload_path`
--

DROP TABLE IF EXISTS `i_upload_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_upload_path` (
  `form` varchar(250) NOT NULL,
  `path` text,
  PRIMARY KEY (`form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_upload_path`
--

LOCK TABLES `i_upload_path` WRITE;
/*!40000 ALTER TABLE `i_upload_path` DISABLE KEYS */;
INSERT INTO `i_upload_path` VALUES ('Customer',''),('Employee',''),('Item',''),('Logo',''),('Supplier','');
/*!40000 ALTER TABLE `i_upload_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_upload_pemrov_simrs`
--

DROP TABLE IF EXISTS `i_upload_pemrov_simrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_upload_pemrov_simrs` (
  `id_import` varchar(120) NOT NULL,
  `date_trn` date DEFAULT NULL,
  `evidence_no` varchar(250) NOT NULL,
  `reff_acc_cost` varchar(120) DEFAULT NULL,
  `reff_prog` varchar(120) DEFAULT NULL,
  `reff_keg` varchar(120) DEFAULT NULL,
  `reff_acc_cashbank` varchar(120) DEFAULT NULL,
  `notes` text,
  `receipt_amount` double(19,2) DEFAULT NULL,
  `spend_amount` double(19,2) DEFAULT NULL,
  `import_date` datetime DEFAULT NULL,
  `posting_status` int(1) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `import_user` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_import`,`evidence_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_upload_pemrov_simrs`
--

LOCK TABLES `i_upload_pemrov_simrs` WRITE;
/*!40000 ALTER TABLE `i_upload_pemrov_simrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_upload_pemrov_simrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `items_view`
--

DROP TABLE IF EXISTS `items_view`;
/*!50001 DROP VIEW IF EXISTS `items_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `items_view` (
  `id_item` varchar(25),
  `item_name` varchar(60),
  `id_barcode` varchar(30),
  `mst_itemcat_nm` varchar(120),
  `flag_buy` int(1),
  `flag_inv` int(1),
  `flag_sell` int(1),
  `sell_unit` varchar(25)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lap_mutasi_hpp`
--

DROP TABLE IF EXISTS `lap_mutasi_hpp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lap_mutasi_hpp` (
  `no_bukti` varchar(60) DEFAULT NULL,
  `date_trn` datetime DEFAULT NULL,
  `id_item` varchar(50) DEFAULT NULL,
  `item_name` varchar(300) DEFAULT NULL,
  `masuk` double DEFAULT NULL,
  `keluar` double DEFAULT NULL,
  `id_unit` varchar(30) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  `company` text,
  `notes` text,
  `nmb_asc` int(11) DEFAULT NULL,
  `price_in` double DEFAULT NULL,
  `price_out` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lap_mutasi_hpp`
--

LOCK TABLES `lap_mutasi_hpp` WRITE;
/*!40000 ALTER TABLE `lap_mutasi_hpp` DISABLE KEYS */;
INSERT INTO `lap_mutasi_hpp` VALUES ('Saldo Awal','2016-08-17 00:00:00','0816000001','Gelang Variasi VHR9340',3,0,'pcs',2640000,3,'TOKO EMAS SABAR','Saldo Awal Barang',0,2640000,2640000),('LPO/08-2016-00001','2016-08-17 00:00:00','0816000001','Gelang Variasi VHR9340',10,0,'pcs',2640000,13,'TOKO EMAS SABAR','',1,2640000,2640000),('CSH/08-2016-00001','2016-08-17 00:00:00','0816000001','Gelang Variasi VHR9340',0,1,'pcs',2725714,12,'TOKO EMAS SABAR','',2,3840000,3840000),('LSO/08-2016-00003','2016-08-17 00:00:00','0816000001','Gelang Variasi VHR9340',0,2,'pcs',2884898,10,'TOKO EMAS SABAR','',3,3840000,3840000),('SRU/08-2016-00001','2016-08-18 00:00:00','0816000001','Gelang Variasi VHR9340',1,0,'pcs',2971725,11,'TOKO EMAS SABAR','',4,3840000,3840000),('CSH/08-2016-00004','2016-08-28 00:00:00','0816000001','Gelang Variasi VHR9340',0,1,'pcs',3044081,10,'TOKO EMAS SABAR','',5,3840000,3840000);
/*!40000 ALTER TABLE `lap_mutasi_hpp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lap_rekap_hpp_akhir`
--

DROP TABLE IF EXISTS `lap_rekap_hpp_akhir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lap_rekap_hpp_akhir` (
  `id_item` varchar(50) DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `nominal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lap_rekap_hpp_akhir`
--

LOCK TABLES `lap_rekap_hpp_akhir` WRITE;
/*!40000 ALTER TABLE `lap_rekap_hpp_akhir` DISABLE KEYS */;
INSERT INTO `lap_rekap_hpp_akhir` VALUES ('0816000001',11,2971725,32688975),('0816000002',8,1080918,8647344),('0816000003',1,0,0),('0816000004',1,0,0);
/*!40000 ALTER TABLE `lap_rekap_hpp_akhir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `lap_rekap_hpp_akhir_view`
--

DROP TABLE IF EXISTS `lap_rekap_hpp_akhir_view`;
/*!50001 DROP VIEW IF EXISTS `lap_rekap_hpp_akhir_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `lap_rekap_hpp_akhir_view` (
  `id_item` varchar(50),
  `item_name` varchar(60),
  `saldo` double,
  `price` double,
  `nominal` double
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_error`
--

DROP TABLE IF EXISTS `log_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_error` (
  `error_log_id` varchar(60) NOT NULL,
  `error_class_name` varchar(120) NOT NULL,
  `error_description` varchar(400) NOT NULL,
  `error_subclass_name` varchar(120) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_user` varchar(120) NOT NULL,
  PRIMARY KEY (`error_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_error`
--

LOCK TABLES `log_error` WRITE;
/*!40000 ALTER TABLE `log_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_transaction`
--

DROP TABLE IF EXISTS `log_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_transaction` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_no` varchar(120) DEFAULT NULL,
  `form` varchar(120) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `action` varchar(120) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id_log`),
  KEY `fk_log1` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_transaction`
--

LOCK TABLES `log_transaction` WRITE;
/*!40000 ALTER TABLE `log_transaction` DISABLE KEYS */;
INSERT INTO `log_transaction` VALUES (1,'C.2016000001','Master Customer','tokoemas','Input','2016-08-14 00:00:00','Input Master Customer Baru - ADI RUMASHO'),(2,'C.2016000002','Master Customer','tokoemas','Input','2016-08-14 00:00:00','Input Master Customer Baru - SUMARDI WIYONO'),(3,'C.2016000003','Master Customer','tokoemas','Input','2016-08-14 00:00:00','Input Master Customer Baru - SUMARSIH NINGSIH'),(4,'S.2016000001','Master Supplier','tokoemas','Input','2016-08-14 00:00:00','Input Master Supplier Baru - UBS SUPPLIER EMAS'),(5,'E.2016000001','Master Pegawai','tokoemas','Input','2016-08-14 00:00:00','Input Master Pegawai Baru - SULISTYOWATI '),(6,'0816000001','Master Barang','tokoemas','Input','2016-08-15 00:00:00','Input Master Barang Baru - Gelang Variasi VHR9340'),(7,'0816000001','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Gelang Variasi VHR9340'),(8,'0816000002','Master Barang','tokoemas','Input','2016-08-15 00:00:00','Input Master Barang Baru - Cincin Motif Love CM934'),(9,'1-1201','Chart Of Account','Admin','Edit','2014-01-01 00:00:00','Edit Account - Persediaan Barang Dagangan'),(10,'1-1201','Chart Of Account','Admin','Edit','2014-01-01 00:00:00','Edit Account - Persediaan Barang Dagangan'),(11,'1-1201','Chart Of Account','Admin','Edit','2014-01-01 00:00:00','Edit Account - Persediaan Barang Dagangan'),(12,'M/SVC-0816000001','Master Service','tokoemas','Input','2016-08-15 00:00:00','Input Master Service Baru - Cleansing Emas'),(13,'PO/08-2016-00001','Purchase Order','tokoemas','Input','2016-08-15 00:00:00','Input Purchase Order Baru - S.2016000001'),(14,'LPO/08-2016-00001','Pelunasan PO','tokoemas','Input','2016-08-15 00:00:00','Input Pelunasan PO Baru - S.2016000001'),(15,'PO/08-2016-00001','Purchase Order','tokoemas','Edit','2016-08-15 00:00:00','Edit Purchase Order - S.2016000001'),(16,'PUD/08-2016-00001','Faktur Pembelian','tokoemas','Input','2016-08-15 00:00:00','Input Pembelian Langsung - S.2016000001'),(17,'PUD/08-2016-00001','Faktur Pembelian','tokoemas','Hapus','2016-08-15 00:00:00','Hapus Pembelian Langsung - S.2016000001'),(18,'PUD/08-2016-00001','Faktur Pembelian','tokoemas','Input','2016-08-15 00:00:00','Input Pembelian Langsung - S.2016000001'),(19,'PUD/08-2016-00001','Faktur Pembelian','tokoemas','Hapus','2016-08-15 00:00:00','Hapus Pembelian Langsung - S.2016000001'),(20,'PUD/08-2016-00001','Faktur Pembelian','tokoemas','Input','2016-08-15 00:00:00','Input Pembelian Langsung - S.2016000001'),(21,'PRU/08-2016-00001','Retur Pembelian','tokoemas','Input','2016-08-15 00:00:00','Input Retur Beli Baru - S.2016000001'),(22,'SO/08-2016-00001','Sales Order','tokoemas','Input','2016-08-15 00:00:00','Input Sales Order Baru - C.2016000001'),(23,'SO/08-2016-00001','Sales Order','tokoemas','Hapus','2016-08-15 00:00:00','Hapus Sales Order - C.2016000001'),(24,'SO/08-2016-00001','Sales Order','tokoemas','Input','2016-08-17 00:00:00','Input Sales Order Baru - C.2016000001'),(25,'LPO/08-2016-00001','Pelunasan PO','tokoemas','Hapus','2016-08-15 00:00:00','Hapus Pelunasan PO - S.2016000001'),(26,'PRU/08-2016-00001','Retur Pembelian','tokoemas','Hapus','2016-08-15 00:00:00','Hapus Retur Beli - S.2016000001'),(27,'LPO/08-2016-00001','Pelunasan PO','tokoemas','Hapus','2016-08-15 00:00:00','Hapus Pelunasan PO - S.2016000001'),(28,'PO/08-2016-00001','Purchase Order','tokoemas','Edit','2016-08-15 00:00:00','Edit Purchase Order - S.2016000001'),(29,'PO/08-2016-00001','Purchase Order','tokoemas','Hapus','2016-08-15 00:00:00','Hapus Purchase Order - S.2016000001'),(30,'PO/08-2016-00002','Purchase Order','tokoemas','Input','2016-08-17 00:00:00','Input Purchase Order Baru - S.2016000001'),(31,'PO/08-2016-00002','Purchase Order','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Purchase Order - S.2016000001'),(32,'PO/08-2016-00002','Purchase Order','tokoemas','Input','2016-08-17 00:00:00','Input Purchase Order Baru - S.2016000001'),(33,'PO/08-2016-00002','Purchase Order','tokoemas','Edit','2016-08-17 00:00:00','Edit Purchase Order - S.2016000001'),(34,'PO/08-2016-00002','Purchase Order','tokoemas','Edit','2016-08-17 00:00:00','Edit Purchase Order - S.2016000001'),(35,'LPO/08-2016-00002','Pelunasan PO','tokoemas','Input','2016-08-17 00:00:00','Input Pelunasan PO Baru - S.2016000001'),(36,'PO/08-2016-00002','Purchase Order','tokoemas','Edit','2016-08-17 00:00:00','Edit Purchase Order - S.2016000001'),(37,'LPO/08-2016-00003','Pelunasan PO','tokoemas','Input','2016-08-17 00:00:00','Input Pelunasan PO Baru - C.2016000001'),(38,'PUD/08-2016-00001','Faktur Pembelian','tokoemas','Hapus','2016-08-15 00:00:00','Hapus Pembelian Langsung - S.2016000001'),(39,'LPO/08-2016-00002','Pelunasan PO','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Pelunasan PO - S.2016000001'),(40,'PO/08-2016-00002','Purchase Order','tokoemas','Edit','2016-08-17 00:00:00','Edit Purchase Order - S.2016000001'),(41,'PO/08-2016-00002','Purchase Order','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Purchase Order - S.2016000001'),(42,'LPO/08-2016-00003','Pelunasan PO','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Pelunasan PO - C.2016000001'),(43,'LPO/08-2016-00003','Pelunasan PO','tokoemas','Input','2016-08-17 00:00:00','Input Pelunasan PO Baru - C.2016000001'),(44,'LPO/08-2016-00003','Pelunasan PO','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Pelunasan PO - C.2016000001'),(45,'SO/08-2016-00001','Sales Order','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Sales Order - C.2016000001'),(46,'CSU/08-2016-00001','Retur Transaksi Kasir','tokoemas','Input','2016-08-17 00:00:00','Input Retur Jual Baru - Tn Aldi'),(47,'CSU/08-2016-00001','Retur Penjualan Kasir','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Retur Jual - Tn Aldi'),(48,'CSU/08-2016-00001','Retur Transaksi Kasir','tokoemas','Input','2016-08-17 00:00:00','Input Retur Jual Baru - CSH/08-2016-00001'),(49,'CSU/08-2016-00001','Retur Penjualan Kasir','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Retur Jual - CSH/08-2016-00001'),(50,'PO/08-2016-00001','Purchase Order','tokoemas','Input','2016-08-17 00:00:00','Input Purchase Order Baru - S.2016000001'),(51,'PO/08-2016-00001','Purchase Order','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Purchase Order - S.2016000001'),(52,'PO/08-2016-00001','Purchase Order','tokoemas','Input','2016-08-17 00:00:00','Input Purchase Order Baru - S.2016000001'),(53,'PO/08-2016-00001','Purchase Order','tokoemas','Edit','2016-08-17 00:00:00','Edit Purchase Order - S.2016000001'),(54,'PO/08-2016-00001','Purchase Order','tokoemas','Edit','2016-08-17 00:00:00','Edit Purchase Order - S.2016000001'),(55,'LPO/08-2016-00001','Pelunasan PO','tokoemas','Input','2016-08-17 00:00:00','Input Pelunasan PO Baru - S.2016000001'),(56,'PO/08-2016-00001','Purchase Order','tokoemas','Edit','2016-08-17 00:00:00','Edit Purchase Order - S.2016000001'),(57,'PUD/08-2016-00001','Faktur Pembelian','tokoemas','Input','2016-08-17 00:00:00','Input Pembelian Langsung - S.2016000001'),(58,'PRU/08-2016-00001','Retur Pembelian','tokoemas','Input','2016-08-17 00:00:00','Input Retur Beli Baru - S.2016000001'),(59,'CSU/08-2016-00001','Retur Transaksi Kasir','tokoemas','Input','2016-08-17 00:00:00','Input Retur Jual Baru - SUMARDI WIYONO'),(60,'SO/08-2016-00001','Sales Order','tokoemas','Input','2016-08-17 00:00:00','Input Sales Order Baru - C.2016000001'),(61,'LPO/08-2016-00002','Pelunasan PO','tokoemas','Input','2016-08-17 00:00:00','Input Pelunasan PO Baru - C.2016000001'),(62,'LPO/08-2016-00002','Pelunasan PO','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Pelunasan PO - C.2016000001'),(63,'LSO/08-2016-00001','Pelunasan PO','tokoemas','Input','2016-08-17 00:00:00','Input Pelunasan PO Baru - C.2016000001'),(64,'LSO/08-2016-00001','Pelunasan PO','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Pelunasan PO - C.2016000001'),(65,'LSO/08-2016-00002','Pelunasan PO','tokoemas','Input','2016-08-17 00:00:00','Input Pelunasan PO Baru - C.2016000001'),(66,'LSO/08-2016-00002','Pelunasan PO','tokoemas','Hapus','2016-08-17 00:00:00','Hapus Pelunasan PO - C.2016000001'),(67,'LSO/08-2016-00003','Pelunasan PO','tokoemas','Input','2016-08-17 00:00:00','Input Pelunasan PO Baru - C.2016000001'),(68,'SRU/08-2016-00001','Retur Penjualan','tokoemas','Input','2016-08-18 00:00:00','Input Retur Jual Baru - C.2016000001'),(69,'SRU/08-2016-00001','Retur Penjualan','tokoemas','Hapus','2016-08-18 00:00:00','Hapus Retur Jual - C.2016000001'),(70,'SRU/08-2016-00001','Retur Penjualan','tokoemas','Input','2016-08-18 00:00:00','Input Retur Jual Baru - C.2016000001'),(71,'0816000003','Master Barang','tokoemas','Input','2016-08-18 00:00:00','Input Master Barang Baru - Gelang Motif Arrow MT902'),(72,'0816000003','Master Item','tokoemas','Edit','2016-08-18 00:00:00','Edit Master Item - Gelang Motif Arrow MT902'),(73,'0816000003','Master Item','tokoemas','Edit','2016-08-18 00:00:00','Edit Master Item - Gelang Motif Arrow MT902'),(74,'0816000004','Master Barang','tokoemas','Input','2016-08-18 00:00:00','Input Master Barang Baru - Cincin Motif Bunga CC98'),(75,'SO/08-2016-00002','Sales Order','tokoemas','Input','2016-08-18 00:00:00','Input Sales Order Baru - C.2016000002'),(76,'1-1101','Chart Of Account','tokoemas','Edit','2016-08-23 00:00:00','Edit Account - Kas Besar'),(77,'0816000001','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Gelang Variasi VHR9340'),(78,'0816000001','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Gelang Variasi VHR9340'),(79,'ADS/08-2016-00001','Koreksi Stock','tokoemas','Input','2016-08-28 00:00:00','Input Koreksi Stock Baru - WH001'),(80,'0816000001','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Gelang Variasi VHR9340'),(81,'0816000002','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Cincin Motif Love CM934'),(82,'0816000003','Master Item','tokoemas','Edit','2016-08-18 00:00:00','Edit Master Item - Gelang Motif Arrow MT902'),(83,'0816000004','Master Item','tokoemas','Edit','2016-08-18 00:00:00','Edit Master Item - Cincin Motif Bunga CC98'),(84,'ADS/08-2016-00001','Koreksi Stock','tokoemas','Hapus','2016-08-28 00:00:00','Hapus Koreksi Stock - WH001'),(85,'ADS/08-2016-00001','Koreksi Stock','tokoemas','Input','2016-08-28 00:00:00','Input Koreksi Stock Baru - WH001'),(86,'0816000001','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Gelang Variasi VHR9340'),(87,'0816000002','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Cincin Motif Love CM934'),(88,'0816000003','Master Item','tokoemas','Edit','2016-08-18 00:00:00','Edit Master Item - Gelang Motif Arrow MT902'),(89,'0816000004','Master Item','tokoemas','Edit','2016-08-18 00:00:00','Edit Master Item - Cincin Motif Bunga CC98'),(90,'0816000001','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Gelang Variasi VHR9340'),(91,'0816000002','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Cincin Motif Love CM934'),(92,'0816000003','Master Item','tokoemas','Edit','2016-08-18 00:00:00','Edit Master Item - Gelang Motif Arrow MT902'),(93,'0816000004','Master Item','tokoemas','Edit','2016-08-18 00:00:00','Edit Master Item - Cincin Motif Bunga CC98'),(94,'ADS/08-2016-00001','Koreksi Stock','tokoemas','Hapus','2016-08-28 00:00:00','Hapus Koreksi Stock - WH001'),(95,'ADS/08-2016-00002','Koreksi Stock','tokoemas','Input','2016-08-28 00:00:00','Input Koreksi Stock Baru - WH001'),(96,'0816000001','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Gelang Variasi VHR9340'),(97,'0816000002','Master Item','tokoemas','Edit','2016-08-15 00:00:00','Edit Master Item - Cincin Motif Love CM934'),(98,'0816000003','Master Item','tokoemas','Edit','2016-08-18 00:00:00','Edit Master Item - Gelang Motif Arrow MT902'),(99,'C.2016000004','Master Customer','admin','Input','2016-08-28 21:29:33',NULL),(100,'C.2016000004','Master Customer','admin','Edit','2016-08-28 21:29:37',NULL),(101,'C.2016000004','Master Customer','admin','Edit','2016-08-28 21:29:37',NULL),(102,'C.2016000005','Master Customer','admin','Input','2016-08-28 00:00:00','Input Master Customer Baru - SATRIO '),(103,'1-1101','Chart Of Account','tokoemas','Edit','2016-08-23 00:00:00','Edit Account - Kas Besar'),(104,'1-1199','Chart Of Account','admin','Edit','2015-01-07 00:00:00','Edit Account - Kas Kasir'),(105,'1-1199','Chart Of Account','admin','Edit','2015-01-07 00:00:00','Edit Account - Dana Lainnya');
/*!40000 ALTER TABLE `log_transaction` ENABLE KEYS */;
UNLOCK TABLES;
