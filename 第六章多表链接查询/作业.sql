-- 1.查询研发部所有男员工信息及部门名称
SELECT e.* ,d.`部门名字` FROM 员工表 e
LEFT JOIN `部门表` d
on e.`部门id` = d.`部门id`
WHERE d.`部门名字` = "研发部" AND e.`员工性别` = "男";

-- 2.查询各部门男员工的数量及部门名称
SELECT COUNT(*) 男员工数量,d.`部门名字` FROM `部门表` d
LEFT JOIN `员工表` e
ON d.`部门id` = e.`部门id`
WHERE e.`员工性别`="男"
GROUP BY e.`部门id`;

-- 3.查询各地区的部门数量及地区名称
SELECT d.* ,COUNT(*) 数量,l.`地址名字` FROM `部门表` d
LEFT JOIN `地址表` l
ON d.`地址id` = l.`地址id`
GROUP BY d.`地址id`;

-- 4.查询员工信息，部门名称，部门所在地区名字
SELECT e.* ,d.`部门名字`,l.`地址名字` FROM `员工表` e
LEFT JOIN `部门表` d
on e.`部门id` = d.`部门id`
LEFT JOIN `地址表` l
on d.`地址id` = l.`地址id`;

-- 5.查询研发部男女员工的数量
SELECT e.* ,COUNT(*) 数量,d.`部门名字` FROM 员工表 e
LEFT JOIN `部门表` d
on e.`部门id` = d.`部门id`
WHERE d.`部门名字` = "研发部"
GROUP BY `员工性别`;