/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t128`;
CREATE DATABASE IF NOT EXISTS `t128` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t128`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'http://localhost:8080/springbootx1786/upload/picture1.jpg'),
	(2, 'picture2', 'http://localhost:8080/springbootx1786/upload/picture2.jpg'),
	(3, 'picture3', 'http://localhost:8080/springbootx1786/upload/picture3.jpg'),
	(6, 'homepage', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `defentongji`;
CREATE TABLE IF NOT EXISTS `defentongji` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tongjibianhao` varchar(200) DEFAULT NULL COMMENT '统计编号',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `shijuantimu` varchar(200) DEFAULT NULL COMMENT '试卷题目',
  `defen` float DEFAULT NULL COMMENT '得分',
  `defenfenxi` longtext COMMENT '得分分析',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tongjibianhao` (`tongjibianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COMMENT='得分统计';

DELETE FROM `defentongji`;
INSERT INTO `defentongji` (`id`, `addtime`, `tongjibianhao`, `zhanghao`, `xingming`, `shijuantimu`, `defen`, `defenfenxi`, `dengjiriqi`) VALUES
	(41, '2021-05-18 12:07:53', '统计编号1', '账号1', '姓名1', '试卷题目1', 1, '得分分析1', '2021-05-18'),
	(42, '2021-05-18 12:07:53', '统计编号2', '账号2', '姓名2', '试卷题目2', 2, '得分分析2', '2021-05-18'),
	(43, '2021-05-18 12:07:53', '统计编号3', '账号3', '姓名3', '试卷题目3', 3, '得分分析3', '2021-05-18'),
	(44, '2021-05-18 12:07:53', '统计编号4', '账号4', '姓名4', '试卷题目4', 4, '得分分析4', '2021-05-18'),
	(45, '2021-05-18 12:07:53', '统计编号5', '账号5', '姓名5', '试卷题目5', 5, '得分分析5', '2021-05-18'),
	(46, '2021-05-18 12:07:53', '统计编号6', '账号6', '姓名6', '试卷题目6', 6, '得分分析6', '2021-05-18');

DROP TABLE IF EXISTS `discusstikuziyuan`;
CREATE TABLE IF NOT EXISTS `discusstikuziyuan` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint NOT NULL COMMENT '关联表id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3 COMMENT='题库资源评论表';

DELETE FROM `discusstikuziyuan`;
INSERT INTO `discusstikuziyuan` (`id`, `addtime`, `refid`, `userid`, `nickname`, `content`, `reply`) VALUES
	(121, '2021-05-18 12:07:53', 1, 1, '用户名1', '评论内容1', '回复内容1'),
	(122, '2021-05-18 12:07:53', 2, 2, '用户名2', '评论内容2', '回复内容2'),
	(123, '2021-05-18 12:07:53', 3, 3, '用户名3', '评论内容3', '回复内容3'),
	(124, '2021-05-18 12:07:53', 4, 4, '用户名4', '评论内容4', '回复内容4'),
	(125, '2021-05-18 12:07:53', 5, 5, '用户名5', '评论内容5', '回复内容5'),
	(126, '2021-05-18 12:07:53', 6, 6, '用户名6', '评论内容6', '回复内容6');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int NOT NULL COMMENT '考试时长(分钟)',
  `status` int NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint DEFAULT NULL COMMENT '父节点id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COMMENT='用户交流';

DELETE FROM `forum`;
INSERT INTO `forum` (`id`, `addtime`, `title`, `content`, `parentid`, `userid`, `username`, `isdone`) VALUES
	(51, '2021-05-18 12:07:53', '帖子标题1', '帖子内容1', 1, 1, '用户名1', '开放'),
	(52, '2021-05-18 12:07:53', '帖子标题2', '帖子内容2', 2, 2, '用户名2', '开放'),
	(53, '2021-05-18 12:07:53', '帖子标题3', '帖子内容3', 3, 3, '用户名3', '开放'),
	(54, '2021-05-18 12:07:53', '帖子标题4', '帖子内容4', 4, 4, '用户名4', '开放'),
	(55, '2021-05-18 12:07:53', '帖子标题5', '帖子内容5', 5, 5, '用户名5', '开放'),
	(56, '2021-05-18 12:07:53', '帖子标题6', '帖子内容6', 6, 6, '用户名6', '开放');

DROP TABLE IF EXISTS `liantitongji`;
CREATE TABLE IF NOT EXISTS `liantitongji` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tongjibianhao` varchar(200) DEFAULT NULL COMMENT '统计编号',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `lianticishu` int DEFAULT NULL COMMENT '练题次数',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tongjibianhao` (`tongjibianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COMMENT='练题统计';

DELETE FROM `liantitongji`;
INSERT INTO `liantitongji` (`id`, `addtime`, `tongjibianhao`, `zhanghao`, `xingming`, `lianticishu`, `dengjiriqi`, `beizhu`) VALUES
	(31, '2021-05-18 12:07:53', '统计编号1', '账号1', '姓名1', 1, '2021-05-18', '备注1'),
	(32, '2021-05-18 12:07:53', '统计编号2', '账号2', '姓名2', 2, '2021-05-18', '备注2'),
	(33, '2021-05-18 12:07:53', '统计编号3', '账号3', '姓名3', 3, '2021-05-18', '备注3'),
	(34, '2021-05-18 12:07:53', '统计编号4', '账号4', '姓名4', 4, '2021-05-18', '备注4'),
	(35, '2021-05-18 12:07:53', '统计编号5', '账号5', '姓名5', 5, '2021-05-18', '备注5'),
	(36, '2021-05-18 12:07:53', '统计编号6', '账号6', '姓名6', 6, '2021-05-18', '备注6');

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '留言人id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1713015742919 DEFAULT CHARSET=utf8mb3 COMMENT='留言板';

DELETE FROM `messages`;
INSERT INTO `messages` (`id`, `addtime`, `userid`, `username`, `content`, `reply`) VALUES
	(111, '2021-05-18 12:07:53', 1, '用户名1', '留言内容1', '回复内容1'),
	(112, '2021-05-18 12:07:53', 2, '用户名2', '留言内容2', '回复内容2'),
	(113, '2021-05-18 12:07:53', 3, '用户名3', '留言内容3', '回复内容3'),
	(114, '2021-05-18 12:07:53', 4, '用户名4', '留言内容4', '回复内容4'),
	(115, '2021-05-18 12:07:53', 5, '用户名5', '留言内容5', '回复内容5'),
	(116, '2021-05-18 12:07:53', 6, '用户名6', '留言内容6', '回复内容6'),
	(1713015742918, '2024-04-13 13:42:22', 11, '用户1', '666', NULL);

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COMMENT='训练通知';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`) VALUES
	(101, '2021-05-18 12:07:53', '标题1', '简介1', 'http://localhost:8080/springbootx1786/upload/news_picture1.jpg', '内容1'),
	(102, '2021-05-18 12:07:53', '标题2', '简介2', 'http://localhost:8080/springbootx1786/upload/news_picture2.jpg', '内容2'),
	(103, '2021-05-18 12:07:53', '标题3', '简介3', 'http://localhost:8080/springbootx1786/upload/news_picture3.jpg', '内容3'),
	(104, '2021-05-18 12:07:53', '标题4', '简介4', 'http://localhost:8080/springbootx1786/upload/news_picture4.jpg', '内容4'),
	(105, '2021-05-18 12:07:53', '标题5', '简介5', 'http://localhost:8080/springbootx1786/upload/news_picture5.jpg', '内容5'),
	(106, '2021-05-18 12:07:53', '标题6', '简介6', 'http://localhost:8080/springbootx1786/upload/news_picture6.jpg', '内容6');

DROP TABLE IF EXISTS `storeup`;
CREATE TABLE IF NOT EXISTS `storeup` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `refid` bigint DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1713015723377 DEFAULT CHARSET=utf8mb3 COMMENT='收藏表';

DELETE FROM `storeup`;
INSERT INTO `storeup` (`id`, `addtime`, `userid`, `refid`, `tablename`, `name`, `picture`) VALUES
	(1713015723376, '2024-04-13 13:42:03', 11, 23, 'tikuziyuan', '资源名称3', 'http://localhost:8080/springbootx1786/upload/tikuziyuan_fengmian3.jpg');

DROP TABLE IF EXISTS `tikuziyuan`;
CREATE TABLE IF NOT EXISTS `tikuziyuan` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ziyuanmingcheng` varchar(200) NOT NULL COMMENT '资源名称',
  `ziyuanleixing` varchar(200) DEFAULT NULL COMMENT '资源类型',
  `wenjian` varchar(200) DEFAULT NULL COMMENT '文件',
  `ziyuanneirong` longtext COMMENT '资源内容',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `shangchuanshijian` date DEFAULT NULL COMMENT '上传时间',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='题库资源';

DELETE FROM `tikuziyuan`;
INSERT INTO `tikuziyuan` (`id`, `addtime`, `ziyuanmingcheng`, `ziyuanleixing`, `wenjian`, `ziyuanneirong`, `fengmian`, `shangchuanshijian`, `clicktime`, `clicknum`) VALUES
	(21, '2021-05-18 12:07:53', '资源名称1', '资源类型1', '', '资源内容1', 'http://localhost:8080/springbootx1786/upload/tikuziyuan_fengmian1.jpg', '2021-05-18', '2021-05-18 20:07:53', 1),
	(22, '2021-05-18 12:07:53', '资源名称2', '资源类型2', '', '资源内容2', 'http://localhost:8080/springbootx1786/upload/tikuziyuan_fengmian2.jpg', '2021-05-18', '2024-04-13 21:40:33', 3),
	(23, '2021-05-18 12:07:53', '资源名称3', '资源类型3', '', '资源内容3', 'http://localhost:8080/springbootx1786/upload/tikuziyuan_fengmian3.jpg', '2021-05-18', '2024-04-13 21:42:05', 7),
	(24, '2021-05-18 12:07:53', '资源名称4', '资源类型4', '', '资源内容4', 'http://localhost:8080/springbootx1786/upload/tikuziyuan_fengmian4.jpg', '2021-05-18', '2021-05-18 20:07:53', 4),
	(25, '2021-05-18 12:07:53', '资源名称5', '资源类型5', '', '资源内容5', 'http://localhost:8080/springbootx1786/upload/tikuziyuan_fengmian5.jpg', '2021-05-18', '2021-05-18 20:07:53', 5),
	(26, '2021-05-18 12:07:53', '资源名称6', '资源类型6', '', '资源内容6', 'http://localhost:8080/springbootx1786/upload/tikuziyuan_fengmian6.jpg', '2021-05-18', '2021-05-18 20:07:53', 6);

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'abo', 'users', '管理员', '6vnhk6xv9nwt6udvxsiv4t7tit3eep7c', '2021-05-18 12:11:21', '2024-04-13 14:44:23'),
	(2, 1621339919466, '11', 'yonghu', '用户', 'pa3w2q7epvweixexglxedf4udqjitpq6', '2021-05-18 12:12:02', '2021-05-18 13:12:02'),
	(3, 11, '用户1', 'yonghu', '用户', 'zkotdynjadckwk04hy00zk42bb4k30lb', '2024-04-13 13:41:36', '2024-04-13 14:42:02');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2021-05-18 12:07:53');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `nianling` varchar(200) NOT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) NOT NULL COMMENT '手机',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1621339919467 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `addtime`, `zhanghao`, `mima`, `xingming`, `nianling`, `xingbie`, `shouji`, `zhaopian`) VALUES
	(11, '2021-05-18 12:07:53', '用户1', '123456', '姓名1', '年龄1', '男', '13823888881', 'http://localhost:8080/springbootx1786/upload/yonghu_zhaopian1.jpg'),
	(12, '2021-05-18 12:07:53', '用户2', '123456', '姓名2', '年龄2', '男', '13823888882', 'http://localhost:8080/springbootx1786/upload/yonghu_zhaopian2.jpg'),
	(13, '2021-05-18 12:07:53', '用户3', '123456', '姓名3', '年龄3', '男', '13823888883', 'http://localhost:8080/springbootx1786/upload/yonghu_zhaopian3.jpg'),
	(14, '2021-05-18 12:07:53', '用户4', '123456', '姓名4', '年龄4', '男', '13823888884', 'http://localhost:8080/springbootx1786/upload/yonghu_zhaopian4.jpg'),
	(15, '2021-05-18 12:07:53', '用户5', '123456', '姓名5', '年龄5', '男', '13823888885', 'http://localhost:8080/springbootx1786/upload/yonghu_zhaopian5.jpg'),
	(16, '2021-05-18 12:07:53', '用户6', '123456', '姓名6', '年龄6', '男', '13823888886', 'http://localhost:8080/springbootx1786/upload/yonghu_zhaopian6.jpg'),
	(1621339919466, '2021-05-18 12:11:59', '11', '11', '水电费', '11', NULL, '11122211111', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
