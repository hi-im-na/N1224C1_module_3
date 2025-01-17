use test_quan_ly_truong_hoc;

# liet ke

# a. nhung hs co gioi tinh nam
select *
from hoc_sinh
where gioi_tinh = 'nam';

# b. nhung hoc sinh chua co ten ph
select *
from hoc_sinh
where ho_ten_ph is null
   or ho_ten_ph = '';

# c. nhung lop chua co giao vien chu nhiem
select *
from lop
where ma_gvcn is null
   or ma_gvcn = '';

# d. nhung hoc sinh chua duoc phan lop
select *
from hoc_sinh
where ma_lop is null
   or ma_lop = '';

# e. nhung hoc sinh nu co dia chi o thanh khe
select *
from hoc_sinh
where gioi_tinh = 'nu'
  and dia_chi like '%Thanh Khê%';

# f. nhung hs nam co dia chi o hai chau hoac nhung hs nu co dia chi o thanh khe
select *
from hoc_sinh
where (gioi_tinh = 'nam' and dia_chi like '%Hải Châu%')
   or (gioi_tinh = 'nu' and dia_chi like '%Thanh Khê%');

# g. nhung hs nam chua co ten ph va nhung hs nu chua duoc phan lop
select *
from hoc_sinh
where (gioi_tinh = 'nam' and (ho_ten_ph is null or ho_ten_ph = ''))
   or (gioi_tinh = 'nu' and (ma_lop is null or ma_lop = ''));

# h. nhung hs nam chua duoc phan lop va nhung hs nam chua co ten ph
select *
from hoc_sinh
where (gioi_tinh = 'nam' and (ma_lop is null or ma_lop = ''))
   or (gioi_tinh = 'nam' and (ho_ten_ph is null or ho_ten_ph = ''));

# i. ma mon hoc cua nhung mon hoc duoc day trong hoc ki 2
select distinct ma_mh
from phu_trach_bo_mon
where hoc_ky like 'Học kỳ 2';

