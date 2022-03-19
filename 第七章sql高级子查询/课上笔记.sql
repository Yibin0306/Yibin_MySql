-- 第七章 子查询
 -- 1.子查询概念：
  -- 一个查询中 嵌套 另一个查询 父查询  子查询
	          父                            子
-- SELECT * FROM 表名 WHERE 列 =(SELECT 列 FROM 表名....)
-- 什么情况下用到子查询  条件必须得用一个查询获得

-- 查询研发部所有员工信息
-- SELECT * FROM 表名 WHERE 列 部门id = (
-- SELECT 列 部门id FROM 表名 WHERE 列 部门名字 = “研发部”)

-- 查询研发部和人事部 所有员工信息
--  SELECT * FROM 表名 员工 WHERE 列 部门id = 
-- （SELECT 列 部门id FROM 表名 部门 WHERE 列 部门名字 = “研发部”）or 部门id=
-- （SELECT 列 部门id FROM 表名 部门 WHERE 列 部门名字 = “人事部”）

-- 查询研发部和人事部 所有员工信息
--  SELECT * FROM 表名 员工 WHERE 列 部门id IN
-- （SELECT 列 部门id FROM 表名 部门 WHERE 列 部门名字 = “研发部” or 列 部门名字 = “人事部”）

-- 查询不是 研发部和人事部 所有员工信息
--  SELECT * FROM 表名 员工 WHERE 列 部门id NOT IN
-- （SELECT 列 部门id FROM 表名 部门 WHERE 列 部门名字 = “研发部” or 列 部门名字 = “人事部”）

-- ？=:子查询自由一个值的时候   ？in ，not in:子查询有多个值
-- <all 小于最小值
-- >all 大于最大值
-- <ANY/some 小于最大值
-- >any/some 大于最小值

-- 如果有后勤部，查询所有员工信息 
-- EXISTS 存在 ， not EXISTS 不存在
-- SELECT * FROM 表名 员工 WHERE EXISTS（
-- SELECT * FROM 表名 部门 WHERE 列 部门名字 = “后勤部”）

-- 如果不存在年龄大于100的员工，查询所有员工信息
-- SELECT * FROM 表名 员工 WHERE not EXISTS（
-- SELECT * FROM 表名 员工 WHERE 列 年龄 > 100）

-- 查询比2部门任何一个年龄都小的年龄信息
-- SELECT * FROM 表名 员工 WHERE 列 年龄<ALL（
-- SELECT 列 年龄 FROM 表名 员工 WHERE 列 部门id=2）

-- 查询比2部门任何一个年龄都大的年龄信息
-- SELECT * FROM 表名 员工 WHERE 列 年龄>ALL（
-- SELECT 列 年龄 FROM 表名 员工 WHERE 列 部门id=2）

-- 查询比2部门其中一个人年龄小的员工信息
-- SELECT * FROM 表名 员工 WHERE 列 年龄<ANY（
--  SELECT 列 年龄 FROM 表名 员工 WHERE 列 部门id=2）

-- 查询比2部门其中一个人年龄大的员工信息
-- SELECT * FROM 表名 员工 WHERE 列 年龄>ANY（
--  SELECT 列 年龄 FROM 表名 员工 WHERE 列 部门id=2）
