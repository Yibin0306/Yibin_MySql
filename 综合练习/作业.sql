-- 1、查询"01"课程比"02"课程成绩高的学生的信息及课程分数
SELECT s.* ,sc.score 01课程成绩 , s2.score 02课程成绩 FROM student s
LEFT JOIN sc
on s.sid = sc.SId AND sc.CId=01
LEFT JOIN sc s2
ON s.sid = s2.sid and s2.CId=02
WHERE sc.score > s2.score

-- 2、查询"01"课程比"02"课程成绩低的学生的信息及课程分数
SELECT s.* ,sc.score 01课程成绩 , s2.score 02课程成绩 FROM student s
LEFT JOIN sc
on s.sid = sc.SId AND sc.CId=01
LEFT JOIN sc s2
ON s.sid = s2.sid and s2.CId=02
WHERE sc.score < s2.score

-- 3、查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT stu.sid,stu.sname,AVG(sc.score) FROM student stu
LEFT JOIN sc
on stu.sid = sc.SId
GROUP BY stu.sname 
HAVING AVG(sc.score)>=60

-- 4、查询平均成绩小于60分的同学的学生编号和学生姓名和平均成绩
SELECT stu.sid,stu.sname,AVG(sc.score) FROM student stu
LEFT JOIN sc
on stu.sid = sc.SId
GROUP BY stu.sname 
HAVING AVG(sc.score)<60

-- 5、查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩
SELECT stu.sid,stu.sname,COUNT(sc.score) 选课总数,SUM(sc.score) 总成绩 FROM student stu
LEFT JOIN sc
on stu.sid = sc.SId
GROUP BY stu.sid

-- 6、查询"李"姓老师的数量
SELECT COUNT(tname) 李姓老师的数量 FROM teacher WHERE tname LIKE "李%"

-- 7、查询学过"张三"老师授课的同学的信息
SELECT * FROM student WHERE sid in(
SELECT sid FROM sc WHERE cid=(
SELECT cid FROM course WHERE tid=(
SELECT tid FROM teacher WHERE tname = "张三")));

-- 8、查询没学过"张三"老师授课的同学的信息
SELECT * FROM student WHERE sid not in(
SELECT sid FROM sc WHERE cid=(
SELECT cid FROM course WHERE tid=(
SELECT tid FROM teacher WHERE tname = "张三")));

-- 9、查询学过编号为"01"并且也学过编号为"02"的课程的同学的信息
SELECT * FROM student WHERE
sid in(SELECT sid FROM sc WHERE cid=01)
AND
sid in(SELECT sid FROM sc WHERE cid=02)

-- 10、查询学过编号为"01"但是没有学过编号为"02"的课程的同学的信息
SELECT * FROM student WHERE
sid in(SELECT sid FROM sc WHERE cid=01)
AND
sid not in(SELECT sid FROM sc WHERE cid=02)

-- 11、查询没有学全所有课程的同学的信息
 -- 一共几门课？数
SELECT COUNT(*) FROM course
 -- 成绩个数小于三
SELECT * FROM student WHERE sid in(
SELECT sid FROM sc
GROUP BY sid
HAVING COUNT(score)<(SELECT COUNT(*) FROM course))

-- 12、查询至少有一门课与学号为"01"的同学所学相同的同学的信息
SELECT * FROM student WHERE sid in(
SELECT DISTINCT sid FROM sc WHERE cid in(
SELECT cid FROM sc WHERE sid=01))AND sid<>01

-- 13、查询和"01"号的同学学习的课程完全相同的其他同学的信息
-- 使用GROUP_CONCAT函数和GROUP BY
SELECT * FROM student WHERE SId in (
SELECT SId FROM sc WHERE CId in(
SELECT CId FROM sc WHERE SId = 01)AND SId<>01
GROUP BY SId
HAVING COUNT(score)=(SELECT COUNT(*) FROM sc WHERE SId = 01))

-- 14、查询没学过"张三"老师讲授的任一门课程的学生姓名
SELECT Sname FROM student WHERE SId NOT in(
SELECT SId FROM sc WHERE CId IN(
SELECT CId FROM course WHERE tid=(
SELECT tid FROM teacher WHERE Tname = "张三")));

-- 15、查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
SELECT stu.sid,stu.Sname,AVG(sc.score) FROM student stu
LEFT JOIN sc
on stu.sid = sc.SId
WHERE sc.score<60 
GROUP BY stu.SId
HAVING COUNT(sc.score)>=2

