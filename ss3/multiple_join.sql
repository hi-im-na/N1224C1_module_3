use test_quan_ly_truong_hoc;

#     a. MaHS, HoTenHS, GioiTinh, MaLop, TenLop, NamHoc, MaGVCN, HoTenGV (chủ nhiệm) của học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, hs.ma_lop, l.ten_lop, l.nam_hoc, l.ma_gvcn, gv.ho_ten_gv
from hoc_sinh hs
         join lop l on hs.ma_lop = l.ma_lop
         join giao_vien gv on l.ma_gvcn = gv.ma_gv;

#     b. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy
#     của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, kqht.ma_mh, mh.ten_mh, kqht.diem_thi_giua_ky, kqht.diem_thi_cuoi_ky
from hoc_sinh hs
         join ket_qua_hoc_tap kqht on hs.ma_hs = kqht.ma_hs
         join mon_hoc mh on kqht.ma_mh = mh.ma_mh;

#     c. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy,
#     MaLop, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả
#     tương ứng với từng học sinh trong trường.
select hs.ma_hs,
       hs.ho_ten_hs,
       kqht.hoc_ky,
       kqht.ma_mh,
       mh.ten_mh,
       kqht.diem_thi_giua_ky,
       kqht.diem_thi_cuoi_ky,
       hs.ma_lop,
       gvpt.ma_gv,
       gvpt.ho_ten_gv as ho_ten_gv_phu_trach
from hoc_sinh hs
         join ket_qua_hoc_tap kqht on hs.ma_hs = kqht.ma_hs
         join mon_hoc mh on kqht.ma_mh = mh.ma_mh
         join lop on hs.ma_lop = lop.ma_lop
         join phu_trach_bo_mon ptbm on lop.ma_lop = ptbm.ma_lop
         join giao_vien gvpt on ptbm.ma_gvpt = gvpt.ma_gv;
#     d. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy,
#     MaGV (phụ trách), HoTenGV (phụ trách) của học sinh
#     và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
select hs.ma_hs,
       hs.ho_ten_hs,
       hs.ma_lop,
       l.ma_gvcn,
       gvcn.ho_ten_gv,
       kqht.hoc_ky,
       kqht.ma_mh,
       mh.ten_mh,
       kqht.diem_thi_giua_ky,
       kqht.diem_thi_cuoi_ky,
       ptbm.ma_gvpt,
       gvpt.ho_ten_gv
from hoc_sinh hs
         join phu_trach_bo_mon ptbm on hs.ma_lop = ptbm.ma_lop
         join lop l on hs.ma_lop = l.ma_lop
         join giao_vien gvcn on l.ma_gvcn = gvcn.ma_gv
         join giao_vien gvpt on ptbm.ma_gvpt = gvpt.ma_gv
         join mon_hoc mh on ptbm.ma_mh = mh.ma_mh
         join ket_qua_hoc_tap kqht on hs.ma_hs = kqht.ma_hs;

#     e. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy,
#     MaGV (phụ trách), HoTenGV (phụ trách)
#     của những học sinh nữ
#     với các môn học đã có kết quả thi cuối kỳ
#     hoặc giữa kỳ được 9 điểm trở lên.
select hs.ma_hs,
       hs.ho_ten_hs,
       gvcn.ma_gv,
       gvcn.ho_ten_gv,
       kqht.hoc_ky,
       kqht.ma_mh,
       mh.ten_mh,
       kqht.diem_thi_giua_ky,
       kqht.diem_thi_cuoi_ky,
       gvpt.ma_gv,
       gvpt.ho_ten_gv
from hoc_sinh hs
         join lop l on hs.ma_lop = l.ma_lop
         join giao_vien gvcn on l.ma_gvcn = gvcn.ma_gv
         join ket_qua_hoc_tap kqht on hs.ma_hs = kqht.ma_hs
         join mon_hoc mh on kqht.ma_mh = mh.ma_mh
         join phu_trach_bo_mon ptbm on hs.ma_lop = ptbm.ma_lop
         join giao_vien gvpt on gvpt.ma_gv = ptbm.ma_gvpt
where hs.gioi_tinh = 'Nữ'
  and (kqht.diem_thi_cuoi_ky >= 9 or kqht.diem_thi_giua_ky >= 9);

#     f. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách)
#     của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
#     Với điều kiện là chỉ hiển thị những môn học mà giáo viên phụ trách môn đó cũng chính là giáo viên chủ nhiệm của lớp.
select hs.ma_hs,
       hs.ho_ten_hs,
       kqht.hoc_ky,
       kqht.ma_mh,
       mh.ten_mh,
       kqht.diem_thi_giua_ky,
       kqht.diem_thi_cuoi_ky,
       l.ma_lop,
       gvpt.ma_gv,
       gvpt.ho_ten_gv
