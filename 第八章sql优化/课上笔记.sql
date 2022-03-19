-- ALTER 修改表结构
-- 创建索引:
-- ALTER TABLE 表名 add INDEX 名字(列名);
-- CREATE:
-- CREATE INDEX 索引名 on 表名(列名);

-- 查看索引:数据库默认给主键创建索引
-- SHOW INDEX FROM 表名;
-- 删除索引:on
-- DROP INDEX 索引名 on 表名

-- 创建表时添加索引
-- CREATE TABLE 表名(
--  id int，
--  NAME int，
--  afe，
-- INDEX(NAME)
-- );

-- 注意：mysql自动提交事务 
 -- 手动开启事务：
  -- begin         start trancation
-- BEGIN；
-- INSERT INTO 表名 VALUES();

-- 事务开始状态 提交 回滚
-- COMMIT;(提交)
-- ROLLBACK;(回滚)