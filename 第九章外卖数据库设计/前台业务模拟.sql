-- 1.请查询出外卖商品编号，名称，定价，折扣，分类编号，商家编号，评分，描述，包装费
SELECT * FROM `外卖商品信息表`;

-- 2.查询川湘菜类型的所有外卖商品信息
  -- 子查询
SELECT * FROM `外卖商品信息表` WHERE `外卖类别id` in(
SELECT `外卖类别id` FROM `外卖类别表` WHERE `外卖类别名字` LIKE "川湘菜");
  -- 链接查询
SELECT * FROM `外卖商品信息表` g
LEFT JOIN `外卖类别表` c
ON g.`外卖类别id`=c.`外卖类别id`
WHERE `外卖类别名字` LIKE "川湘菜"

-- 3.查询出所有包含大盘鸡标题的外卖商品
 -- 模糊查询 关键字 like _：一个任意字符   %：0-n个任意字符
SELECT * FROM `外卖商品信息表` WHERE `商品名称` LIKE "%大盘鸡%";

-- 4.查询出所有评分为5并且描述中含有麻辣内容的外卖商品
 -- 模糊查询 逻辑运算
SELECT * FROM `外卖商品信息表`
WHERE `商品评分`=5 AND `商品简单描述` LIKE "%麻辣%";

-- 5.编号为24的外卖商品的商品编号，名称，定价，折扣，分类编号，商家编号，评分，描述，包装费
SELECT * FROM `外卖商品信息表` WHERE `商品信息id` = 24;

-- 6.畅销外卖商品查询，销售数量前10名的外卖商品编号
SELECT `商品id` FROM `订单明细表`
GROUP BY `商品id`
ORDER BY SUM(`本订单订购某商品的数量`) DESC
LIMIT 0,10;

-- 7.客户订单查询。需要查询自己所有历史订单信息
SELECT * FROM `订单表` WHERE `收货人名字` = "黄雅玲";

-- 8.查询出人均消费在30~50之间并且是川湘菜的外卖商品
SELECT * FROM `外卖商品信息表` WHERE `商家信息id` IN(
SELECT `商家信息id` FROM `商家信息表` WHERE `人均消费` BETWEEN 30 and 50)
AND
(SELECT `外卖类别id` FROM `外卖类别表` WHERE `外卖类别名字` = "川湘菜");

-- 9.查询出所有每种类型的外卖商品总销售额
SELECT sum(`下单实际销售价`) FROM  `订单明细表`
GROUP BY `商品id`;

-- 10.查询出今天的外卖销售总额
 -- 时间相减函数 DATEDIFF()
SELECT `订单表`.`订单id`,SUM(`下单实际销售价`) FROM `订单表`
LEFT JOIN `订单明细表`
ON `订单表`.`订单id`= `订单明细表`.`订单id`
WHERE DATEDIFF(`订单表`.`订单日期`,NOW())=0;

-- 11.统计出每个类别的外卖商品总量
SELECT COUNT(*) 每个类别的外卖商品总量 FROM `外卖商品信息表`
GROUP BY `外卖类别id`;

-- 12.查询出所有张三大盘鸡的外卖商品
SELECT * FROM `外卖商品信息表` WHERE `商家信息id` in(
SELECT `商家信息id` FROM `商家信息表` WHERE `商家名字` LIKE "张三大盘鸡");