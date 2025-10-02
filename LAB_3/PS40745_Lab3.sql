use QLDA﻿
--Cau 1:
declare @tbl_da table
	(MADA int, TongThoiGian decimal(10,2))

insert into @tbl_da
select MADA,
	cast(sum(THOIGIAN) as decimal(10,2)) as TongGioLamViec	
	from PHANCONG
	GROUP BY MADA

select dean.tendean, T.TongThoiGian
	from dean 
	join @tbl_da T
	on dean.mada = T.mada

select 
	convert (decimal(10,2),sum(THOIGIAN)) as TongGioLamViec_decimal,
	convert (varchar ,sum(THOIGIAN)) as TongGioLamViec_varchar
from PHANCONG


--Cau 2:
select THOIGIAN , CEILING(THOIGIAN) T1,
       FLOOR(THOIGIAN) T2,
	   ROUND(THOIGIAN, 3) T3
	   from PHANCONG 
 

Select LUONG,
	ROUND(SQRT(LUONG),2) L3,
	SQRT(LUONG) L1, 
	SQUARE(LUONG) L2
	from NHANVIEN

select ROUND(SQUARE(THOIGIAN), 1) T1  FROM PHANCONG

DECLARE @tbl_DEAN_TG TABLE
(MADA int , ThoiGian float)
insert into @tbl_DEAN_TG
SELECT MADA,SUM(THOIGIAN) ThoiGian
FROM PHANCONG
GROUP BY MADA

select DEAN.TENDEAN,T.ThoiGian,
CEILING(T.ThoiGian) T1,
FLOOR(T.ThoiGian) T2,
ROUND(T.ThoiGian, 2) T3
from DEAN 
inner join @tbl_DEAN_TG T on DEAN.MADA = T.MADA

select * from nhanvien
declare @LuongTB float 
set @LuongTB = (
select AVG(NV.LUONG)
from PHONGBAN PB 
inner join nhanvien nv on PB.MAPHG = NV.PHG 
where PB.TENPHG = N'Nghiên Cứu'
)
SET @LuongTB = ROUND (@LuongTB, 2)
select HONV,TENLOT, TENNV , LUONG  
from NHANVIEN 
where LUONG > @LuongTB	
Declare @bl_DA table
	(MaDeAn int, TongThoiGian decimal (10,2))



--Bai 3:

Select * from NHANVIEN

Declare @TBL_TN Table(MANV int)
Insert into @TBL_TN
	Select MA_NVIEN as SOTN from THANNHAN
		Group by MA_NVIEN
		Having COUNT(MA_NVIEN) >2

		Select upper(HONV) as HO,
			LOWER(TENLOT) as TENLOT,CONCAT(lower(LEFT(TENNV,1)),
			upper (SUBSTRING(TENNV,2,1)),LOWER(Substring(TENNV,3,LEN(TENNV)-2))) as TENNV,
			SUBSTRING(DCHI,Charindex(' ',DCHI),Charindex(',',DCHI) - Charindex(' ',DCHi)) as TENDUONG

			from NHANVIEN NV inner join @TBL_TN TBL on NV.MANV = TBL.MANV
	
--Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất,hiển thị thêm một cột thay thế tên trưởng phòng bằng tên “Fpoly”

Declare @TBL_MAXNV table(MAPHONG int, SONV int)
insert into @TBL_MAXNV
	Select PHG, COUNT(MANV)
		From PHONGBAN PB inner join NHANVIEN NV
		on PB.MAPHG = NV.PHG
		Group by PHG
	Select TENPHG, TRPHG,TENNV,REPLACE(TENNV,TENNV,'Fpoly') as THAYTHE
	from PHONGBAN PB inner  join @TBL_MAXNV TBL on TBL.MAPHONG = PB.MAPHG
	inner  join NHANVIEN NV on NV.MANV = PB.TRPHG
	Where SONV = (Select Max(SONV) from @TBL_MAXNV);
	--B1
declare @maxNV int 
set @maxNV =
	(select max(T.SoNV)
		from(select PHG MaPhong, count(MaNV)SoNV
		from nhanvien 
		group by phg)T)
-- B2 
declare @T_P_maxNV table
	(MaPhong int , SoNV int )
	insert into @T_P_maxNV

select PHG MaPhong, count(MANV) SoNV
	from nhanvien 
	group by PHG
	having count(MANV) = @maxNV 
-- B3 
select PB.TENPHG, NV.TENNV as 'TruongPhong',T.SoNV
	from @T_P_maxNV T join PHONGBAN PB on T.MaPhong = PB.MAPHG
	join NHANVIEN NV ON pb.tenphg = nv.manv

--Câu 4 
--4.1
select * from nhanvien 
where year(ngsinh) >=1960 and year(ngsinh) <=1965

select tennv,YEAR(NGSINH),
(year(getdate()) - YEAR(NGSINH)) Tuoi
from nhanvien
select year(getdate())

select MANV, HONV, TENLOT, TENNV,datename(weekday,ngsinh ) as Thu
from nhanvien
--4.2
declare @tbl_SL_NV table 
(MaPhong int , SoNV int)

insert into @tbl_SL_NV
select PHG MaPhong ,count(MaNV)
from PHONGBAN PB inner join NHANVIEN NV
on PB.MAPHG = NV.PHG 
group by PHG

select TENNV,TENPHG,SoNV,NG_NHANCHUC,
convert(varchar,PB.NG_NHANCHUC, 105) NgayNhanChuc
from PHONGBAN PB
inner join @tbl_SL_NV TBL on PB.MAPHG = TBL.MaPhong
inner join nhanvien NV on NV.MANV = PB.TRPHG

--4.3
Declare @nhanvien_phg table (sonhanvien int,phg int)
insert into @nhanvien_phg 
	Select COUNT(MANV) as sonhanvien, PHG from NHANVIEN
	Group by PHG

	Select pb.TENPHG, nv.sonhanvien, TENNV as tentruongphong,
	CONVERT(varchar,pb.ng_nhanchuc , 105) as ngaynhanchuc
	from PHONGBAN pb inner join @nhanvien_phg nv
	on pb.MAPHG = nv.phg inner join NHANVIEN nv1
	on nv1.MANV = pb.TRPHG