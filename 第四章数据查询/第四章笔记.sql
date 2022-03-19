-- 查询入门
-- 回顾
-- 添加：INSERT into  ALTER
-- 修改：UPDATE...
-- 删除：DELETE

-- 查询入门  SELECT
-- 语法 SELECT 列1，列2，* FROM 表  WHERE 条件；
-- 查询表中所有数据
-- SELECT id，name，age FROM 表名；
-- SELECT * from 表名；

-- 查询中的别名
  -- as 关键字
	 -- SELECT name as 姓名 FROM 表名；
  -- 空格
	 -- SELECT age xx FROM 表名；（逗号）

-- 条件查询
  -- 查询所有性别为w的记录
	 -- SELECT * FROM 表名 WHERE 列="w"
  -- 查询名字第二个字符是c的
	 -- SELECT * FROM 表名 WHERE 列 LIKE "_c%"
  -- 查询第一个是c且c结尾
	 -- WHERE 列 like "c%c"
	 
-- 多条件查询 逻辑运算符 and(且) or(或) not(非) 
	-- 查询年龄小于30且名字以a开头
	 -- WHERE 列<30 and 列 like “a%”.....以此类推 or not (WHERE not 条件)

-- DISTINCT 消除重复行
  -- SELECT DISTINCT 列 FROM 表名；
-- LIMIT 分页查询 limit a，b 整数类型参数
  -- a:从第几行开始，对应行的下标
	-- b:控制结果的行数
	  -- SELECT * FROM 表名 LIMIT 1,1;
		
-- 排序 ORDER BY 列名  规则：升序 asc 降序 desc
 -- 按照年龄升序
  -- SELECT * FROM 表名 ORDER BY 列 asc;
 -- 按照id降序排
  -- SELECT * FROM 表名 ORDER BY 列 desc;
 -- 先按年龄升序排 再按照id降序排
  -- SELECT * FROM 表名 ORDER BY 列 asc,id DESC；