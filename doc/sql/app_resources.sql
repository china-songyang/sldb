/*
SQLyog Enterprise - MySQL GUI v6.0
Host - 5.0.37-community-nt : Database - sldb1
*********************************************************************
Server version : 5.0.37-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `sldb1`;

USE `sldb1`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `app_resources` */

DROP TABLE IF EXISTS `app_resources`;

CREATE TABLE `app_resources` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(100) default NULL,
  `parentId` varchar(100) default NULL,
  `sort` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

/*Data for the table `app_resources` */

insert  into `app_resources`(`id`,`name`,`path`,`parentId`,`sort`) values ('auth','管理权限',NULL,NULL,1),('auth.user','管理用户','/app/auth/user/showUsers.jsp','auth',2),('auth.role','管理角色','/app/auth/role/showRoles.jsp','auth',3),('auth.resource','管理资源','/app/auth/resource/showResources.jsp','auth',4),('auth.organization','管理部门','/app/auth/organization/showOrganizations.jsp','auth',5),('configuration','管理基础配置','',NULL,6),('configuration.dict','管理数据字典','/app/system/dict/showDicts.jsp','configuration',7),('configuration.table','管理表','/app/system/easyform/table/show.jsp','configuration',41),('sldb.admin','管理双辽低保','',NULL,45),('sldb.person','双辽低保','',NULL,49),('sldb.admin.importInfo','管理导入表格','/app/sldb/info/show.jsp','sldb.admin',50),('sldb.import','数据导入','',NULL,51),('sldb.person.apply','申请低保','/app/sldb/person/apply.jsp','sldb.person',52),('sldb.person.first','初审低保','/app/sldb/person/first.jsp','sldb.person',53),('sldb.person.check','核对低保','/app/sldb/person/check.jsp','sldb.person',54),('sldb.person.end','决议低保','/app/sldb/person/end.jsp','sldb.person',55),('sldb.admin.import','查看导入数据','/app/sldb/import/show.jsp','sldb.admin',56),('auth.change.password','修改密码','/app/auth/user/changePassword.jsp',NULL,100),('sldb.import.car','公安-车辆登记','/app/sldb/import/sub/car.jsp','sldb.import',59),('sldb.import.finance','财政-开支人员','/app/sldb/import/sub/finance.jsp','sldb.import',60),('sldb.import.hygiene','卫生-住院数据','/app/sldb/import/sub/hygiene.jsp','sldb.import',61),('sldb.import.unmarry','民政-离婚登记','/app/sldb/import/sub/unmarry.jsp','sldb.import',63),('sldb.import.marry','民政-结婚登记','/app/sldb/import/sub/marry.jsp','sldb.import',64),('sldb.import.city','民政-城镇低保','/app/sldb/import/sub/city.jsp','sldb.import',65),('sldb.import.country','民政-农村低保','/app/sldb/import/sub/country.jsp','sldb.import',66),('sldb.import.kv','人社-医疗保险','/app/sldb/import/sub/kv.jsp','sldb.import',67),('sldb.import.labour','人社-劳动合同','/app/sldb/import/sub/labour.jsp','sldb.import',69),('sldb.import.detail','住建-房产信息','/app/sldb/import/sub/detail.jsp','sldb.import',71),('sldb.admin.allcheck','批量核对低保','/app/sldb/check/allcheck.jsp','sldb.admin',72),('sldb.import.wsbm','卫生-人员信息','/app/sldb/import/sub/wsbm.jsp','sldb.import',74),('sldb.import.sbtx','社保-退休人员','/app/sldb/import/sub/sbtx.jsp','sldb.import',75),('sldb.import.area','农经-承包土地','/app/sldb/import/sub/area.jsp','sldb.import',76),('sldb.person.state','已审低保','/app/sldb/person/state.jsp','sldb.person',78),('sldb.import.food','财政-粮食直补','/app/sldb/import/sub/food.jsp','sldb.import',79),('sldb.import.gongshang','工商-营业执照','/app/sldb/import/sub/gongshang.jsp','sldb.import',80),('sldb.import.gongyi','人社-公益性岗位','/app/sldb/import/sub/gongyi.jsp','sldb.import',81),('sldb.person.stateAll','低保状态','','sldb.person',82),('sldb.person.stateAll.applyState','申请状态','/app/sldb/state/applyAll.jsp','sldb.person.stateAll',83),('sldb.person.stateAll.firstAll','初审状态','/app/sldb/state/firstAll.jsp','sldb.person.stateAll',85),('sldb.person.stateAll.checkAll','核对状态','/app/sldb/state/checkAll.jsp','sldb.person.stateAll',86),('sldb.person.stateAll.endAll','评议状态','/app/sldb/state/endAll.jsp','sldb.person.stateAll',87),('sldb.person.stateAll.stateAll','已审状态','/app/sldb/state/stateAll.jsp','sldb.person.stateAll',88),('sldb.import.rent','住建-廉租房','/app/sldb/import/sub/rent.jsp','sldb.import',89),('sldb.person.checkCity','初审城镇低保','/app/sldb/person/type/checkCity.jsp','sldb.person',90),('sldb.person.checkCityLow','初审城镇低收入','/app/sldb/person/type/checkCityLow.jsp','sldb.person',91),('sldb.person.checkCountry','初审农村低保','/app/sldb/person/type/checkCountry.jsp','sldb.person',92),('sldb.person.checkCountryLow','初审农村低收入','/app/sldb/person/type/checkCountryLow.jsp','sldb.person',93),('sldb.person.checkOk','已核对低保','/app/sldb/person/checkOk.jsp','sldb.person',94),('sldb.person.firstState','已审低保-初审','/app/sldb/person/firstState.jsp','sldb.person',95),('sldb.import.swry','死亡人员','/app/sldb/import/sub/swry.jsp','sldb.import',99),('sldb.import.ncnz','农村低保预报','/app/sldb/import/sub/ncdbyb.jsp','sldb.import',97),('sldb.import.czdbyb','城镇低保预报','/app/sldb/import/sub/czdbyb.jsp','sldb.import',96),('sldb.import.mzzhhd','民政综合核对','/app/sldb/import/sub/mzzhhd.jsp','sldb.import',98),('sldb.report','报表统计','',NULL,57),('sldb.report.total','核对信息统计','/app/sldb/report/total.jsp','sldb.report',102),('sldb.report.unmarry','离婚报表','/app/sldb/report/unitReport/unmarry.jsp','sldb.report',103),('sldb.report.car','车辆登记','/app/sldb/report/unitReport/car.jsp','sldb.report',104),('sldb.report.finance','开支人员','/app/sldb/report/unitReport/finance.jsp','sldb.report',105),('sldb.report.hospital','住院数据','/app/sldb/report/unitReport/hospital.jsp','sldb.report',106),('sldb.report.marry','结婚登记','/app/sldb/report/unitReport/marry.jsp','sldb.report',107),('sldb.report.city','城镇低保','/app/sldb/report/unitReport/city.jsp','sldb.report',108),('sldb.report.insurance','医疗保险','/app/sldb/report/unitReport/medical_insurance.jsp','sldb.report',109),('sldb.report.village','农村低保','/app/sldb/report/unitReport/village.jsp','sldb.report',110),('sldb.report.agreement','劳动合同','/app/sldb/report/unitReport/agreement.jsp','sldb.report',111),('sldb.report.house','房产信息','/app/sldb/report/unitReport/house.jsp','sldb.report',112),('sldb.report.people','卫生人员','/app/sldb/report/unitReport/people.jsp','sldb.report',113),('sldb.report.retire','社保退休','/app/sldb/report/unitReport/retire.jsp','sldb.report',114),('sldb.report.contract','承包土地','/app/sldb/report/unitReport/contract.jsp','sldb.report',115),('sldb.report.food','粮食直补','/app/sldb/report/unitReport/food.jsp','sldb.report',116),('sldb.report.gshang','工商营业执照','/app/sldb/report/unitReport/gshang.jsp','sldb.report',117),('sldb.report.service','公益性岗位','/app/sldb/report/unitReport/service.jsp','sldb.report',118),('sldb.report.rent','廉租房','/app/sldb/report/unitReport/rent.jsp','sldb.report',119),('sldb.report.cityAgo','城镇低保预报','/app/sldb/report/unitReport/cityAgo.jsp','sldb.report',120),('sldb.report.villageAgo','农村低保预报','/app/sldb/report/unitReport/villageAgo.jsp','sldb.report',121),('sldb.report.together','民政综合','/app/sldb/report/unitReport/together.jsp','sldb.report',122),('sldb.report.death','死亡人员','/app/sldb/report/unitReport/death.jsp','sldb.report',123);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
