use QLDA
-- Bài 1: SP in ra dòng ‘Xin chào’ + @ten.
CREATE or ALTER PROCEDURE Chaoban
     @ten NVARCHAR(50)
AS
BEGIN
  select N'Xin chào ' + CAST(@ten AS NVARCHAR(50)) AS LoiChao;
ENDEXEC Chaoban N'Đạt Võ';--SP tính tổng hai số @s1 và @s2
create procedure TinhTong
    @s1 int,@s2 int
as
begin
    DECLARE @tg INT;
    SET @tg = @s1 + @s2;
    select N'tổng là: ' + cast(@tg as nvarchar(10)) as Tong;
end

EXEC TinhTong 10, 25;

--SP tính tổng các số chẵn từ 1 đến @n.
create procedure TongChan
    @n int
as
begin
    declare @tong int = 0;
    declare @i int = 2;
    while @i <= @n
    begin
        set @tong = @tong + @i;
        set @i = @i + 2;
    end;
    select N'tổng các số chẵn từ 1 đến ' + cast(@n as nvarchar(10)) + 
	N' là: ' + cast(@tong as nvarchar(10)) as TongSoChan;
end

EXEC TongChan 10;

--SP tìm ước chung lớn nhất của hai số.
create procedure TimUCLN
    @a int,
    @s int
as
begin
    while @A % @a <> 0
    begin
        declare @temp int;
        set @temp = @s;
        set @s = @a;
        set @a = @temp % @a;
    end;
    select N'ước chung lớn nhất là: ' + cast(@a as nvarchar(10)) as UCLN;
end

EXEC TimUCLN 12, 18;

--Bài 2:Nhập vào @Manv, xuất thông tin các nhân viên theo @Manv.
Create Procedure spGetNV 
   @MaNhanVien nvarchar(9)
as
Begin 
	Select * from NHANVIEN  
	where MANV = @MaNhanVien
end 

EXEC spGetNV '001';

-- Nhập vào @MaDa (mã đề án), cho biết số lượng nhân viên tham gia đề án đó
Create Procedure spSoNV 
@SoNhanvien int
as
Begin 
    select count(MA_NVIEN) AS SoLuongNhanVien
    from PHANCONG
	where @SoNhanvien = MADA
    
	end 
	select * from DEAN
	select * from PHANCONG

EXEC spSoNV 10;

-- Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên 
-- có trưởng phòng là @Trphg và các nhân viên này không có thân nhân.

create procedure spKoThanNhan
@Trphg nvarchar(9)
as
begin 
    select NV.PHG, NV.MANV, NV.TENNV,TN.TENTN,TN.QUANHE
    from PHONGBAN PB join NHANVIEN NV 
		on PB.MAPHG  = nv.PHG
    LEFT JOIN THANNHAN TN on NV.MANV = TN.MA_NVIEN
    where PB.TRPHG = @Trphg and TN.MA_NVIEN IS NULL
end

EXEC spKoThanNhan '005'

--Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv có thuộc phòng ban có mã @Mapb hay không
create procedure A
	@Manv nvarchar(15),
	@Mapb int
	as
	begin
		   if exists (SELECT * from NHANVIEN where MANV = @MaNV AND PHG = @Mapb)
        print N'Nhân viên có mã ' + @Manv + N' thuộc phòng ban có mã '+convert(nvarchar,@Mapb)
    else 
        print N'Nhân viên có mã ' + @Manv + N' không thuộc phòng ban có mã '+convert(nvarchar,@Mapb)
	end

EXEC  A '001', '4';

--Bai 3
--Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào dưới dạng tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại.
create procedure spThemPhongBan
    @MaPhg int,
    @TenPhg nvarchar(100)
as
begin
    if exists (select * from PHONGBAN where MAPHG = @MaPhg)
    begin
        print N'thêm thất bại: mã phòng ban ' + cast(@MaPhg as nvarchar(10)) + N' đã tồn tại.';
    end
    else
    begin
        insert into PHONGBAN (MAPHG, TENPHG) values (@MaPhg, @TenPhg);
        print N'phòng ban ' + @TenPhg + N' đã được thêm thành công với mã ' + 
		cast(@MaPhg as nvarchar(10)) + N'.';
    end
end

EXEC spThemPhongBan 10, N'CNTT';

--Cập nhật phòng ban có tên CNTT thành phòng IT.
UPDATE PHONGBAN
SET TENPHG = N'IT'
WHERE TENPHG = N'CNTT';


