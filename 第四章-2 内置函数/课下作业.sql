CREATE TABLE 作业 (id int,名字 VARCHAR(10),爱好 VARCHAR(10),年龄 INT);
-- 1.拼接“hello”，“world”，！三个字符
SELECT CONCAT("hello"," world"," !");
-- 2.计算自己名字拼音长度
SELECT LENGTH("chuyibin");
-- 3.把"HELLO"字符串转为小写
SELECT LOWER("HELLO");
-- 4.去除"   abc   "右边的空格
SELECT rtrim("   abc    ");
-- 5.把hello中的ll替换为LL
SELECT REPLACE("hello","ll","LL");
-- 6.从"selectstudentbynameandpwd"中截取出"student"
SELECT SUBSTRING("selectstudentbynameandpwd",7,7);
-- 7.获得当前系统时间只包含时分秒
SELECT CURTIME();
-- 8.计算当前日期是一年中的第几天
SELECT DAYOFYEAR(NOW());
-- 9.返回当前月份的英文名
SELECT MONTHNAME(NOW());
-- 10.返回当前日期中的年份，月份
SELECT YEAR(NOW()) 年,MONTH(NOW()) 月;
-- 11.计算当前日期离你出生日期的天数
SELECT DATEDIFF(NOW(),"2002-3-6");
-- 12.计算111的平方根
SELECT SQRT(111);
-- 13.计算34除以12的余数
SELECT MOD(34,12);
-- 14.随机打出16-23之间任意整数
SELECT CEIL(RAND()*7+16);
-- 15.计算2的31次方
SELECT POWER(2,31);
-- 16.打印当前的数据库名字和服务器的版本号
SELECT DATABASE() 数据库名字,VERSION() 服务器版本号;