from hoc_sinh hs
         join ket_qua_hoc_tap kqht on hs.ma_hs = kqht.ma_hs
         join mon_hoc mh on kqht.ma_mh = mh.ma_mh
         join lop l on hs.ma_lop = l.ma_lop
         join giao_vien gvcn on l.ma_gvcn = gvcn.ma_gv
         join phu_trach_bo_mon ptbm on l.ma_lop = ptbm.ma_lop
         join giao_vien gvpt on ptbm.ma_gvpt = gvpt.ma_gv
where gvpt.ma_gv = gvcn.ma_gv;

#     g. MaMH, MaLop, HocKy của những môn học đã được thi cuối kỳ vào năm 2023
select mh.ma_mh, l.ma_lop, kqht.hoc_ky, kqht.ngay_gio_thi_cuoi_ky
from mon_hoc mh
         join ket_qua_hoc_tap kqht on mh.ma_mh = kqht.ma_mh
         join hoc_sinh hs on kqht.ma_hs = hs.ma_hs
         join lop l on hs.ma_lop = l.ma_lop
where YEAR(ngay_gio_thi_cuoi_ky) = 2023;

#     h. MaMH, MaLop, HocKy của những môn học đã được thi vào tháng 8 năm 2023
select mh.ma_mh, l.ma_lop, kqht.hoc_ky
from mon_hoc mh
         join ket_qua_hoc_tap kqht on mh.ma_mh = kqht.ma_mh
         join hoc_sinh hs on kqht.ma_hs = hs.ma_hs
         join lop l on hs.ma_lop = l.ma_lop
where MONTH(kqht.ngay_gio_thi_cuoi_ky) = 8
  and YEAR(kqht.ngay_gio_thi_cuoi_ky) = 2023;

#     i. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023
select mh.ma_mh, l.ma_lop, kqht.hoc_ky
from mon_hoc mh
         join ket_qua_hoc_tap kqht on mh.ma_mh = kqht.ma_mh
         join hoc_sinh hs on kqht.ma_hs = hs.ma_hs
         join lop l on hs.ma_lop = l.ma_lop
where DATEDIFF(kqht.ngay_gio_thi_cuoi_ky, '2023-08-20') < 0;

#     j. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023 đúng 1 tuần.
select mh.ma_mh, l.ma_lop, kqht.hoc_ky
from mon_hoc mh
         join ket_qua_hoc_tap kqht on mh.ma_mh = kqht.ma_mh
         join hoc_sinh hs on kqht.ma_hs = hs.ma_hs
         join lop l on hs.ma_lop = l.ma_lop
where DATEDIFF(kqht.ngay_gio_thi_cuoi_ky, '2023-08-20') = -7;

#     k. MaMH, MaLop, HocKy của những môn học đã được thi sau ngày 20 tháng 8 năm 2023 đúng 21 ngày.
select mh.ma_mh, l.ma_lop, kqht.hoc_ky
from mon_hoc mh
         join ket_qua_hoc_tap kqht on mh.ma_mh = kqht.ma_mh
         join hoc_sinh hs on kqht.ma_hs = hs.ma_hs
         join lop l on hs.ma_lop = l.ma_lop
where DATEDIFF('2023-08-20', kqht.ngay_gio_thi_cuoi_ky) = 21;

#     l. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ ngày 10 đến ngày 20 tháng 8 năm 2023.
select mh.ma_mh, l.ma_lop, kqht.hoc_ky
from mon_hoc mh
         join ket_qua_hoc_tap kqht on mh.ma_mh = kqht.ma_mh
         join hoc_sinh hs on kqht.ma_hs = hs.ma_hs
         join lop l on hs.ma_lop = l.ma_lop
where DAY(kqht.ngay_gio_thi_cuoi_ky) >= 10
  and DAY(kqht.ngay_gio_thi_cuoi_ky) <= 20
  and MONTH(kqht.ngay_gio_thi_cuoi_ky) = 8
  and YEAR(kqht.ngay_gio_thi_cuoi_ky) = 2023;

#     m. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ 10 giờ 00 phút ngày 10 đến 20 giờ 30 phút ngày 20 tháng 8 năm 2023.
select mh.ma_mh, l.ma_lop, kqht.hoc_ky
from mon_hoc mh
         join ket_qua_hoc_tap kqht on mh.ma_mh = kqht.ma_mh
         join hoc_sinh hs on kqht.ma_hs = hs.ma_hs
         join lop l on hs.ma_lop = l.ma_lop
where kqht.ngay_gio_thi_cuoi_ky >= '2023-08-10 10:00:00'
  and kqht.ngay_gio_thi_cuoi_ky <= '2023-08-20 20:30:00';