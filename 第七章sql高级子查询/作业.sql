-- 1.查询部门id比市场部id大的部门的所有员工
SELECT * FROM `员工表` WHERE `部门id` >(
SELECT `部门id` FROM `部门表` WHERE `部门名字`="市场部")

-- 2.查询市场部门所有男员工
SELECT * FROM `员工表` WHERE `部门id` in(
SELECT `部门id` FROM `部门表` WHERE `部门名字`="市场部" and `员工性别` = "男")

-- 3.查询和ee同部门的员工
SELECT * FROM `员工表` WHERE `部门id` in(
SELECT `部门id` FROM `员工表` WHERE `员工名字`="ee")

-- 4.查询和bb同部门且比bb年龄大的员工
SELECT * FROM `员工表` 
WHERE `部门id` in(SELECT `部门id` FROM `员工表` WHERE `员工名字`="bb") 
AND `员工年龄`>(SELECT `员工年龄` FROM `员工表` WHERE `员工名字`="bb")

-- 5.查询比3部门任何一个年龄都小的员工信息
SELECT * FROM `员工表` 
WHERE `员工年龄` <ALL(SELECT 员工年龄 FROM `员工表` WHERE `部门id`=3)
-- 6.查询市场部平均年龄
SELECT AVG(`员工年龄`) 平均年龄 FROM `员工表` 
WHERE `部门id`=(SELECT `部门id` FROM `部门表` WHERE `部门名字`="市场部")