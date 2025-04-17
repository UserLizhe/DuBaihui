/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : zixishiguanli

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/02/2025 10:56:07
*/
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zixishiguanli` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `zixishiguanli`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `ask` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提问',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复',
  `isreply` int(11) NULL DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1740189426001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES (31, '2023-07-10 00:16:56', 1, 1, '提问1', '回复1', 1);
INSERT INTO `chat` VALUES (32, '2023-07-10 00:16:56', 2, 2, '提问2', '回复2', 2);
INSERT INTO `chat` VALUES (33, '2023-07-10 00:16:56', 3, 3, '提问3', '回复3', 3);
INSERT INTO `chat` VALUES (34, '2023-07-10 00:16:56', 4, 4, '提问4', '回复4', 4);
INSERT INTO `chat` VALUES (35, '2023-07-10 00:16:56', 5, 5, '提问5', '回复5', 5);
INSERT INTO `chat` VALUES (36, '2023-07-10 00:16:56', 6, 6, '提问6', '回复6', 6);
INSERT INTO `chat` VALUES (37, '2023-07-10 00:16:56', 7, 7, '提问7', '回复7', 7);
INSERT INTO `chat` VALUES (38, '2023-07-10 00:16:56', 8, 8, '提问8', '回复8', 8);
INSERT INTO `chat` VALUES (1672100533290, '2023-07-10 00:22:12', 1672100482355, NULL, '11111', NULL, 0);
INSERT INTO `chat` VALUES (1672100668654, '2023-07-10 00:24:28', 1672100482355, 1, NULL, '32232', NULL);
INSERT INTO `chat` VALUES (1740189341812, '2025-02-22 09:55:40', 1740189220393, NULL, '222', NULL, 0);
INSERT INTO `chat` VALUES (1740189426000, '2025-02-22 09:57:05', 1740189220393, 1, NULL, '221', NULL);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'upload/1672100678837.jpeg');
INSERT INTO `config` VALUES (2, 'picture2', 'upload/picture2.jpg');
INSERT INTO `config` VALUES (3, 'picture3', 'upload/picture3.jpg');

-- ----------------------------
-- Table structure for discusszixishi
-- ----------------------------
DROP TABLE IF EXISTS `discusszixishi`;
CREATE TABLE `discusszixishi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1740189324530 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自习室评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discusszixishi
-- ----------------------------
INSERT INTO `discusszixishi` VALUES (1672100527434, '2023-07-10 00:22:07', 21, 1672100482355, 'upload/1672100467747.jpeg', '111', '11111', '222');
INSERT INTO `discusszixishi` VALUES (1740189324529, '2025-02-22 09:55:24', 21, 1740189220393, 'upload/1740189205295.jpg', '001', '21', NULL);

-- ----------------------------
-- Table structure for fangwuleixing
-- ----------------------------
DROP TABLE IF EXISTS `fangwuleixing`;
CREATE TABLE `fangwuleixing`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fangwuleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租金分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租金分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fangwuleixing
-- ----------------------------
INSERT INTO `fangwuleixing` VALUES (31, '2025-02-22 03:03:45', '租金分类1');
INSERT INTO `fangwuleixing` VALUES (32, '2025-02-22 03:03:45', '租金分类2');
INSERT INTO `fangwuleixing` VALUES (33, '2025-02-22 03:03:45', '租金分类3');
INSERT INTO `fangwuleixing` VALUES (34, '2025-02-22 03:03:45', '租金分类4');
INSERT INTO `fangwuleixing` VALUES (35, '2025-02-22 03:03:45', '租金分类5');
INSERT INTO `fangwuleixing` VALUES (36, '2025-02-22 03:03:45', '租金分类6');
INSERT INTO `fangwuleixing` VALUES (37, '2025-02-22 03:03:45', '租金分类7');
INSERT INTO `fangwuleixing` VALUES (38, '2025-02-22 03:03:45', '租金分类8');

