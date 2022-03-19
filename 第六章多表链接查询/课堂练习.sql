-- 查询所有员工信息及所在部门名称
SELECT e.* ,d.`部门名字` FROM 员工表 e
LEFT JOIN 部门表 d
on e.`部门id`=d.`部门id`;

-- 查询所有员工信息及部门所在地址
SELECT e.*,d.`部门名字`,l.`地址名字` FROM `员工表` e
LEFT JOIN `部门表` d
on e.`部门id` = d.`部门id`
LEFT JOIN `地址表` l
on d.`地址id` = l.`地址id`


-- 查询部门信息及部门所在地区名字
SELECT d.*,l.`部门名字` FROM `地址表` d
LEFT JOIN `部门表` l
ON d.`地址id` = l.`地址id`;

-- 查询位于香港的部门信息
SELECT d.* FROM `部门表` d
LEFT join `地址表` l
ON d.`地址id` = l.`地址id`
WHERE l.地址名字="香港";

-- 查询研发部所有员工信息
SELECT e.* FROM `员工表` e
LEFT JOIN 部门表 d
on e.`部门id` = d.`部门id`
WHERE d.`部门名字` = "研发部";

-- 统计各部门员工的数量，及部门名称
SELECT d.`部门名字`,COUNT(*) FROM `部门表` d
LEFT JOIN `员工表` e
on d.`部门id` = e.`部门id`
GROUP BY e.`部门id`;






