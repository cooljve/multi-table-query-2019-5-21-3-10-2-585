# 1.查询同时存在1课程和2课程的情况

SELECT * FROM student s,student_course sc,course c,teacher t
	WHERE sc.studentId=s.id AND c.id=sc.courseId AND t.id=c.teacherId AND sc.courseId IN(1,2) 
	GROUP BY s.id 
	HAVING count(sc.studentId)>1;
	
# 2.查询同时存在1课程和2课程的情况

SELECT * FROM student s,student_course sc,course c,teacher t
	WHERE sc.studentId=s.id AND c.id=sc.courseId AND t.id=c.teacherId AND sc.courseId IN(1,2) 
	GROUP BY s.id 
	HAVING count(sc.studentId)>1;

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩

SELECT s.id,s.name,avg(score) FROM student s,student_course sc
	WHERE s.id=sc.studentId 
	GROUP BY sc.studentId 
	HAVING avg(score)>60;
	
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句

SELECT s.* FROM student s
	WHERE not exists(SELECT * FROM student_course WHERE studentId=s.id);

# 5.查询所有有成绩的SQL

SELECT s.* FROM student s,student_course sc
	WHERE sc.studentId=s.id AND sc.courseId IN(1,2,3) 
	GROUP BY s.id 
	HAVING count(studentId)>2;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息

SELECT s.* FROM student s,student_course sc
	WHERE sc.courseId IN(1,2)  AND sc.studentId = s.id 
	GROUP BY s.id 
	HAVING count(sc.studentId)>1;

# 7.检索1课程分数小于60，按分数降序排列的学生信息

SELECT s.* FROM student s,course c,student_course sc
	WHERE c.id=1 AND c.id=sc.courseId AND score<60 AND s.id=sc.studentId;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列

SELECT c.id,c.name,avg(score) FROM student_course sc,course c
	WHERE sc.courseId=c.id 
	GROUP BY sc.courseId 
	ORDER BY avg(score) DESC ,c.id;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数

SELECT s.name,score FROM student s, student_course sc,course c
	WHERE c.name='数学' AND score<60 AND c.id = sc.courseId AND s.id=sc.studentId
	