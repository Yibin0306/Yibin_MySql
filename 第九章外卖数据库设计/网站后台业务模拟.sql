-- 1.查询已完成的订单的订单明细，显示订单日期、订单的外卖名称、订购数量、订购单价
SELECT o1.`订单日期`,g.`商品名称`,o2.`本订单订购某商品的数量`,g.`商品定价` FROM 订单表 o1
LEFT JOIN `订单明细表` o2
on o1.`订单id` = o2.`订单id`
LEFT JOIN `外卖商品信息表` g
ON o2.`商品id`=g.`商品信息id`

-- 2.查询出订单编号为“20110508004”的收货人姓名，地址和电话
SELECT `收货人名字`,`收货具体地址`,`收货人联系方式` FROM `订单表` WHERE `订单id` in(
SELECT `订单id` FROM `订单表` WHERE `订单编号`=20110508004)

-- 3.查询出电话以188开头的客户有几人
SELECT COUNT(*) 188开头的的客户人数 FROM `客户信息表` WHERE `客户电话` LIKE "188%"

-- 4.查询出收货地址在二七广场的地区有几人
SELECT COUNT(*) 二七广场地区人数 FROM 订单表 WHERE `收货具体地址` LIKE "%二七广场%"

-- 5.查询出账单金额最高的订单的收货人姓名和电话
SELECT `收货人名字`,`收货具体地址`,`收货人联系方式` FROM `订单表` WHERE `订单id`=(
SELECT `订单id` FROM `订单明细表` WHERE `下单实际销售价`=(
SELECT MAX(`下单实际销售价`) FROM `订单明细表`))

-- 6.在订单表中获取所有的收货地址，以及每个收货地址的购物次数
SELECT COUNT(*) 每个地址的购物次数 FROM `订单表`
GROUP BY `收货具体地址`

-- 7.请查询出收货地址为“北京市和平东路四段32号”的所购买商品的商品收货人的姓名、地址、商品信息、价格、数量、商品分类
SELECT o1.`订单id`,o2.`本订单订购某商品的数量`,o1.`收货人名字`,o1.`收货具体地址`,g.*,c.`外卖类别名字` FROM 订单表 o1
LEFT JOIN `订单明细表` o2
on o1.`订单id` = o2.`订单id`
LEFT JOIN `外卖商品信息表` g
on o2.`商品id`=g.`商品信息id`
LEFT JOIN `外卖类别表` c
on g.`外卖类别id` = c.`外卖类别id`
WHERE `收货具体地址`="北京市和平东路四段32号"

-- 8.请查询出收货地址为“北京市和平东路四段32号”的所购买商品的商品收货人的姓名、地址、商品信息、价格、数量、商品分类，并按照外卖商品的单价以降序排序
SELECT o1.`订单id`,o2.`本订单订购某商品的数量`,o1.`收货人名字`,o1.`收货具体地址`,g.*,c.`外卖类别名字` FROM 订单表 o1
LEFT JOIN `订单明细表` o2
on o1.`订单id` = o2.`订单id`
LEFT JOIN `外卖商品信息表` g
on o2.`商品id`=g.`商品信息id`
LEFT JOIN `外卖类别表` c
on g.`外卖类别id` = c.`外卖类别id`
WHERE `收货具体地址`="北京市和平东路四段32号"
ORDER BY g.`商品定价` DESC

-- 9.请查询出在所有外卖商品中单价最高的外卖商品类别
SELECT * FROM `外卖商品信息表`
ORDER BY `商品定价` DESC
LIMIT 1;

-- 10.请查询出销量(销售金额)最高的一天
SELECT a.`订单日期`,SUM(b.`下单实际销售价`) FROM 订单表 a
LEFT JOIN `订单明细表` b
on a.`订单id` = b.`订单id`
GROUP BY a.`订单日期`
ORDER BY SUM(b.`下单实际销售价`) DESC
LIMIT 1;

-- 11.统计注册外卖商品中每个商品类别各有多少商品
SELECT a.`外卖类别名字` ,COUNT(*) 共有多少类 FROM `外卖类别表` a
RIGHT JOIN `外卖商品信息表` b
on a.`外卖类别id` = b.`外卖类别id`
GROUP BY a.`外卖类别id`

-- 12.大客户查询，查询出外卖订单总量最多的客户名
SELECT a.`收货人名字`,COUNT(*) 订单总量 FROM `订单表` a
LEFT JOIN `订单明细表` b
on a.`订单id` = b.`订单id`
GROUP BY a.`收货人名字`
ORDER BY SUM(b.`下单实际销售价`) DESC
LIMIT 1;

-- 13.查询出每个商品类别中外卖商品的最高价格，最低价格和平均价格
SELECT `外卖类别id`, MAX(`商品定价`) 最高价,MIN(`商品定价`) 最低价格,AVG(`商品定价`) 平均价格 FROM `外卖商品信息表`
GROUP BY `外卖类别id`
