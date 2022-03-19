-- 第六章 --
-- 构建表
CREATE TABLE 员工表(
员工id int PRIMARY key,
员工名字 VARCHAR(50),
员工年龄 INT,
员工性别 VARCHAR(50),
部门id INT
);
-- 构建部门表
CREATE TABLE 部门表(
部门id INT PRIMARY KEY,
部门名字 VARCHAR(50),
地址id INT
);
-- 构建地址表
CREATE TABLE 地址表(
地址id INT PRIMARY KEY,
地址名字 VARCHAR(50)
);

-- 链接查询 -- 表肯定是大于1张
-- 交叉查询 是把两张或者多张的表内数据一一对应（笛卡尔乘积）
-- 语法：SELECT 字段 ... FROM 表一，表二，.....；
SELECT * FROM 地址表,部门表;
-- 添加链接条件
SELECT * FROM 地址表,部门表 WHERE 地址表.`地址id` = 部门表.`地址id`;
-- 缩减  给表起别名
SELECT * FROM 地址表 l,部门表 d WHERE l.`地址id` = d.`地址id`;

-- 内连接 表 INNER JOIN 表  on  链接条件SELECT * FROM 地址表 l INNER JOIN 部门表 d
on l.地址id=d.地址id;

-- 外连接
 -- 1.左外连接  左边的表为主表，右边为附表
  -- 语法： LEFT JOIN    on
SELECT * FROM 地址表
LEFT JOIN 部门表
on 地址表.`地址id`=部门表.`地址id`;
 -- 2.右外链接     右表为主表，左边为附表
  -- 语法： RIGHT JOIN    on
SELECT * FROM 地址表
RIGHT JOIN 部门表
on 地址表.`地址id`=部门表.`地址id`;