-- 16、检索"01"课程分数小于60，按分数降序排列的学生信息
SELECT * FROM student
LEFT JOIN sc
on student.SId = sc.SId AND sc.CId=01
WHERE sc.score < 60 
ORDER BY sc.score DESC

-- 17、按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩
SELECT student.Sname, SUM(sc.score) 所有的课程成绩,AVG(sc.score) FROM sc
LEFT JOIN student
ON sc.SId = student.SId
GROUP BY sc.SId
ORDER BY SUM(sc.score)DESC


x-- 18、查询各科成绩最高分、最低分和平均分：以如下形式显示：课程ID，课程name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率
-- 及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90
select c.cid ,cname, max(score),min(score),avg(score),
count(score>=60 or null)/count(s.cid)*100 '及格率',
count(score>=70 and score<80 or null)/count(s.cid)*100 '中等率',
count(score>=80 and score<90 or null)/count(s.cid)*100 '优良率',
count(score>=90 or null)/count(s.cid)*100 '优秀率'
from course c
inner join score s
on c.cid =s.cid
group by c.cid

x-- 19、按各科成绩进行排序，并显示排名  
select a.cid, a.sid, a.score, count(b.score)+1 as rank
from sc a
left join sc b
on a.score < b.score and a.cid = b.cid
group by a.cid, a.sid,a.score
order by a.cid, rank ASC;

-- 20、查询学生的总成绩并进行排名
SELECT stu.sid,stu.sname,SUM(sc.score) FROM student stu
LEFT JOIN sc
on stu.sid = sc.SId
GROUP BY stu.sid
ORDER BY SUM(sc.score) DESC


-- 21、查询不同老师所教不同课程平均分从高到低显示
SELECT b.TId,b.Tname,a.CId,a.Cname,AVG(c.score) 平均成绩 FROM course a
LEFT JOIN teacher b
ON a.TId = b.TId
LEFT JOIN sc c
ON c.CId = a.CId
GROUP BY a.CId
ORDER BY AVG(c.score) DESC

-- 22、查询所有课程的成绩第2名到第3名的学生信息及该课程成绩
SELECT stu.*, sc.score 课程成绩 FROM student stu
LEFT JOIN sc
ON stu.SId = sc.SId
ORDER BY sc.score DESC
LIMIT 1,2;

x-- 23、统计各科成绩各分数段人数：课程编号,课程名称,[100-85],[85-70],[70-60],[0-60]及所占百分比
select c.cid ,cname,
count(score>=60 or null)/count(s.cid)*100 '及格率',
count(score>=70 and score<80 or null)/count(s.cid)*100 '中等率',
count(score>=80 and score<90 or null)/count(s.cid)*100 '优良率',
count(score>=90 or null)/count(s.cid)*100 '优秀率'
from course c
inner join score s
on c.cid =s.cid
group by c.cid

-- 24、查询学生平均成绩及其名次
-- 自己对自己左交，查看比自己分数高的有几个
SELECT sc.SId,student.Sname,AVG(sc.score) 平均成绩 FROM sc
LEFT JOIN student
ON sc.SId = student.SId
GROUP BY sc.SId
ORDER BY AVG(score) DESC

-- 25、查询各科成绩前三名的记录
select * from sc sc1 where 
(select count(*) from sc sc2 where sc1.cid = sc2.cid and sc1.score <= sc2.score) <4
order by sc1.cid , sc1.score desc;

-- 26、查询每门课程被选修的学生数
SELECT CId, COUNT(CId) 每门课程被选修的学生数 FROM sc
GROUP BY CId

-- 27、查询出只有两门课程的全部学生的学号和姓名
SELECT * FROM student WHERE sid in(
SELECT sid FROM sc
GROUP BY Sid
HAVING COUNT(score)=2)

-- 28、查询男生、女生人数
SELECT Ssex , COUNT(Ssex) 数量 FROM student
GROUP BY Ssex

-- 29、查询名字中含有"风"字的学生信息
SELECT * FROM student WHERE Sname LIKE "%风%"

-- 30、查询同名同性学生名单，并统计同名人数
select sname,ssex,count(sname) from student
group by sname,ssex
having count(sname)>1;







SELECT * FROM student WHERE sid in(
SELECT sid FROM sc WHERE cid=(
SELECT cid FROM course WHERE tid=(
SELECT tid FROM teacher WHERE tname = "张三")));
