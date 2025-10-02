-- Tìm các nhân viên làm vi?c ? phòng s? 4
select * from NHANVIEN where PHG = 4;
-- Tìm các nhân viên có m?c l??ng trên 30000
select * from NHANVIEN where LUONG > 30000;
-- Tìm các nhân viên có m?c l??ng trên 25,000 ? phòng 4 ho?c các nhân viên có m?c l??ng trên 30,000 ? phòng 5
select * from NHANVIEN
where (LUONG >25000 and PHG = 4) or
	  (LUONG > 3000 and PHG = 5)
-- Cho bi?t h? tên ??y ?? c?a các nhân viên ? TP HCMselect * from NHANVIEN
where DCHI like '%Tp HCM'
-- Cho bi?t h? tên ??y ?? c?a các nhân viên có h? b?t ??u b?ng ký t? 'N'
SELECT CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HoTenDayDu
from NHANVIEN
where HONV COLLATE Latin1_General_CI_AI LIKE 'N%';
-- Cho bi?t ngày sinh và ??a ch? c?a nhân viên Dinh Ba Tien.
SELECT NGSINH, DCHI
FROM NHANVIEN
WHERE HONV COLLATE Latin1_General_CI_AI = 'Dinh'
  AND TENLOT COLLATE Latin1_General_CI_AI = 'Ba'
  AND TENNV COLLATE Latin1_General_CI_AI = 'Tien';