-- ----------------------------
-- Table structure for fangyuanpinzu
-- ----------------------------
DROP TABLE IF EXISTS `fangyuanpinzu`;
CREATE TABLE `fangyuanpinzu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fangwubianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自习室编号',
  `fangwumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自习室名称',
  `fangwuleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租金分类',
  `tupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `louceng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层',
  `quyu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `mianji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '面积',
  `chaoxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '朝向',
  `zulinleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租赁类型',
  `xiangxidizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `yuezu` int(11) NULL DEFAULT NULL COMMENT '月租（元）',
  `peitaosheshi` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配套设施',
  `fangwuxiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '自习室详情',
  `fangdongzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房东账号',
  `fangdongxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房东姓名',
  `sfsh` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核回复',
  `clicktime` datetime(0) NULL DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) NULL DEFAULT 0 COMMENT '点击次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fangwubianhao`(`fangwubianhao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租金' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fangyuanpinzu
-- ----------------------------
INSERT INTO `fangyuanpinzu` VALUES (41, '2025-02-22 03:03:45', '1111111111', '自习室名称1', '租金分类1', 'upload/fangyuanpinzu_tupian1.jpg,upload/fangyuanpinzu_tupian2.jpg,upload/fangyuanpinzu_tupian3.jpg', '楼层1', '区域1', '面积1', '朝向1', '整租', '详细地址1', 1, '配套设施1', '自习室详情1', '房东账号1', '房东姓名1', '是', '', '2025-02-22 11:03:45', 1);
INSERT INTO `fangyuanpinzu` VALUES (42, '2025-02-22 03:03:45', '2222222222', '自习室名称2', '租金分类2', 'upload/fangyuanpinzu_tupian2.jpg,upload/fangyuanpinzu_tupian3.jpg,upload/fangyuanpinzu_tupian4.jpg', '楼层2', '区域2', '面积2', '朝向2', '整租', '详细地址2', 2, '配套设施2', '自习室详情2', '房东账号2', '房东姓名2', '是', '', '2025-02-22 11:03:45', 2);
INSERT INTO `fangyuanpinzu` VALUES (43, '2025-02-22 03:03:45', '3333333333', '自习室名称3', '租金分类3', 'upload/fangyuanpinzu_tupian3.jpg,upload/fangyuanpinzu_tupian4.jpg,upload/fangyuanpinzu_tupian5.jpg', '楼层3', '区域3', '面积3', '朝向3', '整租', '详细地址3', 3, '配套设施3', '自习室详情3', '房东账号3', '房东姓名3', '是', '', '2025-02-22 11:03:45', 3);
INSERT INTO `fangyuanpinzu` VALUES (44, '2025-02-22 03:03:45', '4444444444', '自习室名称4', '租金分类4', 'upload/fangyuanpinzu_tupian4.jpg,upload/fangyuanpinzu_tupian5.jpg,upload/fangyuanpinzu_tupian6.jpg', '楼层4', '区域4', '面积4', '朝向4', '整租', '详细地址4', 4, '配套设施4', '自习室详情4', '房东账号4', '房东姓名4', '是', '', '2025-02-22 11:03:45', 4);
INSERT INTO `fangyuanpinzu` VALUES (45, '2025-02-22 03:03:45', '5555555555', '自习室名称5', '租金分类5', 'upload/fangyuanpinzu_tupian5.jpg,upload/fangyuanpinzu_tupian6.jpg,upload/fangyuanpinzu_tupian7.jpg', '楼层5', '区域5', '面积5', '朝向5', '整租', '详细地址5', 5, '配套设施5', '自习室详情5', '房东账号5', '房东姓名5', '是', '', '2025-02-22 11:03:45', 5);
INSERT INTO `fangyuanpinzu` VALUES (46, '2025-02-22 03:03:45', '6666666666', '自习室名称6', '租金分类6', 'upload/fangyuanpinzu_tupian6.jpg,upload/fangyuanpinzu_tupian7.jpg,upload/fangyuanpinzu_tupian8.jpg', '楼层6', '区域6', '面积6', '朝向6', '整租', '详细地址6', 6, '配套设施6', '自习室详情6', '房东账号6', '房东姓名6', '是', '', '2025-02-22 11:03:45', 6);

-- ----------------------------
-- Table structure for jiankong
-- ----------------------------
DROP TABLE IF EXISTS `jiankong`;
CREATE TABLE `jiankong`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiankong
-- ----------------------------
INSERT INTO `jiankong` VALUES (101, '2025-02-22 03:03:45', '监控1', 'http://localhost:8080/zixishiguanli/upload/jiankong_picture1.jpg', 'upload/jiankong_picture1.jpg');
INSERT INTO `jiankong` VALUES (102, '2025-02-22 03:03:45', '监控2', 'http://localhost:8080/zixishiguanli/upload/jiankong_picture2.jpg', 'upload/jiankong_picture2.jpg');
INSERT INTO `jiankong` VALUES (103, '2025-02-22 03:03:45', '监控3', 'http://localhost:8080/zixishiguanli/upload/jiankong_picture3.jpg', 'upload/jiankong_picture3.jpg');
INSERT INTO `jiankong` VALUES (104, '2025-02-22 03:03:45', '监控4', 'http://localhost:8080/zixishiguanli/upload/jiankong_picture4.jpg', 'upload/jiankong_picture4.jpg');
INSERT INTO `jiankong` VALUES (105, '2025-02-22 03:03:45', '监控5', 'http://localhost:8080/zixishiguanli/upload/jiankong_picture5.jpg', 'upload/jiankong_picture5.jpg');
INSERT INTO `jiankong` VALUES (106, '2025-02-22 03:03:45', '监控6', 'http://localhost:8080/zixishiguanli/upload/jiankong_picture6.jpg', 'upload/jiankong_picture6.jpg');
INSERT INTO `jiankong` VALUES (107, '2025-02-22 03:03:45', '监控7', 'http://localhost:8080/zixishiguanli/upload/jiankong_picture7.jpg', 'upload/jiankong_picture7.jpg');
INSERT INTO `jiankong` VALUES (108, '2025-02-22 03:03:45', '监控8', 'http://localhost:8080/zixishiguanli/upload/jiankong_picture8.jpg', 'upload/jiankong_picture8.jpg');

-- ----------------------------
-- Table structure for jifei
-- ----------------------------
DROP TABLE IF EXISTS `jifei`;
CREATE TABLE `jifei`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zixishi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `begintime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jifei
-- ----------------------------
INSERT INTO `jifei` VALUES (2, '用户名1', '名称1', '2023-7-27 11:29:12', '2');
INSERT INTO `jifei` VALUES (3, '用户名2', '名称2', '2023-7-27 14:38:24', '6');
INSERT INTO `jifei` VALUES (4, '001', '名称1', '2025-2-22 9:55:28', '2');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NULL DEFAULT NULL COMMENT '留言人id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `cpicture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言图片',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `rpicture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1740189345579 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (131, '2025-02-22 03:03:45', 1, '用户名1', 'upload/messages_avatarurl1.jpg', '留言内容1', 'upload/messages_cpicture1.jpg', '回复内容1', 'upload/messages_rpicture1.jpg');
INSERT INTO `messages` VALUES (132, '2025-02-22 03:03:45', 2, '用户名2', 'upload/messages_avatarurl2.jpg', '留言内容2', 'upload/messages_cpicture2.jpg', '回复内容2', 'upload/messages_rpicture2.jpg');
INSERT INTO `messages` VALUES (133, '2025-02-22 03:03:45', 3, '用户名3', 'upload/messages_avatarurl3.jpg', '留言内容3', 'upload/messages_cpicture3.jpg', '回复内容3', 'upload/messages_rpicture3.jpg');
INSERT INTO `messages` VALUES (134, '2025-02-22 03:03:45', 4, '用户名4', 'upload/messages_avatarurl4.jpg', '留言内容4', 'upload/messages_cpicture4.jpg', '回复内容4', 'upload/messages_rpicture4.jpg');
INSERT INTO `messages` VALUES (135, '2025-02-22 03:03:45', 5, '用户名5', 'upload/messages_avatarurl5.jpg', '留言内容5', 'upload/messages_cpicture5.jpg', '回复内容5', 'upload/messages_rpicture5.jpg');
INSERT INTO `messages` VALUES (136, '2025-02-22 03:03:45', 6, '用户名6', 'upload/messages_avatarurl6.jpg', '留言内容6', 'upload/messages_cpicture6.jpg', '回复内容6', 'upload/messages_rpicture6.jpg');
INSERT INTO `messages` VALUES (137, '2025-02-22 03:03:45', 7, '用户名7', 'upload/messages_avatarurl7.jpg', '留言内容7', 'upload/messages_cpicture7.jpg', '回复内容7', 'upload/messages_rpicture7.jpg');
INSERT INTO `messages` VALUES (138, '2025-02-22 03:03:45', 8, '用户名8', 'upload/messages_avatarurl8.jpg', '留言内容8', 'upload/messages_cpicture8.jpg', '回复内容8', 'upload/messages_rpicture8.jpg');
INSERT INTO `messages` VALUES (1740189345578, '2025-02-22 09:55:45', 1740189220393, '001', 'upload/1740189205295.jpg', '222', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告资讯' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (61, '2023-07-10 00:16:56', '有梦想，就要努力去实现', '不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。', 'upload/news_picture1.jpg', '<p><img src=\"http://localhost:8080/zixishiguanli/upload/1672100404181.jpg\"></p><p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p>如果你觉得安于现状是你想要的，那选择安于现状就会让你幸福和满足;如果你不甘平庸，选择一条改变、进取和奋斗的道路，在这个追求的过程中，你也一样会感到快乐。所谓的成功，即是按照自己想要的生活方式生活。最糟糕的状态，莫过于当你想要选择一条不甘平庸、改变、进取和奋斗的道路时，却以一种安于现状的方式生活，最后抱怨自己没有得到想要的人生。</p><p>因为喜欢，你不是在苦苦坚持，也因为喜欢，你愿意投入时间、精力，长久以往，获得成功就是自然而然的事情。</p>');
INSERT INTO `news` VALUES (62, '2023-07-10 00:16:56', '又是一年毕业季', '又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。', 'upload/news_picture2.jpg', '<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>');
INSERT INTO `news` VALUES (63, '2023-07-10 00:16:56', '挫折路上，坚持常在心间', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/news_picture3.jpg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
INSERT INTO `news` VALUES (64, '2023-07-10 00:16:56', '挫折是另一个生命的开端', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。', 'upload/news_picture4.jpg', '<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>');
INSERT INTO `news` VALUES (65, '2023-07-10 00:16:56', '你要去相信，没有到不了的明天', '有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。', 'upload/news_picture5.jpg', '<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>');
INSERT INTO `news` VALUES (66, '2023-07-10 00:16:56', '离开是一种痛苦，是一种勇气，但同样也是一个考验，是一个新的开端', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/news_picture6.jpg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `news` VALUES (67, '2023-07-10 00:16:56', 'Leave未必是一种痛苦', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/news_picture7.jpg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `news` VALUES (68, '2023-07-10 00:16:56', '坚持才会成功', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/news_picture8.jpg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'zixishi' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` float NOT NULL DEFAULT 0 COMMENT '价格',
  `discountprice` float NULL DEFAULT 0 COMMENT '折扣价格',
  `total` float NOT NULL DEFAULT 0 COMMENT '总价格',
  `discounttotal` float NULL DEFAULT 0 COMMENT '折扣总价格',
  `type` int(11) NULL DEFAULT 1 COMMENT '支付类型',
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `logistics` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '物流',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderid`(`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1740189301915 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1672100513381, '2023-07-10 00:21:53', '202212278215244', 'zixishi', 1672100482355, 21, '名称1', 'upload/zixishi_tupian1.jpg', 1, 2, 2, 2, 2, 1, '已完成', '13', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1689738250922, '2023-07-19 03:44:10', '2023719114410807', 'zixishi', 1672100482355, 24, '名称4', 'upload/zixishi_tupian4.jpg', 1, 99.9, 99.9, 99.9, 99.9, 1, '已完成', '12', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1689738311331, '2023-07-19 03:45:10', '2023719114510551', 'zixishi', 1672100482355, 24, '名称4', 'upload/zixishi_tupian4.jpg', 1, 99.9, 99.9, 99.9, 99.9, 1, '已完成', '8', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690342424330, '2023-07-26 03:33:43', '2023726113343443', 'zixishi', 11, 21, '名称1', 'upload/zixishi_tupian1.jpg', 2, 2, 2, 4, 4, 1, '已支付', '2,4', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690342691950, '2023-07-26 03:38:11', '2023726113811383', 'zixishi', 11, 21, '名称1', 'upload/zixishi_tupian1.jpg', 1, 2, 2, 2, 2, 1, '已支付', '14', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690355168525, '2023-07-26 07:06:08', '20237261567996', 'zixishi', 11, 21, '名称1', 'upload/zixishi_tupian1.jpg', 6, 2, 2, 12, 12, 1, '已支付', '座位1,座位2,座位3,座位4,座位5,座位6', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690355191755, '2023-07-26 07:06:31', '202372615631141', 'zixishi', 11, 21, '名称1', 'upload/zixishi_tupian1.jpg', 6, 2, 2, 12, 12, 1, '已支付', '座位1,座位2,座位3,座位4,座位5,座位6', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690355323710, '2023-07-26 07:08:43', '202372615843360', 'zixishi', 11, 21, '名称1', 'upload/zixishi_tupian1.jpg', 6, 2, 2, 12, 12, 1, '已支付', '座位1,座位2,座位3,座位4,座位5,座位6', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690355764241, '2023-07-26 07:16:03', '202372615163188', 'zixishi', 11, 21, '名称1', 'upload/zixishi_tupian1.jpg', 6, 2, 2, 12, 12, 1, '已完成', '座位1,座位2,座位3,座位4,座位5,座位6', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690355960640, '2023-07-26 07:19:20', '2023726151920174', 'zixishi', 11, 21, '名称1', 'upload/zixishi_tupian1.jpg', 6, 2, 2, 12, 12, 1, '已支付', '座位1,座位2,座位3,座位4,座位5,座位6', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690356162301, '2023-07-26 07:22:42', '202372615224225', 'zixishi', 11, 22, '名称2', 'upload/zixishi_tupian2.jpg', 2, 6, 6, 12, 12, 1, '已支付', '座位2,座位4', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690357085322, '2023-07-26 07:38:04', '202372615384587', 'zixishi', 11, 23, '名称3', 'upload/zixishi_tupian3.jpg', 1, 99.9, 99.9, 99.9, 99.9, 1, '已支付', '座位5', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1690439807224, '2023-07-27 06:36:46', '2023727143646630', 'zixishi', 12, 21, '名称1', 'upload/zixishi_tupian1.jpg', 1, 2, 2, 2, 2, 1, '已支付', '座位1', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1740189255823, '2025-02-22 09:54:15', '202522295415201', 'zixishi', 1740189220393, 23, '名称3', 'upload/zixishi_tupian3.jpg', 1, 99.9, 99.9, 99.9, 99.9, 1, '已取消', '座位6', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (1740189301914, '2025-02-22 09:55:00', '20252229550932', 'zixishi', 1740189220393, 21, '名称1', 'upload/zixishi_tupian1.jpg', 1, 2, 2, 2, 2, 1, '已完成', '座位1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1672100498988 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storeup
-- ----------------------------
INSERT INTO `storeup` VALUES (1672100498987, '2023-07-10 00:21:38', 1672100482355, 21, 'zixishi', '名称1', 'upload/zixishi_tupian1.jpg', '1', NULL, NULL);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1, 'admin', 'users', '管理员', 'xyryn4a9cwo5r1693v8cez0fbklhzpli', '2023-07-10 00:19:13', '2025-02-22 11:27:38');
INSERT INTO `token` VALUES (2, 1672100482355, '111', 'yonghu', '用户', '6a4j9qi4esyeyvydx6mtt04tvgl83ew4', '2023-07-10 00:21:25', '2023-07-19 04:07:42');
INSERT INTO `token` VALUES (3, 11, '用户名1', 'yonghu', '用户', 'jm0i1dsky4454kwk4zfd1dbtt23vgpjk', '2023-07-26 03:31:58', '2023-07-27 04:19:08');
INSERT INTO `token` VALUES (4, 12, '用户名2', 'yonghu', '用户', '4pmp4a6179phiphx8dqxyb5uvabcup4w', '2023-07-27 06:33:07', '2023-07-27 07:33:07');
INSERT INTO `token` VALUES (5, 1740189220393, '001', 'yonghu', '用户', 'ztjk17ws2ve6g9771bd3okl42zbkxmts', '2025-02-22 09:53:47', '2025-02-22 11:26:26');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin', '管理员', '2023-07-10 00:16:56');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `shouji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `money` float NULL DEFAULT 0 COMMENT '余额',
  `msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息通知',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuming`(`yonghuming`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1740189220394 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (11, '2023-07-10 00:16:56', '用户名1', '123456', '姓名1', '女', 'upload/yonghu_touxiang1.jpg', '13823888881', '773890001@qq.com', 20022.1, NULL);
INSERT INTO `yonghu` VALUES (12, '2023-07-10 00:16:56', '用户名2', '123456', '姓名2', '男', 'upload/yonghu_touxiang2.jpg', '13823888882', '773890002@qq.com', 198, NULL);
INSERT INTO `yonghu` VALUES (13, '2023-07-10 00:16:56', '用户名3', '123456', '姓名3', '男', 'upload/yonghu_touxiang3.jpg', '13823888883', '773890003@qq.com', 200, NULL);
INSERT INTO `yonghu` VALUES (14, '2023-07-10 00:16:56', '用户名4', '123456', '姓名4', '男', 'upload/yonghu_touxiang4.jpg', '13823888884', '773890004@qq.com', 200, NULL);
INSERT INTO `yonghu` VALUES (15, '2023-07-10 00:16:56', '用户名5', '123456', '姓名5', '男', 'upload/yonghu_touxiang5.jpg', '13823888885', '773890005@qq.com', 200, NULL);
INSERT INTO `yonghu` VALUES (16, '2023-07-10 00:16:56', '用户名6', '123456', '姓名6', '男', 'upload/yonghu_touxiang6.jpg', '13823888886', '773890006@qq.com', 200, NULL);
INSERT INTO `yonghu` VALUES (17, '2023-07-10 00:16:56', '用户名7', '123456', '姓名7', '男', 'upload/yonghu_touxiang7.jpg', '13823888887', '773890007@qq.com', 200, NULL);
INSERT INTO `yonghu` VALUES (18, '2023-07-10 00:16:56', '用户名8', '123456', '姓名8', '男', 'upload/yonghu_touxiang8.jpg', '13823888888', '773890008@qq.com', 200, NULL);
INSERT INTO `yonghu` VALUES (1672100482355, '2023-07-10 00:21:22', '111', '111', '小邹', '女', 'upload/1672100467747.jpeg', '16459878981', '165@12.com', 5413.2, '你的座位快到时间了请续费');
INSERT INTO `yonghu` VALUES (1740189220393, '2025-02-22 09:53:40', '001', '123', '001', '男', 'upload/1740189205295.jpg', '13479525306', '1473893560@qq.com', 498, NULL);

-- ----------------------------
-- Table structure for zhuowei
-- ----------------------------
DROP TABLE IF EXISTS `zhuowei`;
CREATE TABLE `zhuowei`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `select` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zixishi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zhuowei
-- ----------------------------
INSERT INTO `zhuowei` VALUES (1, '座位1', '1', '0', '名称1');
INSERT INTO `zhuowei` VALUES (2, '座位2', '1', '0', '名称2');
INSERT INTO `zhuowei` VALUES (3, '座位3', '0', '0', '名称2');
INSERT INTO `zhuowei` VALUES (4, '座位4', '1', '0', '名称2');
INSERT INTO `zhuowei` VALUES (5, '座位5', '1', '0', '名称3');
INSERT INTO `zhuowei` VALUES (6, '座位6', '1', '0', '名称3');
INSERT INTO `zhuowei` VALUES (7, '座位2', '0', NULL, '名称1');

-- ----------------------------
-- Table structure for zixishi
-- ----------------------------
DROP TABLE IF EXISTS `zixishi`;
CREATE TABLE `zixishi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `guimo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规模',
  `sheshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设施',
  `weizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `yingyeshijian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业时间',
  `shoufeishuoming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费说明',
  `xiangqingjieshao` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情介绍',
  `price` float NOT NULL COMMENT '价格',
  `number` int(11) NULL DEFAULT NULL COMMENT '座位总数',
  `selected` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '已选座位[用,号隔开]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mingcheng`(`mingcheng`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自习室' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zixishi
-- ----------------------------
INSERT INTO `zixishi` VALUES (21, '2023-07-10 00:16:56', '名称1', 'upload/zixishi_tupian1.jpg,upload/zixishi_tupian2.jpg,upload/zixishi_tupian3.jpg', '大型', '设施1', '位置1', '营业时间1', '收费说明1', '<p><img src=\"http://localhost:8080/zixishiguanli/upload/1672100374576.jpg\">详情介绍1</p>', 2, 60, '座位1,座位1');
INSERT INTO `zixishi` VALUES (22, '2023-07-10 00:16:56', '名称2', 'upload/zixishi_tupian2.jpg,upload/zixishi_tupian3.jpg,upload/zixishi_tupian4.jpg', '中型', '设施2', '位置2', '营业时间2', '收费说明2', '<p><img src=\"http://localhost:8080/zixishiguanli/upload/1672100387923.jpg\">详情介绍2</p>', 6, 20, '座位2,座位4');
INSERT INTO `zixishi` VALUES (23, '2023-07-10 00:16:56', '名称3', 'upload/zixishi_tupian3.jpg,upload/zixishi_tupian4.jpg,upload/zixishi_tupian5.jpg', '小型', '设施3', '位置3', '营业时间3', '收费说明3', '<p>详情介绍3</p>', 99.9, 20, '座位5,座位6');
INSERT INTO `zixishi` VALUES (24, '2023-07-10 00:16:56', '名称4', 'upload/zixishi_tupian4.jpg,upload/zixishi_tupian5.jpg,upload/zixishi_tupian6.jpg', '大型', '设施4', '位置4', '营业时间4', '收费说明4', '详情介绍4', 99.9, 20, '');
INSERT INTO `zixishi` VALUES (25, '2023-07-10 00:16:56', '名称5', 'upload/zixishi_tupian5.jpg,upload/zixishi_tupian6.jpg,upload/zixishi_tupian7.jpg', '大型', '设施5', '位置5', '营业时间5', '收费说明5', '详情介绍5', 99.9, 20, '');
INSERT INTO `zixishi` VALUES (26, '2023-07-10 00:16:56', '名称6', 'upload/zixishi_tupian6.jpg,upload/zixishi_tupian7.jpg,upload/zixishi_tupian8.jpg', '大型', '设施6', '位置6', '营业时间6', '收费说明6', '详情介绍6', 99.9, 20, '');
INSERT INTO `zixishi` VALUES (27, '2023-07-10 00:16:56', '名称7', 'upload/zixishi_tupian7.jpg,upload/zixishi_tupian8.jpg,upload/zixishi_tupian9.jpg', '大型', '设施7', '位置7', '营业时间7', '收费说明7', '详情介绍7', 99.9, 20, '');
INSERT INTO `zixishi` VALUES (28, '2023-07-10 00:16:56', '名称8', 'upload/zixishi_tupian8.jpg,upload/zixishi_tupian9.jpg,upload/zixishi_tupian10.jpg', '大型', '设施8', '位置8', '营业时间8', '收费说明8', '详情介绍8', 99.9, 20, '');

SET FOREIGN_KEY_CHECKS = 1;
