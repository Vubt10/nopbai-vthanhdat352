-- T�m c�c nh�n vi�n l�m vi?c ? ph�ng s? 4
select * from NHANVIEN where PHG = 4;
-- T�m c�c nh�n vi�n c� m?c l??ng tr�n 30000
select * from NHANVIEN where LUONG > 30000;
-- T�m c�c nh�n vi�n c� m?c l??ng tr�n 25,000 ? ph�ng 4 ho?c c�c nh�n vi�n c� m?c l??ng tr�n 30,000 ? ph�ng 5
select * from NHANVIEN
where (LUONG >25000 and PHG = 4) or
	  (LUONG > 3000 and PHG = 5)
-- Cho bi?t h? t�n ??y ?? c?a c�c nh�n vi�n ? TP HCMselect * from NHANVIEN
where DCHI like '%Tp HCM'
-- Cho bi?t h? t�n ??y ?? c?a c�c nh�n vi�n c� h? b?t ??u b?ng k� t? 'N'
SELECT CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HoTenDayDu
from NHANVIEN
where HONV COLLATE Latin1_General_CI_AI LIKE 'N%';
-- Cho bi?t ng�y sinh v� ??a ch? c?a nh�n vi�n Dinh Ba Tien.
SELECT NGSINH, DCHI
FROM NHANVIEN
WHERE HONV COLLATE Latin1_General_CI_AI = 'Dinh'
  AND TENLOT COLLATE Latin1_General_CI_AI = 'Ba'
  AND TENNV COLLATE Latin1_General_CI_AI = 'Tien';
