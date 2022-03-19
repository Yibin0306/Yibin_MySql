-- 字符串相关函数
-- 链接字符串 CONCAT(str1,str2,...)；
-- 查询员工的全名
-- SELECT CONCAT(列，列) FROM 表名；（两列内容拼到一起）

-- 字符串的长度 LENGTH(str)；
-- SELECT LENGTH(“132123”)；

-- 转大写 UPPER(str)；
-- SELECT UPPER(“abc”)；
-- 转小写 LOWER(str)；
-- SELECT LOWER(“ABC”)；

-- 去除字符串左侧的空格；
-- SELECT LTRIM(“    sds”)；
-- 去除字符串右侧的空格；
-- SELECT RTRIM(“asdsa   ”)；
-- 去除两侧空格
-- SELECT TRIM(“  asdas  ”)；

-- 字符串替换
-- SELECT REPLACE(“adadas”,“da”,“cc”)；（cc替换da）
-- 比较字符串
-- SELECT STRCMP(“tom”,“Tom”)；（返回0）
-- 截取字符串
-- SELECT SUBSTRING(“abcdefg”，3，3)；（3不是下标）

-- --------日期相关的函数
-- 当前系统时间 now（）：年月日 时分秒  curtime（）：时分秒    CURDATE() ：年月日
-- SELECT NOW()；
-- SELECT CURDATE()；
-- SELECT CURTIME()；
-- 月份
-- SELECT MONTH(NOW())；
-- 月份的名字
-- SELECT MONTHNAME(NOW())；
-- day名字
-- SELECT DAYNAME(NOW())；
-- 一周的第几天
-- SELECT DAYOFWEEK(NOW())；
-- 一年的第几周
-- SELECT WEEK(NOW());
-- 一年的第几天
-- SELECT DAYOFYEAR(NOW())；
-- 一个月的第几天
-- SELECT DAYOFMONTH(NOW())；
-- 年份
-- SELECT YEAR(CURDATE());
-- 季度
-- SELECT QUARTER(NOW())；
-- 分钟  MINUTE(time)；
-- SELECT MINUTE(NOW())；
-- 秒  SECOND(time)；
-- SELECT SECOND(NOW())；
-- 添加时间间隔 DATE_ADD(date,INTERVAL expr unit)   ADDDATE(date,INTERVAL expr unit)    ADDTIME(expr1,expr2)
-- SELECT DATE_ADD(NOW(),INTERVAL 5 HOUR)；（加五小时）
-- 减去时间间隔 DATE_SUB(date,INTERVAL expr unit)  SUBDATE(date,INTERVAL expr unit)
-- SELECT SUBDATE(NOW(),INTERVAL 1 day)；
-- 日期相减 DATEDIFF(expr1,expr2)
-- SELECT DATEDIFF(NOW(),"2019-5-15");

-- -------------数学相关的函数
-- 保留小数位 FORMAT(X,D)；
-- SELECT FORMAT(2.45454,2)；（后面是保留几位）
-- 绝对值
-- SELECT ABS(-445656)；
-- 平方根
-- SELECT SQRT(9)；
-- 求余数
-- SELECT MOD(4,3)，MOD(3,3)，....；
-- 向上取整
-- SELECT CEIL(3.5444)；
-- 向下取整
-- SELECT FLOOR(4.454353)；
-- 随机数 0-1
-- SELECT RAND()；
-- 随机3-5之间
-- SELECT RAND()*2+3；
-- 随机 20-50之间的整数
-- SELECT CEIL(RAND()*30+20)；
-- 删除不牵涉四舍五入
-- SELECT TRUNCATE(3.344455,6)；
-- 结果：负数：-1  0：0  正数：1
-- 幂运算
-- SELECT POWER(2,3)；（二的三次方）
-- 四舍五入，制定精度
-- SELECT ROUND(3.456465，3)；

-- 查看数据库
-- SELECT DATABASE();
-- 数据版本
-- SELECT VERSION();







