/*
Navicat MySQL Data Transfer

Source Server         : luo_pdd
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : luo_pdd

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-01-24 13:40:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pdd_homecasual
-- ----------------------------
DROP TABLE IF EXISTS `pdd_homecasual`;
CREATE TABLE `pdd_homecasual` (
  `imgurl` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pdd_homecasual
-- ----------------------------
INSERT INTO `pdd_homecasual` VALUES ('http://127.0.0.1:3000/images/home/s1.png', 'http://mobile.yangkeduo.com/subject.html?subject_id=6153');
INSERT INTO `pdd_homecasual` VALUES ('http://127.0.0.1:3000/images/home/s2.png', 'http://mobile.yangkeduo.com/promotion_op.html?type=12&id=228');
INSERT INTO `pdd_homecasual` VALUES ('http://127.0.0.1:3000/images/home/s3.png', 'http://mobile.yangkeduo.com/subject.html?subject_id=6242');
INSERT INTO `pdd_homecasual` VALUES ('http://127.0.0.1:3000/images/home/s5.png', 'http://mobile.yangkeduo.com/subject.html?subject_id=6230');
INSERT INTO `pdd_homecasual` VALUES ('http://127.0.0.1:3000/images/home/s6.png', 'http://mobile.yangkeduo.com/promotion_op.html?type=12&id=190');
INSERT INTO `pdd_homecasual` VALUES ('http://127.0.0.1:3000/images/home/s7.png', 'http://mobile.yangkeduo.com/promotion_op.html?type=12&id=229');
INSERT INTO `pdd_homecasual` VALUES ('http://127.0.0.1:3000/images/home/s8.png', 'http://mobile.yangkeduo.com/subject.html?subject_id=6153');
INSERT INTO `pdd_homecasual` VALUES ('http://127.0.0.1:3000/images/home/s9.png', 'http://mobile.yangkeduo.com/subject.html?subject_id=6242');
INSERT INTO `pdd_homecasual` VALUES ('http://127.0.0.1:3000/images/home/s4.png', 'http://mobile.yangkeduo.com/subject.html?subject_id=6153');

-- ----------------------------
-- Table structure for pdd_recommend
-- ----------------------------
DROP TABLE IF EXISTS `pdd_recommend`;
CREATE TABLE `pdd_recommend` (
  `goods_id` bigint(255) NOT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `hd_thumb_url` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `normal_price` int(255) DEFAULT NULL,
  `market_price` int(255) DEFAULT NULL,
  `sales_tip` varchar(255) DEFAULT NULL,
  `hd_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pdd_recommend
-- ----------------------------
INSERT INTO `pdd_recommend` VALUES ('2041906', '【可以穿的浴巾浴袍】比纯棉浴巾吸水韩版女浴巾可爱兔子', '可裹可穿超吸水性感浴巾', 'http://t00img.yangkeduo.com/t03img/images/2018-05-28/95448690d774b840c09882be6f89ba0a.jpeg', 'http://t00img.yangkeduo.com/t01img/images/2018-05-28/b6aa326d5a7370f1b48243dee0a14e5c.jpeg', 'http://omsproductionimg.yangkeduo.com/images/2017-07-11/4f18d2ab76a3fbcd348758ac262b05a0.jpeg', '1090', '1580', '5500', '已拼10万+件', 'http://t00img.yangkeduo.com/t08img/images/2018-05-28/31411123eaf1c115e1bf9e60ed6e9d98.jpeg');
INSERT INTO `pdd_recommend` VALUES ('2316452', '秋季牛仔裤男青年修身弹力小脚裤2018新款韩版潮流男士小直筒长裤', '男士修身弹力小脚裤 品质保证', 'http://t00img.yangkeduo.com/t11img/images/2018-07-15/6982d3a77481e146e9fb81dc31d3a546.jpeg', 'http://t00img.yangkeduo.com/t10img/images/2018-07-15/aa4c5248112bdc08cc2faec10b1ad2a7.jpeg', 'http://t00img.yangkeduo.com/t10img/images/2018-06-25/667b2fcd41a6a1450cc29aac5bb8507f.jpeg', '2800', '3200', '26900', '已拼2万件', 'http://t00img.yangkeduo.com/t07img/images/2018-07-15/e1e113fcbbff3a80d47db599a856d51a.jpeg');
INSERT INTO `pdd_recommend` VALUES ('10519372', '8册专注力训练儿童智力开发书2-6岁幼儿益智游戏书找不同思维训练', '专注力游戏书', 'http://t00img.yangkeduo.com/t05img/images/2018-06-21/db850903d0e78944dc68b6cb92a58ed5.jpeg', 'http://t00img.yangkeduo.com/t10img/images/2018-06-21/f39609e97b16487951cacfaa349619e6.jpeg', 'http://omsproductionimg.yangkeduo.com/images/2017-06-12/29c1a24e3ba385d6fa08d8312bdb269f.jpeg', '990', '1180', '5120', '已拼3万件', 'http://t00img.yangkeduo.com/t01img/images/2018-06-21/644fbcbb3fc30e8833481b87be1bb056.jpeg');
INSERT INTO `pdd_recommend` VALUES ('14213769', '【2份送一斤枣】宁夏枸杞枸杞子滋补红枸杞头茬苟杞子500/250/50g', '宁夏枸杞500g', 'http://omsproductionimg.yangkeduo.com/images/2018-05-26/215e734664aeeec25db3bc7ab90ff893.jpeg', 'http://omsproductionimg.yangkeduo.com/images/2018-05-26/4e037a3abb20b8bd9816a0e5cf8bebbd.jpeg', 'http://t00img.yangkeduo.com/t02img/images/2018-06-25/16b63fa711ecee9aef7d74424e219283.jpeg', '500', '680', '8800', '已拼10万+件', 'http://omsproductionimg.yangkeduo.com/images/2017-06-28/2b38d058aadbd7f53bbc363bba99e00a.jpeg');
INSERT INTO `pdd_recommend` VALUES ('48367210', '【天然竹浆本色品质纸巾】丝飘抽纸餐巾纸面纸妇婴适用卫生纸批发', '【天然竹浆本色品质纸巾】丝飘抽纸餐巾纸', 'http://t00img.yangkeduo.com/t07img/images/2018-05-27/38a24fafe5166b7e236a01ddf1ec7a04.jpeg', 'http://t00img.yangkeduo.com/t05img/images/2018-05-27/672d9e4bf34e8faa83054460446bcbe3.jpeg', 'http://t00img.yangkeduo.com/t10img/images/2018-03-11/81675d6ce75437c9a490d5f233df4141.jpeg', '990', '1490', '6690', '已拼10万+件', 'http://t00img.yangkeduo.com/t09img/images/2018-05-27/ee014c4ba052d094c097adc80b9325d7.jpeg');
INSERT INTO `pdd_recommend` VALUES ('50783155', '【南极人】肤色加绒加厚打底裤女光腿神器秋冬外穿保暖裤子连体裤', '加绒加厚打底踩脚裤保暖一体裤连裤袜', 'http://t00img.yangkeduo.com/t01img/images/2018-06-01/4d0c2a4168c2c8ea2053b1ba44e342cf.jpeg', 'http://t00img.yangkeduo.com/t01img/images/2018-06-01/1a984c0b71d4b3f5dd3e9a4a38a2429c.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-09-10/6db1b848614c4b8730c0ad5507c7637f.jpeg', '1990', '4990', '9900', '已拼10万+件', 'http://t00img.yangkeduo.com/t03img/images/2018-06-01/39b48497d277a9917e2b0bcbe2c4595b.jpeg');
INSERT INTO `pdd_recommend` VALUES ('65676090', 'USB可充电电子称体重秤精准家用健康秤人体秤成人减肥称重计器准', '体重秤精准家用健康秤人体秤成人减肥称重计', 'http://t00img.yangkeduo.com/t07img/images/2018-06-15/eccb3df7c0c6f180ebd0ec3fe755dae8.jpeg', 'http://t00img.yangkeduo.com/t08img/images/2018-06-15/b47b12272db838b8c72eb4b9a938aaac.jpeg', 'http://t00img.yangkeduo.com/t08img/images/2018-04-18/fc603bad27947c7adcdf1baae828cb34.jpeg', '1240', '3500', '16800', '已拼10万+件', 'http://t02img.yangkeduo.com/images/2018-04-09/ab4204a66a1ee9bbfb1ff723b8ed8f40.jpeg');
INSERT INTO `pdd_recommend` VALUES ('73318400', '【搓澡神器】承诺洗澡刷长柄浴刷搓背刷搓澡刷软毛洗澡刷搓背神器', '承诺升级款洗澡刷浴刷洗浴搓背刷长柄搓澡刷', 'http://omsproductionimg.yangkeduo.com/images/2018-06-15/f8c700654070b1215435b990a4d6e30e.jpeg', 'http://omsproductionimg.yangkeduo.com/images/2018-06-15/1991b1568cac46fcb8cc56c3431d1993.jpeg', 'http://omsproductionimg.yangkeduo.com/images/2017-10-29/b52afaddb84c46ac6551a072692b42b0.jpeg', '990', '1290', '6900', '已拼10万+件', 'http://omsproductionimg.yangkeduo.com/images/2017-09-06/6983f00c49b0b78099d6f0babd8ac97f.jpeg');
INSERT INTO `pdd_recommend` VALUES ('118241846', '湖南特产豆腐乳酱香辣霉豆腐农家自制超辣麻辣味下饭菜850g', '湖南特产瓦罐霉豆腐850g', 'http://t00img.yangkeduo.com/t10img/images/2018-06-30/3be2054f6c97eaecbd82b25eb0a09ba3.jpeg', 'http://t00img.yangkeduo.com/t03img/images/2018-06-30/eadbefbbb7a958d9d277920a21307238.jpeg', 'http://omsproductionimg.yangkeduo.com/images/2017-10-13/d4e000de29a2db3dc24622e2682a24bb.jpeg', '2980', '3480', '5500', '已拼1万件', 'http://t00img.yangkeduo.com/t09img/images/2018-06-30/85d3736dcea2ec7a2c6459058d6701bc.jpeg');
INSERT INTO `pdd_recommend` VALUES ('136590526', '【花花公子正品】皮带男士休闲自动扣皮带商务百搭自动扣学生腰带', '皮带男', 'http://t00img.yangkeduo.com/t10img/images/2018-06-22/2fa2b2b9b6423fa01b5a769110d20afb.jpeg', 'http://t00img.yangkeduo.com/t02img/images/2018-06-22/45cee30308baa4995bc4686720423705.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-09-01/68b91521e1a01573e101b15abcae9793.jpeg', '1380', '4990', '14900', '已拼10万+件', 'http://t00img.yangkeduo.com/t10img/images/2018-06-22/4235c00da369b1450172728895be9af4.jpeg');
INSERT INTO `pdd_recommend` VALUES ('169295119', '【戒烟神器】正品电子烟仿真香烟大烟雾水果味烟油男女清肺蒸汽烟', '【戒烟神器】仿真香烟电子烟套装多口味可选', 'http://omsproductionimg.yangkeduo.com/images/2018-01-14/05bb5251f30076115253eeaca5d6ad1e.jpeg', 'http://omsproductionimg.yangkeduo.com/images/2018-01-14/3ff694d98f06f1db6978b7fbe83d16a4.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-09-06/16689ceb93d0e167097f16452e7106d2.jpeg', '2980', '3680', '5900', '已拼10万+件', 'http://omsproductionimg.yangkeduo.com/images/2018-01-14/791a5a406cb903234ee472b6d25b6db4.jpeg');
INSERT INTO `pdd_recommend` VALUES ('178134109', '【爱斯麦】黑色牛仔裤女高腰春秋大码显瘦学生弹力紧身小脚长裤子', '爱斯麦正品黑色紧身牛仔小脚铅笔裤子', 'http://t00img.yangkeduo.com/t09img/images/2018-02-26/f1e9a209a2e2eb62df3a9ec36f1bcd74.jpeg', 'http://t00img.yangkeduo.com/t01img/images/2018-02-26/52d6a1c1c23dc89cd451fbf362f896c3.jpeg', 'http://omsproductionimg.yangkeduo.com/images/2017-11-06/c493dc4c067481beaa3d153cc943f146.png', '3990', '4990', '10800', '已拼4万件', 'http://t05img.yangkeduo.com/images/2018-02-26/397f63376d7fe23c408cbe8e01d6f2b6.png');
INSERT INTO `pdd_recommend` VALUES ('228942174', '【爆卖5600万包】采琪采本色抽纸批发母婴可用竹纤维面巾纸整箱装', '采琪采本色抽纸', 'http://t00img.yangkeduo.com/goods/images/2018-09-02/73592e733476de44c2e193a2c9c292e8.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-09-02/9d2fadb5b9ac0ba847f361248ad15494.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-08-31/b94868b99fbe4bef85c58e83f1e4e8fd.jpeg', '990', '1390', '3990', '已拼10万+件', 'http://t11img.yangkeduo.com/images/2018-03-21/6f27160410b2ddc397d23e1fc02626b8.jpeg');
INSERT INTO `pdd_recommend` VALUES ('344112935', '【连续听歌32小时】【买一送三】蓝牙耳机通用所有手机{待机70天}', '蓝牙耳机通用所有手机', 'http://t00img.yangkeduo.com/t03img/images/2018-05-05/690f068dfbf940e9a22f71132766bcd1.jpeg', 'http://t00img.yangkeduo.com/t03img/images/2018-05-05/5175ccf0a7b569aea93396c2b2ad697d.jpeg', 'http://t00img.yangkeduo.com/t11img/images/2018-06-19/cd59c6af23ef22afd5baa8f86b6fbc9b.jpeg', '990', '1300', '19900', '已拼8万件', 'http://t10img.yangkeduo.com/images/2018-05-05/8b05dd53fd89954e7b23962fde4c43cc.png');
INSERT INTO `pdd_recommend` VALUES ('482053513', '媛萱美女童套装2018新款春装小孩衣服童装春秋装大童运动三件套', '中大童印花刺绣三件套（马甲+卫衣+裤子）', 'http://t00img.yangkeduo.com/goods/images/2018-08-03/de99ad14155622603d996a7b807a366d.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-08-03/69425cc7135b2ba75c099ff23724ded1.jpeg', 'http://t00img.yangkeduo.com/t05img/images/2018-03-26/744cc6062d93a415fa5012c6c0e65e3d.jpeg', '4980', '7900', '27900', '已拼2万件', 'http://t00img.yangkeduo.com/goods/images/2018-08-03/109085a8fc7144900d34d8439b47aa45.jpeg');
INSERT INTO `pdd_recommend` VALUES ('882888828', '亏本冲量厂家直销破损补发抽屉化妆品收纳盒桌面置物饰品收纳盒架', '桌面化妆品收纳盒', 'http://t00img.yangkeduo.com/t07img/images/2018-06-06/43526c71d4e9266b070ebf0c26ae0817.jpeg', 'http://t00img.yangkeduo.com/t07img/images/2018-06-06/d6adb7a168fbcf37fc56832a6cd106c4.jpeg', 'http://t00img.yangkeduo.com/t02img/images/2018-03-31/ab85553637fdddcc295cec711a4a0913.jpeg', '760', '990', '3880', '已拼10万+件', 'http://t08img.yangkeduo.com/images/2018-04-09/2ba836c423e86bf13169e9254a0450b5.jpeg');
INSERT INTO `pdd_recommend` VALUES ('2459679200', '【花花公子贵宾正品】潮休闲运动鞋学生跑步鞋男单鞋子轻便透气', '花花公子贵宾飞织男鞋', 'http://t00img.yangkeduo.com/goods/images/2018-08-15/e0ba59e1f28566155b45b164de9372a9.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-08-15/54fe60fbb8e2f79f6e8d0d919909f2dd.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-08-21/384a84088457fe98b3d451b169440b69.jpeg', '2690', '6990', '12900', '已拼10万+件', 'http://t00img.yangkeduo.com/goods/images/2018-08-15/88f1c33e3040b16f92532c6484c29359.jpeg');
INSERT INTO `pdd_recommend` VALUES ('2491622905', '童装女童秋装套装2018新款春秋季小女孩洋气儿童时髦运动三件套', '女童春秋装套装2018新款儿童三件套', 'http://t00img.yangkeduo.com/goods/images/2018-09-09/96d93f3c3739a6e910f9d11bcad37298.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-09-09/f1a8e44dfc8249a164bfbeafcd0dad25.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-08-13/07b2f91dc858621176bcc473e97293f0.jpeg', '5680', '7500', '18800', '已拼1万件', 'http://t00img.yangkeduo.com/goods/images/2018-09-09/3b2dc2d2637171d34428d0a938552498.jpeg');
INSERT INTO `pdd_recommend` VALUES ('2570072250', '【花花公子贵宾,晋江冷粘鞋】美国品牌透气防臭飞织大码男运动鞋', '花花公子贵宾男鞋', 'http://t00img.yangkeduo.com/goods/images/2018-08-26/bb75e1d2f253061024ad43c1ef52b908.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-08-26/2c5c90fc139d0b3f562e50d98a3afa6f.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-08-26/c4b8dce28810d4ebedae438158ed4f0c.jpeg', '4990', '19900', '20000', '已拼2万件', 'http://t00img.yangkeduo.com/goods/images/2018-08-26/ab3dad89275efa7cd62810bf00288de6.jpeg');
INSERT INTO `pdd_recommend` VALUES ('2635286942', '俏丽苏格子长袖衬衣女2018秋新款韩版宽松外套打底衫女士衬衫上衣', '新款韩版百搭女装打底衫女士衬衫上衣', 'http://t00img.yangkeduo.com/goods/images/2018-08-17/571add96718caf017b5eef9b7a6a788c.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-08-17/091d8f7dbfad772ab2843351516a364d.jpeg', 'http://t00img.yangkeduo.com/goods/images/2018-08-27/f3947b680054d0f30cf6ba45bc70cf93.jpeg', '2980', '4500', '15800', '已拼10万+件', 'http://t00img.yangkeduo.com/goods/images/2018-08-17/b71afef6424d72ba73a2890a4d04cf64.jpeg');

-- ----------------------------
-- Table structure for pdd_user_info
-- ----------------------------
DROP TABLE IF EXISTS `pdd_user_info`;
CREATE TABLE `pdd_user_info` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pdd_user_info
-- ----------------------------
INSERT INTO `pdd_user_info` VALUES ('1', '18888888888', '18888888888');
