use QLDA

--Cau 1: Chương trình tính diện tích, chu vi hình chữ nhật khi biết chiều dài và chiều rộng.
declare @chieudai float
set @chieudai = 10.0
declare @chieurong float = 5.0
declare @dientich float = @chieudai * @chieurong
select @dientich
declare @chuvi float = (@chieudai + @chieurong)*2
select @chuvi

--Cau 2: Dựa trên csdl QLDA thực hiện truy vấn, các giá trị truyền vào và trả ra phải dưới dạng sử dụng biến.
 
 --B1 Cho biêt nhân viên có lương cao nhất
	Select MAX(Luong) from NHANVIEN
 --B2 Luu lai gia tri Max
	Declare @MaxLuong float
	set @MaxLuong = (select max(luong) from NHANVIEN)
 --B3 Truy van danh sach nhan vien theo luong max
	select * from NHANVIEN
	where LUONG= @MaxLuong

 --B1 Tim gia tri luong Min
	Select Min(Luong) from NHANVIEN
 --B2 Luu lai gia tri Max
	Declare @MinLuong float
	set @MinLuong = (select min(luong) from NHANVIEN)
 --B3 Truy van danh sach nhan vien theo luong max
	select * from NHANVIEN
	where LUONG= @MinLuong
-
--Cau 2
select AVG(LUONG) from PHONGBAN PB inner join NHANVIEN NV on PB.MAPHG  = NV.PHG where  PB.TENPHG = N'Nghiên cứu'

declare @Luongtb float
Set @Luongtb = (select AVG(LUONG) from PHONGBAN PB inner join NHANVIEN NV 
on PB.MAPHG  = NV.PHG where  PB.TENPHG = N'Nghiên cứu')
select HONV, TENLOT,TENNV,LUONG from NHANVIEN where LUONG > @Luongtb

--cau 3
select phg maphong, count(manv), avg(luong) luongtb from nhanvien
group by phg having avg(luong) > 32000

declare @tbl_phong_tb table
(maphong int, sonv int,luongtb int)

insert into @tbl_phong_tb select phg maphong, count(manv), avg(luong) luongtb from nhanvien
group by phg having avg(luong) > 32000

select *from phongban pb inner join @tbl_phong_tb t_ptb on pb.MAPHG = t_ptb.maphong


--Cau 4
select * from PHONGBAN select * from DEAN

select PHONG MaPhong, count (MADA) sodean from DEAN group by PHONG

declare @tbl_phong_dean table 
	(maphong int , sodean int)
insert into  @tbl_phong_dean
select phong maphong, count (mada) sodean from DEAN group by PHONG

select * from  @tbl_phong_dean
select pb.tenphg, sodean from PHONGBAN pb inner join @tbl_phong_dean p_da on pb.MAPHG =p_da.maphong
