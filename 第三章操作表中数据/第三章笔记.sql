-- 比较运算符 表达式 ：布尔表达式 值：true 1  flase 0
-- < 
-- >
-- <==
-- >==
-- =
-- !=  <>

-- is null 是空
-- SELECT NUll is NULL;
-- is not NULL 非空
-- SELECT NUll is NULL;

-- in 判断一个值在是否属于列表长任意一个
-- ont in 不是列表中任意一个

-- like 通配符匹配  找相同
-- _:匹配一个任意字符
-- %：匹配0-n个任意字符
 -- SELECT"abc"like"_bc";
 -- SELECT"abc"like"__c";
 -- SELECT"abc"like"%c";
 -- SELECT"aaa"like"%_%";
 -- SELECT"abcdefg"like"%b_c%";
 -- SELECT"tom"like"t%";

-- BETWEEN AND 判断一个值是否在两个值中间
-- SELECT 3 BETWEEN 2 AND 7 ;

-- 添加数据 INSERT INTO
 -- 1.一次添加一次数据
 -- 语法:INSERT into 表名（字段1，字段2，....）VALUES（值1，值2，...）
 --      INSERT INTO 表名 VALUES （值1，值2...）
 -- 2.一次添加多行数据
  -- 语法：INSERT into 表名（） VALUES（），（），（）;

-- 修改表中的数据
 -- 语法：UPDATE 表名 set 列名1=值，列名2=值，where条件；
  -- 把表中年龄大于20的增加5
  -- UPDATE 表名 set 列名 = 列名+5 WHERE 列名>20；
	-- 把表中表id=3的名字改成cyb，年龄改为0
	-- UPDATE 表名 set 列名=“cyb” ，列名=0，WHERE 列名id=3；
	
-- 删除表中数据 
 -- 语法：DELETE from 表名 where 条件
  -- 删除数据为<16数据
	-- DELETE FROM 表名 WHERE 列名<16；
	-- 删除表中所有数据
	 -- 1.删除表中所有数据
	 -- DELETE FROM 表名；
	 -- 2. TRUNCATE TABLE 表名；（有外键约束的不能删）
