-- cau2: 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự
select * from nhan_vien
where ho_ten like 'h%' or ho_ten like 't%' or ho_ten like 'k%' and CHAR_LENGTH(ho_ten) < 16;
-- cau3: 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang
where timestampdiff(YEAR,ngay_sinh,now()) between 18 And 50
and dia_chi like '%Đà Nẵng%' OR dia_chi like '%Quảng Trị%';
-- cau 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.ma_khach_hang,ho_ten,COUNT(hop_dong.ma_khach_hang) as sl
from hop_dong 
inner join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where khach_hang.ma_loai_khach = 1
group by hop_dong.ma_khach_hang
order by sl ;
-- cau 5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, (dich_vu.chi_phi_thue + dich_vu_di_kem.gia * hop_dong_chi_tiet.so_luong) AS tong_tien
from  hop_dong
right join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
right join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
right join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
right join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
right join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem;
-- chua xong cau 5 
-- Cau6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where not exists(select 1 from hop_dong where dich_vu.ma_dich_vu = ma_dich_vu and month(ngay_lam_hop_dong) between 1 and 3 and year(ngay_lam_hop_dong)=2021);
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
inner join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where 
exists(select 1 from hop_dong where dich_vu.ma_dich_vu = ma_dich_vu and year(ngay_lam_hop_dong)=2020)
and not exists(select 1 from hop_dong where dich_vu.ma_dich_vu = ma_dich_vu and year(ngay_lam_hop_dong)=2021);
-- select 1 có nghĩa là trả về một tập kết quả
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
select DISTINCT ho_ten from khach_hang;
select ho_ten from khach_hang group by ho_ten;
SELECT ho_ten FROM khach_hang UNION SELECT ho_ten FROM khach_hang;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select temp.month, count(month(hop_dong.ngay_lam_hop_dong)) as so_khach from
(select  1 as month 
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month ) as temp
left join hop_dong on month (hop_dong.ngay_lam_hop_dong) = temp.month
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by temp.month
order by temp.month;
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hop_dong.ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, IFNULL(SUM(so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong 
left join hop_dong_Chi_tiet on hop_dong.ma_hop_dong = hop_dong_Chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select ma_dich_vu_di_kem,ten_dich_vu_di_kem from dich_vu_di_kem
join hop_dong_chi_tiet using(ma_dich_vu_di_kem)
join hop_dong using (ma_hop_dong)
join khach_hang using(ma_khach_hang)
where khach_hang.ma_loai_khach = 1 and dia_chi like '%Vinh%' OR dia_chi like '%Quảng Ngãi%';
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select ma_hop_dong, nhan_vien.ho_ten,khach_hang.ho_ten, khach_hang.so_dien_thoai, ten_dich_vu,  IFNULL(SUM(so_luong),0) as so_luong_dich_vu_di_kem,tien_dat_coc 
from nhan_vien
join hop_dong using(ma_nhan_vien)
join khach_hang using(ma_khach_hang)
left join hop_dong_Chi_tiet using(ma_hop_dong) -- tai sao su dung left join
join dich_vu using(ma_dich_vu)
where
exists(select 1 from hop_dong where dich_vu.ma_dich_vu = ma_dich_vu and month(ngay_lam_hop_dong) between 10 and 12 and year(ngay_lam_hop_dong)=2020)
and not exists(select 1 from hop_dong where dich_vu.ma_dich_vu = ma_dich_vu and month(ngay_lam_hop_dong) between 1 and 6 and year(ngay_lam_hop_dong)=2021)
group by hop_dong.ma_hop_dong;
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
with temp1 as (select ma_dich_vu_di_kem,ten_dich_vu_di_kem, SUM(so_luong) AS SL
from dich_vu_di_kem 
join hop_dong_chi_tiet using(ma_dich_vu_di_kem)
group by ma_dich_vu_di_kem) 
SELECT * from temp1 where SL = (select max(SL) from temp1);
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
SELECT
		ma_hop_dong,
		ten_loai_dich_vu,
        ten_dich_vu_di_kem,
        count(ma_dich_vu_di_kem) so_lan_dung_dvdk
FROM
        dich_vu_di_kem
        JOIN hop_dong_chi_tiet USING(ma_dich_vu_di_kem)
        JOIN hop_dong USING (ma_hop_dong)
        JOIN dich_vu USING (ma_dich_vu)
        JOIN loai_dich_vu USING (ma_loai_dich_vu)
GROUP by
        ma_dich_vu_di_kem
HAVING so_lan_dung_dvdk = 1;
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi, count(hop_dong.ma_nhan_vien) as so_luong
from nhan_vien
join trinh_do using(ma_trinh_do)
join bo_phan using (ma_bo_phan)
join hop_dong using(ma_nhan_vien)
where year(ngay_lam_hop_dong) between 2020 and 2021
group by ma_nhan_vien
having so_luong <= 3;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete from nhan_vien 
where not exists (select * from hop_dong where ma_nhan_vien=nhan_vien.ma_nhan_vien and year(ngay_lam_hop_dong) between 2019 and 2021);
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
delete from khach_hang
where exists (select * from hop_dong where ma_khach_hang=hop_dong.ma_khach_hang and year(ngay_lam_hop_dong) < 2021);

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
with temp2 as (select ma_dich_vu_di_kem, sum(so_luong) as sl from hop_dong_chi_tiet group by ma_dich_vu_di_kem having sl > 10)
update dich_vu_di_kem
set gia = gia*2
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from temp2);
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang
union all
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien