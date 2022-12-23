use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * 
from subject
where Credit = (select max(Credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject
join mark on subject.SubId = mark.SubId
where mark.mark = (select MAX(mark.Mark)from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm 
select * from student;
select * from mark;
select student.StudentId, AVG(mark.Mark) as TB from student
join mark on student.StudentId = mark.StudentId
group by StudentId
order by TB desc;