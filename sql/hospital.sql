/*
 Navicat Premium Data Transfer

 Source Server         : localhost3306
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost:3306
 Source Schema         : hospital

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 04/01/2023 10:53:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `id` int(20) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(1) NOT NULL COMMENT '0男  1女',
  `phone` int(15) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delflag` bit(1) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT NULL,
  `updatetime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for check
-- ----------------------------
DROP TABLE IF EXISTS `check`;
CREATE TABLE `check`  (
  `id` int(20) NOT NULL,
  `doctorid` int(20) NOT NULL,
  `patientid` int(20) NOT NULL,
  `ckeckitemid` int(20) NOT NULL,
  `expense` int(10) NULL DEFAULT NULL,
  `delflag` bit(1) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT NULL,
  `updatetime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctorid_c`(`doctorid`) USING BTREE,
  INDEX `patientid_c`(`patientid`) USING BTREE,
  INDEX `ckeckitemid_c`(`ckeckitemid`) USING BTREE,
  CONSTRAINT `doctorid_c` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ckeckitemid_c` FOREIGN KEY (`ckeckitemid`) REFERENCES `check_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `patientid_c` FOREIGN KEY (`patientid`) REFERENCES `patient` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for check_item
-- ----------------------------
DROP TABLE IF EXISTS `check_item`;
CREATE TABLE `check_item`  (
  `id` int(20) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expense` int(10) NULL DEFAULT NULL,
  `delflag` bit(1) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT NULL,
  `updatetime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `id` int(20) NOT NULL,
  `name` int(50) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(1) NULL DEFAULT NULL COMMENT '0男 1女',
  `phone` int(15) NOT NULL,
  `department` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position` int(2) NOT NULL,
  `delflag` bit(1) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT NULL,
  `updatetime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int(10) NOT NULL,
  `stock` int(10) NOT NULL,
  `delflag` bit(1) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT NULL,
  `updatetime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for medical_record
-- ----------------------------
DROP TABLE IF EXISTS `medical_record`;
CREATE TABLE `medical_record`  (
  `id` int(20) NOT NULL,
  `ill` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '病历描述',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `patientid` int(20) NOT NULL,
  `doctorid` int(20) NOT NULL,
  `delflag` int(1) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT NULL,
  `updatetime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patientid_m`(`patientid`) USING BTREE,
  INDEX `doctorid_m`(`doctorid`) USING BTREE,
  CONSTRAINT `doctorid_m` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `patientid_m` FOREIGN KEY (`patientid`) REFERENCES `patient` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `id` int(20) NOT NULL COMMENT '病人id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` int(15) NOT NULL,
  `sex` int(1) NULL DEFAULT NULL COMMENT '0男  1女',
  `age` int(3) NULL DEFAULT NULL,
  `delflag` bit(1) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT NULL,
  `updatetime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for prescription
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription`  (
  `id` int(20) NOT NULL,
  `time` datetime(0) NOT NULL,
  `doctor_id` int(20) NOT NULL,
  `patient_id` int(20) NOT NULL,
  `drug_id` int(20) NOT NULL,
  `delflag` bit(1) NULL DEFAULT b'0',
  `createtime` timestamp(0) NULL DEFAULT NULL,
  `updatetime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `drug_id`(`drug_id`) USING BTREE,
  CONSTRAINT `doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drug_id` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `id` int(20) NOT NULL,
  `patientid` int(20) NOT NULL,
  `doctorid` int(20) NOT NULL,
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `expense` int(3) NULL DEFAULT NULL,
  `delflag` bit(1) NOT NULL DEFAULT b'0',
  `createtime` timestamp(0) NULL DEFAULT NULL,
  `updatetime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patientid`(`patientid`) USING BTREE,
  INDEX `doctorid`(`doctorid`) USING BTREE,
  CONSTRAINT `doctorid` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `patientid` FOREIGN KEY (`patientid`) REFERENCES `patient` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
