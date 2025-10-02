use QLDA﻿
-- Bài 1:
select MANV,TENNV, LUONG, avg(LUONG) over(partition by PHG) as LuongTbTrongPhong,
    case 
        when LUONG < avg(LUONG) over(partition by PHG) then 'Co'
        else 'Khong'
    end as TangLuongOrKhong
from NHANVIEN;

-- Nếu lương nhân viên nhỏ hơn trung bình lương mà nhân viên đó đang làm việc thì xếp loại “nhanvien”, ngược lại xếp loại “truongphong”
select MANV,TENNV,LUONG, avg(LUONG) over(partition by PHG) as LuongTbTrongPhong,
    case 
        when LUONG < avg(LUONG) over(partition by PHG) then 'Nhan Vien'
        else 'Truong Phong'
    end as Chuc_Vu
from NHANVIEN;

-- Viết chương trình hiển thị TenNV như hình bên dưới, tùy vào cột phái của nhân viên
select  
    case 
        when PHAI = 'Nam' then 'Mr. ' + TENNV
        else 'Ms. ' + TENNV
    end as TENNV
from NHANVIEN;

-- Viết chương trình tính thuế mà nhân viên phải đóng 
select TENNV, LUONG,
    case 
        when LUONG < 25000 then LUONG * 0.1
        when LUONG >= 25000 and LUONG < 30000 then LUONG * 0.12
        when LUONG >= 30000 and LUONG < 40000 then LUONG * 0.15
        when LUONG >= 40000 and LUONG < 50000 then LUONG * 0.2
        else LUONG * 0.25
    end as Tien_Thue_Phai_Dong
from NhanVien;

-- Bài 2:
-- Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn
select HONV, TENLOT, TENNV, MANV from NhanVien where MANV % 2 = 0;
-- Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn nhưng không tính nhân viên có MaNV là 4
select HONV, TENLOT, TENNV, MANV from NhanVien where MANV != 4;

/* Bài 3:
 Thực hiện chèn thêm một dòng dữ liệu vào bảng PhongBan theo 2 bước 
 Nhận thông báo “ thêm dư lieu thành cong” từ khối Try
 Chèn sai kiểu dữ liệu cột MaPHG để nhận thông báo lỗi “Them dư lieu that bai” từ khối Catch */
begin try 
insert into PHONGBAN(MAPHG, TENPHG) values ('Chuoi du lieu sai', 'Ten phong can chen');
    print 'Them du lieu thanh cong';
end try

begin catch
    print 'Them du lieu that bai';
end catch;

-- Viết chương trình khai báo biến @chia, thực hiện phép chia @chia cho số 0 và dùng RAISERROR để thông báo lỗi.
declare @chia int = 10;
begin try
    if @chia = 0
        raiserror('Khong chia cho 0.', 16, 1);
    else
        select 100 / @chia as KetQua;
end try

begin catch
    print 'Co loi: ' + error_message();
end catch;

Begin try
	insert into PHONGBAN values (N'Nhan su',7,'005','2023-3-22')
end try

Begin catch
	print N'Lỗi rồi bạn ơi, trùng khóa chính'
end catch