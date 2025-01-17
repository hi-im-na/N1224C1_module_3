use test_quan_ly_truong_hoc;
#     a. Liệt kê ma_học_sinh, ho_ten_hoc_sinh, gioi_tinh, ma_lop, ten_lop, ma_gvcn của tất cả học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, l.ma_lop, l.ten_lop, l.ma_gvcn
from hoc_sinh hs
         join lop l on hs.ma_lop = l.ma_lop;

#     b. Liệt kê ma_học_sinh, ho_ten_hoc_sinh, hoc_ky, ma_mon_hoc, diem_thi_giua_ky, diem_thi_cuoi_ky của tất cả học sinh và các môn học có kết quả tương ứng với từng học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, kqht.hoc_ky, kqht.ma_mh, kqht.diem_thi_giua_ky, kqht.diem_thi_cuoi_ky
from hoc_sinh hs
         join ket_qua_hoc_tap kqht on hs.ma_hs = kqht.ma_hs;

#     c. Liệt kê ma_giao_vien, ho_ten_giao_vien, ma_lop, ma_mon_hoc, hoc_ky của những giáo viên đã được giao phụ trách ít nhất một môn học.
select gv.ma_gv, gv.ho_ten_gv, ptbm.ma_lop, ptbm.ma_mh, ptbm.hoc_ky
from giao_vien gv
         join phu_trach_bo_mon ptbm on gv.ma_gv = ptbm.ma_gvpt;

#     d. Suy nghĩ về yêu cầu a ở trên: Nếu học sinh chưa được phân lớp thì liệu có liệt kê được học sinh đó không?
-- Không, vì học sinh chưa được phân lớp thì không có mã lớp để join với bảng lớp.

#     e. Suy nghĩ về yêu cầu b ở trên: Nếu học sinh chưa có kết quả thi của môn nào cả thì liệu có liệt kê được học sinh đó không?
-- Có, vì chưa có kq thi nhưng vẫn có record để lưu thời gian thi giữa kì và cuối kì, nên vẫn có thể liệt kê được học sinh đó.

#     f. Suy nghĩ về yêu cầu c ở trên: Nếu giáo viên chưa phụ trách một môn nào cả thì liệu có liệt kê được giáo viên đó không?
-- Không, vì giáo viên chưa phụ trách một môn nào cả thì không có mã môn học để join với bảng phụ trách bộ môn.