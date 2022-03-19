-- 1.创建表
CREATE TABLE 学生(id int,名字 VARCHAR(10),年龄 int,性别 VARCHAR(4));
-- 添加五个数据
INSERT INTO 学生 VALUES(1,"aa",12,"男"),(2,"bb",121,"男"),(3,"cc",52,"男"),(4,"dd",92,"男"),(5,"ee",2,"男"),(6,"ff",2,"女");
-- 2.把性别为女的年龄改为18
UPDATE 学生 set 年龄=18 WHERE 性别="女";
-- 3.把名字中含有"e"字符的年龄增加5
UPDATE 学生 set 年龄=年龄+5 WHERE 名字 LIKE "%e%";
-- 4.把年龄小于40的性别改为无
UPDATE 学生 set 性别="无" WHERE 年龄<40;
-- 5.把名字中以a字母结尾的年龄改为0
UPDATE 学生 set 年龄=0 WHERE 名字 LIKE "%a";
-- 6.把年龄属于10-60之间的性别改为女
UPDATE 学生 set 性别="女" WHERE 年龄 BETWEEN 10 AND 60;
-- 7.删除年龄小于10的数据
DELETE FROM 学生 WHERE 年龄<10;
-- 8.删除年龄在2-20之间的数据
DELETE FROM 学生 WHERE 年龄 BETWEEN 2 AND 20;
-- 9.删除名字中含有“e”字母的数据
DELETE FROM 学生 WHERE 名字 LIKE "%e%";
-- 10.删除名字中以“b”开头的数据
DELETE FROM 学生 WHERE 名字 LIKE "b%";