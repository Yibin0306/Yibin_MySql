CREATE TABLE 学生(id INT,名字 VARCHAR(50),年龄 INT,性别 VARCHAR(50),班级 INT);

-- 1.查询名字中含有a字母的学生信息
SELECT * FROM 学生 WHERE 名字 LIKE "%a%";
-- 2.查询1班学生的数量
SELECT COUNT(*) FROM 学生 WHERE 班级=1;
-- 3.查询1班男生的数量
SELECT 性别, COUNT(性别) FROM 学生 WHERE 班级=1 && 性别="男";
-- 4.分别查询表中男生，女生的数量
SELECT 性别 , COUNT(性别) 数量 FROM 学生
GROUP BY 性别;
-- 5.查询每个班级的班级编号，学生人数
SELECT 班级,COUNT(*) 人数 FROM 学生
GROUP BY 班级;
-- 6.查询班级内包含女生的班级编号和女生人数
SELECT 班级,COUNT(班级) 数量 FROM 学生 WHERE 性别="女"
GROUP BY 班级
HAVING COUNT(*)>0;
-- 7.查询班级人数超过2人的班级编号和班级人数
SELECT 班级,COUNT(班级) 数量 FROM 学生
GROUP BY 班级
HAVING COUNT(班级)>2;
-- 8.查询名字是两个字符且年龄大于50的女生
SELECT * FROM 学生 WHERE 名字 LIKE "__" && 年龄>50 && 性别="女";