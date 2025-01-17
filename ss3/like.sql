use test_quan_ly_truong_hoc;

# liet ke

# a. nhung hs co ho ten bat dau bang tu Nguyen
select *
from hoc_sinh
where ho_ten_hs like 'Nguyễn%';

# b. nhung hs co ho ten ket thuc bang tu No
select *
from hoc_sinh
where ho_ten_hs like '%Nở';

#     c. Những học sinh có họ tên chứa từ Thị.
select *
from hoc_sinh
where ho_ten_hs like '%Thị%';
#     d. Những học sinh chứa từ Thị ở giữa (không được chứa ở đầu và ở cuối).
select *
from hoc_sinh
where ho_ten_hs like '%Thị%'
  and ho_ten_hs not like 'Thị%'
  and ho_ten_hs not like '%Thị';
#     e. Những học sinh có họ tên với độ dài là 30 ký tự (kể cả khoảng trắng).
select *
from hoc_sinh
where length(ho_ten_hs) = 30;
#     f. Những học sinh có họ tên với độ dài tối đa là 30 ký tự.
select *
from hoc_sinh
where length(ho_ten_hs) <= 30;
#     g. Những học sinh có họ tên với độ dài tối đa là 30 ký tự và bắt đầu bằng ký tự N.
select *
from hoc_sinh
where length(ho_ten_hs) <= 30
  and ho_ten_hs like 'N%';
#     h. Những học sinh có họ tên bắt đầu bằng các ký tự: N, T, V.
select *
from hoc_sinh
where ho_ten_hs like 'N%'
   or ho_ten_hs like 'T%'
   or ho_ten_hs like 'V%';
#     i. Những học sinh có họ tên không được bắt đầu bằng các ký tự: N, T, V.
select *
from hoc_sinh
where ho_ten_hs not like 'N%'
  and ho_ten_hs not like 'T%'
  and ho_ten_hs not like 'V%';
#     j. Những học sinh có họ tên với phần họ có đúng 4 ký tự.
select *
from hoc_sinh
where ho_ten_hs like '____ %';