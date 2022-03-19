CREATE TABLE 动物 (id int,名字 VARCHAR(10),颜色 VARCHAR(10),年龄 INT);
-- 添加舒徐
INSERT INTO 动物 VALUES(1001,"cat","black",12),(1002,"duck","yellow",6),(1003,"dot","gray",11),(1004,"tigger","caise",23);
-- 1.查询名字中含g的动物
SELECT * FROM 动物 WHERE 名字 LIKE "%g%";
-- 2.查询颜色中包括含k字母的动物
SELECT * FROM 动物 WHERE 颜色 LIKE "%k%";
-- 3.查询名字中第二个字符是i的动物
SELECT * FROM 动物 WHERE 名字 LIKE "_i%";
-- 4.查询名字中第一个字母为d的且第三个字母为c的动物
SELECT * FROM 动物 WHERE 名字 LIKE "d%" and 名字 LIKE "__c%";
-- 5.按照年龄从小到大查询所有动物的信息
SELECT * FROM 动物 ORDER BY 年龄 DESC;
-- 6.查询年龄在1-88之间的动物信息
SELECT * FROM 动物 WHERE 年龄 BETWEEN 1 and 88;
-- 7.查询名字长度为四个字符的动物信息
SELECT * FROM 动物 WHERE 名字 like "____";
-- 8.查询颜色第三个字符为a的动物信息
SELECT * FROM 动物 WHERE 颜色 LIKE "__a%";