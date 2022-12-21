-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * 
from student
where  StudentName like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * 
from class
where MONTH(StartDate) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from subject
where Credit >=3 AND Credit <=5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2 
select * from student;
Update student
set ClassID = 2
where StudentName = "Hung";
use quanlysinhvien;
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select  student.StudentName, subject.SubName, mark.Mark
from (student inner join mark on mark.StudentId= student.StudentId)
inner join subject on mark.SubId = subject.SubId;
select * from mark;