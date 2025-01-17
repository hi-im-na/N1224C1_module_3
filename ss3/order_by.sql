use test_quan_ly_truong_hoc;

#     a. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh.
select *
from hoc_sinh
order by ho_ten_hs;
#     b. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo địa chỉ.
select *
from hoc_sinh
order by dia_chi desc;
#     c. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và giảm dần theo địa chỉ.
select *
from hoc_sinh
order by ho_ten_hs asc, dia_chi desc;
#     d. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và tăng dần theo địa chỉ.
select *
from hoc_sinh
order by ho_ten_hs asc, dia_chi asc;
#     e. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ.
select *
from hoc_sinh
order by ho_ten_hs desc, dia_chi desc;
#     f. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ và tăng dần theo họ tên phụ huynh.
select *
from hoc_sinh
order by ho_ten_hs desc, dia_chi desc, ho_ten_ph asc;
#     *** Trả lời thêm: Trong 2 từ khóa ASC và DESC, từ nào là không bắt buộc phải ghi rõ trong câu SELECT mà kết quả thực hiện vẫn đảm bảo tính đúng đắn?
#     *** Đáp án: ASC0