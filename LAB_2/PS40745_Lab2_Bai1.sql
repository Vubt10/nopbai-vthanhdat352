use master
go
create database QLDA_PS40745
on
(name = QLDA_PS40745_dat,
    filename = 'D:\SqlData1\QLDA_PS40745.mdf',
    size = 10,
    maxsize = 50,
    filegrowth = 5)
log on
(name = QLDA_PS40745_log,
    filename = 'D:\SqlData1\QLDA_PS40745.ldf',
    size = 10MB,
    maxsize = 50MB,
    filegrowth = 5MB)
go

USE QLDA_PS40745
GO
create table PhongBan
( TenPHG NVARCHAR(15),
  MaPHG int not null primary key,
  TrPHG NVARCHAR(9) NULL,
  NG_NhanChuc DATE NULL
);

CREATE TABLE NhanVien
( HONV NVARCHAR(15) NULL,
  TENLOT NVARCHAR(15) NULL,
  TENNV NVARCHAR(15) NULL,
  MANV NVARCHAR(9) NOT NULL PRIMARY KEY,
  NGSINH DATE NULL,
  DCHI NVARCHAR(30) NULL,
  PHAI NVARCHAR(3) NULL,
  LUONG float(10) NULL,
  MA_NQL NVARCHAR(9) NULL,
  PHG INT NULL
);

CREATE TABLE DiaDiem_PHG
( DIAIDIEM NVARCHAR(15) NOT NULL,
  MAPHG INT NOT NULL,
  PRIMARY KEY(DIAIDIEM, MAPHG)
);

CREATE TABLE ThanNhan
( MA_NV1EN NVARCHAR(9) NOT NULL,
  TENTN NVARCHAR(15) NOT NULL,
  PHAI NVARCHAR(3) NULL,
  NGSINH DATE NULL,
  QUANHE NVARCHAR(15) NULL,
  PRIMARY KEY(MA_NV1EN, TENTN)
);

CREATE TABLE DeAn
( TENDA NVARCHAR(15) NULL,
  MADA INT NOT NULL PRIMARY KEY,
  DDIEM_DA NVARCHAR(15) NULL,
  PHONG INT NULL
);

CREATE TABLE CongViec
( MADA INT NOT NULL,
  STT INT NOT NULL,
  TEN_CONG_VIEC NVARCHAR(50) NULL,
  PRIMARY KEY(MADA, STT)
);

CREATE TABLE PhanCong
( MA_NVIEN NVARCHAR(9) NOT NULL,
  MADA INT NOT NULL,
  STT INT NOT NULL,
  THOIGIAN INT NOT NULL,
  PRIMARY KEY(MA_NVIEN, MADA, STT)
);

insert into NhanVien
Values
(N'Đinh',N'Bá',N'Tiên','009','02/11/1960',N'119 Công Quỳnh, Tp HCM','Nam','30000','005','5'),
(N'Nguyễn',N'Thanh',N'Tùng','005','08/20/1962',N'222 Nguyễn Văn Cừ, Tp HCM','Nam','40000','006','5'),
(N'Bùi',N'Ngọc',N'Hằng','007','3/11/1954',N'332 Nguyễn Thái Học, Tp HCM','Nam','25000','001','4'),
(N'Lê',N'Quỳnh',N'Như','001','02/01/1967',N'291 Hồ Văn Huê, Tp HCM','Nữ','43000','006','4'),
(N'Nguyễn',N'Mạnh',N'Hùng','004','03/04/1967',N'95 Bà Rịa, Vũng Tàu','Nam','38000','006','5'),
(N'Trần',N'Thanh',N'Tâm','003','05/04/1957',N'34 Mai Thị Lự, Tp HCM','Nam','25000','005','5'),
(N'Trần',N'Hồng',N'Quang','008','09/01/1967',N'80 Lê Hồng Phong, Tp HCM','Nam','25000','005','4'),
(N'Phạm',N'Văn',N'Vinh','006','01/01/1965',N'45 Trưng Vương, Hà Nội','Nữ','55000',null,'1');


insert into ThanNhan
Values
('005',N'Trinh',N'Nữ','04/05/1976',N'Con gái'),
('005',N'Khang',N'Nam','10/25/1978',N'Con trai'),
('005',N'Phượng',N'Nữ','05/03/1948',N'Vợ chồng'),
('009',N'Minh',N'Nam','02/29/1932',N'Vợ chồng'),
('009',N'Tiến',N'Nam','01/01/1970',N'Con trai'),
('009',N'Châu',N'Nữ','12/30/1976',N'Con gái'),
('009',N'Phượng',N'Nữ','05/05/1957',N'Vợ chồng');


Insert into PhongBan
Values
(N'Nghiên cứu','5','005','05/22/1978'),
(N'Điều hành','4','008','01/01/1985'),
(N'Quản lý','1','006','06/19/1971');

Insert into DiaDiem_PHG
Values
('TP HCM','1'),
(N'Hà Nội','4'),
(N'TAU','5'),
(N'NHA TRANG','5'),
('TP HCM','5');


Insert into DeAn
Values
(N'Sản phẩm X','1',N'Vũng Tàu','5'),
(N'Sản phẩm Y','2',N'Nha Trang','5'),
(N'Sản phẩm Z','3',N'TP HCM','5'),
(N'Tin học hóa','10',N'Hà Nội','4'),
(N'Cáp quang','20',N'TP HCM','1'),
(N'Đào tạo','30',N'Hà Nội','4');


Insert into CongViec
Values
('1','1',N'Thiết kế sản phẩm X'),
('1','2',N'Thử nghiệm sản phẩm X'),
('2','1',N'Sản xuất sản phẩm Y'),
('2','2',N'Quảng cáo sản phẩm Y'),
('3','1',N'Khuyến mãi sản phẩm Z'),
('10','1',N'Tin học hóa phòng nhân sự'),
('10','2',N'Tin học hóa phòng kinh doanh'),
('20','1',N'Lắp đặt cáp quang'),
('30','1',N'Đào tạo nhân viên Marketing'),
('30','2',N'Đào tạo chuyên viên thiết kế');


Insert into PhanCong
Values
('009','1','1','32'),
('009','2','2','8'),
('004','3','1','40'),
('003','1','2','20'),
('003','2','1','20'),
('008','10','1','35'),
('001','30','2','20'),
('001','30','1','15'),
('006','20','1','30'),
('005','3','1','10'),
('005','10','2','10'),
('007','30','2','30'),
('007','10','2','10');


-- Cập nhật các quan hệ

alter table NhanVien
    add foreign key(PHG) references PHONGBAN(MAPHG),
        foreign key(MA_NQL) references NHANVIEN(MANV);

alter table PhongBan
    add foreign key(TRPHG) references NHANVIEN(MANV);

alter table DiaDiem_PHG
    add foreign key(MAPHG) references PHONGBAN(MAPHG);

alter table ThanNhan
    add foreign key(MA_NVIEN) references NHANVIEN(MANV);

alter table DeAn
    add foreign key(PHONG) references PHONGBAN(MAPHG);

alter table CongViec
    add foreign key(MADA) references DEAN(MADA);

alter table PhanCong
    add foreign key(MA_NVIEN) references NHANVIEN(MANV),
        foreign key(MADA, STT) references CONGVIEC(MADA, STT);


